package kr.freedi.dev.menu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.board.domain.BoardVO;
import kr.freedi.dev.board.service.BoardService;
import kr.freedi.dev.content.domain.ContentVO;
import kr.freedi.dev.content.service.IContentService;
import kr.freedi.dev.menu.domain.MenuVO;
import kr.freedi.dev.menu.service.IMenuService;
import kr.freedi.dev.user.domain.UserVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: MenuController.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class MenuController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	//private final String MENU_TYP_CSL = "CSL";
	private final String MENU_TYP_DEF = "DEF";
	private final String MENU_TYP_ENG = "ENG";
	
	@Resource(name = "menuService")
	private IMenuService menuService;
	
	@Resource(name = "contentService")
	private IContentService contentService;
	
	@Resource(name = "boardService")
	private BoardService boardService;


	@RequestMapping(value = "/csl/menu/manage.do")
	public String adminMenu(HttpServletRequest request, ModelMap model) throws Exception {
		
		ContentVO contentVO = new ContentVO();
		contentVO.setActFlg("Y");
		List<EgovMap> contentList = contentService.selectFullList(contentVO);
		model.addAttribute("contentList", contentList);
		
		BoardVO boardVO = new BoardVO();
		boardVO.setActFlg("Y");
		List<BoardVO> boardList = boardService.selectFullList(boardVO);
		model.addAttribute("boardList", boardList);
		
		return "menu/csl/Manage";
	}

	@RequestMapping(value = "/csl/menu/list.do")
	public @ResponseBody
	String list(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {

		log.debug(reqMap.toString());
		List<MenuVO> menuList = menuService.getTreeList(String.valueOf(reqMap.get("menuTyp")));
		return new ObjectMapper().writeValueAsString(menuList);
	}
	
	@RequestMapping(value = "/csl/menu/select.do")
	public @ResponseBody
	String select(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {

		log.debug(reqMap.toString());
		MenuVO menuVO = menuService.select(Integer.parseInt(String.valueOf(reqMap.get("menuKey"))));
		return new ObjectMapper().writeValueAsString(menuVO);
	}
	
	@RequestMapping(value = "/csl/menu/create.do")
	public @ResponseBody
	String create(HttpServletRequest request,
			UserVO userSession,
			@RequestParam(value = "targetKey", required = true) Integer targetKey,
			@RequestParam(value = "menuNm", required = false) String menuNm,
			@RequestParam(value = "menuTyp", required = false) String menuTyp
			)throws Exception {

		log.debug("targetKey=" + targetKey + ", menuNm=" + menuNm + ", menuTyp=" + menuTyp);
		MenuVO menuVO = menuService.insert(targetKey, menuNm, menuTyp, userSession.getUserId());

		return new ObjectMapper().writeValueAsString(menuVO);
	}
	
	@RequestMapping(value = "/csl/menu/updateMenuNm.do")
	public @ResponseBody
	String updateMenuNm(HttpServletRequest request,
			UserVO userSession,
			@RequestParam(value = "menuKey", required = true) Integer menuKey,
			@RequestParam(value = "menuNm", required = false) String menuNm
			)throws Exception {

		log.debug("menuKey=" + menuKey + ", menuNm=" + menuNm);
		int result = menuService.updateMenuNm(menuKey, menuNm, userSession.getUserId());

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping(value = "/csl/menu/update.do")
	public @ResponseBody
	String update(MultipartHttpServletRequest mrequest, HttpServletRequest request,
			UserVO userSession,
			@RequestParam(value = "menuKey", required = true) Integer menuKey,
			@RequestParam(value = "mainTopImgOn", required = false) String mainTopImgOn,
			@RequestParam(value = "mainTopImgOff", required = false) String mainTopImgOff,
			@RequestParam(value = "topImgOn", required = false) String topImgOn,
			@RequestParam(value = "topImgOff", required = false) String topImgOff,
			@RequestParam(value = "leftTopImg", required = false) String leftTopImg,
			@RequestParam(value = "leftImgOn", required = false) String leftImgOn,
			@RequestParam(value = "leftImgOff", required = false) String leftImgOff,
			@RequestParam(value = "titleImg", required = false) String titleImg,
			@RequestParam(value = "menuNm", required = false) String menuNm,
			@RequestParam(value = "naviFlg", required = false) String naviFlg,
			@RequestParam(value = "actFlg", required = false) String actFlg,
			@RequestParam(value = "linkTyp", required = false) String linkTyp,
			@RequestParam(value = "url", required = false) String url,
			@RequestParam(value = "boardKey", required = false) Integer boardKey,
			@RequestParam(value = "contentKey", required = false) Integer contentKey,
			@RequestParam(value = "subViewTyp", required = false) String subViewTyp
			)throws Exception {

		log.debug(request.getParameter("menuNm"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mainTopImgOnFile", mainTopImgOn);
		map.put("mainTopImgOffFile", mainTopImgOff);
		map.put("topImgOnFile", topImgOn);
		map.put("topImgOffFile", topImgOff);
		map.put("leftTopImgFile", leftTopImg);
		map.put("leftImgOnFile", leftImgOn);
		map.put("leftImgOffFile", leftImgOff);
		map.put("titleImgFile", titleImg);
		menuService.updateFile(mrequest, menuKey, map, 
				"mainTopImgOnFile", "mainTopImgOffFile","topImgOnFile", "topImgOffFile",
				"leftTopImgFile", "leftImgOnFile", "leftImgOffFile", "titleImgFile");
		
		MenuVO menuVO = new MenuVO();
		menuVO.setMenuKey(menuKey);
		menuVO.setMenuNm(menuNm);
		menuVO.setNaviFlg(naviFlg);
		menuVO.setActFlg(actFlg);
		menuVO.setLinkTyp(linkTyp);
		menuVO.setUrl(url);
		menuVO.setBoardKey(boardKey);
		menuVO.setContentKey(contentKey);
		menuVO.setSubViewTyp(subViewTyp);
		menuVO.setLastOperId(userSession.getUserId());
		log.debug(menuVO.toString());
		
		int result = menuService.update(menuVO);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	
	@RequestMapping(value = "/csl/menu/delete.do")
	public @ResponseBody
	String delete(HttpServletRequest request,
			UserVO userSession,
			@RequestParam(value = "menuKey", required = true) Integer menuKey
			)throws Exception {

		log.debug("menuKey=" + menuKey);
		menuService.delete(menuKey);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "success");

		return new ObjectMapper().writeValueAsString(resultMap);
	}

	
	@RequestMapping(value = "/csl/menu/deleteFile.do")
	public @ResponseBody
	String deleteFile(HttpServletRequest request,
			UserVO userSession,
			@RequestParam(value = "menuKey", required = true) Integer menuKey,
			@RequestParam(value="columnName", required=true) String columnName
			)throws Exception {

		log.debug("menuKey=" + menuKey + ", columnName=" + columnName);
		int result = menuService.deleteFile(menuKey, columnName);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping(value = "/csl/menu/moveMenu.do")
	public @ResponseBody
	String moveMenu(HttpServletRequest request,
			UserVO userSession,
			@RequestParam(value = "menuTyp", required = false) String menuTyp,
			@RequestParam(value = "moveTyp", required = false) String moveTyp,
			@RequestParam(value = "moveWay", required = false) String moveWay,
			@RequestParam(value = "menuKey", required = true) Integer menuKey
			)throws Exception {

		log.debug("menuTyp=" + menuTyp + ", moveTyp=" + moveTyp + ", moveWay=" + moveWay + ", menuKey=" + menuKey);
		int result = menuService.moveMenu(menuTyp, moveTyp, moveWay, menuKey);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping(value = "/menu/siteMap.do")
	public String siteMapHandler(HttpServletRequest request, ModelMap model) {
		
		request.setAttribute("treeMenuList", menuService.getActTreeList(MENU_TYP_DEF));
		
		return "menu/def/SiteMap";
	}
	
	@RequestMapping(value = "/eng/menu/siteMap.do")
	public String engSiteMapHandler(HttpServletRequest request, ModelMap model) {
		
		request.setAttribute("treeMenuList", menuService.getActTreeList(MENU_TYP_ENG));
		
		return "menu/eng/SiteMap";
	}
	
	@RequestMapping(value = "/csl/menu/actTreeList.do")
	public @ResponseBody
	String actTreeList(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {

		log.debug(reqMap.toString());
		
		List<MenuVO> defTreeList = menuService.getActTreeList(MENU_TYP_DEF);
		List<MenuVO> engTreeList = menuService.getActTreeList(MENU_TYP_ENG);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("defTreeList", defTreeList);
		resultMap.put("engTreeList", engTreeList);
		
		System.out.println(new ObjectMapper().writeValueAsString(defTreeList));

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping(value = "/csl/menu/actMenuList.do")
	public @ResponseBody
	String actMenuList(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {

		log.debug(reqMap.toString());
		
		List<MenuVO> defMenuList = menuService.selectActMenuList(MENU_TYP_DEF);
		List<MenuVO> engMenuList = menuService.selectActMenuList(MENU_TYP_ENG);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("defMenuList", defMenuList);
		resultMap.put("engMenuList", engMenuList);

		System.out.println(new ObjectMapper().writeValueAsString(resultMap));
		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
}
