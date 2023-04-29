package kr.freedi.dev.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.user.domain.CorpUserSearchVO;
import kr.freedi.dev.user.domain.CorpUserVO;
import kr.freedi.dev.user.domain.IntfUserVO;
import kr.freedi.dev.common.annotation.UserGrpMapping;
import kr.freedi.dev.common.util.AESUtil;
import kr.freedi.dev.user.domain.CorpUserParamVO;
import kr.freedi.dev.user.domain.UserAuthVO;
import kr.freedi.dev.user.domain.UserVO;
import kr.freedi.dev.user.service.CorpUserService;
import kr.freedi.dev.user.service.IntfUserService;
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
 * @file 	: LxhUserController.java
 * @date	: 2023. 4. 26.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class IntfUserController extends UserController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	private final String USER_GRP = "INTF_USER"; //인터페이스 계정
	private final String DEFAULT_AUTH_ID = "ROLE_INTF_DEFAULT"; //권한그룹
	private final String DEFATUL_REG_ST = "B01"; //A01=승인대기, B01=정상사용, C01=사용정지, D01=회원탈퇴
	
	@Resource(name = "intfUserService")
	private IntfUserService intfUserService;
	
	@Resource(name = "userAuthService")
	private UserAuthService userAuthService;
	
	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;
	
	/* ***********************************************************************************/
	/* intf *******************************************************************************/
	/* ***********************************************************************************/
	@RequestMapping("/intf/login.do")
	public String defLogin(HttpServletRequest request, ModelMap model) throws Exception {
		
		IntfUserVO paramVo = new IntfUserVO();
		String pComNo = request.getParameter("com_no");
		paramVo.setComNo(pComNo);
		IntfUserVO loginVO = intfUserService.selectByComNo(paramVo);
		
		if(loginVO == null || StringUtils.isEmpty(loginVO.getUserId())){
			return "forward:loginForm.do";
		}else{
			UserVO userVO = new UserVO();
			userVO.setIntfUserVO(loginVO);
			userVO.setUserTyp(this.USER_GRP);
			userVO.setLocale(super.getLocale());
			userVO.setIpAddr(super.getIpAddr());
			userVO.setLoginYmdt(super.getLoginYmdt());
			userVO.setSessionId(super.getSessionId());
			
			request.getSession().setAttribute("userSession", userVO);
			
			//update lastLoginDt
			intfUserService.updateLastLoginDt(loginVO);
			
			String redirectUrl = "/index.do";
			String destinationAfterLogin = request.getSession().getAttribute("destinationAfterLogin") == null ? "" : (String)request.getSession().getAttribute("destinationAfterLogin");
			if(StringUtils.isNotEmpty(destinationAfterLogin)){
				redirectUrl = destinationAfterLogin;
			}
			
			return "redirect:" + redirectUrl;
		}
	}
}


