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
		url: '/user/genr/findId.do'
	    ,type:'post'
	    ,dataType:'json'
	    ,async:true
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
					$('#result').text(data.userId);
				}else{
					$('#result').text(data.msg);					
				}
				
				$('[id^=findIdForm_]').hide();
				$('[id^=findIdResult_]').show();
				if(data.isAvail == 'true'){
					$('#findIdResult_btn').hide();
				}
			}
	    }
	});
});

function findId(){
	$('#defaultForm').submit();
}
function findIdForm(){
	$('[id^=findIdResult_]').hide();
	$('[id^=findIdForm_]').show();
	$('#findIdForm_layer input').val('');
}
//-->
</script>

</head>
<body>

<form:form commandName="genrUserVO" id="defaultForm" name="defaultForm" method="post" action="findId.do">
<div style="height:400px;">
	<div id="findIdForm_layer">
		<table cellpadding="0" class="tb_base" summary="">
			<caption><span>아이디찾기</span></caption>
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
						<input type="text" id="userNm" name="userNm" class="validate[required,maxSize[20]] tb_ipty" maxlength="20" style="width:192px;" title="이름" />
					</td>
				</tr>
				<tr>
					<th><label for="mob1">휴대폰번호</label></th>
					<td>
						<input id="mob1" name="mob1" value="${paramVO.mob1 }" class="validate[required, maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="휴대폰번호 앞자리"/>
						-
						<input id="mob2" name="mob2" value="${paramVO.mob2 }" class="validate[required, maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="휴대폰번호 중간자리"/>
						-
						<input id="mob3" name="mob3" value="${paramVO.mob3 }" class="validate[required, maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="휴대폰번호 끝자리"/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div id="findIdResult_layer" style="display:none;">
		<table cellpadding="0" class="tb_base" summary="" style="">
			<caption><span>아이디찾기 결과</span></caption>
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
		<input type="button" value="확인" title="확인" class="btn_st0" onclick="findId();" id="findIdForm_btn"/>
		<input type="button" value="재시도" title="재시도" class="btn_st0" onclick="findIdForm();" id="findIdResult_btn" style="display:none;"/>
	</div>
</div>
</form:form>

</body>
</html>