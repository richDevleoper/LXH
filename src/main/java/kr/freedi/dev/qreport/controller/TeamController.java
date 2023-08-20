package kr.freedi.dev.qreport.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.common.util.SendMailUtil;
import kr.freedi.dev.qcircle.domain.CircleVO;
import kr.freedi.dev.qcircle.service.CircleService;
import kr.freedi.dev.qeducation.controller.EducationController;
import kr.freedi.dev.qeducation.excel.ExcelFunction;
import kr.freedi.dev.qpopup.domain.DepartVO;
import kr.freedi.dev.qpopup.service.QPopupService;
import kr.freedi.dev.qproposal.service.ProposalService;
import kr.freedi.dev.qreport.domain.ReportSearchVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;
import kr.freedi.dev.qreport.domain.ReportVO;
import kr.freedi.dev.qreport.service.MakeService;
import kr.freedi.dev.qreport.service.ReportService;
import kr.freedi.dev.user.domain.UserVO;

/**
 * @project : dev_default
 * @file : TeamController.java
 * @date : 2023. 3. 27
 * @author : swpark
 * @comment : 분임조과제 - 등록
 * @history :
 */
@Controller
@RequestMapping({ "/team" })
public class TeamController {

	protected Log log = LogFactory.getLog(this.getClass());

	// final String ATTACH_TABLE_PREFIX = "TB";

	final String REP_MENU_CODE = "TEAM"; // REPORT(과제) or TEAM(분임조과제)

	@Resource(name = "reportService")
	private ReportService reportService;
	
	@Resource(name = "makeService")
	private MakeService makeService;
	
	@Resource(name = "qPopupService")
	private QPopupService qPopupService;
	
	@Resource(name = "codeService")
	private CodeService codeService;

	@Resource(name = "circleService")
	private CircleService circleService;
	
