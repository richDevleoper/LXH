package kr.freedi.dev.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.user.domain.CorpUserSearchVO;
import kr.freedi.dev.user.domain.CorpUserVO;
import kr.freedi.dev.common.annotation.UserGrpMapping;
import kr.freedi.dev.common.util.AESUtil;
import kr.freedi.dev.user.domain.CorpUserParamVO;
import kr.freedi.dev.user.domain.UserAuthVO;
import kr.freedi.dev.user.domain.UserVO;
import kr.freedi.dev.user.service.CorpUserService;
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

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: CorpUserController.java
 * @date	: 2017. 2. 17.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class CorpUserController extends UserController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	private final String USER_GRP = "CORP_USER"; //사용자그룹
	private final String DEFAULT_AUTH_ID = "ROLE_CORP_DEFAULT"; //권한그룹
	private final String DEFATUL_REG_ST = "B01"; //A01=승인대기, B01=정상사용, C01=사용정지, D01=회원탈퇴
	
	@Resource(name = "corpUserService")
	private CorpUserService corpUserService;
	
	@Resource(name = "userAuthService")
	private UserAuthService userAuthService;
	
	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;
	
	/* ***********************************************************************************/
	/* csl *******************************************************************************/
	/* ***********************************************************************************/
	@RequestMapping({"/csl/user/corp/list.do"})
	public String list(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO) throws Exception {
		
		List<EgovMap> corpUserList = corpUserService.selectList(searchVO);
		searchVO.setTotalRecordCount(corpUserService.selectListCount(searchVO));
		model.addAttribute("corpUserList", corpUserList);
		
		UserAuthVO userAuthVO = new UserAuthVO();
		userAuthVO.setUserGrp(this.USER_GRP);
		List<EgovMap> userAuthList = userAuthService.selectFullList(userAuthVO);
		model.addAttribute("userAuthList", userAuthList);

		return "user/corp/csl/List";
	}
	
	@RequestMapping({"/csl/user/corp/insertForm.do"})
	public String cslInsertForm(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {

		CorpUserVO corpUserVO = new CorpUserVO();
		model.addAttribute("corpUserVO", corpUserVO);
		model.addAttribute("action", "insert.do");
		
		UserAuthVO userAuthVO = new UserAuthVO();
		userAuthVO.setUserGrp(this.USER_GRP);
		userAuthVO.setActFlg("Y");
		List<EgovMap> userAuthList = userAuthService.selectFullList(userAuthVO);
		model.addAttribute("userAuthList", userAuthList);

		return "user/corp/csl/Form";
	}

	@RequestMapping({"/csl/user/corp/insert.do"})
	public String cslInsert(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {

		corpUserVO.setChrTel(paramVO.getChrTel());
		corpUserVO.setChrMob(paramVO.getChrMob());
		corpUserVO.setChrFax(paramVO.getChrFax());
		corpUserVO.setCorpTel(paramVO.getCorpTel());
		corpUserVO.setCorpMob(paramVO.getCorpMob());
		corpUserVO.setCorpFax(paramVO.getCorpFax());
		corpUserVO.setCorpId(paramVO.getCorpId());
		
		corpUserService.insert(corpUserVO);

		return "redirect:list.do?" + searchVO.getParam();
	}

	@RequestMapping({"/csl/user/corp/updateForm.do"})
	public String cslUpdateForm(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO,
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {

		CorpUserVO sCorpUserVO = corpUserService.select(corpUserVO);
		paramVO.setChrTel(sCorpUserVO.getChrTel());
		paramVO.setChrMob(sCorpUserVO.getChrMob());
		paramVO.setChrFax(sCorpUserVO.getChrFax());
		paramVO.setCorpTel(sCorpUserVO.getCorpTel());
		paramVO.setCorpMob(sCorpUserVO.getCorpMob());
		paramVO.setCorpFax(sCorpUserVO.getCorpFax());
		paramVO.setCorpId(sCorpUserVO.getCorpId());
		
		model.addAttribute("corpUserVO", sCorpUserVO);
		model.addAttribute("action", "update.do");
		
		UserAuthVO userAuthVO = new UserAuthVO();
		userAuthVO.setUserGrp(this.USER_GRP);
		userAuthVO.setActFlg("Y");
		List<EgovMap> userAuthList = userAuthService.selectFullList(userAuthVO);
		model.addAttribute("userAuthList", userAuthList);
		
		return "user/corp/csl/Form";
	}

	@RequestMapping({"/csl/user/corp/update.do"})
	public String cslUpdate(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {

		corpUserVO.setChrTel(paramVO.getChrTel());
		corpUserVO.setChrMob(paramVO.getChrMob());
		corpUserVO.setChrFax(paramVO.getChrFax());
		corpUserVO.setCorpTel(paramVO.getCorpTel());
		corpUserVO.setCorpMob(paramVO.getCorpMob());
		corpUserVO.setCorpFax(paramVO.getCorpFax());
		corpUserVO.setCorpId(paramVO.getCorpId());
		corpUserService.updateByMngr(corpUserVO);

		return "redirect:updateForm.do?userId=" + corpUserVO.getUserId() + "&" + searchVO.getParam();
	}

	@RequestMapping("/csl/user/corp/delete.do")
	public String delete(HttpServletRequest request, 
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO) throws Exception {

		corpUserService.delete(corpUserVO);

		return "redirect:list.do?" + searchVO.getParam();
	}
	
	
	/* ***********************************************************************************/
	/* def *******************************************************************************/
	/* ***********************************************************************************/
	@RequestMapping({"/user/corp/insertForm.do"})
	public String defInsertForm(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {

		CorpUserVO corpUserVO = new CorpUserVO();
		model.addAttribute("corpUserVO", corpUserVO);

		return "user/corp/def/InsertForm";
	}

	@RequestMapping({"/user/corp/insert.do"})
	public @ResponseBody 
	String defInsert(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {

		corpUserVO.setChrTel(paramVO.getChrTel());
		corpUserVO.setChrMob(paramVO.getChrMob());
		corpUserVO.setChrFax(paramVO.getChrFax());
		corpUserVO.setCorpTel(paramVO.getCorpTel());
		corpUserVO.setCorpMob(paramVO.getCorpMob());
		corpUserVO.setCorpFax(paramVO.getCorpFax());
		corpUserVO.setCorpId(paramVO.getCorpId());
		corpUserVO.setAuthId(this.DEFAULT_AUTH_ID);
		corpUserVO.setRegSt(this.DEFATUL_REG_ST);
		
		Integer rtnVal = corpUserService.insert(corpUserVO);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(rtnVal > 0){
			resultMap.put("isAvail", "true");
			resultMap.put("corpNm", corpUserVO.getCorpNm());			
		}else{
			resultMap.put("isAvail", "false");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}

	@UserGrpMapping(value={USER_GRP})
	@RequestMapping({"/user/corp/updateForm.do"})
	public String defUpdateForm(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO,
			@ModelAttribute("paramVO") CorpUserParamVO paramVO,
			UserVO userSession) throws Exception {

		corpUserVO.setUserId(userSession.getCorpUserVO().getUserId());
		
		CorpUserVO sCorpUserVO = corpUserService.select(corpUserVO);
		paramVO.setChrTel(sCorpUserVO.getChrTel());
		paramVO.setChrMob(sCorpUserVO.getChrMob());
		paramVO.setChrFax(sCorpUserVO.getChrFax());
		paramVO.setCorpTel(sCorpUserVO.getCorpTel());
		paramVO.setCorpMob(sCorpUserVO.getCorpMob());
		paramVO.setCorpFax(sCorpUserVO.getCorpFax());
		paramVO.setCorpId(sCorpUserVO.getCorpId());
		
		model.addAttribute("corpUserVO", sCorpUserVO);
		
		return "user/corp/def/UpdateForm";
	}

	@UserGrpMapping(value={USER_GRP})
	@RequestMapping({"/user/corp/update.do"})
	public @ResponseBody
	String defUpdate(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		corpUserVO.setChrTel(paramVO.getChrTel());
		corpUserVO.setChrMob(paramVO.getChrMob());
		corpUserVO.setChrFax(paramVO.getChrFax());
		corpUserVO.setCorpTel(paramVO.getCorpTel());
		corpUserVO.setCorpMob(paramVO.getCorpMob());
		corpUserVO.setCorpFax(paramVO.getCorpFax());
		corpUserVO.setCorpId(paramVO.getCorpId());
		
		Integer rtnVal = corpUserService.updateByCorp(corpUserVO);
		
		if(rtnVal > 0){
			resultMap.put("isAvail", "true");
		}else{
			resultMap.put("isAvail", "false");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@UserGrpMapping(value={USER_GRP})
	@RequestMapping({"/user/corp/leaveForm.do"})
	public String defLeaveForm(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO,
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {

		return "user/corp/def/LeaveForm";
	}

	@UserGrpMapping(value={USER_GRP})
	@RequestMapping({"/user/corp/leave.do"})
	public @ResponseBody 
	String defLeave(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {

		CorpUserVO leaveVO = corpUserService.selectByUserIdAndUserPw(corpUserVO);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if(leaveVO != null && StringUtils.isNotEmpty(leaveVO.getUserId())){
			corpUserVO.setRegSt("D01");
			Integer rtnVal = corpUserService.updateRegSt(corpUserVO);
			if(rtnVal > 0){
				request.getSession().invalidate();
				resultMap.put("isAvail", "true");
			}else{
				resultMap.put("isAvail", "false");
			}
		}else{
			resultMap.put("isAvail", "false");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping({"/user/corp/findIdForm.do"})
	public String defFindIdForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {
		
		CorpUserVO corpUserVO = new CorpUserVO();
		model.addAttribute("corpUserVO", corpUserVO);
		
		return "user/corp/def/FindIdForm";
	}
	
	@RequestMapping({"/user/corp/findId.do"})
	public @ResponseBody
	String defFindId(HttpServletRequest request, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO, 
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {
		
		corpUserVO.setChrMob(paramVO.getChrMob());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		CorpUserVO resultVO = corpUserService.selectByUserNmAndChrMob(corpUserVO);
		
		if(resultVO != null && StringUtils.isNoneEmpty(resultVO.getUserId())){
			if(StringUtils.equals(resultVO.getRegSt(), "B01")){
				resultMap.put("isAvail", "true");
				resultMap.put("msg", "");
				String userId = "";
				for(int i=0; i<resultVO.getUserId().length(); i++){
					if(i<4){
						userId += resultVO.getUserId().substring(i,(i+1));
					}else{
						userId += "*";
					}
				}
				resultMap.put("userId", userId);
			}else {
				resultMap.put("isAvail", "false");
				if(StringUtils.equals(resultVO.getRegSt(), "A01")){
					resultMap.put("msg", "가입승인 대기중입니다");
				}else if(StringUtils.equals(resultVO.getRegSt(), "C01")){
					resultMap.put("msg", "사용정지된 계정입니다");
				}else if(StringUtils.equals(resultVO.getRegSt(), "D01")){
					resultMap.put("msg", "일치하는 정보가 없습니다");
				}
			}
		}else{
			resultMap.put("isAvail", "false");
			resultMap.put("msg", "일치하는 정보가 없습니다");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping({"/user/corp/findPwForm.do"})
	public String defFindPwForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {
		
		CorpUserVO corpUserVO = new CorpUserVO();
		model.addAttribute("corpUserVO", corpUserVO);
		
		return "user/corp/def/FindPwForm";
	}
	
	@RequestMapping({"/user/corp/findPw.do"})
	public @ResponseBody
	String defFindPw(HttpServletRequest request, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO, 
			@ModelAttribute("paramVO") CorpUserParamVO paramVO) throws Exception {

		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		CorpUserVO resultVO = corpUserService.selectByUserIdAndUserNmAndEmail(corpUserVO);
		
		if(resultVO != null && StringUtils.isNoneEmpty(resultVO.getUserId())){
			if(StringUtils.equals(resultVO.getRegSt(), "B01")){
				resultMap.put("isAvail", "true");
				resultMap.put("msg", "비밀번호 재설정 메일이 발송되었습니다");

				
				AESUtil aesUtil = new AESUtil(propertiesService.getString("site.aes.key"));
				String encUserId = aesUtil.encrypt(resultVO.getUserId());
				String encCurTime = aesUtil.encrypt(String.valueOf(System.currentTimeMillis()));
				
				//개발 확인용
				resultMap.put("resetPwUrl", "/user/corp/resetPwForm.do?u=" + encUserId + "&c=" + encCurTime);
				
				//TODO send mail
				
				
			}else {
				resultMap.put("isAvail", "false");
				if(StringUtils.equals(resultVO.getRegSt(), "A01")){
					resultMap.put("msg", "가입승인 대기중입니다");
				}else if(StringUtils.equals(resultVO.getRegSt(), "C01")){
					resultMap.put("msg", "사용정지된 계정입니다");
				}else if(StringUtils.equals(resultVO.getRegSt(), "D01")){
					resultMap.put("msg", "일치하는 정보가 없습니다");
				}
			}
		}else{
			resultMap.put("isAvail", "false");
			resultMap.put("msg", "일치하는 정보가 없습니다");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	
	@RequestMapping({"/user/corp/resetPwForm.do"})
	public String defResetPwForm(HttpServletRequest request, ModelMap model,
			@RequestParam(value="u", required=true) String u,
			@RequestParam(value="c", required=true) String c) throws Exception {
		
		AESUtil aesUtil = new AESUtil(propertiesService.getString("site.aes.key"));
		
		long validTime = Long.parseLong(aesUtil.decrypt(c)) + (1000 * 60 * 5);
		long nowTime = System.currentTimeMillis();
		
		log.debug(validTime + "=validTime");
		log.debug(nowTime + "=nowTime");
		
		if(nowTime < validTime){
			model.addAttribute("valid", "true");
		}else{
			model.addAttribute("valid", "false");
		}
		
		return "user/corp/def/ResetPwForm";
	}
	
	@RequestMapping({"/user/corp/resetPw.do"})
	public @ResponseBody
	String defResetPw(HttpServletRequest request, 
			@ModelAttribute("corpUserSearchVO") CorpUserSearchVO searchVO,
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO, 
			@ModelAttribute("paramVO") CorpUserParamVO paramVO,
			@RequestParam(value="u", required=true) String u,
			@RequestParam(value="c", required=true) String c) throws Exception {

		
		AESUtil aesUtil = new AESUtil(propertiesService.getString("site.aes.key"));
		corpUserVO.setUserId(aesUtil.decrypt(u));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Integer rtnVal = corpUserService.updatePw(corpUserVO);
		
		if(rtnVal > 0){
			resultMap.put("isAvail", "true");			
		}else{
			resultMap.put("isAvail", "false");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping("/user/corp/loginForm.do")
	public String defLoginForm(HttpServletRequest request, ModelMap model) throws Exception {

		CorpUserVO corpUserVO = new CorpUserVO();
		model.addAttribute("corpUserVO", corpUserVO);

		return "user/corp/def/LoginForm";
	}
	
	@RequestMapping("/user/corp/login.do")
	public String defLogin(HttpServletRequest request, ModelMap model,
			@ModelAttribute("corpUserVO") CorpUserVO corpUserVO) throws Exception {
		
		CorpUserVO loginVO = corpUserService.selectByUserIdAndUserPw(corpUserVO);
		
		if(loginVO == null || StringUtils.isEmpty(loginVO.getUserId())){
			return "forward:loginForm.do";
		}else{
			UserVO userVO = new UserVO();
			
			userVO.setCorpUserVO(loginVO);
			
			userVO.setUserTyp(this.USER_GRP);
			userVO.setLocale(super.getLocale());
			userVO.setIpAddr(super.getIpAddr());
			userVO.setLoginYmdt(super.getLoginYmdt());
			userVO.setSessionId(super.getSessionId());
			
			request.getSession().setAttribute("userSession", userVO);
			
			//update lastLoginDt
			corpUserService.updateLastLoginDt(loginVO);
			
			String redirectUrl = "/index.do";
			String destinationAfterLogin = request.getSession().getAttribute("destinationAfterLogin") == null ? "" : (String)request.getSession().getAttribute("destinationAfterLogin");
			if(StringUtils.isNotEmpty(destinationAfterLogin)){
				redirectUrl = destinationAfterLogin;
			}
			
			return "redirect:" + redirectUrl;
		}
	}
	
	@RequestMapping("/user/corp/logout.do")
	public String defLogout(HttpServletRequest request, ModelMap model) throws Exception {

		request.getSession().invalidate();
			
		return "redirect:/index.do";
	}
	
	@RequestMapping(value="/user/corp/checkLoginInfo.do", method=RequestMethod.POST)
	public @ResponseBody 
	String checkLoginInfo(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		CorpUserVO corpUserVO = new CorpUserVO();
		corpUserVO.setUserId(String.valueOf(reqMap.get("userId")));
		corpUserVO.setUserPw(String.valueOf(reqMap.get("userPw")));
		
		CorpUserVO vo = corpUserService.selectByUserIdAndUserPw(corpUserVO); 
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
	
	@UserGrpMapping(value={USER_GRP})
	@RequestMapping(value={"/user/corp/updateUserPw.do"}, method=RequestMethod.POST)
	public @ResponseBody 
	String updateUserPw(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		CorpUserVO corpUserVO = new CorpUserVO();
		corpUserVO.setUserId(String.valueOf(reqMap.get("userId")));
		corpUserVO.setUserPw(String.valueOf(reqMap.get("userPw")));
		
		Integer rtnVal = corpUserService.updatePw(corpUserVO);
		if(rtnVal > 0){
			resultMap.put("isAvail", "true");
		}else{
			resultMap.put("isAvail", "false");
		}
		
		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	/* ***********************************************************************************/
	/* common ****************************************************************************/
	/* ***********************************************************************************/
	@RequestMapping(value={"/csl/user/corp/checkUserId.do", "/user/corp/checkUserId.do"}, method=RequestMethod.POST)
	public @ResponseBody 
	String checkUserId(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		CorpUserVO corpUserVO = new CorpUserVO();
		corpUserVO.setUserId(String.valueOf(reqMap.get("userId")));
		
		CorpUserVO vo = corpUserService.select(corpUserVO); 
		if(vo != null && StringUtils.isNotEmpty(vo.getUserId())){
			resultMap.put("isAvail", "false");
		}else{
			resultMap.put("isAvail", "true");
		}
		
		return new ObjectMapper().writeValueAsString(resultMap);
	}
}


