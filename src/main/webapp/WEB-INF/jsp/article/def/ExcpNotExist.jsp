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
<title>존재여부 확인</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<script type="text/javascript">
<!--
alert("존재하지 않거나 삭제된 게시물입니다.");
prevPage();
var contentsEditors = [];
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
			<h4>존재여부 확인</h4>
			<p>존재하지 않거나 삭제된 게시물입니다.</p>
			<p class="etc_box_btn"><a href="#none" onclick="prevPage();">이전페이지</a></p>
		</div>
	</div>
</div>
<!-- //게시판 글쓰기 권한없음 -->

</form:form>

</body>
</html>