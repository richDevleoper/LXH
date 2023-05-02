package kr.freedi.dev.qreport.controller;

import java.io.File;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.qreport.domain.ReportDetailVO;
import kr.freedi.dev.qreport.domain.ReportIndicatorVO;
import kr.freedi.dev.qreport.domain.ReportResultVO;
import kr.freedi.dev.qreport.domain.ReportSearchVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;
import kr.freedi.dev.qreport.domain.ReportVO;
import kr.freedi.dev.qreport.service.ReportService;
import kr.freedi.dev.user.domain.UserVO;

/**
 * @project : dev_default
 * @file 	: ReportController.java
 * @date	: 2023. 3. 27
 * @author	: swpark
 * @comment : 과제 - 등록
 * @history	: 
 */
@Controller
@RequestMapping({"/report"})
public class ReportController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_TABLE_PREFIX = "TB";
	
	@Resource(name = "reportService")
	private ReportService reportService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "reportIdGnrService")
	private EgovIdGnrService idGnrService;
	
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}
	
	// 과제 - 리스트
	@RequestMapping({"/list.do", "/002_01_mission.do"})
	public String handler_list(HttpServletRequest request, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		List<EgovMap> countList = reportService.selectListCount2(searchVO);
		
		
		int totalCount = 0;
		for (EgovMap egovMap : countList) {
			BigDecimal currVal = (BigDecimal)egovMap.get("cnt");
			totalCount = totalCount + currVal.intValue();
			String codeNm = (String)egovMap.get("repstatuscode");
			if(codeNm!=null) {
				model.addAttribute("count_"+codeNm, currVal.intValue());
			}
		}
		
		//페이징 기본설정8
		searchVO.setTotalRecordCount(totalCount);
		
		List<ReportVO> reportList = reportService.selectList(searchVO);
		model.addAttribute("reportList", reportList);
		model.addAttribute("totalCount", totalCount);
	
		CodeVO codeVO = new CodeVO(); 
		codeVO.setCodeGrpId("6SIG_YN");
		codeVO.setActFlg("Y"); 
		model.addAttribute("searchRepName", codeService.selectFullList(codeVO));
		
		codeVO.setCodeGrpId("RP_TY1");
		codeVO.setActFlg("Y"); 
		model.addAttribute("typeCode1", codeService.selectFullList(codeVO));
		
		codeVO.setCodeGrpId("RP_TY2");
		codeVO.setActFlg("Y"); 
		model.addAttribute("typeCode2", codeService.selectFullList(codeVO));
		
		codeVO.setCodeGrpId("RP_TY3");
		codeVO.setActFlg("Y"); 
		model.addAttribute("typeCode3", codeService.selectFullList(codeVO));
		
		codeVO.setCodeGrpId("REP_STAT");
		codeVO.setActFlg("Y"); 
		model.addAttribute("searchStatus", codeService.selectFullList(codeVO));
		
		return "app/report/List";
	}
	
	@RequestMapping({"/updateForm.do"})
	public String updateForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO, 
			UserVO userSession)throws Exception {

		
		//Integer paramRepCode = reportVO.getRepCode();
		ReportVO tReportVO = new ReportVO();
		tReportVO = reportService.select(reportVO);
		
		if(tReportVO.getRepStatusCode().equals("1")) { 
			// 임시저장일 경우
			return "redirect:./insertForm.do?menuKey="+searchVO.getMenuKey()+"&repCode="+reportVO.getRepCode();
		} else {	
			// 그 외(선정중~)
			return "redirect:./insertFormStat3.do?menuKey="+searchVO.getMenuKey()+"&repCode="+reportVO.getRepCode();
			
		}
	}
	// 나의 과제 > 상태 '선정중' 이상
	@RequestMapping({"/insertFormStat3.do"})
	public String handler_insertFormStat3(HttpServletRequest req, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("reportVO") ReportVO reportVO, 
			UserVO userSession) throws Exception {
		
		this.proc_reportFormHandler(req, model, searchVO, reportVO, userSession);
				
		return "app/report/InsertFormStat3";
	}  
	
	
	// 나의 과제> 과제작성 (임시저장 포함)
	@RequestMapping({"/insertForm.do"})
	public String handler_insertForm(HttpServletRequest req, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("reportVO") ReportVO reportVO, 
			UserVO userSession) throws Exception {
		
		ReportVO retVO = this.proc_reportFormHandler(req, model, searchVO, reportVO, userSession);
				
		if(retVO.getRepCode() != null 
				&& retVO.getRepDivisionCode() !=null 
				&& !retVO.getRepDivisionCode().equals("1")) {  
			// 임시저장중인 6시그마 건만 별도 페이지에서 처리. (일정계획의 포멧이 다름)
			return "app/report/InsertFormStat1";	
		} else {
			return "app/report/InsertForm";
		}
		
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
		model.addAttribute("action", "/report/insert.do");
		
		/*********
		 * 2. ReportVO 데이터 가져오기
		 * *******/
		if(reportVO.getRepCode() != null) {
			// 수정모드	
			//ReportVO dbReportVO = new ReportVO();
			retVO = reportService.select(reportVO);
			// 키 코드가 파라메터로 들어오면 임시저장건 수정모드로 진행
			retVO.setMode("UPDATE");
			model.addAttribute("reportVO", retVO);
		} else {
			// 신규작성 - 기본 Form 구성을 위한 메모리 할당
			//ReportVO emptyReportVO = new ReportVO();
			retVO.setRepCode(idGnrService.getNextIntegerId());
			retVO.setRepMenuCode("REPORT"); // REPORT >> 과제 
			
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
	
	@RequestMapping({"/insert.do"})
	public String insert(HttpServletRequest req, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO,
			UserVO userSession, 
			String userIp) throws Exception {

		String userId = userSession.getUserId();
		
//		//insert article
		if(reportVO.getMode().equals("UPDATE")) {
			reportVO.setRepUpdateUser(userId);
			reportService.update(reportVO);	
		} else {
			reportVO.setRepRegUser(userId);
			reportService.insert(reportVO);	
		}
		
		//return "redirect:/report/002_01_sub01.do?menuKey=29";
		return "redirect:/sub.do?menuKey=29";
	}
	

  
}

