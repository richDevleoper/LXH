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
<title>비밀번호 확인</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<script type="text/javascript">
<!--
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
				return true;
			}
		}
	});
});

//
function checkWriterPwd(){
	$("#defaultForm").submit();
	return false;
}
//이전 페이지
function prevPage(){
	history.go(-1);
}
//-->
</script>
</head>
<body>

<form:form commandName="articleVO" id="defaultForm" name="defaultForm" method="post" action="${action }">
${articleSearchVO.hiddenTag }

<form:hidden path="articleKey" />

<!-- 게시글 비밀번호 확인 -->
<div class="etc_box">
	<div class="pw_confirm">
		<div class="pw_confirm_cont">
			<h4>비밀번호 확인</h4>
			<p>
				<input type="password" id="searchWriterPwd" name="searchWriterPwd" value="" class="validate[required,minSize[4],maxSize[20]] inp_type" style="width:30%;" maxlength="20" />
				<c:if test="${cause eq 'wrong'}"><span>* 비밀번호가 일지하지 않습니다</span></c:if>
			</p>
			<p class="etc_box_btn">
			<a href="#none" onclick="return checkWriterPwd();">확인</a>
			<a href="#none" onclick="prevPage();">이전페이지</a>
			</p>
		</div>
	</div>
</div>
<!-- //게시글 비밀번호 확인 -->

</form:form>

</body>
</html>