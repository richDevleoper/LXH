<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8" />
<title>
	<c:if test="${not empty historyMenuList}">
		${historyMenuList[fn:length(historyMenuList)-1].menuNm } - 품질혁신지원시스템
	</c:if> 
	<decorator:title default="" />
</title>


<!--[if lt IE 9]><script src="/csl/jquery/html5shiv-3.7.3/html5shiv.js"></script><![endif]-->
<%--
<link type="text/css" rel="stylesheet" media="screen" href="<c:out value='/def/jquery/ui-1.12.1.custom/jquery-ui.css' />" />
<link type="text/css" rel="stylesheet" media="screen" href="<c:out value='/def/jquery/validation-engine-2.6.2/css/validationEngine.jquery.css' />" />
 
<script type="text/javascript" src="<c:out value='/def/jquery/jquery-1.12.4.js'/>"></script>
<script type="text/javascript" src="<c:out value='/def/jquery/ui-1.12.1.custom/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:out value='/def/jquery/form-3.51.0/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/def/jquery/ui-1.12.1.custom/i18n/jquery.ui.datepicker-ko.js'/>"></script>
<script type="text/javascript" src="<c:out value='/def/jquery/validation-engine-2.6.2/js/languages/jquery.validationEngine-ko.js'/>"></script>
<script type="text/javascript" src="<c:out value='/def/jquery/validation-engine-2.6.2/js/jquery.validationEngine-custom.js'/>"></script>
<script type="text/javascript" src="<c:out value='/def/jquery/jcarousellite-1.1/jquery.jcarousellite.js'/>"></script>
<script type="text/javascript" src="<c:out value='/def/jquery/blockui-2.70.0/jquery.blockUI.js'/>"></script>


dwr 사용을 지양하기 위해 주석처리함, 필요시 해당 jsp에 추가하여 사용바람. 가능하면 ajax 사용바람
<script type="text/javascript" src="<c:out value='/dwr/engine.js' />"></script>
<script type="text/javascript" src="<c:out value='/dwr/util.js' />"></script>
--%>
	<script src="/assets/js/jquery-3.3.1.min.js"></script>
	<script src="/assets/js/jstree.min.js"></script>
    <script src="/assets/js/tabulator.min.js"></script>
	<script src="/assets/js/common.js"></script>

<!-- site -->
<%-- 
<link type="text/css" rel="stylesheet" href="<c:url value='/def/css/style.css' />" />
<script type="text/javascript" src="<c:out value='/def/js/site.util.js' />"></script>
<script type="text/javascript" src="<c:out value='/def/js/site.cmmn.js' />"></script>
 --%>
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/tree.css">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/style.css">