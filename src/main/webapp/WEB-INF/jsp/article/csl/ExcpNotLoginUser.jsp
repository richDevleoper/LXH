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

<table class="tb_base" summary="">
	<caption><span>사용자정보 확인</span></caption>
	<colgroup>
		<col style="width:15%"/>
		<col style="width:35%"/>
		<col style="width:15%"/>
		<col style="width:35%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col" colspan="4">사용자정보 확인</th>
		</tr>
	</thead>
	<tbody class="write">
		<tr>
			<th><label for="">사용자정보</label></th>
			<td colspan="3">로그인정보가 없습니다.</td>
		</tr>
	</tbody>
</table>

<p class="btn_list">
	<button class="jListButton" onclick="prevPage();" title="이전페이지">이전페이지</button>
</p>

</form:form>

</body>
</html>