package kr.freedi.dev.qreport.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.attachfile.service.AttachFileService;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qreport.domain.ReportDetailVO;
import kr.freedi.dev.qreport.domain.ReportIndicatorVO;
import kr.freedi.dev.qreport.domain.ReportResultVO;
import kr.freedi.dev.qreport.domain.ReportSearchVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;
import kr.freedi.dev.qreport.domain.ReportVO;
import kr.freedi.dev.user.domain.UserVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;




/**
 * @project : dev_default
 * @file 	: ReportService.java
 * @date	: 2023. 3. 27.
 * @author	: swpark
 * @comment : 과제 Service 
 * @history	: 
 */
@Service("reportService")
public class ReportService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_PREFIX = "report";
	
	final String USER_TYP_MNGR = "MNGR_USER";
	

	@Resource(name = "defaultDAO")
	private DefaultDAO dao;

	@Resource(name = "reportDetailService")
	private ReportDetailService reportDetailService;
	
	@Resource(name = "reportTeamService")
	private ReportTeamService reportTeamService;
	
	@Resource(name = "reportResultService")
	private ReportResultService reportResultService;
	
	@Resource(name = "reportIndicatorService")
	private ReportIndicatorService reportIndicatorService;
	
	@Resource
	private AttachFileService attachFileService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "reportIdGnrService")
	private EgovIdGnrService idGnrService;
	
	public void insert(ReportVO reportVO) throws Exception {


		//reportVO.setRepMenuCode("REPORT"); //REPORT-과제, TEAM-분임조
		
		// report_team
		// report_detail
		// report_result
		// report_indicators
		dao.insert("Report.insert", reportVO);
		
		// 2. 팀구성 및 승인자 저장(tb_report_team)
		ReportTeamVO teamMember3 = new ReportTeamVO(); // 지도사원
		ReportTeamVO teamMember5 = new ReportTeamVO(); // 챔피언
		for (ReportTeamVO vo : reportVO.getRepTeamMemberList()) {
			vo.setRepCode(reportVO.getRepCode());
			vo.setRepTeamRegUser(reportVO.getRepRegUser());
			reportTeamService.insert(vo);	
			
			if(vo.getRepTeamMemRole().equals("3"))
				teamMember3 = vo;
			else if(vo.getRepTeamMemRole().equals("5"))
				teamMember5 = vo;
		}
		
		// 1. 일정 저장(tb_report_detail)
		for (ReportDetailVO vo : reportVO.getRepDetailList()) {
			vo.setRepCode(reportVO.getRepCode());
			vo.setRepDivisionCode(reportVO.getRepDivisionCode());
			vo.setRepRegUser(reportVO.getRepRegUser());
			
			if(vo.getRepStepCode().equals("1,7")) { // 입력화면에서 6시그마 여부에 따라 입력화면이 달라지기때문에 값이 두개가 공존함. 이에 가공 필요.
				if(reportVO.getRepDivisionCode().equals("1"))
					vo.setRepStepCode("1"); //6시그마면 첫번째 필드 
				else 
					vo.setRepStepCode("7"); // 일반/10+면 유일한 필드
			}
		
			String apprMemCode = "";
			String apprMemRoleCode = "";
			switch (vo.getRepStepCode()) {
			case "1": // 6시그마 첫 step
			case "7": // 일반과제
				vo.setRepStatus("1");
				apprMemCode = teamMember5.getComNo(); 
				apprMemRoleCode = teamMember5.getRepTeamMemRole();
				break;
			case "6": // 6시그마 마지막 step
				// 챔피언 지정
				vo.setRepStatus("0");
				apprMemCode = teamMember5.getComNo(); 
				apprMemRoleCode = teamMember5.getRepTeamMemRole();
				break;
			default:
				// 2,3,4,5 : 지도사원
				vo.setRepStatus("0");
				apprMemCode = teamMember3.getComNo(); 
				apprMemRoleCode = teamMember3.getRepTeamMemRole();
				break;
			}
			vo.setRepApprovalMemCode(apprMemCode);
			vo.setRepApprovalMemRole(apprMemRoleCode);
			
			if(vo.getRepPlanStartDate()!=null)
				reportDetailService.insert(vo);
		}
		
		// 3. 성과 tb_report_result 저장
		for (ReportResultVO vo : reportVO.getRepResultList()) {
			vo.setRepCode(reportVO.getRepCode());
			vo.setRepResultRegUser(reportVO.getRepRegUser());
			reportResultService.insert(vo);	
		}
		
		// 4. 주요지표 tb_report_indicator 저장
		for (ReportIndicatorVO vo : reportVO.getRepIndicatorList()) {
			vo.setRepCode(reportVO.getRepCode());
			vo.setRepIndiRegUser(reportVO.getRepRegUser());
			reportIndicatorService.insert(vo);	
		}
	}
	
	public void update(ReportVO reportVO) throws Exception {

		// report_detail 저장
		// report_team 저장
		// report_result 저장
		// report_indicator 저장
		
		// 각 항목 키가 있으면 저장, 없으면 update
		// 서비스에 해당 기능 만들어서 vo 던지기.
		
		
		dao.update("Report.update", reportVO);
		
		for (ReportDetailVO vo : reportVO.getRepDetailList()) {
			reportDetailService.save(vo);
		}
		
		for (ReportTeamVO vo : reportVO.getRepTeamMemberList()) {
			reportTeamService.save(vo);	
		}
		
		for (ReportResultVO vo : reportVO.getRepResultList()) {
			reportResultService.save(vo);	
		}
		
		for (ReportIndicatorVO vo : reportVO.getRepIndicatorList()) {
			reportIndicatorService.save(vo);	
		}
	}
	
	public void updateStep6Sigma(ReportVO reportVO, String step) throws Exception {
		// report_detail 의 특정 
		
	
		
		ReportDetailVO vo = reportVO.getRepDetailList().get(Integer.parseInt(step)-1);
		vo.setRepCode(reportVO.getRepCode());
		reportDetailService.updateStep(vo);
		
		// 임시 : 결재완료시 다음 단계로 진행
		reportDetailService.updateStepNext(vo);
		
	}
	
	public void updateStepGeneral(ReportVO reportVO) throws Exception {
		// report_detail 의 특정 
	}
	
	
	
	

	public List<ReportVO> selectList(ReportSearchVO searchVO) {
		
		return dao.selectList("Report.selectList", searchVO);
	}
	
	public List<ReportVO> selectFullList(ReportSearchVO searchVO) {
		
		return dao.selectList("Report.selectFullList", searchVO);
	}
	
	public int selectListCount(ReportSearchVO searchVO) {
		return (Integer) dao.selectOne("Report.selectListCount", searchVO);
	}
	
	public List<EgovMap> selectListCount2(ReportSearchVO searchVO) {
		return dao.selectList("Report.selectListCount2", searchVO); // 상태 종류별 카운트 
	}
	
	public List<EgovMap> selectFullListCount(ReportSearchVO searchVO) {
		return dao.selectList("Report.selectFullListCount", searchVO); // 상태 종류별 카운트 
	}
	
	public ReportVO select(ReportVO reportVO) {
		ReportVO resultVO = (ReportVO)dao.selectOne("Report.select", reportVO);
		// 과제 팀원
		if(resultVO != null){
			
			ReportDetailVO reportDetailVO = new ReportDetailVO();
			reportDetailVO.setRepCode(reportVO.getRepCode());
			resultVO.setRepDetailList(reportDetailService.selectFullList(reportDetailVO));
			
			ReportTeamVO reportTeamVO = new ReportTeamVO();
			reportTeamVO.setRepCode(reportVO.getRepCode());
			resultVO.setRepTeamMemberList(reportTeamService.selectFullList(reportTeamVO));
			
			ReportResultVO reportResultVO = new ReportResultVO();
			reportResultVO.setRepCode(reportVO.getRepCode());
			resultVO.setRepResultList(reportResultService.selectFullList(reportResultVO));
			
			ReportIndicatorVO reportIndicatorVO = new ReportIndicatorVO();
			reportIndicatorVO.setRepCode(reportVO.getRepCode());
			resultVO.setRepIndicatorList(reportIndicatorService.selectFullList(reportIndicatorVO));
			
			AttachFileVO attachFileVO = null;
			attachFileVO = new AttachFileVO();
			attachFileVO.setFileId(ATTACH_PREFIX + "_" + reportVO.getRepCode());
			attachFileVO.setDeleteFlg("N");
			resultVO.setFileList(attachFileService.selectFullList(attachFileVO));
		}
		return resultVO;
	}
	
	
	
	// converting
	public ReportVO proc_reportFormHandler(HttpServletRequest req, ModelMap model,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO,
			@ModelAttribute("reportVO") ReportVO reportVO, 
			UserVO userSession) throws Exception {
		
		ArticleSearchVO aSearchVO = new ArticleSearchVO();
		aSearchVO.setMenuKey(searchVO.getMenuKey());
		return this.proc_reportFormHandler(req, model, aSearchVO, reportVO, userSession);
	}
	
	public ReportVO proc_reportFormHandler(HttpServletRequest req, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("reportVO") ReportVO reportVO, 
			UserVO userSession) throws Exception {
		
		ReportVO retVO = new ReportVO();
		
		// 작성자 본인 권한체크하기.
		
		// 메뉴키
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		/*********
		 * 1. 기초코드 바인딩
		 * *******/
		CodeVO codeVO = new CodeVO(); 
		
		// 그 외 코드 바인딩, 개별 코드별로 부르는 것이 오래 걸려 한번에 불러오도록 커스터마이징(23/4/3) 
		String[] arrCodeGrpIds = {"6SIG_YN", "RP_TY1", "RP_TY2", "RP_TY3", "SECTOR", "ACTTYPE", "LDRBELT", "MBBUSERT", "RESULTTY", "REP_ROLE"};
		codeVO.setCodeGrpIdList(arrCodeGrpIds);
		codeVO.setActFlg("Y"); 
		List<EgovMap> allCodes = codeService.selectFullList(codeVO);		//item.codeGrpId, codeId, codeNm

		model.addAttribute("allCodes", allCodes);
		
		List<Map> codeResultTy = new ArrayList<>();
		Map mapItem = new HashMap<String, String>();
		mapItem.put("codeId", "");
		mapItem.put("codeNm", "선택하세요");
		codeResultTy.add(mapItem);
		
		HashMap<String, String> repRoleCodes  = new HashMap<>();
		
		for (EgovMap item : allCodes) {
			if(item.get("codeGrpId").equals("RESULTTY")) {
				mapItem = new HashMap<String, String>();
				mapItem.put("codeId", item.get("codeId"));
				mapItem.put("codeNm", item.get("codeNm"));
				codeResultTy.add(mapItem);
			} else if(item.get("codeGrpId").equals("REP_ROLE")) {
				
				repRoleCodes.put(item.get("codeId").toString(), item.get("codeNm").toString());
			}
		}
		model.addAttribute("codeResultTy", codeResultTy);

		// 6sigma Full Process 여부, 최초 바인딩이 필요해 별도로 조회
		codeVO.setCodeGrpId("6SIG_YN");
		codeVO.setActFlg("Y"); 
		model.addAttribute("divisionCode", codeService.selectFullList(codeVO));
		
		
		/*********
		 * 2. ReportVO 데이터 가져오기
		 * *******/
		if(reportVO.getRepCode() != null) {
			// 수정모드	
			//ReportVO dbReportVO = new ReportVO();
			retVO = this.select(reportVO);
			// 키 코드가 파라메터로 들어오면 임시저장건 수정모드로 진행
			retVO.setMode("UPDATE");
			model.addAttribute("reportVO", retVO);
		} else {
			// 신규작성 - 기본 Form 구성을 위한 메모리 할당
			//ReportVO emptyReportVO = new ReportVO();
			retVO.setRepMenuCode(reportVO.getRepMenuCode());
			retVO.setRepCode(idGnrService.getNextIntegerId());
			retVO.setRepMenuCode("REPORT"); // REPORT >> 과제 
			
			// 분임조 정보 가져오기
			if(reportVO.getRepMenuCode().equals("TEAM")) {
				//분임조 DB조회하고
				// 분임조 코드, 분임조명, , 분임조장명 가져오기
				String userId = userSession.getUserId();
				
			}
			
			
			// 일정 구성 - 빈 칸 작성
			List<ReportDetailVO> reportDetailList = new ArrayList<>();
			for (int i=1; i<=6; i++) { // 6시그마 기준
				ReportDetailVO emptyDetailVO = new ReportDetailVO();
				emptyDetailVO.setRepStepCode(Integer.toString(i));
				if(i==1) {
					emptyDetailVO.setRepStatus("1");
				} else {
					emptyDetailVO.setRepStatus("0");
				}
				reportDetailList.add(emptyDetailVO);
			}
			retVO.setRepDetailList(reportDetailList);
			
			// 팀 구성 - 빈 칸 작성
			List<ReportTeamVO> reportTeamList = new ArrayList<>();
			for (int i = 1; i <= 5; i++) {
				ReportTeamVO emptyRepTeamVO = new ReportTeamVO();
				emptyRepTeamVO.setRepTeamMemRole(Integer.toString(i));			// 각 행별 역할부여(과제리더, 팀멤버, ~~)
				emptyRepTeamVO.setRepTeamMemRoleNm(repRoleCodes.get(Integer.toString(i)));  // 역할명칭 코드값 가져오기
				reportTeamList.add(emptyRepTeamVO);
			}
			retVO.setRepTeamMemberList(reportTeamList);
			
			// 성과 - 빈 칸 작성
			List<ReportResultVO> repResultList = new ArrayList<>();
			repResultList.add(new ReportResultVO());
			retVO.setRepResultList(repResultList);
			
			// 주요지표 - 빈 칸 작성
			List<ReportIndicatorVO> repIndicatorList = new ArrayList<>();
			repIndicatorList.add(new ReportIndicatorVO());
			retVO.setRepIndicatorList(repIndicatorList);
			
			model.addAttribute("reportVO", retVO);
		}
		
		return retVO;
	}
}
