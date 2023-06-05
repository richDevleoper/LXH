package kr.freedi.dev.index.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.FastDateFormat;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.fdl.property.EgovPropertyService;
import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.article.service.ArticleService;
import kr.freedi.dev.banner.domain.BannerVO;
import kr.freedi.dev.banner.service.IBannerService;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.common.domain.CommonVO;
import kr.freedi.dev.common.exception.NotExistPageException;
import kr.freedi.dev.link.domain.LinkVO;
import kr.freedi.dev.link.service.ILinkService;
import kr.freedi.dev.menu.domain.MenuVO;
import kr.freedi.dev.menu.service.IMenuService;
import kr.freedi.dev.popup.domain.PopupVO;
import kr.freedi.dev.popup.service.IPopupService;

/**
 * @project : dev_default
 * @file : IndexController.java
 * @date : 2017. 4. 21.
 * @author : pdh
 * @comment :
 * @history :
 */
@Controller
public class IndexController {

	protected Log log = LogFactory.getLog(this.getClass());

	final String MENU_TYP_CSL = "CSL";
	final String MENU_TYP_DEF = "DEF";
	final String MENU_TYP_ENG = "ENG";

	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;

	@Resource(name = "bannerService")
	private IBannerService bannerService;

	@Resource(name = "linkService")
	private ILinkService linkService;

	@Resource(name = "popupService")
	private IPopupService popupService;

	@Resource(name = "articleService")
	private ArticleService articleService;

	@Resource(name = "menuService")
	private IMenuService menuService;

	@Resource(name = "codeService")
	private CodeService codeService;

	@RequestMapping("/csl/index.do")
	public String cslIndexHandler(HttpServletRequest request, ModelMap model,
			@RequestParam(required = false, value = "menuKey") Integer menuKey) {

		Date today = new Date(System.currentTimeMillis());
		FastDateFormat fdf = FastDateFormat.getInstance("yyyyMMddHH");

		model.addAttribute("nYear", Integer.parseInt(fdf.format(today).substring(0, 4)));
		model.addAttribute("nMonth", Integer.parseInt(fdf.format(today).substring(4, 6)));
		model.addAttribute("nDate", Integer.parseInt(fdf.format(today).substring(6, 8)));

		return "index/csl/Index";
	}

	@RequestMapping("/csl/sub.do")
	public String cslSubHandler(HttpServletRequest request, @ModelAttribute("searchVO") CommonVO searchVO)
			throws Exception {
		String redirect = "/index.do";

		Integer menuKey = searchVO.getMenuKey();

		if (menuKey != null && menuKey.intValue() > 0) {
			MenuVO vo = menuService.select(menuKey);
			if (vo != null) {
				if (!StringUtils.equalsIgnoreCase(vo.getLinkTyp(), "EMPTY")) {
					if (StringUtils.equalsIgnoreCase(vo.getLinkTyp(), "URL")) {
						redirect = this.getEncodUrl(vo.getMenuUrl());
					} else {
						redirect = vo.getMenuUrl();
					}
				} else {
					MenuVO paramMenuVO = new MenuVO();
					paramMenuVO.setMenuKey(menuKey);
					paramMenuVO.setMenuTyp(MENU_TYP_CSL);

					MenuVO childVO = menuService.getAvailChildMenu(paramMenuVO);
					if (childVO != null) {
						if (StringUtils.equalsIgnoreCase(childVO.getLinkTyp(), "U")) {
							redirect = this.getEncodUrl(childVO.getMenuUrl());
						} else {
							redirect = childVO.getMenuUrl();
						}
					} else {
						log.debug("childVO=null");
						throw new NotExistPageException();
					}
				}
			} else {
				log.debug("vo=null");
				throw new NotExistPageException();
			}
		}

		return "redirect:" + redirect;
	}

	@RequestMapping("/index.do")
	public String indexHandler(HttpServletRequest request, ModelMap model,
			@RequestParam(required = false, value = "login_no") String empNo) throws Exception {
		
		menuService.setHeaderInormation(request); 
		
		return "index/qi/Index";
	}

