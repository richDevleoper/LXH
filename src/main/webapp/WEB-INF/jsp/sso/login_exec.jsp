<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="./config.jsp" %>
<%

	String uurl = null;

	//http://nlstest.initech.com:8090/agent/sso/login_exec.jsp : 꼭 도메인으로 호출해야 된다.
	//1.SSO ID 수신
	String sso_id = getSsoId(request);
	System.out.println("*================== [login_exec.jsp]  sso_id = "+sso_id);
	if(sso_id == null || sso_id.equals("")){
		goLoginPage(response);
	} else {
		String retCode = getEamSessionCheckAndAgentVaild(request,response);
		System.out.println("*================== [retCode]  retCode = " + retCode);
		response.sendRedirect("/intf/login.do?user_id="+sso_id);
		//out.flush();
		//out.close();
	}

%>