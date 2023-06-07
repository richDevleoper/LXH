package kr.freedi.dev.user.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

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

import com.lgcns.encypt.EncryptUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.menu.service.MenuUseService;
import kr.freedi.dev.user.domain.MngrUserParamVO;
import kr.freedi.dev.user.domain.MngrUserSearchVO;
import kr.freedi.dev.user.domain.MngrUserVO;
import kr.freedi.dev.user.domain.UserAuthVO;
import kr.freedi.dev.user.domain.UserVO;
import kr.freedi.dev.user.service.MngrUserService;
import kr.freedi.dev.user.service.UserAuthService;

/**
 * @project : dev_default
 * @file 	: MngrUserController.java
 * @date	: 2017. 2. 17.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class MngrUserController extends UserController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	private final String USER_GRP = "MNGR_USER"; //사용자그룹
	private final String MENU_TYP = "CSL"; //메뉴그룹
	
	@Resource(name = "mngrUserService")
	private MngrUserService mngrUserService;
	
	@Resource(name = "userAuthService")
	private UserAuthService userAuthService;
	
	@Resource(name = "menuUseService")
	private MenuUseService menuUseService;
	
	@RequestMapping({"/csl/user/mngr/list.do"})
	public String list(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("mngrUserSearchVO") MngrUserSearchVO searchVO) throws Exception {
		
		List<EgovMap> mngrUserList = mngrUserService.selectList(searchVO);
		searchVO.setTotalRecordCount(mngrUserService.selectListCount(searchVO));
		model.addAttribute("mngrUserList", mngrUserList);
		
		UserAuthVO userAuthVO = new UserAuthVO();
		userAuthVO.setUserGrp(this.USER_GRP);
		List<EgovMap> userAuthList = userAuthService.selectFullList(userAuthVO);
		model.addAttribute("userAuthList", userAuthList);

		return "user/mngr/csl/List";
	}
	
	@RequestMapping("/csl/user/mngr/insertForm.do")
	public String insertForm(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("mngrUserSearchVO") MngrUserSearchVO searchVO,
			@ModelAttribute("paramVO") MngrUserParamVO paramVO) throws Exception {

		MngrUserVO mngrUserVO = new MngrUserVO();
		model.addAttribute("mngrUserVO", mngrUserVO);
		model.addAttribute("action", "insert.do");
		
		UserAuthVO userAuthVO = new UserAuthVO();
		userAuthVO.setUserGrp(this.USER_GRP);
		userAuthVO.setActFlg("Y");
		List<EgovMap> userAuthList = userAuthService.selectFullList(userAuthVO);
		model.addAttribute("userAuthList", userAuthList);

		return "user/mngr/csl/Form";
	}

	@RequestMapping("/csl/user/mngr/insert.do")
	public String insert(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("mngrUserVO") MngrUserVO mngrUserVO, 
			@ModelAttribute("mngrUserSearchVO") MngrUserSearchVO searchVO,
			@ModelAttribute("paramVO") MngrUserParamVO paramVO) throws Exception {

		mngrUserVO.setTel(paramVO.getTel());
		mngrUserVO.setMob(paramVO.getMob());
		mngrUserService.insert(mngrUserVO);

		return "redirect:list.do?" + searchVO.getParam();
	}

	@RequestMapping("/csl/user/mngr/updateForm.do")
	public String updateForm(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("mngrUserSearchVO") MngrUserSearchVO searchVO,
			@ModelAttribute("mngrUserVO") MngrUserVO mngrUserVO,
			@ModelAttribute("paramVO") MngrUserParamVO paramVO) throws Exception {

		MngrUserVO sMngrUserVO = mngrUserService.select(mngrUserVO);
		paramVO.setTel(sMngrUserVO.getTel());
		paramVO.setMob(sMngrUserVO.getMob());
		model.addAttribute("mngrUserVO", sMngrUserVO);
		model.addAttribute("action", "update.do");
		
		UserAuthVO userAuthVO = new UserAuthVO();
		userAuthVO.setUserGrp(this.USER_GRP);
		userAuthVO.setActFlg("Y");
		List<EgovMap> userAuthList = userAuthService.selectFullList(userAuthVO);
		model.addAttribute("userAuthList", userAuthList);
		
		return "user/mngr/csl/Form";
	}

	@RequestMapping("/csl/user/mngr/update.do")
	public String update(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("mngrUserVO") MngrUserVO mngrUserVO, 
			@ModelAttribute("mngrUserSearchVO") MngrUserSearchVO searchVO,
			@ModelAttribute("paramVO") MngrUserParamVO paramVO) throws Exception {

		mngrUserVO.setTel(paramVO.getTel());
		mngrUserVO.setMob(paramVO.getMob());
		mngrUserService.update(mngrUserVO);

		return "redirect:updateForm.do?userId=" + mngrUserVO.getUserId() + "&" + searchVO.getParam();
	}

	@RequestMapping("/csl/user/mngr/delete.do")
	public String delete(HttpServletRequest request, 
			@ModelAttribute("mngrUserVO") MngrUserVO mngrUserVO, 
			@ModelAttribute("mngrUserSearchVO") MngrUserSearchVO searchVO) throws Exception {

		mngrUserService.delete(mngrUserVO);

		return "redirect:list.do?" + searchVO.getParam();
	}
	
	@RequestMapping("/csl/user/mngr/loginForm.do")
	public String loginForm(HttpServletRequest request, ModelMap model) throws Exception {

		MngrUserVO mngrUserVO = new MngrUserVO();
		model.addAttribute("mngrUserVO", mngrUserVO);
		
		Cookie[] cookies = request.getCookies();
//		if(cookies != null) {
//			for(int index = 0; index < cookies.length; index++) {
//				Cookie cookie = cookies[index];
//				
//				if(cookie.getName().equals("URLENCODED_LG_GP_SI")) {
//					String encUid = cookie.getValue();
//					System.out.println("ENC UID : " + encUid);
//					
//					String plainUid = EncryptUtil.decryptText(URLDecoder.decode(encUid, "UTF-8"), "ThisIsIkepSecurityKey");
//					System.out.println("PLAIN UID : " + plainUid);
//				}
//			}
//		}

		return "user/mngr/csl/LoginForm";
	}
	
	@RequestMapping("/csl/user/mngr/login.do")
	public String login(HttpServletRequest request, ModelMap model,
			@ModelAttribute("mngrUserVO") MngrUserVO mngrUserVO) throws Exception {

		
		
		MngrUserVO loginVO = mngrUserService.selectByUserIdAndUserPw(mngrUserVO);
		
		if(loginVO == null || StringUtils.isEmpty(loginVO.getUserId())){
			return "forward:loginForm.do";
		}else{
			UserVO userVO = new UserVO();
			
			userVO.setMngrUserVO(loginVO);
			
			userVO.setUserTyp(this.USER_GRP);
			userVO.setLocale(super.getLocale());
			userVO.setIpAddr(super.getIpAddr());
			userVO.setLoginYmdt(super.getLoginYmdt());
			userVO.setSessionId(super.getSessionId());
			
			userVO.setCslMenuUseKeys(menuUseService.selectMenuUseKeys(loginVO.getAuthId(), "ALL", this.MENU_TYP));
			log.debug(userVO);
			
			request.getSession().setAttribute("userSession", userVO);
			mngrUserService.updateLastLoginDt(loginVO);
			
			return "redirect:/csl/index.do";
		}
	}
	
	@RequestMapping("/csl/user/mngr/logout.do")
	public String logout(HttpServletRequest request, ModelMap model) throws Exception {

		request.getSession().invalidate();
			
		return "redirect:/csl/user/mngr/loginForm.do";
	}
	
	@RequestMapping(value="/csl/user/mngr/checkLoginInfo.do", method=RequestMethod.POST)
	public @ResponseBody 
	String checkLoginInfo(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MngrUserVO mngrUserVO = new MngrUserVO();
		mngrUserVO.setUserId(String.valueOf(reqMap.get("userId")));
		mngrUserVO.setUserPw(String.valueOf(reqMap.get("userPw")));
		
		MngrUserVO vo = mngrUserService.selectByUserIdAndUserPw(mngrUserVO); 
		if(vo != null && StringUtils.isNotEmpty(vo.getUserId())){
			if(StringUtils.equals(vo.getRegSt(), "B01")){
				resultMap.put("isAvail", "true");
				resultMap.put("msg", "");
			}else {
				resultMap.put("isAvail", "false");
				if(StringUtils.equals(vo.getRegSt(), "A01")){
					resultMap.put("msg", "가입승인 대기중입니다");
				}else if(StringUtils.equals(vo.getRegSt(), "C01")){
					resultMap.put("msg", "사용정지된 계정입니다");
				}else if(StringUtils.equals(vo.getRegSt(), "D01")){
					resultMap.put("msg", "일치하는 정보가 없습니다");
				}
			}
		}else{
			resultMap.put("isAvail", "false");
			resultMap.put("msg", "일치하는 정보가 없습니다");
		}
		
		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping(value="/csl/user/mngr/checkUserId.do", method=RequestMethod.POST)
	public @ResponseBody 
	String checkUserId(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MngrUserVO mngrUserVO = new MngrUserVO();
		mngrUserVO.setUserId(String.valueOf(reqMap.get("userId")));
		
		MngrUserVO vo = mngrUserService.select(mngrUserVO); 
		if(vo != null && StringUtils.isNotEmpty(vo.getUserId())){
			resultMap.put("isAvail", "false");
		}else{
			resultMap.put("isAvail", "true");
		}
		
		return new ObjectMapper().writeValueAsString(resultMap);
	}
}


