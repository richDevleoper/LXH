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
<title>회원탈퇴</title>
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
				return true;
			}
			return false;
		}
	});
	
	$('#defaultForm').ajaxForm({
		url: '/user/genr/leave.do'
	    ,type:'post'
	    ,dataType:'json'
	    ,async:false
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,complete : function(){
			$.unblockUI();
		}
	    ,success: function(data, statusText, xhr, $form){
	    	console.log(data);
			if(data != null){
				if(data.isAvail == 'true'){
					alert('회원탈퇴가 완료되었습니다');
					location.href='/index.do';
				}else{
					alert('비밀번호가 일치하지 않습니다');
					$('#userPw').val('');
				}
			}
	    }
	});
});

function leave(){
	$('#defaultForm').submit();
}
//-->
</script>

</head>
<body>

<form:form commandName="genrUserVO" id="defaultForm" name="defaultForm" method="post" action="leave.do">
<input type="hidden" id="userId" name="userId" value="${userSession.genrUserVO.userId }" />
<div style="height:400px;">
	<div>
		<table cellpadding="0" class="tb_base" summary="">
			<caption><span>회원탈퇴</span></caption>
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
						${userSession.genrUserVO.userId }
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
		<input type="button" value="회원탈퇴" title="회원탈퇴" class="btn_st0" onclick="leave();" id="leave_btn"/>
	</div>
</div>
</form:form>

</body>
</html>