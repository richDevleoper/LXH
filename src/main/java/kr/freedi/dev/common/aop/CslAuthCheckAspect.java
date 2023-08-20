package kr.freedi.dev.common.aop;

import java.lang.reflect.Method;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.freedi.dev.common.exception.CslNullSessionException;
import kr.freedi.dev.common.exception.CslPermissionDeniedException;
import kr.freedi.dev.common.exception.CslResponseBodyNullSessionException;
import kr.freedi.dev.menu.service.MenuUseService;
import kr.freedi.dev.user.domain.UserVO;

/**
 * @project : dev_default
 * @file 	: CslAuthCheckAspect.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Aspect
@Order(2)
public class CslAuthCheckAspect {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="menuUseService")
	private MenuUseService menuUseService;
	
	private String[] nsExcludePatterns = {
			"/csl/user/mngr/login" 
			,"/csl/user/mngr/logout" 
			,"/csl/user/mngr/check"
			,"/csl/user/genr/check"
			,"/csl/user/corp/check"
			,"/csl/error"};
	
	private String[] pdExcludePatterns = {
			"/csl/user/mngr/login" 
			,"/csl/user/mngr/logout" 
			,"/csl/user/mngr/check"
			,"/csl/user/genr/check"
			,"/csl/user/corp/check"
			,"/csl/error"
			,"/csl/index"
			,"/csl/attachfile"
			,"/csl/editor",
			"/csl/article"};
	
	@Before("within(@org.springframework.stereotype.Controller *)")
	public void sessionCheckController(JoinPoint joinPoint)throws Throwable{
		
		Object[] args = joinPoint.getArgs();
		
		for(Object obj : args){
			if(obj instanceof HttpServletRequest){
				HttpServletRequest request = (HttpServletRequest)obj;
				String requestUri = request.getRequestURI();
				if(StringUtils.startsWithIgnoreCase(requestUri, "/csl")){
					
					Class<?> cls = joinPoint.getTarget().getClass();
					String methodName = joinPoint.getSignature().getName();
					Method method = null;
					ResponseBody responseBody = null;
					
					Method[] methodList = cls.getDeclaredMethods();
					for(Method m : methodList){
						if(StringUtils.equals(methodName, m.getName())){
							method = m;
							responseBody = method.getAnnotation(ResponseBody.class);
							break;
						}
					}
					
					
					
					UserVO userSession = (UserVO)request.getSession().getAttribute("userSession");
					
					if(!isNsExcludePattern(requestUri)){
						if(userSession == null || userSession.getMngrUserVO() == null || StringUtils.isEmpty(userSession.getMngrUserVO().getUserId())){
						
							//request.getSession().setAttribute("errorRequestUri", request.getRequestURI() + "?" + request.getQueryString());
							//request.getSession().setAttribute("errorReferer", request.getHeader("referer"));
							String requestReferer = request.getHeader("referer") == null ? "" : request.getHeader("referer");
							request.getSession().setAttribute("errorRequestReferer", requestReferer);
							
							if(responseBody != null){
								throw new CslResponseBodyNullSessionException();
							}
							throw new CslNullSessionException();
						}
					}
					
					if(!isPdExcludePattern(requestUri) && responseBody == null){
						if (request.getParameter("menuKey") != null && StringUtils.isNotEmpty(request.getParameter("menuKey"))){
							Integer curMenuKey = Integer.parseInt(request.getParameter("menuKey"));
							List<Integer> menuUseKeys = menuUseService.selectMenuUseKeys(userSession.getMngrUserVO().getAuthId(), "ALL", "CSL");
							if(menuUseKeys.indexOf(curMenuKey) < 0){
								String requestReferer = request.getHeader("referer") == null ? "" : request.getHeader("referer");
								request.getSession().setAttribute("errorRequestReferer", requestReferer);
								//request.getSession().setAttribute("errorRequestUri", request.getRequestURI() + "?" + request.getQueryString());
								//request.getSession().setAttribute("errorReferer", request.getHeader("referer"));
								throw new CslPermissionDeniedException();
							}
						}else{
							throw new CslPermissionDeniedException();
						}
					}
				}
			}
		}
	}
	
	private boolean isNsExcludePattern(String uri){
		boolean result = false;
		if(nsExcludePatterns != null && nsExcludePatterns.length > 0){
			for(String excludePattern : nsExcludePatterns){
				if(StringUtils.startsWithIgnoreCase(uri, excludePattern)){
					result = true;
					break;
				}
			}
		}
		return result;
	}
	
	private boolean isPdExcludePattern(String uri){
		boolean result = false;
		if(pdExcludePatterns != null && pdExcludePatterns.length > 0){
			for(String excludePattern : pdExcludePatterns){
				if(StringUtils.startsWithIgnoreCase(uri, excludePattern)){
					result = true;
					break;
				}
			}
		}
		return result;
	}
}