	@Resource(name = "proposalService")
	private ProposalService proposalService;

	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}

	// 과제 - 리스트
	@RequestMapping({ "/list.do" })
	public String handler_list(HttpServletRequest request, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		model.addAttribute("repMenuCode", REP_MENU_CODE);
		
		searchVO.setMenuCode(REP_MENU_CODE);
		String pSearchUser = userSession.getUserId();
		if(pSearchUser==null)
			pSearchUser = "x";
		searchVO.setSearchUserid(pSearchUser);

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
		
		//페이징 기본설정
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

		// Integer paramRepCode = reportVO.getRepCode();
		ReportVO tReportVO = new ReportVO();
		tReportVO = reportService.select(reportVO);
		
		if(("1,2,8").indexOf(tReportVO.getRepStatusCode())>-1) {
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
		reportVO.setRepMenuCode(REP_MENU_CODE); // 화면 바인딩을 위해 세팅하여 서비스에 전달

		// 페이지 바인딩
		ReportVO retVO = reportService.proc_reportFormHandler(req, model, searchVO, reportVO, userSession);
		model.addAttribute("action", "/team/insert.do");

		// (시작) 분임조 과제 작성 -> 작성 화면 진입시 분임조 정보 가져오기
		String userId = userSession.getUserId();
		if (retVO.getRepLeaderCode() != null) {
			userId = retVO.getRepLeaderCode();
		}
		ReportTeamVO memberVO = new ReportTeamVO();
		memberVO.setComNo(userId);

		CircleVO circleVO = circleService.findCircleInfo(memberVO);
		model.addAttribute("circleVO", circleVO);
		// (끝) 분임조 과제 작성 -> 작성 화면 진입시 분임조 정보 가져오기

		if (retVO.getRepCode() != null && retVO.getRepDivisionCode() != null
				&& !retVO.getRepDivisionCode().equals("1")) {
			// 임시저장, 상신중 인 6시그마 건만 별도 페이지에서 처리. (일정계획의 포멧이 다름)
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

		if(reportVO.getMode().equals("UPDATE")) {
			// 임시저장 건 결재의뢰/임시저장
			reportVO.setRepUpdateUser(userId);
			reportService.update(reportVO);	
		} else if(reportVO.getMode().equals("CANCEL")) {
			// 임시저장 건 결재취소 --> 결재데이터 제거 및 임시저장 상태로 변경			
			reportService.cancelApprove(reportVO);
		} else if(reportVO.getMode().equals("DELETE")) {
			// 임시저장 건 결재취소 --> 결재데이터 제거 및 임시저장 상태로 변경
			reportService.delete(reportVO);
		} else {
			// 신규입력 결재의뢰/임시저장
			reportVO.setRepRegUser(userId);
			reportService.insert(reportVO);
			if(reportVO.getRepTeamMemberList().size()>0) {
				
				String sender = "";
				sender = proposalService.selectProposalEmail(userSession.getIntfUserVO().getComCode());
				String receiver = "";
				receiver = proposalService.selectProposalEmail(reportVO.getRepTeamMemberList().get(0).getComNo());
				SendMailUtil.CustomSendMail(sender, receiver, reportVO.getRepTeamMemberList().get(0).getComNo(), "request");
			}
		}

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
		String repCurrStep = reportVO.getRepCurrStepCode();

		// 챔피언, 지도사원 저장
		List<ReportTeamVO> approveMemberList = new ArrayList<>();
		
		ReportTeamVO memChamp = null;	// 챔피언
		ReportTeamVO memLeader = null; // 지도사원
		for (ReportTeamVO memberVO : reportVO.getRepTeamMemberList()) {
			if(memberVO.getRepTeamMemRole().equals("5")) { // Define, Finish
				memChamp = memberVO;	// 챔피언(5)
			} else if(memberVO.getRepTeamMemRole().equals("3")) {  //그 외
				memLeader = memberVO;	// 지도사원(3)
			}
		}
		
		reportVO.setRepUpdateUser(userId);
		if(reportVO.getMode().equals("CANCEL")) {  // 결재취소

			// 마지막 단계 결재상신건 취소하기			
			reportService.cancelApprove(reportVO);

		} else if(reportVO.getMode().equals("DROP")) { // Drop신청

			// 마지막 단계 결재상신건 취소하기			
			approveMemberList.add(memChamp);  
			reportVO.setRepUpdateUser(userId);
			// 과제 진행 중 Drop하기
			reportService.dropApprove(reportVO, approveMemberList);
			
		} else {
			
			//1. 단계저장 - 6시그마  ---------------------------------
			if(reportVO.getRepDivisionCode().equals("1")) {
				reportService.updateStep6Sigma(reportVO);
			} 
			
			// 2. 과제마스터 변경사항 체크하기  ---------------------------------
			ReportVO originReportVO = reportService.select(reportVO);
			
			// Finish 결재인 경우 챔피언 결재선 추가
			if(repCurrStep.equals("6")) {
				approveMemberList.add(memChamp);
			}
			// 그 외 중간 진행사항은 지도사원 결재선 추가
			if("1,2,3,4,5".indexOf(repCurrStep)>-1) {
				approveMemberList.add(memLeader);
				
				// 과제 마스터 변경사항 발생시 결재선에 챔피언 등록
				Boolean isChanged = reportService.compareReportBaseInfo(originReportVO, reportVO); // 변경사항 체크
				if(isChanged) {
					approveMemberList.add(memChamp);
					
					reportVO.setRepUpdateUser(userSession.getUserId());
					reportService.updateReportMasterAndResult(reportVO);
				} 
			}

			// 3. 결재올리기 ---------------------------------
			reportVO.setRepUpdateUser(userId);
			//reportService.regApproveType3(reportVO, approveMemberList);
			reportService.regApproveReport(reportVO, approveMemberList, "3");

			// TODO 4. 이메일 전송   ---------------------------------
		
		}

		return "redirect:/sub.do?menuKey=33";
	}

	// 과제검색
	@RequestMapping({"/Search.do"})
	public String handler_search(HttpServletRequest request, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO, 
			UserVO userSession)throws Exception {

		model.addAttribute("menuKey", searchVO.getMenuKey());
		model.addAttribute("repMenuCode", REP_MENU_CODE);

		searchVO.setMenuCode(REP_MENU_CODE); // 과제 or 분임조과제 구분

		// 페이지 초기값 세팅을 위한 코드값 바인딩
		CodeVO codeVO = new CodeVO(); 
		codeVO.setCodeGrpId("6SIG_YN");
		codeVO.setActFlg("Y"); 
		List<EgovMap> code6SigYn = codeService.selectFullList(codeVO);
		if(REP_MENU_CODE.equals("TEAM") 
				&& code6SigYn.size()==3 
				&& code6SigYn.get(2).get("codeNm").toString().startsWith("10+"))
			code6SigYn.remove(2); // 분임조 과제에서는 10+ 선택 못하도록 코드 삭제
		model.addAttribute("searchDivision", code6SigYn);
		

		codeVO = new CodeVO(); 
		String[] arrCodeGrpIds = {"6SIG_YN", "RP_TY1", "RP_TY2", "RP_TY3", "SECTOR", "ACTTYPE", "LDRBELT", "MBBUSERT", "RESULTTY", "REP_ROLE", "WPLACE", "REP_STAT"};
		codeVO.setCodeGrpIdList(arrCodeGrpIds);
		codeVO.setActFlg("Y"); 
		List<EgovMap> allCodes = codeService.selectFullList(codeVO);		//item.codeGrpId, codeId, codeNm

		model.addAttribute("allCodes", allCodes);

		//searchVO.setSearchUserid(userSession.getUserId());
		List<EgovMap> countList = reportService.selectFullListCount(searchVO);

		int totalCount = 0;
		for (EgovMap egovMap : countList) {
			
			String codeNm = (String)egovMap.get("repDivisionCode");
			BigDecimal currVal = (BigDecimal)egovMap.get("cnt");
			totalCount = totalCount + currVal.intValue();
		}
		model.addAttribute("countList", countList);
		
		//페이징 기본설정
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

		return "app/report/SearchView"; // 과제 페이지
	}
	
	@RequestMapping({"/ReportList.do"})
	public String handler_reportList(HttpServletRequest req, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		model.addAttribute("repMenuCode", REP_MENU_CODE);
		model.addAttribute("searchVO", searchVO);
		
		CodeVO codeVO = new CodeVO(); 
		String[] arrCodeGrpIds = {"6SIG_YN", "RP_TY1", "RP_TY2", "RP_TY3", "SECTOR", "ACTTYPE", "LDRBELT", "MBBUSERT", "RESULTTY", "REP_ROLE", "WPLACE", "REP_STAT"};
		codeVO.setCodeGrpIdList(arrCodeGrpIds);
		codeVO.setActFlg("Y");
		List<EgovMap> allCodes = codeService.selectFullList(codeVO); // item.codeGrpId, codeId, codeNm
		model.addAttribute("allCodes", allCodes);
		
		searchVO.setMenuCode(REP_MENU_CODE);

		List<DepartVO> dbList = qPopupService.selectTreeList();
		JsonArray deptList = makeService.convertTreeJson(dbList);
		model.addAttribute("deptFullList", deptList);
		
		List<EgovMap> reportList = reportService.selectReportList(searchVO);
		model.addAttribute("reportList", reportList);

		return "app/report/ReportList";
	}
	
	@RequestMapping({"/reportExcelbuild.do"})
	public @ResponseBody void excelBuild(HttpServletRequest request, HttpServletResponse response, 
		@ModelAttribute("reportVO") ReportVO reportVO,
		@ModelAttribute("reportSearchVO") ReportSearchVO searchVO,
		   UserVO userSession){
		
		EducationController xlsController = new EducationController();
		
		try {
			String[] colIdArr = {"IDX", "REP_NAME", "REP_DIVISION", "REP_TYPE", "REP_STATUS", "REP_START_DATE", "REP_FINISH_DATE", "REP_ACTION_TYPE", "REP_MBB_USE_RATE", "REP_SECTOR"};
			String[] colNameArr = {"NO", "과제명", "6σ Full Process여부", "과제유형", "진행현황", "시작일", "종료일", "활동분야", "MBB활용율", "활동분야"};
			
			String fileName = "분임조과제_" + xlsController.getCurrentDate() + xlsController.getCurrentTime() + ".xlsx";
			searchVO.setMenuCode(REP_MENU_CODE);
			List<HashMap<String,Object>> reportList  = reportService.selectFullListExcel(searchVO);
			//List<ReportVO> reportList = reportService.selectFullList(searchVO);
			
			ExcelFunction.excelWriter(request, response, reportList, fileName, colIdArr, colNameArr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping({"/reportSummary.do"})
	public @ResponseBody void excelSummaryBuild(HttpServletRequest request, HttpServletResponse response, 
		@ModelAttribute("reportVO") ReportVO reportVO,
		@ModelAttribute("reportSearchVO") ReportSearchVO searchVO,
		   UserVO userSession){
		
		EducationController xlsController = new EducationController();
		
		try {
			String[] colIdArr = {"REPRESULTTYPE","INY_TOTAL","INY_ACT_1","INY_ACT_2","INY_ACT_3","INY_ACT_4","INY_ACT_5","Y_ACT_1","Y_ACT_2","Y_ACT_3","Y_ACT_4","Y_ACT_5"};
			String[] colNameArr = {"구분","년내Total","(년내)품질개선","(년내)개발","(년내)생산성향상","(년내)원가개선","(년내)기타","(년간)품질개선","(년간)개발","(년간)생산성향상","(년간)원가개선","(년간)기타"};
			
			String fileName = "REPORT_분임조과제_" + xlsController.getCurrentDate() + xlsController.getCurrentTime() + ".xlsx";
			searchVO.setMenuCode(REP_MENU_CODE);
			List<HashMap<String,Object>> reportList  = reportService.reportSelectExcel(searchVO);
			//List<EgovMap> reportList = reportService.selectReportList(searchVO);
			
			ExcelFunction.excelWriter(request, response, reportList, fileName, colIdArr, colNameArr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
