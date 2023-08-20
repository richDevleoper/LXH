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
<title>아이디찾기</title>
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
		}
	});
	
	$('#defaultForm').ajaxForm({
		url: '/user/genr/findPw.do'
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
				$('#result').text(data.msg);
				$('#resetPwUrl').text(data.resetPwUrl);
				
				$('[id^=findPwForm_]').hide();
				$('[id^=findPwResult_]').show();
				if(data.isAvail == 'true'){
					$('#findPwResult_btn').hide();
				}
			}
	    }
	});
});

function findPw(){
	$('#defaultForm').submit();
}
function findPwForm(){
	$('[id^=findPwResult_]').hide();
	$('[id^=findPwForm_]').show();
	$('#findPwForm_layer input').val('');
}
//-->
</script>

</head>
<body>

<form:form commandName="genrUserVO" id="defaultForm" name="defaultForm" method="post" action="findPw.do">
<div style="height:400px;">
	<div id="findPwForm_layer">
		<table cellpadding="0" class="tb_base" summary="">
			<caption><span>비밀번호찾기</span></caption>
			<colgroup>
				<col style="width:13%"/>
				<col style="width:87%"/>
			</colgroup>
			<thead>
			</thead>
			<tbody class="write">
				<tr>
					<th><label for="userNm">이름</label></th>
					<td>
						<input type="text" id="userNm" name="userNm" class="validate[required,maxSize[20]] tb_ipty" maxlength="20" style="width:240px;" title="이름" />
					</td>
				</tr>
				<tr>
					<th><label for="userId">아이디</label></th>
					<td>
						<input type="text" id="userId" name="userId" class="validate[required,minSize[4],maxSize[20]] tb_ipty" maxlength="20" style="width:240px;" title="아이디"/>
					</td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td>
						<input type="text" id="email" name="email" class="validate[maxSize[50],custom[email]] tb_ipty" maxlength="50" style="width:240px;" title="이메일"/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div id="findPwResult_layer" style="display:none;">
		<table cellpadding="0" class="tb_base" summary="" style="">
			<caption><span>비밀번호찾기 결과</span></caption>
			<colgroup>
				<col style="width:13%"/>
				<col style="width:87%"/>
			</colgroup>
			<thead>
			</thead>
			<tbody class="write">
				<tr>
					<th><label for="">결과</label></th>
					<td><span id="result" style="color:blue;"></span></td>
				</tr>
				<tr>
					<th><label for="">개발확인용 URL</label></th>
					<td><span id="resetPwUrl" style="color:blue;"></span></td>
				</tr>
			</tbody>
		</table>
	</div>
		
	<div style="margin-top:20px; text-align:center;">
		<input type="button" value="확인" title="확인" class="btn_st0" onclick="findPw();" id="findPwForm_btn"/>
		<input type="button" value="재시도" title="재시도" class="btn_st0" onclick="findPwForm();" id="findPwResult_btn" style="display:none;"/>
	</div>
</div>
</form:form>

</body>
</html>