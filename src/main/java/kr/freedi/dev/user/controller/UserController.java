package kr.freedi.dev.user.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.time.FastDateFormat;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @project : dev_default
 * @file 	: UserController.java
 * @date	: 2017. 2. 22.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class UserController {
	
	protected Log log = LogFactory.getLog(UserController.class);
	
	@Autowired
	private HttpServletRequest httpServletRequest;
	
	public String getIpAddr(){
		return httpServletRequest.getRemoteAddr();
	}
	
	public String getLocale(){
		return httpServletRequest.getLocale().toString();
	}
	
	public String getLoginYmdt(){
		Date today = new Date(System.currentTimeMillis());
		FastDateFormat fdf = FastDateFormat.getInstance("yyyyMMddHHmmss");
		
		return fdf.format(today);
	}

	public String getSessionId(){
		return httpServletRequest.getSession().getId();
	}
	
	
	
	
	
}