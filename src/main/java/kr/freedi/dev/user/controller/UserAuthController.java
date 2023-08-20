package kr.freedi.dev.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.menu.service.MenuUseService;
import kr.freedi.dev.user.domain.UserAuthSearchVO;
import kr.freedi.dev.user.domain.UserAuthVO;
import kr.freedi.dev.user.domain.UserVO;
import kr.freedi.dev.user.service.UserAuthService;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: UserAuthController.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class UserAuthController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "userAuthService")
	private UserAuthService userAuthService;

	@Resource(name = "menuUseService")
	private MenuUseService menuUseService;

	@RequestMapping("/csl/user/auth/list.do")
	public String list(HttpServletRequest request, ModelMap model,
			@ModelAttribute("userAuthSearchVO") UserAuthSearchVO searchVO) throws Exception {

		List<EgovMap> userAuthList = userAuthService.selectList(searchVO);
		searchVO.setTotalRecordCount(userAuthService.selectListCount(searchVO));

		model.addAttribute("userAuthList", userAuthList);

		return "user/auth/csl/List";
	}

	@RequestMapping("/csl/user/auth/insertForm.do")
	public String insertForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("userAuthSearchVO") UserAuthSearchVO searchVO) throws Exception {

		UserAuthVO userAuthVO = new UserAuthVO();
		userAuthVO.setActFlg("Y");

		model.addAttribute("userAuthVO", userAuthVO);
		model.addAttribute("action", "insert.do");

		return "user/auth/csl/Form";

	}

	@RequestMapping("/csl/user/auth/insert.do")
	public String insert(HttpServletRequest request,
			UserVO userSession,
			@ModelAttribute("userAuthVO") UserAuthVO userAuthVO,
			@ModelAttribute("userAuthSearchVO") UserAuthSearchVO searchVO) throws Exception {

		userAuthVO.setFrstOperId(userSession.getUserId());
		
		userAuthService.insert(userAuthVO);

		return "redirect:list.do?" + searchVO.getParam();
	}

	@RequestMapping("/csl/user/auth/updateForm.do")
	public String updateForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("userAuthVO") UserAuthVO userAuthVO,
			@ModelAttribute("userAuthSearchVO") UserAuthSearchVO searchVO) throws Exception {
		
		model.addAttribute("userAuthVO", userAuthService.select(userAuthVO));
		model.addAttribute("action", "update.do");

		return "user/auth/csl/Form";

	}

	@RequestMapping("/csl/user/auth/update.do")
	public String update(HttpServletRequest request,
			UserVO userSession,
			@ModelAttribute("userAuthVO") UserAuthVO userAuthVO,
			@ModelAttribute("userAuthSearchVO") UserAuthSearchVO searchVO) throws Exception {

		userAuthService.update(userAuthVO);

		return "redirect:updateForm.do?authId=" + userAuthVO.getAuthId() + "&" + searchVO.getParam();
	}

	@RequestMapping("/csl/user/auth/delete.do")
	public String delete(HttpServletRequest request,
			@ModelAttribute("userAuthVO") UserAuthVO userAuthVO,
			@ModelAttribute("userAuthSearchVO") UserAuthSearchVO searchVO) throws Exception {

		userAuthService.delete(userAuthVO);

		return "redirect:list.do?" + searchVO.getParam();
	}

	@RequestMapping("/csl/user/auth/menuUse.do")
	public String menuUse(HttpServletRequest request, ModelMap model,
			@ModelAttribute("userAuthVO") UserAuthVO userAuthVO,
			@ModelAttribute("userAuthSearchVO") UserAuthSearchVO searchVO) throws Exception {

		String useTyp = "ALL";
		String menuTyp = "CSL";
		
		model.addAttribute("useTyp", useTyp);
		model.addAttribute("menuTyp", menuTyp);
		model.addAttribute("userAuthVO", userAuthService.select(userAuthVO));
		model.addAttribute("menuKeys", menuUseService.selectMenuUseKeys(userAuthVO.getAuthId(), useTyp, menuTyp));

		return "user/auth/csl/MenuUse";
	}
	
	/* menu_use *****************************************************************************/
	@RequestMapping(value="/csl/user/auth/insertMenuUse.do", method=RequestMethod.POST)
	public @ResponseBody 
	String insert(HttpServletRequest request,
			@RequestParam(value = "menuKeys", required = false) String menuKeys,
			@RequestParam(value = "authId", required = false) String authId,
			@RequestParam(value = "useTyp", required = false) String useTyp,
			@RequestParam(value = "menuTyp", required = false) String menuTyp)throws Exception {
		
		log.debug(menuKeys);
		
		List<Integer> keyList = new ArrayList<Integer>();
		
		String[] keyArray = StringUtils.split(StringUtils.removeStart(menuKeys, ","), ",");
		if(keyArray != null && keyArray.length > 0){
			for(String key : keyArray){
				keyList.add(Integer.parseInt(key));
			}
		}
		
		Integer result = menuUseService.insert(authId, keyList, useTyp, menuTyp);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		
		String json = new ObjectMapper().writeValueAsString(resultMap);
		
		return json;
	}
}