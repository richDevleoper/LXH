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
	public String handler001_01(HttpServletRequest request, ModelMap model,
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
	public String handler001_01_sub(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_01_sigma_sub";

	}
	
	@RequestMapping({"/app/001_03_t_mbb.do"})
	public String handler001_03(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_03_t_mbb";

	}
	
	@RequestMapping({"/app/001_04_mbb_use.do"})
	public String handler001_04(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_04_mbb_use";

	}
	
	@RequestMapping({"/app/001_04_mbb_use_sub.do"})
	public String handler001_04_sub(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_04_mbb_use_sub";

	}
	

	
	@RequestMapping({"/app/001_05_01_kpi_list.do"})
	public String handler001_05_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_05_01_kpi_list";

	}

	@RequestMapping({"/app/001_05_01_sub.do"})
	public String handler001_05_01_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_05_01_sub";

	}
	
	@RequestMapping({"/app/001_05_02_plan.do"})
	public String handler001_05_02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/001_05_02_plan";

	}
	
	
	/*
	 #2. 과제/10+ No Policy활동  
	 */
	@RequestMapping({"/app/002_01_mission.do"})
	public String handler002_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_01_mission";

	}
	
	@RequestMapping({"/app/002_01_sub01.do"})
	public String handler002_01_sub(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_01_sub01";

	}
	
	@RequestMapping({"/app/002_01_sub02.do"})
	public String handler002_01_sub02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_01_sub02";

	}
	
	@RequestMapping({"/app/002_01_sub04.do"})
	public String handler002_01_sub04(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_01_sub04";

	}
	
	@RequestMapping({"/app/002_01_sub05.do"})
	public String handler002_01_sub05(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_01_sub05";

	}
	
	@RequestMapping({"/app/002_02_search.do"})
	public String handler002_02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_02_search";

	}
	
	@RequestMapping({"/app/002_02_sub.do"})
	public String handler002_02_sub(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_02_sub";

	}
	
	@RequestMapping({"/app/002_03_report.do"})
	public String handler002_03(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/002_03_report";

	}
	
	@RequestMapping({"/app/003_01_myworks.do"})
	public String handler003_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/003_01_myworks";
	}
	
	@RequestMapping({"/app/003_01_myworks_01.do"})
	public String handler003_01_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/003_01_myworks_01";
	}
	
	@RequestMapping({"/app/003_01_myworks_02.do"})
	public String handler003_01_02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/003_01_myworks_02";
	}
	
	@RequestMapping({"/app/003_01_myworks_03.do"})
	public String handler003_01_03(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/003_01_myworks_03";
	}
	
	@RequestMapping({"/app/003_01_myworks_04.do"})
	public String handler003_01_04(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/003_01_myworks_04";
	}
	
	@RequestMapping({"/app/003_02_searchwork.do"})
	public String handler003_02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/003_02_searchwork";
	}
	
	@RequestMapping({"/app/003_02_searchwork_01.do"})
	public String handler003_02_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/003_02_searchwork_01";
	}
	
	@RequestMapping({"/app/003_03_mkteam.do"})
	public String handler003_03(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/003_03_mkteam";
	}
	
	@RequestMapping({"/app/003_03_mkteam_01.do"})
	public String handler003_03_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/003_03_mkteam_01";
	}
	
	@RequestMapping({"/app/003_03_mkteam_02.do"})
	public String handler003_03_02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/003_03_mkteam_02";
	}
	
	@RequestMapping({"/app/003_04_report.do"})
	public String handler003_04(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/003_04_report";
	}
	
	@RequestMapping({"/app/003_04_report_01.do"})
	public String handler003_04_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/003_04_report_01";
	}
	
	@RequestMapping({"/app/004_01_01_suggest.do"})
	public String handler004_01_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_01_01_suggest";
	}
	
	@RequestMapping({"/app/004_01_01_suggest_01.do"})
	public String handler004_01_01_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_01_01_suggest_01";
	}
	
	@RequestMapping({"/app/004_01_01_suggest_02.do"})
	public String handler004_01_01_02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_01_01_suggest_02";
	}
	
	@RequestMapping({"/app/004_01_02_pmsg.do"})
	public String handler004_01_02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_01_02_pmsg";
	}
	
	@RequestMapping({"/app/004_01_02_pmsg_01.do"})
	public String handler004_01_02_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_01_02_pmsg_01";
	}
	
	@RequestMapping({"/app/004_01_02_pmsg_02.do"})
	public String handler004_01_02_02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_01_02_pmsg_02";
	}
	
	@RequestMapping({"/app/004_02_search.do"})
	public String handler004_02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_02_search";
	}
	
	@RequestMapping({"/app/004_02_search_01.do"})
	public String handler004_02_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_02_search_01";
	}
	
	@RequestMapping({"/app/004_03_audit.do"})
	public String handler004_03(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_03_audit";
	}
	
	@RequestMapping({"/app/004_03_audit_01.do"})
	public String handler004_03_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_03_audit_01";
	}
	
	@RequestMapping({"/app/004_04_01_grd_eval.do"})  // 이 주소를 메뉴 URL로 등록하겠습니다.
	public String handler004_04_01(HttpServletRequest request, ModelMap model,  // 핸들러 메서드의 이름도 고유하게 바꿉니다.
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_04_01_grd_eval"; //JSP 파일의 경로를 넣되 확장자는 넣지 않습니다.
	}
	
	@RequestMapping({"/app/004_04_02_pay.do"})  // 이 주소를 메뉴 URL로 등록하겠습니다.
	public String handler004_04_02(HttpServletRequest request, ModelMap model,  // 핸들러 메서드의 이름도 고유하게 바꿉니다.
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_04_02_pay"; //JSP 파일의 경로를 넣되 확장자는 넣지 않습니다.
	}
	
	@RequestMapping({"/app/004_06_report.do"})
	public String handler004_06(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_06_report";
	}
	
	@RequestMapping({"/app/004_06_report_01.do"})
	public String handler004_06_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/004_06_report_01";
	}
	
	@RequestMapping({"/app/005_01_status.do"})
	public String handler005_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/005_01_status";
	}

	
	@RequestMapping({"/app/005_02_yplan.do"})
	public String handler005_02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/005_02_yplan";
	}
	
	@RequestMapping({"/app/005_03_01_buildup.do"})
	public String handler005_03_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/005_03_01_buildup";
	}
	
	@RequestMapping({"/app/005_03_01_buildup_01.do"})
	public String handler005_03_01_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/005_03_01_buildup_01";
	}
	
	@RequestMapping({"/app/005_03_02_pfmsubmit.do"})
	public String handler005_03_02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/005_03_02_pfmsubmit";
	}
	
	@RequestMapping({"/app/008_01_apprvbox.do"})
	public String handler008_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/008_01_apprvbox";
	}
	
	@RequestMapping({"/app/008_02_apprv_req.do"})
	public String handler008_02(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/008_02_apprv_req";
	}
	
	@RequestMapping({"/app/008_03_apprv_list.do"})
	public String handler008_03(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/008_03_apprv_list";
	}
	
	@RequestMapping({"/app/009_01_total_src.do"})
	public String handler009_01(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		return "app/qi/009_01_total_src";
	}
}