	@RequestMapping("/sub.do")
	public String subHandler(HttpServletRequest request, @ModelAttribute("searchVO") CommonVO searchVO)
			throws Exception {
		String redirect = "/index.do";

		Integer menuKey = searchVO.getMenuKey();

		if (menuKey != null && menuKey.intValue() > 0) {
			MenuVO vo = menuService.select(menuKey);
			if (vo != null) {
				if (!StringUtils.equalsIgnoreCase(vo.getLinkTyp(), "EMPTY")) {
					if (StringUtils.equalsIgnoreCase(vo.getLinkTyp(), "URL")) {
						redirect = this.getEncodUrl(vo.getMenuUrl());
					} else {
						redirect = vo.getMenuUrl();
					}
				} else {
					MenuVO paramMenuVO = new MenuVO();
					paramMenuVO.setMenuKey(menuKey);
					paramMenuVO.setMenuTyp(MENU_TYP_DEF);

					MenuVO childVO = menuService.getAvailChildMenu(paramMenuVO);
					if (childVO != null) {
						if (StringUtils.equalsIgnoreCase(childVO.getLinkTyp(), "U")) {
							redirect = this.getEncodUrl(childVO.getMenuUrl());
						} else {
							redirect = childVO.getMenuUrl();
						}
					} else {
						log.debug("childVO=null");
						throw new NotExistPageException();
					}
				}
			} else {
				log.debug("vo=null");
				throw new NotExistPageException();
			}
		}

		return "redirect:" + redirect;
	}

