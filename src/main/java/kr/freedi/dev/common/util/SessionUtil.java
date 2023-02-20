package kr.freedi.dev.common.util;

import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.user.domain.UserVO;

import org.apache.commons.lang3.StringUtils;

public class SessionUtil {
	public static boolean isNullUserSession(HttpServletRequest request){
		
		UserVO userSession = (UserVO)request.getSession().getAttribute("userSession");
		
		if(userSession == null || StringUtils.isEmpty(userSession.getUserId())){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean isNotNullUserSession(HttpServletRequest request){
		UserVO userSession = (UserVO)request.getSession().getAttribute("userSession");
		
		if(userSession == null || StringUtils.isEmpty(userSession.getUserId())){
			return false;
		}else{
			return true;
		}
	}
}
