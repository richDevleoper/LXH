package kr.freedi.dev.sso.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.initech.eam.nls.CookieManager;
import com.initech.eam.smartenforcer.SECode;

@Controller
@RequestMapping({"/sso"})
public class SSOController {

	@RequestMapping("/login_exec.do")
	public String listView(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String sso_id = null;
		sso_id = CookieManager.getCookieValue(SECode.USER_ID, request);
		return "sso/login_exec";
	}
}
