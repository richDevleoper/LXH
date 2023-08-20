package kr.freedi.dev.common.aop;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.freedi.dev.common.annotation.UserGrpMapping;
import kr.freedi.dev.common.exception.DefNullSessionException;
import kr.freedi.dev.common.exception.DefPermissionDeniedException;
import kr.freedi.dev.common.exception.DefResponseBodyNullSessionException;
import kr.freedi.dev.common.exception.DefResponseBodyPermissionDeniedException;
import kr.freedi.dev.user.domain.UserVO;

/**
 * @project : dev_default
 * @file 	: DefAuthCheckAspect.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Aspect
@Order(2)
public class DefAuthCheckAspect {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Before("within(@org.springframework.stereotype.Controller *)")
	public void sessionCheckController(JoinPoint joinPoint)throws Throwable{
		
		Object[] args = joinPoint.getArgs();
		
		for(Object obj : args){
			if(obj instanceof HttpServletRequest){
				HttpServletRequest request = (HttpServletRequest)obj;
				//String requestUri = request.getRequestURI();
				if(!StringUtils.startsWithAny(request.getRequestURI(), new String[]{"/csl"})){
					
					Class<?> cls = joinPoint.getTarget().getClass();
					String methodName = joinPoint.getSignature().getName();
					Method method = null;
					ResponseBody responseBody = null;
					UserGrpMapping userGrpMapping = null;
					
					Method[] methodList = cls.getDeclaredMethods();
					for(Method m : methodList){
						if(StringUtils.equals(methodName, m.getName())){
							method = m;
							responseBody = method.getAnnotation(ResponseBody.class);
							userGrpMapping = method.getAnnotation(UserGrpMapping.class);
							break;
						}
					}
					
					if(userGrpMapping != null){
						UserVO userSession = (UserVO)request.getSession().getAttribute("userSession");
						if(userSession == null || StringUtils.equals(userSession.getUserTyp(), "GUEST_USER")){
							String requestReferer = request.getHeader("referer") == null ? "" : request.getHeader("referer");
							request.getSession().setAttribute("errorRequestReferer", requestReferer);
							
							if(responseBody != null){
								throw new DefResponseBodyNullSessionException();
							}
							throw new DefNullSessionException();
						}else{
							if(!StringUtils.equalsAny(userSession.getUserTyp(), userGrpMapping.value())){
								String requestReferer = request.getHeader("referer") == null ? "" : request.getHeader("referer");
								request.getSession().setAttribute("errorRequestReferer", requestReferer);
								
								if(responseBody != null){
									throw new DefResponseBodyPermissionDeniedException();
								}
								throw new DefPermissionDeniedException();
							}
						}
					}
				}
			}
		}
	}
}

