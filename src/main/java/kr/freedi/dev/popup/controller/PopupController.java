package kr.freedi.dev.popup.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.popup.domain.PopupSearchVO;
import kr.freedi.dev.popup.domain.PopupVO;
import kr.freedi.dev.popup.service.IPopupService;
import kr.freedi.dev.user.domain.UserVO;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: PopupController.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class PopupController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "popupService")
	private IPopupService popupService;
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}
	
	private String getPath(HttpServletRequest request, String fileName) {
		if(StringUtils.startsWith(request.getRequestURI(), "/csl")){
			return "popup/csl/" + fileName;
		}else{
			return "popup/def/" + fileName;
		}
	}
	
	@RequestMapping({"/csl/popup/list.do", "/popup/list.do"})
	public String list(HttpServletRequest request, ModelMap model,
			@ModelAttribute("popupSearchVO") PopupSearchVO searchVO) throws Exception {

		if(!StringUtils.startsWithAny(request.getRequestURI(), new String[]{"/csl"})){
			searchVO.setSearchPbsh("Y");
		}
		
		List<EgovMap> popupList = popupService.selectList(searchVO);
		searchVO.setTotalRecordCount(popupService.selectListCount(searchVO));
		
		model.addAttribute("popupList", popupList);
		
		return this.getPath(request, "List");
	}

	@RequestMapping("/csl/popup/insertForm.do")
	public String insertForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("popupSearchVO") PopupSearchVO searchVO) throws Exception {
		
		PopupVO vo = new PopupVO();

		vo.setActFlg("Y");	//활성
		vo.setPeriodFlg("N"); //기간제한=없음
		vo.setSizeAutoFlg("Y"); //크기자동=yes
		
		model.addAttribute("popupVO", vo);
		model.addAttribute("action", "insert.do");
				
		return this.getPath(request, "Form");
	}

	@RequestMapping("/csl/popup/insert.do")
	public String insert(HttpServletRequest request,
			@ModelAttribute("popupVO") PopupVO popupVO,
			@ModelAttribute("popupSearchVO") PopupSearchVO searchVO,
			UserVO userSession) throws Exception {

		popupVO.setFrstOperId(userSession.getUserId()); //등록자 아이디
		log.debug(popupVO.toString());
		
		popupService.insert(popupVO);
		
		return "redirect:list.do?" + searchVO.getParam();
	}

	@RequestMapping("/csl/popup/view.do")
	public String view(HttpServletRequest request, ModelMap model,			
			@ModelAttribute("popupVO") PopupVO popupVO) throws Exception {

		model.addAttribute("popupVO", popupService.select(popupVO));
		
		return "popup/View";
	}
	
	@RequestMapping("/csl/popup/updateForm.do")
	public String updateForm(HttpServletRequest request, ModelMap model,			
			@ModelAttribute("popupVO") PopupVO popupVO,
			@ModelAttribute("popupSearchVO") PopupSearchVO searchVO) throws Exception {

		PopupVO vo = popupService.select(popupVO);
		
		model.addAttribute("popupVO", vo);
		model.addAttribute("action", "update.do");
		
		return this.getPath(request, "Form");
	}

	@RequestMapping("/csl/popup/update.do")
	public String update(HttpServletRequest request,
			@ModelAttribute("popupVO") PopupVO popupVO,
			@ModelAttribute("popupSearchVO") PopupSearchVO searchVO,
			UserVO userSession) throws Exception {

		popupVO.setLastOperId(userSession.getUserId());
		log.debug(popupVO.toString());
		popupService.update(popupVO);
		
		return "redirect:updateForm.do?popupKey=" + popupVO.getPopupKey() + "&" + searchVO.getParam();
	}

	@RequestMapping("/csl/popup/delete.do")
	public String delete(HttpServletRequest request,
			@ModelAttribute("popupVO") PopupVO popupVO,
			@ModelAttribute("popupSearchVO") PopupSearchVO searchVO) throws Exception {

		popupService.delete(popupVO);
		
		return "redirect:list.do?" + searchVO.getParam();
	}
	
}
