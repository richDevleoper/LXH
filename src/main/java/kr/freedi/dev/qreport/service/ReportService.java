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
import kr.freedi.dev.qapprove.domain.ApproveDetailVO;
import kr.freedi.dev.qapprove.domain.ApproveVO;
import kr.freedi.dev.qapprove.service.ApproveService;
import kr.freedi.dev.qcircle.domain.CircleVO;
import kr.freedi.dev.qcircle.service.CircleService;
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
	
	@Resource(name = "approveService")
	private ApproveService approveService;
	
	@Resource(name = "reportIdGnrService")
	private EgovIdGnrService idGnrService;
	
	@Resource(name = "circleService")
	private CircleService circleService;
	
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
		for (ReportDetailVO vo : reportVO.getRepDetailList()) { //일반과제/10+ : 1건, 6시그마 6건.
			vo.setRepCode(reportVO.getRepCode());
			vo.setRepDivisionCode(reportVO.getRepDivisionCode());
			vo.setRepRegUser(reportVO.getRepRegUser());
			
			if("1,7".indexOf(vo.getRepStepCode())>-1) { // 입력화면에서 6시그마 여부에 따라 입력화면이 달라지기때문에 값이 두개가 공존함. 이에 가공 필요.
				if(reportVO.getRepDivisionCode().equals("1"))
					vo.setRepStepCode("1"); //6시그마면 첫번째 필드 
				else 
					vo.setRepStepCode("7"); // 일반/10+면 유일한 필드
			}
		
			String apprMemCode = "";
			String apprMemRoleCode = "";
			switch (vo.getRepStepCode()) {
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
				// 1,2,3,4,5 : 지도사원
				vo.setRepStatus("0");
				apprMemCode = teamMember3.getComNo(); 
				apprMemRoleCode = teamMember3.getRepTeamMemRole();
				break;
			}
			vo.setRepApprovalMemCode(apprMemCode);
			vo.setRepApprovalMemRole(apprMemRoleCode);
			
			if(vo.getRepPlanStartDate()!=null || vo.getRepActStartDate()!=null)
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
		
		// 결재상신
		if(reportVO.getRepStatusCode().equals("2")) { // 결재상신 - 과제신청
			this.regApproveType1(reportVO, teamMember5); // 챔피언 결재 등록
		}
	}
	
	private void regApproveType1(ReportVO reportVO, ReportTeamVO approveMember) throws Exception {
		
		ApproveVO newApprVO = new ApproveVO();
		newApprVO.setAprovalType("1"); 		// 결재 종류 (1-과제신청, 2-드랍신청, 6시그마프로세스, 10+, 일반과제, 6-실시제안, 7-쪽지제안) (code_grp_id='APR_TYPE')
		if(reportVO.getRepMenuCode().equals("REPORT")) {
			newApprVO.setRefBusType("1"); 	// 업무 종류(1-과제)	
		} else {
			newApprVO.setRefBusType("2"); 	// 업무 종류(1-과제, 2-분임조, 3-쪽지제안, 4-실시제안) (code_grp_id='BUS_TYPE')
		}
		
		newApprVO.setRefBusCode(reportVO.getRepCode().toString()); 		// 과제번호 등록(업무데이터 코드)
		newApprVO.setAprovalSubject(reportVO.getRepName());				// 결재문서명
		newApprVO.setUserId(reportVO.getRepRegUser());					// 상신자
		
		ApproveDetailVO newDetail = new ApproveDetailVO();
		// aprovalCode는  approveService.insert에서 처리
		newDetail.setComNo(approveMember.getComNo()); 					// 결재자 사번
		newDetail.setComDepartCode(approveMember.getDeptCode());			// 결재자 부서코드
		newDetail.setComJobx(approveMember.getComJobxCode());				// 결재자 직위코드
		newDetail.setComPosition(approveMember.getComPositionCode());		// 결재자 직책코드
		newDetail.setAprovalReqComNo(reportVO.getRepRegUser());			// 결재상신자 사번
		newDetail.setAprovalStatCode("2");
		
		List<ApproveDetailVO> newList = new ArrayList<>();
		newList.add(newDetail);		
		newApprVO.setDetailList(newList);								// 결재선 등록
		
		approveService.insert(newApprVO);
	}

	// 6시그마 결재요청
	public void regApproveType3(ReportVO reportVO, List<ReportTeamVO> approveMemberList) throws Exception {
	
		this.regApproveReport(reportVO, approveMemberList, "3"); // 결재 종류 (1-과제신청, 2-드랍신청, 3-6시그마프로세스, 6-실시제안, 7-쪽지제안) (code_grp_id='APR_TYPE')
	}
	
	// 과제 결재요청
	public void regApproveReport(ReportVO reportVO, List<ReportTeamVO> approveMemberList, String aprovalType) throws Exception {
		
		ApproveVO newApprVO = new ApproveVO();
		newApprVO.setAprovalType(aprovalType); 		// 결재 종류 (1-과제신청, 2-드랍신청, 3-6시그마프로세스, 6-실시제안, 7-쪽지제안) (code_grp_id='APR_TYPE')
		
		if(reportVO.getRepMenuCode().equals("REPORT")) {
			newApprVO.setRefBusType("1"); 	// 업무 종류(1-과제)	
		} else {
			newApprVO.setRefBusType("2"); 	// 업무 종류(1-과제, 2-분임조, 3-쪽지제안, 4-실시제안) (code_grp_id='BUS_TYPE')
		}
		newApprVO.setRefBusCode(reportVO.getRepCode().toString()); 		// 과제번호 등록(업무데이터 코드)
		newApprVO.setRefBusSubCode(reportVO.getRepCurrStepCode());
		newApprVO.setAprovalSubject(reportVO.getRepName());				// 결재문서명
		newApprVO.setUserId(reportVO.getRepUpdateUser());					// 상신자
		
		// 결재선 추가
		List<ApproveDetailVO> newList = new ArrayList<>();
		for (ReportTeamVO approveMember : approveMemberList) {
			ApproveDetailVO newDetail = new ApproveDetailVO();
			// aprovalCode는  approveService.insert에서 처리
			newDetail.setComNo(approveMember.getComNo()); 					// 결재자 사번
			newDetail.setComDepartCode(approveMember.getDeptCode());		// 결재자 부서코드
			newDetail.setComJobx(approveMember.getComJobxCode());			// 결재자 직위코드
			newDetail.setComPosition(approveMember.getComPositionCode());	// 결재자 직책코드
			newDetail.setAprovalReqComNo(reportVO.getRepRegUser());			// 결재상신자 사번
			newDetail.setAprovalStatCode("2");
			newList.add(newDetail);
		}	
		newApprVO.setDetailList(newList);	
		
		approveService.insert(newApprVO);
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
		
		ReportTeamVO approveMember = null;
		for (ReportTeamVO vo : reportVO.getRepTeamMemberList()) {
			reportTeamService.save(vo);	
			if(reportVO.getRepStatusCode().equals("2") && vo.getRepTeamMemRole().equals("5")) {
				approveMember = vo;
			}
		}
		
		for (ReportResultVO vo : reportVO.getRepResultList()) {
			reportResultService.save(vo);	
		}
		
		for (ReportIndicatorVO vo : reportVO.getRepIndicatorList()) {
			reportIndicatorService.save(vo);	
		}
		
		// 결재상신할 때 챔피언의 정보 가져오기
		if(reportVO.getRepStatusCode().equals("2")) { // 결재상신 - 과제신청
			reportVO.setRepRegUser(reportVO.getRepUpdateUser());   // 결재 상신시 결재자 정보 등록자에 넣기
			this.regApproveType1(reportVO, approveMember); // 챔피언 결재 등록
		} 
	}
	
	public void updateReportMaster(ReportVO reportVO) throws Exception {

		// report_detail 저장
		// report_team 저장
		// report_result 저장
		// report_indicator 저장
		
		// 각 항목 키가 있으면 저장, 없으면 update
		// 서비스에 해당 기능 만들어서 vo 던지기.
		
		
		dao.update("Report.update", reportVO);
	}
	
	
	public void cancelApprove(ReportVO reportVO) throws Exception {
		
		String repStatusCode = reportVO.getRepStatusCode();
		
		if(reportVO.getRepCode()!=null) {
			
			if(repStatusCode.equals("2")) { // 과제등록시 '선정중' 일 때 취소하면 
				reportVO = this.select(reportVO);	// 값이 바뀐 상태에서 결재취소 하는 경우에 대비 디비에서 불러오기
				reportVO.setRepStatusCode("1");		// 임시저장 상태로 변경
				this.update(reportVO);				// 상태 변경 저장
				
				ApproveVO vo = new ApproveVO();
				vo.setAprovalType("1");								// 과제선정 (과제-분임조과제 공통)
				vo.setRefBusCode(reportVO.getRepCode().toString());	// 과제코드
				approveService.cancelApprove(vo);					// 해당 결재건 지우기	
			} else if (repStatusCode.equals("3")) { // 과제등록시 '진행중'인 상태에서 단계별 결재를 취소하면
				
				ApproveVO vo = new ApproveVO();  // 수정대상 검색조건 설정
				vo.setAprovalType("3");								// 6시그마 결재건
				vo.setRefBusCode(reportVO.getRepCode().toString());	// 과제코드
				vo.setRefBusSubCode(reportVO.getRepCurrStepCode());	// 현재 진행중이던 단계
				approveService.cancelApprove(vo);					// 해당 결재건 지우기
				
			} else if (repStatusCode.equals("9")) { // 과제등록시 '9(Drop결재중)'인 상태에서 단계별 결재를 취소하면
				
				ApproveVO vo = new ApproveVO();  // 수정대상 검색조건 설정
				vo.setAprovalType("2");								// 과제선정 (과제-분임조과제 공통)
				vo.setRefBusCode(reportVO.getRepCode().toString());	// 과제코드
				approveService.cancelApprove(vo);					// 해당 결재건 지우기
			}	
		}
	}
	
	public void dropApprove(ReportVO reportVO, List<ReportTeamVO> approveMemberList) throws Exception {
		
		//String repStatusCode = reportVO.getRepStatusCode();
		
		if(reportVO.getRepCode()!=null) {
			// drop 신청시
			// reportVO.repStatusCode ==> 9 (Drop결재중) 변경
			ReportVO savedReportVO = this.select(reportVO);	// 값이 바뀐 상태에서 결재취소 하는 경우에 대비 디비에서 불러오기
			savedReportVO.setRepStatusCode("9");		// 임시저장 상태로 변경
			this.update(savedReportVO);				// 상태 변경 저장
			
			// 결재상신(DROP)
			this.regApproveReport(reportVO, approveMemberList, "2"); // 결재 종류 (1-과제신청, 2-드랍신청, 3-6시그마프로세스, 6-실시제안, 7-쪽지제안) (code_grp_id='APR_TYPE')
			// tb_approval_mst.aproval_type=2
			// 결재선 --> 챔피언, 과제리더
			// 해당 결재 완료시 report.repStatusCode=6으로 변경
		}
	}
	
	
	// 단계별 결재 승인 완료시 상태코드 업데이트하기 (결재상신은 컨트롤러에서)
	public void updateStep6Sigma(ReportVO reportVO) throws Exception {
		
		// report_detail 의 특정 
		String step = reportVO.getRepCurrStepCode();
		
		ReportDetailVO vo = reportVO.getRepDetailList().get(Integer.parseInt(step)-1);
		vo.setRepUpdateUser(reportVO.getRepUpdateUser());
		reportDetailService.updateStep(vo);
		
	}
	
	// 단계별 결재 완료시 상태 업데이트하기
	//public void approveStep6Sigma(ReportVO reportVO) {

		// 임시 : 결재완료시 다음 단계로 진행
		// reportDetailService.updateStepNext(vo);
		
