<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8" />
<title>
	영문사이트  -
	<c:if test="${not empty historyMenuList}">
		${historyMenuList[fn:length(historyMenuList)-1].menuNm } - 
	</c:if> 
	<decorator:title default="" />
</title>

<link type="text/css" rel="stylesheet" media="screen" href="<c:out value='/eng/jquery/ui-1.12.1.custom/jquery-ui.css' />" />
<link type="text/css" rel="stylesheet" media="screen" href="<c:out value='/eng/jquery/validation-engine-2.6.2/css/validationEngine.jquery.css' />" />
<!--[if lt IE 9]><script src="/csl/jquery/html5shiv-3.7.3/html5shiv.js"></script><![endif]-->
<script type="text/javascript" src="<c:out value='/eng/jquery/jquery-1.12.4.js'/>"></script>
<script type="text/javascript" src="<c:out value='/eng/jquery/ui-1.12.1.custom/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:out value='/eng/jquery/form-3.51.0/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/eng/jquery/ui-1.12.1.custom/i18n/jquery.ui.datepicker-ko.js'/>"></script>
<script type="text/javascript" src="<c:out value='/eng/jquery/validation-engine-2.6.2/js/languages/jquery.validationEngine-ko.js'/>"></script>
<script type="text/javascript" src="<c:out value='/eng/jquery/validation-engine-2.6.2/js/jquery.validationEngine-custom.js'/>"></script>
<script type="text/javascript" src="<c:out value='/eng/jquery/jcarousellite-1.1/jquery.jcarousellite.js'/>"></script>
<script type="text/javascript" src="<c:out value='/eng/jquery/blockui-2.70.0/jquery.blockUI.js'/>"></script>

<%-- 
dwr 사용을 지양하기 위해 주석처리함, 필요시 해당 jsp에 추가하여 사용바람. 가능하면 ajax 사용바람
<script type="text/javascript" src="<c:out value='/dwr/engine.js' />"></script>
<script type="text/javascript" src="<c:out value='/dwr/util.js' />"></script>
--%>

<!-- site -->
<link type="text/css" rel="stylesheet" href="<c:url value='/eng/css/style.css' />" />
<script type="text/javascript" src="<c:out value='/eng/js/site.util.js' />"></script>
<script type="text/javascript" src="<c:out value='/eng/js/site.cmmn.js' />"></script>

