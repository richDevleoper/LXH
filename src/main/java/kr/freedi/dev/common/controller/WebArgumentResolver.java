package kr.freedi.dev.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import kr.freedi.dev.user.domain.UserVO;

/**
 * @project : dev_default
 * @file 	: WebArgumentResolver.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class WebArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public boolean supportsParameter(MethodParameter parameter) {

		Class<?> classType = parameter.getParameterType();

		if (String.class.isAssignableFrom(classType) || UserVO.class.isAssignableFrom(classType)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {

		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();

		String paramName = parameter.getParameterName();

		if (paramName != null && paramName.length() > 0) {

			if (paramName.equals("userIp")) {
				return request.getRemoteAddr();
			}
			
			if (paramName.equals("menuKey")) {
				if(request.getParameter("menuKey") != null && StringUtils.isEmpty(request.getParameter("menuKey"))){
					return Integer.parseInt(request.getParameter("menuKey"));
				}else{
					return 0;
				}
			}
			
			if (paramName.equals("userSession")) {
				UserVO userSession = (UserVO) request.getSession().getAttribute("userSession");
				if (userSession != null) {
					return userSession;
				} else {
					request.getSession().setAttribute("userSession", new UserVO());
					return (UserVO) request.getSession().getAttribute("userSession");
				}
			}
		}

		return request.getParameter(paramName);
	}

}
