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
<title>비밀번호 재설정</title>
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
			'checkUserPw' : function(){
				if($('#userPw').val() != $('#userPwRe').val()){
					return '* 비밀번호와 비밀번호 확인 정보가 일치하지 않습니다';
				}
			}
		},
		onValidationComplete: function(form, status){
			if(status == true) {
				return true;
			}
		}
	});
	
	$('#defaultForm').ajaxForm({
		url: '/user/genr/resetPw.do'
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
			if(data != null && data.isAvail == 'true'){
				$('#result').text('비밀번호가 변경되었습니다');
				
				$('[id^=resetPwForm_]').hide();
				$('[id^=resetPwResult_]').show();
				if(data.isAvail == 'true'){
					$('#resetPwResult_btn').hide();
				}
			}
	    }
	});
});

function resetPw(){
	$('#defaultForm').submit();
}
function resetPwForm(){
	$('[id^=resetPwResult_]').hide();
	$('[id^=resetPwForm_]').show();
	$('#resetPwForm_layer input').val('');
}
//-->
</script>

</head>
<body>

<form:form commandName="genrUserVO" id="defaultForm" name="defaultForm" method="post" action="resetPw.do">
<input type="hidden" id="u" name="u" value="${param.u }" />
<input type="hidden" id="c" name="c" value="${param.c }" />

<c:choose>
	<c:when test="${valid eq 'true' }">
		<div style="height:400px;">
			<div id="resetPwForm_layer">
				<table cellpadding="0" class="tb_base" summary="">
					<caption><span>비밀번호 재설정</span></caption>
					<colgroup>
						<col style="width:13%"/>
						<col style="width:87%"/>
					</colgroup>
					<thead>
					</thead>
					<tbody class="write">
						<tr>
							<th><label for="userPw">비밀번호</label></th>
							<td>
								<input type="password" id="userPw" name="userPw" class="validate[required,minSize[6],maxSize[20]] tb_ipty" maxlength="20" style="width:192px;" title="비밀번호"/>
							</td>
						</tr>
						<tr>
							<th><label for="userPw">비밀번호 확인</label></th>
							<td>
								<input type="password" id="userPwRe" name="userPwRe" class="validate[required,minSize[6],maxSize[20],funcCall[checkUserPw]] tb_ipty" maxlength="20" style="width:192px;" title="비밀번호 확인"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		
			<div id="resetPwResult_layer" style="display:none;">
				<table cellpadding="0" class="tb_base" summary="" style="">
					<caption><span>비밀번호 재설정 결과</span></caption>
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
					</tbody>
				</table>
			</div>
				
			<div style="margin-top:20px; text-align:center;">
				<input type="button" value="확인" title="확인" class="btn_st0" onclick="resetPw();" id="resetPwForm_btn"/>
				<input type="button" value="재시도" title="재시도" class="btn_st0" onclick="resetPwForm();" id="resetPwResult_btn" style="display:none;"/>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div style="text-align:center;height:400px;">
			유효하지않은 접근입니다
		</div>
	</c:otherwise>
</c:choose>
</form:form>

</body>
</html>