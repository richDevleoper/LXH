<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
<%@ taglib prefix="attachfile" uri="http://www.freedi.kr/attachfile-taglib"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>jQuery File Upload Example</title>

<link rel="stylesheet" href="/def/jquery/ui-1.12.1.custom/jquery-ui.css">
<link type="text/css" rel="stylesheet" href="/def/css/base.css" />
<link rel="stylesheet" href="css/jquery.fileupload.css">
<link rel="stylesheet" href="css/jquery.fileupload-ui.css">

<!--[if lt IE 9]><script src="http://182.162.82.162/def/jquery/html5shiv-3.7.3/html5shiv.js"></script><![endif]-->
<script type="text/javascript" src="/def/jquery/ui-1.12.1.custom/external/jquery/jquery.js"></script>
<script type="text/javascript" src="/def/jquery/ui-1.12.1.custom/jquery-ui.js"></script>

<script src="js/jquery.fileupload-tmpl.js"></script>
<script src="js/jquery.iframe-transport.js"></script>
<script src="js/jquery.fileupload.js"></script>
<script src="js/jquery.fileupload-process.js"></script>
<script src="js/jquery.fileupload-validate.js"></script>
<script src="js/jquery.fileupload-ui.js"></script>
<script src="js/jquery.fileupload-jquery-ui.js"></script>
<script src="js/attachfile-fileuploader.js"></script>

</head>

<body style="width:800px;">
	<h1>Sample</h1>
	<%--
	<script type="text/javascript">$(document).ready(function (){var fu = new jAttachFile.fileUpload({fileId:'article_1', fileGrp:'article', maxFileSize:1000000000, maxNumberOfFiles:10, autoUpload:true});});</script>
	<div id="fileUploadWrap"></div>
	--%>
	<attachfile:fileuploader
		objectId="fileUploadObj_01"
		ctx=""
		wrapperId="fileUploadWrap"
		fileId="article_1"
		fileGrp="article"
		autoUpload="false"
		maxFileSize="1000000"
		maxNumberOfFiles="3"/>
	
</body>
</html>