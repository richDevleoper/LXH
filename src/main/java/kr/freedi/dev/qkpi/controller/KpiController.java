package kr.freedi.dev.qkpi.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import kr.freedi.dev.article.domain.ArticleVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.qeducation.controller.EducationController;
import kr.freedi.dev.qeducation.excel.ExcelFunction;
import kr.freedi.dev.qkpi.domain.KpiManageVO;
import kr.freedi.dev.qkpi.domain.KpiSearchVO;
import kr.freedi.dev.qkpi.domain.KpiVO;
import kr.freedi.dev.qkpi.service.KpiService;
import kr.freedi.dev.qpopup.domain.DepartVO;
import kr.freedi.dev.qpopup.service.QPopupService;
import kr.freedi.dev.qreport.domain.MakeSearchVO;
import kr.freedi.dev.qreport.domain.MakeVO;
import kr.freedi.dev.qreport.domain.ReportSearchVO;
import kr.freedi.dev.qreport.domain.ReportVO;
import kr.freedi.dev.qreport.service.MakeService;
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
@RequestMapping({"/kpi"})
public class KpiController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	//final String ATTACH_TABLE_PREFIX = "TB";
	
	final String REP_MENU_CODE = "REPORT";  // REPORT or TEAM
	
	@Resource(name = "reportService")
	private ReportService reportService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "qPopupService")
	private QPopupService qPopupService;
	
	@Resource(name = "makeService")
	private MakeService makeService;
	
	@Resource(name = "kpiService")
	private KpiService kpiService;
	
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}
	
	@RequestMapping({"/MgrList.do"})
	public String handler_mgrList(HttpServletRequest request, ModelMap model,
			@ModelAttribute("makeVO") MakeVO makeVO,
			@ModelAttribute("searchVO") KpiSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		String pKudIdx = makeVO.getKudIdx();
		if(pKudIdx==null)
			searchVO.setKudIdx("6SIG");
		
		// 현재 년도 설정
		if(searchVO.getSearchYear()==null) {
			LocalDate now = LocalDate.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy");
			searchVO.setSearchYear(now.format(formatter));
	
		}
        
		Integer totalCount = makeService.selectKpiListCount(searchVO);
		searchVO.setTotalRecordCount(totalCount);
		model.addAttribute("totalCount", totalCount);
		
		List<KpiManageVO> list = makeService.selectKpiFullList(searchVO);
		model.addAttribute("mgrList", list);	
	
		return "app/kpi/MgrList";
	}
	
	
	// 대상선정
	@RequestMapping({"/MgrSelect.do"})
	public String handler_mgrSelect(HttpServletRequest request, ModelMap model,
			@ModelAttribute("makeVO") MakeVO makeVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO, 
			UserVO userSession)throws Exception {

		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		searchVO.setSearchUserid(userSession.getUserId());
		
		List<DepartVO> dbList = qPopupService.selectTreeList();
		JsonArray deptList = makeService.convertTreeJson(dbList);
		
		model.addAttribute("deptList", deptList);
		
		String pKudIdx = makeVO.getKudIdx();
		if(pKudIdx==null)
			makeVO.setKudIdx("6SIG");
		
		List<KpiManageVO> kpiMgrList = makeService.selectKpiUserDetailList(makeVO);
		model.addAttribute("kpiMgrList", kpiMgrList);
		// select 6sig 품질/인재
		// select 6sig 품질 외 인재
		
		// 페이지 바인딩
		model.addAttribute("action", "/kpi/insertKpiUserInfo.do");
		
		return "app/kpi/MgrSelect";
	}
	
	@RequestMapping({"/MgrPlan.do"})
	public String handler_mgrPlan(HttpServletRequest request, ModelMap model,
			@ModelAttribute("kpiSearchVO") KpiSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		
		JsonArray resultArray = kpiService.getPlanData(searchVO);
		model.addAttribute("tableData", resultArray);
		
		return "app/kpi/MgrPlan";
	}
	
	@RequestMapping({"/insertKpiUserInfo.do"})
	public String insertMakeInfo(HttpServletRequest request, ModelMap model,
		@ModelAttribute("MakeSearchVO") MakeSearchVO searchVO, 
		@ModelAttribute("MakeVO") MakeVO makeVO, 
		UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		
		makeVO.setCirRegUser(userSession.getUserId());
		makeVO.setCirUpdateUser(userSession.getUserId());
		
		makeService.saveKpi(makeVO);
		
		//return "app/make/MakeList";
		return "redirect:/kpi/MgrList.do?menuKey=46&kudIdx="+makeVO.getKudIdx();
		
	}
	
	@RequestMapping({"/status6SIG.do"})
	public String handler_statusList6SIG(HttpServletRequest request, ModelMap model,
			@ModelAttribute("kpiSearchVO") KpiSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		model.addAttribute("kudIdx", "6SIG");
		
		JsonArray resultArray = kpiService.getPlanData(searchVO);
		model.addAttribute("tableData", resultArray);
		
		
		return "app/kpi/StatusList";
	}
	
	@RequestMapping({"/statusMBB.do"})
	public String handler_statusListMBB(HttpServletRequest request, ModelMap model,
			@ModelAttribute("kpiSearchVO") KpiSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		model.addAttribute("kudIdx", "MBB");
		
		JsonArray resultArray = kpiService.getPlanData(searchVO);
		model.addAttribute("tableData", resultArray);
		
		return "app/kpi/StatusList";
	}
	
	@RequestMapping({"/statusView.do"})
	public String handler_statusList6SIG(HttpServletRequest request, ModelMap model,
			@ModelAttribute("kpiVO") KpiVO kpiVO,
			@ModelAttribute("kpiSearchVO") KpiSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		
		
		return "app/kpi/StatusView";
	}
	
	
	@RequestMapping({"/MbbRateList.do"})
	public String handler_mbbRateList(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		return "app/kpi/MbbRateList";
	}
	
	@RequestMapping({"/MbbRateView.do"})
	public String handler_mbbRateView(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		return "app/kpi/MbbRateView";
	}
	
	@RequestMapping({"/excelBuild.do"})
	public @ResponseBody void excelBuild(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("makeVO") MakeVO makeVO,
			@ModelAttribute("searchVO") KpiSearchVO searchVO,
			UserVO userSession){
		
		EducationController xlsController = new EducationController();
		
		try {
			String[] colIdArr = {"IDX", "COM_NO", "KUD_USER_NAME", "KUD_PLACE", "KUD_PART", "KUD_TEAM_NAME", "KUD_BELONG_NAME", "", "KUD_JOBX", "KUD_POSITION", "KUD_CERT_BELT"};
			String[] colNameArr = {"NO", "사번", "이름", "근무지명", "부문", "팀명", "소속명", "직무명", "직위", "직책","인증현황"};
			
			String fileName = "KPI관리대상_" + xlsController.getCurrentDate() + xlsController.getCurrentTime() + ".xlsx";
			List<HashMap<String,Object>> reportList  = makeService.selectKpiFullListExcel(searchVO); 
			//List<ReportVO> reportList = reportService.selectFullList(searchVO);
			
			ExcelFunction.excelWriter(request, response, reportList, fileName, colIdArr, colNameArr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}

