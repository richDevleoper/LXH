package kr.freedi.dev.content.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.content.domain.ContentSearchVO;
import kr.freedi.dev.content.domain.ContentVO;
import kr.freedi.dev.content.service.IContentService;
import kr.freedi.dev.menu.domain.MenuVO;
import kr.freedi.dev.menu.service.MenuService;
import kr.freedi.dev.user.domain.UserVO;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: ContentController.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class ContentController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	private final String MENU_TYP_DEF = "DEF";
	
	@Resource(name = "contentService")
	private IContentService contentService;
	
	@Resource(name="menuService")
	private MenuService menuService;
	
	private String getPath(HttpServletRequest request, String fileName) {
		if(StringUtils.startsWith(request.getRequestURI(), "/csl")){
			return "content/csl/" + fileName;
		}else{
			return "content/def/" + fileName;
		}
	}
	
	@RequestMapping("/csl/content/list.do")
	public String list(HttpServletRequest request, ModelMap model,
			@ModelAttribute("contentSearchVO") ContentSearchVO searchVO) throws Exception {

		List<EgovMap> contentList = contentService.selectList(searchVO);
		searchVO.setTotalRecordCount(contentService.selectListCount(searchVO));
		
		model.addAttribute("contentList", contentList);
		
		//menuList
		List<MenuVO> menuList = menuService.getActTreeList(MENU_TYP_DEF);
		model.addAttribute("treeMenuList", menuList);
		
		return this.getPath(request, "List");
	}

	@RequestMapping("/csl/content/insertForm.do")
	public String insertForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("contentSearchVO") ContentSearchVO searchVO) throws Exception {
		
		ContentVO vo = new ContentVO();

		vo.setActFlg("Y");	//활성여부=활성
		
		model.addAttribute("contentVO", vo);
		model.addAttribute("action", "insert.do");
				
		return this.getPath(request, "Form");
	}

	@RequestMapping("/csl/content/insert.do")
	public String insert(HttpServletRequest request,
			@ModelAttribute("contentVO") ContentVO contentVO,
			@ModelAttribute("contentSearchVO") ContentSearchVO searchVO,
			UserVO userSession,
			SessionStatus status) throws Exception {

		contentVO.setFrstOperId(userSession.getUserId()); //등록자 아이디
		
		contentService.insert(contentVO);
		
		return "redirect:list.do?" + searchVO.getParam();
	}

	@RequestMapping({"/csl/content/view.do", "/content/view.do", "/eng/content/view.do"})
	public String view(HttpServletRequest request, ModelMap model,			
			@ModelAttribute("contentVO") ContentVO contentVO,
			@ModelAttribute("contentSearchVO") ContentSearchVO searchVO) throws Exception {

		model.addAttribute("contentVO", contentService.select(contentVO));
		
		return this.getPath(request, "View");
	}

	@RequestMapping("/csl/content/updateForm.do")
	public String updateForm(HttpServletRequest request, ModelMap model,			
			@ModelAttribute("contentVO") ContentVO contentVO,
			@ModelAttribute("contentSearchVO") ContentSearchVO searchVO) throws Exception {

		model.addAttribute("contentVO", contentService.select(contentVO));
		model.addAttribute("action", "update.do");
		
		return this.getPath(request, "Form");
	}

	@RequestMapping("/csl/content/update.do")
	public String update(HttpServletRequest request,
			@ModelAttribute("contentVO") ContentVO contentVO,
			@ModelAttribute("contentSearchVO") ContentSearchVO searchVO, 
			UserVO userSession) throws Exception {

		contentVO.setLastOperId(userSession.getUserId());
		contentService.update(contentVO);
		
		return "redirect:updateForm.do?contentKey="+contentVO.getContentKey() + "&" + searchVO.getParam();
	}

	@RequestMapping("/csl/content/delete.do")
	public String delete(HttpServletRequest request,
			@ModelAttribute("contentVO") ContentVO contentVO,
			@ModelAttribute("contentSearchVO") ContentSearchVO searchVO) throws Exception {

		contentService.delete(contentVO);
		
		return "redirect:list.do?" + searchVO.getParam();
	}
	
	
	/*
	@RequestMapping({"/csl/content/crossDomainView.do", "/content/crossDomainView.do"})
	public String corssDomainView(HttpServletRequest request, ModelMap model,			
			@RequestParam(value = "url", required = true) String url,
			@ModelAttribute("contentSearchVO") ContentSearchVO searchVO) throws Exception {
		
		String html = getCode(url, "EUC-KR");
		
		//html = html.replaceAll("a href", "a xhref");		
		html = html.replaceAll("/lmsdata/", "http://www.jscyber.net/lmsdata/");
		html = html.replaceAll("/dwr/", "http://www.jscyber.net/dwr/");
		
		model.addAttribute("html", html);
		
		
		
		return "content/CrossDomainView";
	}

	private String getCode(String url, String charset) {

		try {

			URL pageUrl = new URL(url);
			String line = "";
			StringBuffer pageBuffer = new StringBuffer();

			BufferedReader reader = new BufferedReader(new InputStreamReader(pageUrl.openStream(), charset));
			pageBuffer.setLength(0);
			while((line = reader.readLine()) != null) {
				pageBuffer.append(line);
			}

			String data = pageBuffer.toString();

			reader.close();

			return data;

		} catch (Exception e) {

		}
		return "";
	}
	*/
}
