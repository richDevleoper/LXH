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

<style type="text/css" title="">
body {
	background: url(<c:out value='/csl/img/common/bg_top_re.gif' />)
		repeat-x top #424953;
}

h1 {
	width: 980px;
	height: 60px;
	margin: 0 auto;
	background: url(<c:out value='/csl/img/common/bg_head.gif' />)
		no-repeat;
	text-align: center;
}

.login_form {
	width: 980px;
	margin: 0 auto;
	padding-top: 170px;
	height: 255px;
	background: url(<c:out value='/csl/img/user/bg_login.jpg' />)
		no-repeat;
}

.login_form h2 {
	text-align: center;
	margin-bottom: 7px;
}

.login_form fieldset {
	padding: 33px 0 0 23px;
}

.login_form fieldset p {
	padding-left: 300px;
	float: left;
	width: 250px;
	margin-right: 7px;
	font-size: 0;
}

.login_form fieldset p label {
	display: inline-block;
	width: 72px;
	height: 22px;
	vertical-align: middle;
}

.login_form fieldset p label.lb_id {
	background: url(<c:out value='/csl/img/user/label_userid.gif' />)
		no-repeat 0 50%;
}

.login_form fieldset p label.lb_pwd {
	background: url(<c:out value='/csl/img/user/label_userpwd.gif' />)
		no-repeat 0 50%;
}

.login_form fieldset p input.ip_type {
	width: 170px;
	height: 19px;
	margin: 2px 0;
	border: 1px solid #38383a;
	vertical-align: middle;
}
</style>

<script type="text/javaScript" language="javascript">
<!--
$(function() {
	
	$("#loginForm").validationEngine({
		unbindEngine:false,
		validationEventTrigger: "submit",
		promptPosition : "topLeft",
		showOneMessage : true,
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
	
	$("#userId").focus();
});

function checkLoginInfo(){
	var _result;
	$.ajax({
		url : '/csl/user/mngr/checkLoginInfo.do' 
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

//-->
</script>

</head>
<body>
<form:form commandName="mngrUserVO" id="loginForm" name="loginForm" method="post" action="login.do">

<h1>
	<!-- <img src="<c:out value='/csl/img/logo.gif' />" alt="logo" /> -->
	<img src="" alt="logo" />
</h1>
<div class="login_form">
	<h2>
		<img src="<c:out value='/csl/img/user/h1_login.gif' />" alt="login" />
	</h2>
		<fieldset>
			<legend class="hidden">관리자 로그인</legend>
			<p>
				<label for="userId" class="lb_id"><span class="hidden">아이디</span></label>
				<form:input path="userId" value="" cssClass="validate[required, maxSize[20], minSize[4]] ip_type" cssStyle="ime-mode:inactive" onKeydown="if(event.keyCode == 13){$('#loginForm').submit();}" />
				<%-- admin --%>
				<label for="userPw" class="lb_pwd"><span class="hidden">패스워드</span></label>
				<form:password path="userPw" value="" cssClass="validate[required, maxSize[20], minSize[4], ip_type" maxlength="20"  onKeydown="if(event.keyCode == 13){$('#loginForm').submit();}" />
				<%-- admin12# --%>
			</p>
			<a href="#none" onclick="$('#loginForm').submit(); return false;"><img src="<c:out value='/csl/img/user/btn_login.gif' />" alt="로그인" style="vertical-align: middle;" /></a>
		</fieldset>
</div>
	
</form:form>
</body>
</html>