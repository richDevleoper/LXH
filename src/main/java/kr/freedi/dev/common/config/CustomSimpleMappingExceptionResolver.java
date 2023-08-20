package kr.freedi.dev.common.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

/**
 * @project : dev_default
 * @file 	: CustomSimpleMappingExceptionResolver.java
 * @date	: 2017. 2. 27.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class CustomSimpleMappingExceptionResolver extends SimpleMappingExceptionResolver{
	protected Log log = LogFactory.getLog(this.getClass());
	 
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception e) {
		log.error(e);
	    System.out.println("request.getRequestURI()=" + request.getRequestURI());
	    return super.resolveException(request, response, handler, e);
	}
}

