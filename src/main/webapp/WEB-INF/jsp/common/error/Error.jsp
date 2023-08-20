<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="org.apache.commons.lang3.StringUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");

	String[] reqHistory = request.getSession().getAttribute("reqHistory") == null ? null : (String[])request.getSession().getAttribute("reqHistory");
	String reqContext = "";
	if(reqHistory != null){
		for(int i =0; i<reqHistory.length; i++){
			if(StringUtils.startsWith(reqHistory[i], "/csl")){
				reqContext = "csl";
				break;
			}else if(StringUtils.startsWith(reqHistory[i], "/eng")){
				reqContext = "eng";
				break;
			}
			//out.write("<br />reqHistory" + i + "=" + reqHistory[i]);	
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title> error </title>
<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8" />
<style type="text/css">
#error_page{width:500px; margin:150px auto 0 auto; font-family:'맑은 고딕','Malgun Gothic',Gulim,'굴림',Sans-serif; text-align:center;}
#error_page h1{font-size:19px; color:#3161b1;}
#error_page .error_title{margin:50px 0 20px 0; color:#333; font-size:25px; letter-spacing:-1px; font-weight:600;}
#error_page .error_cont{margin-bottom:30px; padding-bottom:30px; font-size:14px; color:#666; line-height:22px; border-bottom:1px solid #e2e2e2;}
#error_page .btn_error{text-align:center;}
#error_page .btn_error a.btn_prevpage{padding:7px 15px 9px 15px; text-decoration:none; text-align:center; font-size:12px; color:#666; border:1px solid #e2e2e2;}
#error_page .btn_error a.btn_home{padding:8px 15px 10px 15px; text-decoration:none; text-align:center; font-size:12px; color:#fff; background:#888; border:0;}
</style>
</head>
<body>
<% if(StringUtils.equals(reqContext, "csl")){ %>
	<div id="error_page">
		<h1>localhost.localhost.com</h1>
		<!-- <h1><img src="/common/img/error_logo.gif" alt="로고이미지" /></h1> --> <!-- 로고를 이미지로 써야할 경우 -->
		<p class="error_title">페이지를 찾을 수 없습니다.</p>
		<p class="error_cont">방문하시려는 페이지의 주소가 잘못 입력되었거나,<br />페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br />입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
		<p class="btn_error">
		<a href="#none" class="btn_prevpage" onclick="history.go(-1); return false;">이전페이지</a>
		<a href="/csl/index.do" class="btn_home">홈으로 이동</a>
		</p>
	</div>
<% }else if(StringUtils.equals(reqContext, "eng")){ %>
	<div id="error_page">
		<h1>localhost.localhost.com</h1>
		<!-- <h1><img src="/common/img/error_logo.gif" alt="로고이미지" /></h1> --> <!-- 로고를 이미지로 써야할 경우 -->
		<p class="error_title">페이지를 찾을 수 없습니다.</p>
		<p class="error_cont">방문하시려는 페이지의 주소가 잘못 입력되었거나,<br />페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br />입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
		<p class="btn_error">
		<a href="#none" class="btn_prevpage" onclick="history.go(-1); return false;">이전페이지</a>
		<a href="/eng/index.do" class="btn_home">홈으로 이동</a>
		</p>
	</div>
<% }else{ %>
	<div id="error_page">
		<h1>localhost.localhost.com</h1>
		<!-- <h1><img src="/common/img/error_logo.gif" alt="로고이미지" /></h1> --> <!-- 로고를 이미지로 써야할 경우 -->
		<p class="error_title">페이지를 찾을 수 없습니다.</p>
		<p class="error_cont">방문하시려는 페이지의 주소가 잘못 입력되었거나,<br />페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br />입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
		<p class="btn_error">
		<a href="#none" class="btn_prevpage" onclick="history.go(-1); return false;">이전페이지</a>
		<a href="/index.do" class="btn_home">홈으로 이동</a>
		</p>
	</div>
<% } %>


<!--  
<%
	if(throwable != null){
		throwable.printStackTrace(new PrintWriter(out));
	}
%>
-->
</body>
</html>



