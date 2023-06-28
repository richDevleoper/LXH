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
import kr.freedi.dev.index.domain.SearchAllVO;
import kr.freedi.dev.link.domain.LinkVO;
import kr.freedi.dev.link.service.ILinkService;
import kr.freedi.dev.menu.domain.MenuVO;
import kr.freedi.dev.menu.service.IMenuService;
import kr.freedi.dev.popup.domain.PopupVO;
import kr.freedi.dev.popup.service.IPopupService;
import kr.freedi.dev.qreport.domain.ReportSearchVO;

/**
 * @project : dev_default
 * @file : SearchController.java
 * @date : 2023. 6. 29.
 * @author : pdh
 * @comment :
 * @history :
 */
@Controller
@RequestMapping({"/search"})
public class SearchController {

	protected Log log = LogFactory.getLog(this.getClass());

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

	@RequestMapping("/index.do")
	public String cslIndexHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("searchAllVO") SearchAllVO searchVO,
			@RequestParam(required = false, value = "menuKey") Integer menuKey) {

		return "search/index";
	}


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
