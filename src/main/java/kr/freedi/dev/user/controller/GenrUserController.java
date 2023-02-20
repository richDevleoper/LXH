package kr.freedi.dev.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.annotation.UserGrpMapping;
import kr.freedi.dev.common.util.AESUtil;
import kr.freedi.dev.user.domain.GenrUserParamVO;
import kr.freedi.dev.user.domain.GenrUserSearchVO;
import kr.freedi.dev.user.domain.GenrUserVO;
import kr.freedi.dev.user.domain.UserAuthVO;
import kr.freedi.dev.user.domain.UserVO;
import kr.freedi.dev.user.service.GenrUserService;
import kr.freedi.dev.user.service.UserAuthService;

/**
 * @project : dev_default
 * @file 	: GenrUserController.java
 * @date	: 2017. 2. 17.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class GenrUserController extends UserController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	private final String USER_GRP = "GENR_USER"; //사용자그룹
	private final String DEFAULT_AUTH_ID = "ROLE_GENR_DEFAULT"; //권한그룹
	private final String DEFATUL_REG_ST = "B01"; //A01=승인대기, B01=정상사용, C01=사용정지, D01=회원탈퇴
	
	@Resource(name = "genrUserService")
	private GenrUserService genrUserService;
	
	@Resource(name = "userAuthService")
	private UserAuthService userAuthService;
	
	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;
	
	/* ***********************************************************************************/
	/* csl *******************************************************************************/
	/* ***********************************************************************************/
	@RequestMapping({"/csl/user/genr/list.do"})
	public String cslList(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO) throws Exception {
		
		List<EgovMap> genrUserList = genrUserService.selectList(searchVO);
		searchVO.setTotalRecordCount(genrUserService.selectListCount(searchVO));
		model.addAttribute("genrUserList", genrUserList);
		
		UserAuthVO userAuthVO = new UserAuthVO();
		userAuthVO.setUserGrp(this.USER_GRP);
		List<EgovMap> userAuthList = userAuthService.selectFullList(userAuthVO);
		model.addAttribute("userAuthList", userAuthList);

		return "user/genr/csl/List";
	}
	
	@RequestMapping({"/csl/user/genr/insertForm.do"})
	public String cslInsertForm(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {

		GenrUserVO genrUserVO = new GenrUserVO();
		model.addAttribute("genrUserVO", genrUserVO);
		model.addAttribute("action", "insert.do");
		
		UserAuthVO userAuthVO = new UserAuthVO();
		userAuthVO.setUserGrp(this.USER_GRP);
		userAuthVO.setActFlg("Y");
		List<EgovMap> userAuthList = userAuthService.selectFullList(userAuthVO);
		model.addAttribute("userAuthList", userAuthList);

		return "user/genr/csl/Form";
	}

	@RequestMapping({"/csl/user/genr/insert.do"})
	public String cslInsert(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO, 
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {

		genrUserVO.setTel(paramVO.getTel());
		genrUserVO.setMob(paramVO.getMob());
		genrUserService.insert(genrUserVO);

		return "redirect:list.do?" + searchVO.getParam();
	}

	@RequestMapping({"/csl/user/genr/updateForm.do"})
	public String cslUpdateForm(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO,
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {

		GenrUserVO sGenrUserVO = genrUserService.select(genrUserVO);
		paramVO.setTel(sGenrUserVO.getTel());
		paramVO.setMob(sGenrUserVO.getMob());
		model.addAttribute("genrUserVO", sGenrUserVO);
		model.addAttribute("action", "update.do");
		
		UserAuthVO userAuthVO = new UserAuthVO();
		userAuthVO.setUserGrp(this.USER_GRP);
		userAuthVO.setActFlg("Y");
		List<EgovMap> userAuthList = userAuthService.selectFullList(userAuthVO);
		model.addAttribute("userAuthList", userAuthList);
		
		return "user/genr/csl/Form";
	}

	@RequestMapping({"/csl/user/genr/update.do"})
	public String cslUpdate(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO, 
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {

		genrUserVO.setTel(paramVO.getTel());
		genrUserVO.setMob(paramVO.getMob());
		genrUserService.updateByMngr(genrUserVO);

		return "redirect:updateForm.do?userId=" + genrUserVO.getUserId() + "&" + searchVO.getParam();
	}

	@RequestMapping("/csl/user/genr/delete.do")
	public String delete(HttpServletRequest request, 
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO, 
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO) throws Exception {

		genrUserService.delete(genrUserVO);

		return "redirect:list.do?" + searchVO.getParam();
	}
	
	
	/* ***********************************************************************************/
	/* def *******************************************************************************/
	/* ***********************************************************************************/
	@RequestMapping({"/user/genr/insertForm.do"})
	public String defInsertForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {
		
		GenrUserVO genrUserVO = new GenrUserVO();
		model.addAttribute("genrUserVO", genrUserVO);
		
		return "user/genr/def/InsertForm";
	}
	
	@RequestMapping({"/user/genr/insert.do"})
	public @ResponseBody
	String defInsert(HttpServletRequest request, 
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO, 
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {
		
		genrUserVO.setTel(paramVO.getTel());
		genrUserVO.setMob(paramVO.getMob());
		genrUserVO.setAuthId(this.DEFAULT_AUTH_ID);
		genrUserVO.setRegSt(this.DEFATUL_REG_ST);
		
		Integer rtnVal = genrUserService.insert(genrUserVO);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(rtnVal > 0){
			resultMap.put("isAvail", "true");
			resultMap.put("userNm", genrUserVO.getUserNm());			
		}else{
			resultMap.put("isAvail", "false");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@UserGrpMapping(value={USER_GRP})
	@RequestMapping({"/user/genr/updateForm.do"})
	public String defUpdateForm(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO,
			@ModelAttribute("paramVO") GenrUserParamVO paramVO,
			UserVO userSession) throws Exception {

		genrUserVO.setUserId(userSession.getGenrUserVO().getUserId());
		
		GenrUserVO sGenrUserVO = genrUserService.select(genrUserVO);
		paramVO.setTel(sGenrUserVO.getTel());
		paramVO.setMob(sGenrUserVO.getMob());
		model.addAttribute("genrUserVO", sGenrUserVO);
		
		return "user/genr/def/UpdateForm";
	}
	
	@UserGrpMapping(value={USER_GRP})
	@RequestMapping({"/user/genr/update.do"})
	public @ResponseBody 
	String defUpdate(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO, 
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		genrUserVO.setTel(paramVO.getTel());
		genrUserVO.setMob(paramVO.getMob());
		Integer rtnVal = genrUserService.updateByGenr(genrUserVO);
		
		
		if(rtnVal > 0){
			resultMap.put("isAvail", "true");
		}else{
			resultMap.put("isAvail", "false");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@UserGrpMapping(value={USER_GRP})
	@RequestMapping({"/user/genr/leaveForm.do"})
	public String defLeaveForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO,
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {

		return "user/genr/def/LeaveForm";
	}
	
	@UserGrpMapping(value={USER_GRP})
	@RequestMapping({"/user/genr/leave.do"})
	public @ResponseBody 
	String defLeave(HttpServletRequest request, 
			UserVO userSession,
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO, 
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {

		GenrUserVO leaveVO = genrUserService.selectByUserIdAndUserPw(genrUserVO);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if(leaveVO != null && StringUtils.isNotEmpty(leaveVO.getUserId())){
			genrUserVO.setRegSt("D01");
			Integer rtnVal = genrUserService.updateRegSt(genrUserVO);
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
	
	
	@RequestMapping({"/user/genr/findIdForm.do"})
	public String defFindIdForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {
		
		GenrUserVO genrUserVO = new GenrUserVO();
		model.addAttribute("genrUserVO", genrUserVO);
		
		return "user/genr/def/FindIdForm";
	}
	
	@RequestMapping({"/user/genr/findId.do"})
	public @ResponseBody
	String defFindId(HttpServletRequest request, 
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO, 
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {
		
		genrUserVO.setMob(paramVO.getMob());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		GenrUserVO resultVO = genrUserService.selectByUserNmAndMob(genrUserVO);
		
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
	
	@RequestMapping({"/user/genr/findPwForm.do"})
	public String defFindPwForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {
		
		GenrUserVO genrUserVO = new GenrUserVO();
		model.addAttribute("genrUserVO", genrUserVO);
		
		return "user/genr/def/FindPwForm";
	}
	
	@RequestMapping({"/user/genr/findPw.do"})
	public @ResponseBody
	String defFindPw(HttpServletRequest request, 
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO, 
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {

		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		GenrUserVO resultVO = genrUserService.selectByUserIdAndUserNmAndEmail(genrUserVO);
		
		if(resultVO != null && StringUtils.isNoneEmpty(resultVO.getUserId())){
			if(StringUtils.equals(resultVO.getRegSt(), "B01")){
				resultMap.put("isAvail", "true");
				resultMap.put("msg", "비밀번호 재설정 메일이 발송되었습니다");

				
				AESUtil aesUtil = new AESUtil(propertiesService.getString("site.aes.key"));
				String encUserId = aesUtil.encrypt(resultVO.getUserId());
				String encCurTime = aesUtil.encrypt(String.valueOf(System.currentTimeMillis()));
				
				//개발 확인용
				resultMap.put("resetPwUrl", "/user/genr/resetPwForm.do?u=" + encUserId + "&c=" + encCurTime);
				
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
	
	
	@RequestMapping({"/user/genr/resetPwForm.do"})
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
		
		return "user/genr/def/ResetPwForm";
	}
	
	@RequestMapping({"/user/genr/resetPw.do"})
	public @ResponseBody
	String defResetPw(HttpServletRequest request, 
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO, 
			@ModelAttribute("paramVO") GenrUserParamVO paramVO,
			@RequestParam(value="u", required=true) String u,
			@RequestParam(value="c", required=true) String c) throws Exception {

		
		AESUtil aesUtil = new AESUtil(propertiesService.getString("site.aes.key"));
		genrUserVO.setUserId(aesUtil.decrypt(u));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Integer rtnVal = genrUserService.updatePw(genrUserVO);
		
		if(rtnVal > 0){
			resultMap.put("isAvail", "true");			
		}else{
			resultMap.put("isAvail", "false");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping("/user/genr/loginForm.do")
	public String defLoginForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("paramVO") GenrUserParamVO paramVO) throws Exception {

		GenrUserVO genrUserVO = new GenrUserVO();
		model.addAttribute("genrUserVO", genrUserVO);

		return "user/genr/def/LoginForm";
	}
	
	@RequestMapping("/user/genr/login.do")
	public String defLogin(HttpServletRequest request, ModelMap model,
			@ModelAttribute("genrUserSearchVO") GenrUserSearchVO searchVO,
			@ModelAttribute("paramVO") GenrUserParamVO paramVO,
			@ModelAttribute("genrUserVO") GenrUserVO genrUserVO) throws Exception {
		
		GenrUserVO loginVO = genrUserService.selectByUserIdAndUserPw(genrUserVO);
		
		if(loginVO == null || StringUtils.isEmpty(loginVO.getUserId())){
			return "forward:loginForm.do";
		}else{
			UserVO userVO = new UserVO();
			
			userVO.setGenrUserVO(loginVO);
			
			userVO.setUserTyp(this.USER_GRP);
			userVO.setLocale(super.getLocale());
			userVO.setIpAddr(super.getIpAddr());
			userVO.setLoginYmdt(super.getLoginYmdt());
			userVO.setSessionId(super.getSessionId());
			
			request.getSession().setAttribute("userSession", userVO);
			
			//update lastLoginDt
			genrUserService.updateLastLoginDt(loginVO);
			
			String redirectUrl = "/index.do";
			String destinationAfterLogin = request.getSession().getAttribute("destinationAfterLogin") == null ? "" : (String)request.getSession().getAttribute("destinationAfterLogin");
			if(StringUtils.isNotEmpty(destinationAfterLogin)){
				redirectUrl = destinationAfterLogin;
			}
			
			return "redirect:" + redirectUrl;
		}
	}
	
	@RequestMapping("/user/genr/logout.do")
	public String defLogout(HttpServletRequest request, ModelMap model) throws Exception {

		request.getSession().invalidate();
			
		return "redirect:/index.do";
	}
	
	@RequestMapping(value={"/user/genr/checkLoginInfo.do"}, method=RequestMethod.POST)
	public @ResponseBody 
	String checkLoginInfo(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		GenrUserVO genrUserVO = new GenrUserVO();
		genrUserVO.setUserId(String.valueOf(reqMap.get("userId")));
		genrUserVO.setUserPw(String.valueOf(reqMap.get("userPw")));
		
		GenrUserVO vo = genrUserService.selectByUserIdAndUserPw(genrUserVO); 
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
	@RequestMapping(value={"/user/genr/updateUserPw.do"}, method=RequestMethod.POST)
	public @ResponseBody 
	String updateUserPw(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		GenrUserVO genrUserVO = new GenrUserVO();
		genrUserVO.setUserId(String.valueOf(reqMap.get("userId")));
		genrUserVO.setUserPw(String.valueOf(reqMap.get("userPw")));
		
		Integer rtnVal = genrUserService.updatePw(genrUserVO);
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
	@RequestMapping(value={"/csl/user/genr/checkUserId.do", "/user/genr/checkUserId.do"}, method=RequestMethod.POST)
	public @ResponseBody 
	String checkUserId(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		GenrUserVO genrUserVO = new GenrUserVO();
		genrUserVO.setUserId(String.valueOf(reqMap.get("userId")));
		
		GenrUserVO vo = genrUserService.select(genrUserVO); 
		if(vo != null && StringUtils.isNotEmpty(vo.getUserId())){
			resultMap.put("isAvail", "false");
		}else{
			resultMap.put("isAvail", "true");
		}
		
		return new ObjectMapper().writeValueAsString(resultMap);
	}
}