//		vo.setRepStatus("2");
//		// 마지막 단계 외에는 모두 다음 단계를 활성화 시킨다.
//		if("1,2,3,4,5".indexOf(step)>-1) {
//			vo = new ReportDetailVO();
//			vo.setRepCode(reportVO.getRepCode());
//			vo.setRepUpdateUser(reportVO.getRepUpdateUser());
//			vo.setRepStepCode(step); // 쿼리에서 1 더해서 처리
//			reportDetailService.updateStepNext(vo);	
//		} else {
//			// 과제 상태 완료로 변경
//			// 과제 Detail 마지막 단계 업데이트
//		}
	//}
		

	public List<ReportVO> selectList(ReportSearchVO searchVO) {
		
		return dao.selectList("Report.selectList", searchVO);
	}
	
	public List<ReportVO> selectFullList(ReportSearchVO searchVO) {
		
		return dao.selectList("Report.selectFullList", searchVO);
	}
	
	public List<HashMap<String,Object>> selectFullListExcel(ReportSearchVO searchVO) {
		
		return dao.selectList("Report.selectFullListExcel", searchVO);
	}
	
	public List<EgovMap> selectReportList(ReportSearchVO vo) {
		
		return dao.selectList("Report.reportSelect", vo);
	}
	
	public List<HashMap<String,Object>> reportSelectExcel(ReportSearchVO vo) {
		
		return dao.selectList("Report.reportSelectExcel", vo);
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
	
	// 과제 기본정보만 조회
	public ReportVO selectReportDefaultInfo(ReportVO reportVO) {
		
		return (ReportVO)dao.selectOne("Report.select", reportVO);
	}
	
	public void delete(ReportVO reportVO) {
		
		// 과제 일정 제거
		ReportDetailVO reportDetailVO = new ReportDetailVO();
		reportDetailVO.setRepCode(reportVO.getRepCode());
		reportDetailService.delete(reportDetailVO);
		
		// 과제 팀원 제거
		ReportTeamVO reportTeamVO = new ReportTeamVO();
		reportTeamVO.setRepCode(reportVO.getRepCode());
		reportTeamService.delete(reportTeamVO);
		
		ReportResultVO reportResultVO = new ReportResultVO();
		reportResultVO.setRepCode(reportVO.getRepCode());
		reportResultService.delete(reportResultVO);
		
		ReportIndicatorVO reportIndicatorVO = new ReportIndicatorVO();
		reportIndicatorVO.setRepCode(reportVO.getRepCode());
		reportIndicatorService.delete(reportIndicatorVO);
		
		
		// 과제 첨부파일 제거
		attachFileService.deleteAttachFile(ATTACH_PREFIX + "_" + reportVO.getRepCode());
		
		dao.delete("Report.delete", reportVO);  	// 결재선 지우기
	}
	
	public Boolean checkChangeBaseInfo(ReportVO originVO, ReportVO newVO) {
		
		/***
		 * 과제 기본정보 변경시 true, 변경사항 없으면 false
		 * ****/
		
		if(		
			originVO.getRepName().equals(newVO.getRepName())
			&& originVO.getRepDivisionCode().equals(newVO.getRepDivisionCode())
			&& originVO.getRepTypeCode().equals(newVO.getRepTypeCode())
			&& originVO.getRepSectorCode().equals(newVO.getRepSectorCode())
			&& originVO.getRepProductClass().equals(newVO.getRepProductClass())
			&& originVO.getRepLeaderBeltCode().equals(newVO.getRepLeaderBeltCode())
			&& originVO.getRepActionTypeCode().equals(newVO.getRepActionTypeCode())
			&& originVO.getRepMbbUseRateCode().equals(newVO.getRepMbbUseRateCode())
			&& originVO.getRepUseRefDate().equals(newVO.getRepUseRefDate())
			&& originVO.getRepKeyword().equals(newVO.getRepKeyword())   ) {
			return false;
		} else {
			return true;
		}
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
		String[] arrCodeGrpIds = {"6SIG_YN", "RP_TY1", "RP_TY2", "RP_TY3", "SECTOR", "ACTTYPE", "LDRBELT", "MBBUSERT", "RESULTTY", "REP_ROLE", "BUSGRP"};
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
		// 분임조는 10+ 없애기
		codeVO.setCodeGrpId("6SIG_YN");
		codeVO.setActFlg("Y"); 
		List<EgovMap> code6SigYn = codeService.selectFullList(codeVO);
		if(reportVO.getRepMenuCode()!=null && reportVO.getRepMenuCode().equals("TEAM") 
				&& code6SigYn.size()==3 
				&& code6SigYn.get(2).get("codeNm").toString().startsWith("10+"))
			code6SigYn.remove(2); // 분임조 과제에서는 10+ 선택 못하도록 코드 삭제
		model.addAttribute("divisionCode", code6SigYn);
		
		
		/*********
		 * 2. ReportVO 데이터 가져오기
		 * *******/
		if(reportVO.getRepCode() != null) {
			// 수정모드	
			//ReportVO dbReportVO = new ReportVO();
			retVO = this.select(reportVO);
			
			if(retVO.getRepMenuCode().equals("TEAM")) {
				// 분임조과제일 경우 작성자를 기준으로 분임조 정보를 가져온다.
				ReportTeamVO memberVO = new ReportTeamVO();
				memberVO.setComNo(retVO.getRepRegUser());
				
				CircleVO circleVO = circleService.findCircleInfo(memberVO);
				model.addAttribute("circleVO", circleVO);
			}
			// 키 코드가 파라메터로 들어오면 임시저장건 수정모드로 진행
			retVO.setMode("UPDATE");
			model.addAttribute("reportVO", retVO);
		} else {
			// 신규작성 - 기본 Form 구성을 위한 메모리 할당
			//ReportVO emptyReportVO = new ReportVO();
			retVO.setRepMenuCode(reportVO.getRepMenuCode());
			retVO.setRepCode(idGnrService.getNextIntegerId());
			retVO.setRepMenuCode(reportVO.getRepMenuCode()); // REPORT >> 과제 
			
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
				String strTeamMemRoleNm = repRoleCodes.get(Integer.toString(i));
				if(reportVO.getRepMenuCode().equals("TEAM") && i==2)
					strTeamMemRoleNm = "분임조원";
				emptyRepTeamVO.setRepTeamMemRoleNm(strTeamMemRoleNm);  // 역할명칭 코드값 가져오기
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
	
	public void updateStatus(ReportVO vo) {
		ReportVO savedVO = this.select(vo);
		
		if(vo.getRepStatusCode().equals("3")) {  // 승인일 경우
			if(!savedVO.getRepDivisionCode().equals("1")) {  
				vo.setRepStatusCode("7"); // 일반/10+과제는 완료로 바꿔준다.
			}
		} // 반려는 코드 변경 없이 그대로 반영한다.
		
		dao.update("Report.updateStatus", vo);
	}
	
	/**
     * 과제 - 6시그마 단계별 결재 승인 후 다음단계를 활성화한다.
     *
     * @param ReportVO vo - repCode, repCurrStepCode
	 * @throws Exception 
     */
	public void update6SigmaStepNext(ReportVO reportVO) throws Exception {
		ReportVO savedVO = this.select(reportVO);
		String statusCode = savedVO.getRepStatusCode();
		String currStepCode = savedVO.getRepCurrStepCode();
		
		//1. 6sigma 과제 확인, 진행중 여부 확인
		if(savedVO.getRepDivisionCode().equals("1") && "3,4,5".indexOf(statusCode)>-1) {
			
			Integer currStepNum = Integer.parseInt(currStepCode);
			
			// 현재 단계 완료 처리
			ReportDetailVO detailVO = savedVO.getRepDetailList().get(currStepNum-1);
			detailVO.setRepStatus("2"); // 승인한 단계 완료 처리
			detailVO.setRepUpdateUser(reportVO.getRepUpdateUser());
			reportDetailService.update(detailVO);
			
			// 과제상태 변경
			if(detailVO.getRepPlanStartDate()!=null
					&& detailVO.getRepActStartDate()!=null
					&& detailVO.getRepPlanStartDate().before(detailVO.getRepActStartDate())
					&& detailVO.getRepPlanStartDate().equals(detailVO.getRepActStartDate())
					) {
				// 계획된 날짜에 승인시 
				savedVO.setRepStatusCode("4"); // 진행중(On)	
			} else {
				// 계획보다 늦어질 경우 
				savedVO.setRepStatusCode("5"); // 진행중(Off)	
			}
			this.update(savedVO);
			
			if(currStepNum==6) {
				// 승인은 repStatusCode 6으로, Drop은  5로 처리
				savedVO.setRepStatusCode("6"); // 완료
				dao.update("Report.updateStatus", savedVO);
			} else {
				// 그 외 결재면 다음 스텝으로 넘어가
				ReportDetailVO detailNextVO = new ReportDetailVO();
				detailNextVO.setRepCode(reportVO.getRepCode());
				detailNextVO.setRepStatus("1");
  				detailNextVO.setRepUpdateUser(reportVO.getRepUpdateUser());
				detailNextVO.setRepStepCode(Integer.toString(currStepNum+1));
				reportDetailService.updateStepStatus(detailNextVO);
			}
		}
	}
	
	public void update6SigmaStepBefore(ReportVO reportVO) throws Exception {
		ReportVO savedVO = this.select(reportVO);
		String statusCode = savedVO.getRepStatusCode();	// 과제 상태코드(진행중(ON/OFF))
		String currStepCode = savedVO.getRepCurrStepCode();	// 현재 6시그마 진행단계
		
		//1. 6sigma 과제 확인, 진행중 여부 확인
		if(savedVO.getRepDivisionCode().equals("1") && "3,4".indexOf(statusCode)>-1) {
			
			Integer currStepNum = Integer.parseInt(currStepCode);	//현재단게
			
			// 현재 단계 0로 처리
			ReportDetailVO detailVO = savedVO.getRepDetailList().get(currStepNum-1); //현재단계 데이터 가져온다(0-base)
			detailVO.setRepStatus("0"); // 단계 초기화
			detailVO.setRepUpdateUser(reportVO.getRepUpdateUser());
			reportDetailService.update(detailVO);
			
			// 이전 스텝 활성화
			ReportDetailVO detailNextVO = new ReportDetailVO();
			detailNextVO.setRepCode(reportVO.getRepCode());
			detailNextVO.setRepStepCode(Integer.toString(currStepNum-1));	//이전단계
			detailNextVO.setRepStatus("1"); 
			detailNextVO.setRepUpdateUser(reportVO.getRepUpdateUser());
			reportDetailService.updateStepStatus(detailNextVO	);
		}
	}
	
	
}
