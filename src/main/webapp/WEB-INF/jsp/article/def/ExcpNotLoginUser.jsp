<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
    
<!doctype html>
<html lang="ko">
<head>
<title>사용자정보 확인</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<script type="text/javascript">

<!--
alert("해당 기능을 위한 사용자정보가 없습니다.");
prevPage();
$(function() {
	$("#defaultForm").validationEngine('attach', {
		unbindEngine:false,
		validationEventTrigger: "submit",
		promptPosition : "topLeft",
		showOneMessage : true,
		customFunctions: {
			//
		},
		onValidationComplete: function(form, status){
			if(status == true) {
				return false;
			}
		}
	});
});

//이전 페이지
function prevPage(){
	history.go(-1);
}

//개인회원
function genrLoginForm(){
	window.location.href = genrUserLoginFormUrl;	
}

//기업회원
function corpLoginForm(){
	window.location.href = corpUserLoginFormUrl;	
}
//-->
</script>
</head>
<body>

<form:form commandName="articleVO" id="defaultForm" name="defaultForm" method="post" action="${action}">
${articleSearchVO.hiddenTag }

<form:hidden path="articleKey" />

<!-- 게시판 글쓰기 권한없음 -->
<div class="etc_box">
	<div class="authority">
		<div class="auth_cont">
			<h4>사용자정보 확인</h4>
			<p>해당 기능을 위한 사용자정보가 없습니다.</p>
			<p class="etc_box_btn"><a href="#none" onclick="prevPage();">이전페이지</a></p>
			<p class="etc_box_btn"><a href="#none" onclick="genrLoginForm();">개인회원 로그인</a></p>
			<p class="etc_box_btn"><a href="#none" onclick="corpLoginForm();">기업회원 로그인</a></p>
		</div>
	</div>
</div>
<!-- //게시판 글쓰기 권한없음 -->

</form:form>

</body>
</html>