	/*
	 * @RequestMapping("/index.do") public String indexHandler(HttpServletRequest
	 * request, ModelMap model) throws Exception {
	 * 
	 * //article ArticleSearchVO articleSearchVO = new ArticleSearchVO();
	 * articleSearchVO.setBoardKey(1); articleSearchVO.setRecordCountPerPage(3);
	 * model.addAttribute("noticeList",
	 * articleService.selectRecentListWithoutFileList(articleSearchVO));
	 * 
	 * //main visual banner BannerVO visualBannerVO = new BannerVO();
	 * visualBannerVO.setLocateTyp("MAIN_VISUAL"); visualBannerVO.setActFlg("Y");
	 * model.addAttribute("visualBannerList",
	 * bannerService.selectFullList(visualBannerVO));
	 * 
	 * //main bottom banner //BannerVO bottomBannerVO = new BannerVO();
	 * //bottomBannerVO.setLocateTyp("MAIN_BOTTOM");
	 * //bottomBannerVO.setActFlg("Y"); //model.addAttribute("bottomBannerList",
	 * bannerService.selectFullList(bottomBannerVO));
	 * 
	 * //link LinkVO linkVO = new LinkVO(); linkVO.setLocateTyp("DEF_LINK_01");
	 * linkVO.setActFlg("Y"); model.addAttribute("linkList",
	 * linkService.selectFullList(linkVO));
	 * 
	 * PopupVO popupVO = new PopupVO(); popupVO.setLocateTyp("DEF_POPUP_01");
	 * popupVO.setActFlg("Y"); model.addAttribute("popupList",
	 * popupService.selectFullList(popupVO));
	 * 
	 * //주요사업 CodeVO codeVO = new CodeVO(); codeVO.setCodeGrpId("MAINBIZ");
	 * codeVO.setActFlg("Y"); model.addAttribute("mainBizList",
	 * codeService.selectFullList(codeVO));
	 * 
	 * 
	 * return "index/def/Index"; }
	 * 
	 * @RequestMapping("/sub.do") public String subHandler(HttpServletRequest
	 * request, @ModelAttribute("searchVO")CommonVO searchVO)throws Exception {
	 * String redirect = "/index.do";
	 * 
	 * Integer menuKey = searchVO.getMenuKey();
	 * 
	 * if(menuKey != null && menuKey.intValue() > 0){ MenuVO vo =
	 * menuService.select(menuKey); if(vo != null){
	 * if(!StringUtils.equalsIgnoreCase(vo.getLinkTyp(), "EMPTY")){
	 * if(StringUtils.equalsIgnoreCase(vo.getLinkTyp(), "URL")){ redirect =
	 * this.getEncodUrl(vo.getMenuUrl()); }else{ redirect = vo.getMenuUrl(); }
	 * }else{ MenuVO paramMenuVO = new MenuVO(); paramMenuVO.setMenuKey(menuKey);
	 * paramMenuVO.setMenuTyp(MENU_TYP_DEF);
	 * 
	 * MenuVO childVO = menuService.getAvailChildMenu(paramMenuVO); if(childVO !=
	 * null){ if(StringUtils.equalsIgnoreCase(childVO.getLinkTyp(), "U")){ redirect
	 * = this.getEncodUrl(childVO.getMenuUrl()); }else{ redirect =
	 * childVO.getMenuUrl(); } }else { log.debug("childVO=null"); throw new
	 * NotExistPageException(); } } }else{ log.debug("vo=null"); throw new
	 * NotExistPageException(); } }
	 * 
	 * return "redirect:" + redirect; }
	 * 
	 * 
	 * @RequestMapping("/eng/index.do") public String
	 * engIndexHandler(HttpServletRequest request, ModelMap model) throws Exception
	 * {
	 * 
	 * //article ArticleSearchVO articleSearchVO = new ArticleSearchVO();
	 * articleSearchVO.setBoardKey(5); model.addAttribute("noticeList",
	 * articleService.selectRecentListWithoutFileList(articleSearchVO));
	 * 
	 * //banner //BannerVO bannerVO = new BannerVO();
	 * //bannerVO.setLocateTyp("DEF_BNR_01"); //bannerVO.setActFlg("Y");
	 * //model.addAttribute("bannerList", bannerService.selectFullList(bannerVO));
	 * 
	 * //link //LinkVO linkVO = new LinkVO(); //linkVO.setLocateTyp("DEF_LINK_01");
	 * //linkVO.setActFlg("Y"); //model.addAttribute("linkList",
	 * linkService.selectFullList(linkVO));
	 * 
	 * //PopupVO popupVO = new PopupVO(); //popupVO.setLocateTyp("DEF_POPUP_01");
	 * //popupVO.setActFlg("Y"); //model.addAttribute("popupList",
	 * popupService.selectFullList(popupVO));
	 * 
	 * 
	 * return "index/eng/Index"; }
	 * 
	 * @RequestMapping("/eng/sub.do") public String engSubHandler(HttpServletRequest
	 * request, @ModelAttribute("searchVO")CommonVO searchVO)throws Exception {
	 * String redirect = "/eng/index.do";
	 * 
	 * Integer menuKey = searchVO.getMenuKey();
	 * 
	 * if(menuKey != null && menuKey.intValue() > 0){ MenuVO vo =
	 * menuService.select(menuKey); if(vo != null){
	 * if(!StringUtils.equalsIgnoreCase(vo.getLinkTyp(), "EMPTY")){
	 * if(StringUtils.equalsIgnoreCase(vo.getLinkTyp(), "URL")){ redirect =
	 * this.getEncodUrl(vo.getMenuUrl()); }else{ redirect = vo.getMenuUrl(); }
	 * }else{ MenuVO paramMenuVO = new MenuVO(); paramMenuVO.setMenuKey(menuKey);
	 * paramMenuVO.setMenuTyp(MENU_TYP_ENG);
	 * 
	 * MenuVO childVO = menuService.getAvailChildMenu(paramMenuVO); if(childVO !=
	 * null){ if(StringUtils.equalsIgnoreCase(childVO.getLinkTyp(), "U")){ redirect
	 * = this.getEncodUrl(childVO.getMenuUrl()); }else{ redirect =
	 * childVO.getMenuUrl(); } }else { log.debug("childVO=null"); throw new
	 * NotExistPageException(); } } }else{ log.debug("vo=null"); throw new
	 * NotExistPageException(); } }
	 * 
	 * return "redirect:" + redirect; }
	 */

	private String getEncodUrl(String url) throws UnsupportedEncodingException {
		String result = "";
		String[] tmp = url.split("&");

		String param = "";
		String value = "";
		for (int i = 0; i < tmp.length; i++) {
			if (StringUtils.startsWith(tmp[i], "searchClass")) {
				String[] target = String.valueOf(tmp[i]).split("=");
				param = target[0];
				if (target.length > 1) {
					value = target[1];
				}
				result += "&" + param + "=" + URLEncoder.encode(String.valueOf(value), "UTF-8");
			} else {
				if (i == 0) {
					result += tmp[i];
				} else {
					result += "&" + tmp[i];
				}
			}
		}

		return result;
	}
}
