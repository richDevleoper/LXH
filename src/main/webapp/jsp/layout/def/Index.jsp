<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>

	<%@ include file="/WEB-INF/jsp/layout/def/Head.jsp" %>
	<script type="text/javascript" src="<c:out value='/def/js/index.cmmn.js' />"></script>
	<decorator:head />
</head>

<body>
	<!-- skipnavigation -->
	<div id="skipnavigation">
		<ul>
			<li><a href="#container_wrap">본문 바로가기</a></li>
			<li><a href="#gnb">주요메뉴 바로가기</a></li>
		</ul>
	</div>
	<!-- //skipnavigation -->
	<hr />

	<div id="wrap">
	<%@ include file="/WEB-INF/jsp/layout/def/Header.jsp" %>
		<decorator:body />
	<%@ include file="/WEB-INF/jsp/layout/def/Footer.jsp" %>
	</div>
</body>
</html>