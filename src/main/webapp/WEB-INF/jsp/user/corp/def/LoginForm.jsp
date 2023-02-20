<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>로그인</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<script type="text/javascript">
<!--
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
				var fResult = checkLoginInfo();
				if(fResult == undefined){
					return false;
				}
				if(fResult.isAvail != 'true'){
					alert(fResult.msg);
					return false;
				}
				return true;
			}
			return false;
		}
	});
});

function checkLoginInfo(){
	var _result;
	$.ajax({
		url : '/user/corp/checkLoginInfo.do' 
        ,method : "post"
		,dataType : 'json'
		,async: false
		,data : {
			userId:$("#userId").val()
			,userPw:$("#userPw").val()
		}
		,success : function(result, stat, xhr) {
			//console.log(result);
			_result = result;
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
	return _result;
}

function login(){
	$('#defaultForm').submit();
}
//-->
</script>

</head>
<body>

<form:form commandName="corpUserVO" id="defaultForm" name="defaultForm" method="post" action="login.do">
<div style="height:400px;">
	<div>
		<table cellpadding="0" class="tb_base" summary="">
			<caption><span>로그인</span></caption>
			<colgroup>
				<col style="width:13%"/>
				<col style="width:87%"/>
			</colgroup>
			<thead>
			</thead>
			<tbody class="write">
				<tr>
					<th><label for="userId">아이디</label></th>
					<td>
						<input type="text" id="userId" name="userId" class="validate[required,minSize[4],maxSize[20]] tb_ipty" maxlength="20" style="width:192px;" title="아이디"/>
					</td>
				</tr>
				<tr>
					<th><label for="userPw">비밀번호</label></th>
					<td>
						<input type="password" id="userPw" name="userPw" class="validate[required,minSize[6],maxSize[20]] tb_ipty" maxlength="20" style="width:192px;" title="비밀번호"/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
		
	<div style="margin-top:20px; text-align:center;">
		<input type="button" value="로그인" title="로그인" class="btn_st0" onclick="login();" id="login_btn"/>
	</div>
</div>
</form:form>

</body>
</html>