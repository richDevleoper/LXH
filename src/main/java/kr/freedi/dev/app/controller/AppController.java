package kr.freedi.dev.app.controller;

import java.io.File;
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
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.article.domain.ArticleVO;
import kr.freedi.dev.article.service.ArticleService;
import kr.freedi.dev.board.domain.BoardVO;
import kr.freedi.dev.board.service.BoardService;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.common.util.EncriptUtil;
import kr.freedi.dev.common.util.MapUtil;
import kr.freedi.dev.user.domain.UserVO;

/**
 * @project : dev_default
 * @file 	: ArticleController.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class AppController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_TABLE_PREFIX = "TB";
	
	
	@Resource(name = "articleIdGnrService")
	private EgovIdGnrService idGnrService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}


	@RequestMapping({"/app/001_01_sigma.do"})
	public String sixSigmaStatusHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleVO") ArticleVO articleVO,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		log.debug(searchVO.toString());
		
		//권한체크
		//boolean isMngr = appService.isMngr(userSession, articleVO);
		

//		//권한정보
//		model.addAttribute("isMngr", isMngr);
//		model.addAttribute("isUseGrpForWrite", articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_WRITE));
//		model.addAttribute("isUseGrpForComment", articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_COMMENT));

		return "app/qi/001_01_sigma";

	}
	
	@RequestMapping({"/app/001_01_sigma_sub.do"})
	public String sixSigmaStatusSubHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_01_sigma_sub";

	}
	
	@RequestMapping({"/app/001_03_t_mbb.do"})
	public String captainMBBStatusHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_03_t_mbb";

	}
	
	@RequestMapping({"/app/001_04_mbb_use.do"})
	public String useRateMBBHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_04_mbb_use";

	}
	
	@RequestMapping({"/app/001_04_mbb_use_sub.do"})
	public String useRateMBBSubHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_04_mbb_use_sub";

	}
	

	
	@RequestMapping({"/app/001_05_01_kpi_list.do"})
	public String kpiMgrListHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_05_01_kpi_list";

	}
	
	@RequestMapping({"/app/001_05_02_plan.do"})
	public String kpiPlanBuildHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_05_02_plan";

	}
	
	
	/*
	 #2. 과제/10+ No Policy활동  
	 */
	@RequestMapping({"/app/002_01_mission.do"})
	public String missionListHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_01_mission";

	}
	
	@RequestMapping({"/app/002_01_sub01.do"})
	public String missionSub01Handler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_01_sub01";

	}
	
	@RequestMapping({"/app/002_01_sub02.do"})
	public String missionSub02Handler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_01_sub02";

	}
	
	@RequestMapping({"/app/002_01_sub04.do"})
	public String missionSub04Handler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_01_sub04";

	}
	
	@RequestMapping({"/app/002_01_sub05.do"})
	public String missionSub05Handler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_01_sub05";

	}
	
	@RequestMapping({"/app/002_02_search.do"})
	public String missionSearchHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_02_search";

	}
	
	@RequestMapping({"/app/002_02_sub.do"})
	public String missionSearchSubHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_02_sub";

	}
	
	@RequestMapping({"/app/002_03_report.do"})
	public String missionReportHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_03_report";

	}
	
	
	
	
	
}
