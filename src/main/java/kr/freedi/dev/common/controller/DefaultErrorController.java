package kr.freedi.dev.common.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @project : dev_default
 * @file 	: DefaultErrorController.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class DefaultErrorController {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@RequestMapping({"/common/error.do", "/common/error404.do", "/common/error500.do", "/common/error503.do"})
	public String error(HttpServletRequest request, ModelMap model){
		
		return "common/error/Error";
	}
	
	
	
	@RequestMapping("/csl/error/nullSession.do")
	public String cslNullSession(HttpServletRequest request, ModelMap model){
		
		//String errorRequestUri = String.valueOf(request.getSession().getAttribute("errorRequestUri"));
		return "error/csl/NullSession";
	}
	
	@RequestMapping("/csl/error/permissionDenied.do")
	public String cslPermissionDenied(HttpServletRequest request, ModelMap model){
		
		//String errorRequestUri = String.valueOf(request.getSession().getAttribute("errorRequestUri"));
		return "error/csl/PermissionDenied";
	}
	
	
	
	@RequestMapping("/csl/error/responseBodyNullSession.do")
	public @ResponseBody 
	String cslResponseBodyNullSession(HttpServletRequest request, ModelMap model) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("exception", "nullSession");
		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping("/csl/error/responseBodyPermissionDenied.do")
	public @ResponseBody 
	String cslResponseBodyPermissionDenied(HttpServletRequest request, ModelMap model) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("exception", "permissionDenied");
		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	
	
	@RequestMapping("/error/nullSession.do")
	public String defNullSession(HttpServletRequest request, ModelMap model){
		
		//String errorRequestUri = String.valueOf(request.getSession().getAttribute("errorRequestUri"));
		return "error/def/NullSession";
	}
	
	@RequestMapping("/error/permissionDenied.do")
	public String defPermissionDenied(HttpServletRequest request, ModelMap model){
		
		//String errorRequestUri = String.valueOf(request.getSession().getAttribute("errorRequestUri"));
		return "error/def/PermissionDenied";
	}
	
	
	@RequestMapping("/error/responseBodyNullSession.do")
	public @ResponseBody 
	String defResponseBodyNullSession(HttpServletRequest request, ModelMap model) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("exception", "nullSession");
		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping("/error/responseBodyPermissionDenied.do")
	public @ResponseBody 
	String defResponseBodyPermissionDenied(HttpServletRequest request, ModelMap model) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("exception", "permissionDenied");
		return new ObjectMapper().writeValueAsString(resultMap);
	}
}
