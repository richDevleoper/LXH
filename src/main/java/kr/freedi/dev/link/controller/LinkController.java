package kr.freedi.dev.link.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.link.domain.LinkSearchVO;
import kr.freedi.dev.link.domain.LinkVO;
import kr.freedi.dev.link.service.ILinkService;
import kr.freedi.dev.user.domain.UserVO;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file : LinkController.java
 * @date : 2017. 2. 8.
 * @author : pdh
 * @comment :
 * @history :
 */
@Controller
public class LinkController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "linkService")
	private ILinkService linkService;

	
	private String getPath(HttpServletRequest request, String fileName) {
		if(StringUtils.startsWith(request.getRequestURI(), "/csl")){
			return "link/csl/" + fileName;
		}else{
			return "link/def/" + fileName;
		}
	}
	
	@RequestMapping({"/csl/link/list.do", "/link/list.do"})
	public String list(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("linkSearchVO") LinkSearchVO searchVO) throws Exception {

		if(!StringUtils.startsWithAny(request.getRequestURI(), new String[]{"/csl"})){
			searchVO.setSearchPbsh("Y");
		}
		
		List<EgovMap> linkList = linkService.selectList(searchVO);
		searchVO.setTotalRecordCount(linkService.selectListCount(searchVO));
		
		model.addAttribute("linkList", linkList);

		return this.getPath(request, "List");
	}

	@RequestMapping("/csl/link/insertForm.do")
	public String insertForm(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("linkSearchVO") LinkSearchVO searchVO) throws Exception {

		LinkVO linkVO = new LinkVO();
		linkVO.setActFlg("Y"); //활성여부=활성
		linkVO.setPeriodFlg("N"); //기간제한=없음
		linkVO.setTargetTyp("NEW"); //타겟=새창
		
		model.addAttribute("linkVO", linkVO);
		model.addAttribute("action", "insert.do");

		return this.getPath(request, "Form");
	}

	@RequestMapping("/csl/link/insert.do")
	public String insert(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("linkVO") LinkVO linkVO, 
			@ModelAttribute("linkSearchVO") LinkSearchVO searchVO) throws Exception {

		linkVO.setFrstOperId(userSession.getUserId()); //등록자 아이디

		linkService.insert(linkVO);

		return "redirect:list.do?" + searchVO.getParam();
	}

	@RequestMapping("/csl/link/updateForm.do")
	public String updateForm(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("linkSearchVO") LinkSearchVO searchVO,
			@ModelAttribute("linkVO") LinkVO linkVO) throws Exception {

		model.addAttribute("linkVO", linkService.select(linkVO));
		model.addAttribute("action", "update.do");
		
		return this.getPath(request, "Form");
	}

	@RequestMapping("/csl/link/update.do")
	public String update(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("linkVO") LinkVO linkVO, 
			@ModelAttribute("linkSearchVO") LinkSearchVO searchVO) throws Exception {

		linkVO.setLastOperId(userSession.getUserId());
		
		linkService.update(linkVO);

		return "redirect:updateForm.do?linkKey=" + linkVO.getLinkKey() + "&" + searchVO.getParam();
	}

	@RequestMapping("/csl/link/delete.do")
	public String delete(HttpServletRequest request, 
			@ModelAttribute("linkVO") LinkVO linkVO, 
			@ModelAttribute("linkSearchVO") LinkSearchVO searchVO) throws Exception {

		linkService.delete(linkVO);

		return "redirect:list.do?" + searchVO.getParam();
	}
}
