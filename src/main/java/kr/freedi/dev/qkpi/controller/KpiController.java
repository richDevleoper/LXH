package kr.freedi.dev.qkpi.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.google.gson.JsonArray;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.article.service.ArticleService;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.qapprove.domain.ApproveVO;
import kr.freedi.dev.qpopup.domain.DepartVO;
import kr.freedi.dev.qpopup.service.QPopupService;
import kr.freedi.dev.qreport.domain.MakeSearchVO;
import kr.freedi.dev.qreport.domain.MakeVO;
import kr.freedi.dev.qreport.domain.ReportSearchVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;
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
	
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}
	
	@RequestMapping({"/MgrList.do"})
	public String handler_mgrList(HttpServletRequest request, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
	
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
		
		// 페이지 바인딩
		model.addAttribute("action", "/kpi/insertKpiUserInfo.do");
		
		return "app/kpi/MgrSelect";
	}
	
	@RequestMapping({"/MgrPlan.do"})
	public String handler_mgrPlan(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		return "app/kpi/MgrPlan";
	}
	
	@RequestMapping({"/insertKpiUserInfo.do"})
	public String insertMakeInfo(HttpServletRequest request, ModelMap model,
		@ModelAttribute("MakeSearchVO") MakeSearchVO searchVO, 
		@ModelAttribute("MakeVO") MakeVO makeVO, 
		UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		
		if(makeVO.getCirCode()==null) {
			makeVO.setCirRegUser(userSession.getUserId());
			makeService.insertKpi(makeVO);	
		} else {
			makeVO.setCirUpdateUser(userSession.getUserId());
			makeService.updateKpi(makeVO);
		}
		
		//return "app/make/MakeList";
		return "redirect:/sub.do?menuKey="+searchVO.getMenuKey();
		
	}			
}

