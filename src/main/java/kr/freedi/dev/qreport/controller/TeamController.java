package kr.freedi.dev.qreport.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.qcircle.domain.CircleVO;
import kr.freedi.dev.qcircle.service.CircleService;
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
@RequestMapping({"/team"})
public class TeamController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	//final String ATTACH_TABLE_PREFIX = "TB";
	
	final String REP_MENU_CODE = "TEAM";  // REPORT(과제) or TEAM(분임조과제)
	
	@Resource(name = "reportService")
	private ReportService reportService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "circleService")
	private CircleService circleService;

	
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}
	
	// 과제 - 리스트
	@RequestMapping({"/list.do"})
	public String handler_list(HttpServletRequest request, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		model.addAttribute("repMenuCode", REP_MENU_CODE);
		
		searchVO.setMenuCode(REP_MENU_CODE);
		searchVO.setSearchUserid(userSession.getUserId());
		
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
	
	// 리스트에서 클릭시 (상황별 수정페이지로 이동)
	@RequestMapping({"/updateForm.do"})
	public String updateForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO, 
			UserVO userSession)throws Exception {

		
		//Integer paramRepCode = reportVO.getRepCode();
		ReportVO tReportVO = new ReportVO();
		tReportVO = reportService.select(reportVO);
		
		if(("1|2").indexOf(tReportVO.getRepStatusCode())>-1) {
			// 임시저장, 선정중일 경우
			return "redirect:./insertForm.do?menuKey="+searchVO.getMenuKey()+"&repCode="+reportVO.getRepCode();
		} else {	
			// 그 외(승인 이후)
			return "redirect:./insertFormStat3.do?menuKey="+searchVO.getMenuKey()+"&repCode="+reportVO.getRepCode();
		}
	}
	
	// 과제(등록화면) - 상태 '선정중' 이상
	@RequestMapping({"/insertFormStat3.do"})
	public String handler_insertFormStat3(HttpServletRequest req, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("reportVO") ReportVO reportVO, 
			UserVO userSession) throws Exception {
		
		
		
		reportService.proc_reportFormHandler(req, model, searchVO, reportVO, userSession);
		model.addAttribute("action", "/team/updateStep.do");
		model.addAttribute("repMenuCode", REP_MENU_CODE);
				
		return "app/report/InsertFormStat3";
	}  
	
	
	// 과제(등록화면) - 상태 '임시저장'
	@RequestMapping({"/insertForm.do"})
	public String handler_insertForm(HttpServletRequest req, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("reportVO") ReportVO reportVO, 
			UserVO userSession) throws Exception {
		
		model.addAttribute("repMenuCode", REP_MENU_CODE);
		reportVO.setRepMenuCode(REP_MENU_CODE); //화면 바인딩을 위해 세팅하여 서비스에 전달
		
		// 페이지 바인딩
		ReportVO retVO = reportService.proc_reportFormHandler(req, model, searchVO, reportVO, userSession);
		model.addAttribute("action", "/team/insert.do");
		
		// (시작) 분임조 과제 작성 -> 작성 화면 진입시 분임조 정보 가져오기
		String userId = userSession.getUserId();
		ReportTeamVO memberVO = new ReportTeamVO();
		memberVO.setComNo(userId);
		
		CircleVO circleVO = circleService.findCircleInfo(memberVO);
		model.addAttribute("circleVO", circleVO);
		// (끝) 분임조 과제 작성 -> 작성 화면 진입시 분임조 정보 가져오기

		if(retVO.getRepCode() != null 
				&& retVO.getRepDivisionCode() !=null 
				&& !retVO.getRepDivisionCode().equals("1")) {  
			// 임시저장중인 6시그마 건만 별도 페이지에서 처리. (일정계획의 포멧이 다름)
			return "app/report/InsertFormStat1";	
		} else {
			return "app/report/InsertForm";
		}
		
	}  
	
	
	// 과제 등록(Submit)
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
		return "redirect:/sub.do?menuKey=33";
	}
	
	// 과제 단계별 승인시 승인처리(6시그마/일반과제 분리처리)
	@RequestMapping({"/updateStep.do"})
	public String update_step(HttpServletRequest req, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO,
			UserVO userSession, 
			String userIp) throws Exception {

		String userId = userSession.getUserId();
		String currStep = req.getParameter("detail_curr_step");
		
		// 수정할 대상 가져오기 
		// reportVO.getRepDetailList().get(Integer.parseInt(currStep)-1);
		
		//1. 그냥 저장
		if(reportVO.getRepDivisionCode().equals("1")) {
			// 6시그마 저장
			reportService.updateStep6Sigma(reportVO, currStep);
		} else {
			// 일반/10+ 저장
			reportService.updateStepGeneral(reportVO);
		}
		
		//2. 결재올리기

		// 3. 기존 데이터 대비 과제 마스터가 바뀐 내용이 있다면 메일 보내기 
		
		// 결재 처리부
		// ㄴ결재 처리하면서  해당 repStepCode는 '2'로 처리하고 그다음 step을 '1'로 처리
		// ㄴ Drop은 결재 완료시 mst, detail을 
		
/*//		//insert article
		if(reportVO.getMode().equals("UPDATE")) {
			reportVO.setRepUpdateUser(userId);
			reportService.update(reportVO);	
		} else {
			reportVO.setRepRegUser(userId);
			reportService.insert(reportVO);	
		}*/
		
		//return "redirect:/report/002_01_sub01.do?menuKey=29";
		return "redirect:/sub.do?menuKey=29";
	}
	
	// 과제검색
	@RequestMapping({"/Search.do"})
	public String handler_search(HttpServletRequest request, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO, 
			UserVO userSession)throws Exception {

		model.addAttribute("menuKey", searchVO.getMenuKey());
		model.addAttribute("repMenuCode", REP_MENU_CODE);
		
		searchVO.setMenuCode(REP_MENU_CODE);  // 과제 or 분임조과제 구분
		
		// 페이지 초기값 세팅을 위한 코드값 바인딩
		CodeVO codeVO = new CodeVO(); 
		codeVO.setCodeGrpId("6SIG_YN");
		codeVO.setActFlg("Y"); 
		model.addAttribute("searchRepName", codeService.selectFullList(codeVO));

		codeVO = new CodeVO(); 
		String[] arrCodeGrpIds = {"6SIG_YN", "RP_TY1", "RP_TY2", "RP_TY3", "SECTOR", "ACTTYPE", "LDRBELT", "MBBUSERT", "RESULTTY", "REP_ROLE", "WPLACE", "REP_STAT"};
		codeVO.setCodeGrpIdList(arrCodeGrpIds);
		codeVO.setActFlg("Y"); 
		List<EgovMap> allCodes = codeService.selectFullList(codeVO);		//item.codeGrpId, codeId, codeNm

		model.addAttribute("allCodes", allCodes);
			
		searchVO.setSearchUserid(userSession.getUserId());
		List<EgovMap> countList = reportService.selectFullListCount(searchVO);
		
		
		int totalCount = 0;
		for (EgovMap egovMap : countList) {
			
			String codeNm = (String)egovMap.get("repDivisionCode");
			BigDecimal currVal = (BigDecimal)egovMap.get("cnt");
			totalCount = totalCount + currVal.intValue();
		}
		model.addAttribute("countList", countList);
		
		//페이징 기본설정8
		searchVO.setTotalRecordCount(totalCount);
		
		List<ReportVO> reportList = reportService.selectFullList(searchVO);
		model.addAttribute("reportList", reportList);
		model.addAttribute("totalCount", totalCount);
		
		return "app/report/Search";
	}
	
	// 과제검색_상세보기
	@RequestMapping({"/SearchView.do"})
	public String handler_searchView(HttpServletRequest req, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		model.addAttribute("repMenuCode", REP_MENU_CODE); // 과제 or 분임조과제. 결재문서는 이 코드 안들어감.

		searchVO.setMenuCode(REP_MENU_CODE);  // 검색조건 설정
		
		// TODO 결재건 종류에 따른 서브페이지 로딩하기.(조건문 분기하기)
		
		// TODO 과제 정보 가져오기
		ReportVO dbReportVO = reportService.proc_reportFormHandler(req, model, searchVO, reportVO, userSession);
		model.addAttribute("reportVO", dbReportVO);
		
		// TODO 분임조 정보 가져오기

		
		return "app/approve/ApprForm"; // 과제 페이지
	}
	

  
}
