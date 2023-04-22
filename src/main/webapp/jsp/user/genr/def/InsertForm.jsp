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
<title>회원가입</title>
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
			'cfCheckUserId' : function(){
				var regexp = /^[0-9a-zA-z]*$/;
				if(!regexp.test($("#userId").val())){
					return "* 영문과 숫자만 사용하세요";
				}
				if(!checkUserId()){
					return "* 사용할 수 없는 아이디입니다";
				}
			}
		},
		onValidationComplete: function(form, status){
			if(status == true) {
				var currentStep = parseInt($('#currentStep').val());
				
				if(currentStep == 1){
					$('[id^=prgrs_]').removeClass('on');
					$('#prgrs_'+(currentStep+1)).addClass('on');
					
					$('[id^=step_]').hide();
					$('#step_'+(currentStep+1)).show();
					
					$('#currentStep').val((currentStep+1));
					console.log($('#currentStep').val());
					
					return false;
					
				}else if(currentStep == 2){
					return true;									
				}
				return false;
			}
		}
	});
	
	$('#defaultForm').ajaxForm({
		url: '/user/genr/insert.do'
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
			if(data.isAvail == 'true'){
				var currentStep = parseInt($('#currentStep').val());
				
				$('[id^=prgrs_]').removeClass('on');
				$('#prgrs_'+(currentStep+1)).addClass('on');
				
				$('[id^=step_]').hide();
				$('#step_'+(currentStep+1)).show();
				
				$('#sUserNm').text(data.userNm);
				
				$('#currentStep').val((currentStep+1));
				console.log($('#currentStep').val());
			}else{
				console.log(xhr);
			}
	    }
	});
});

function checkUserId(){
	var _result = false;
	$.ajax({
		url : '/csl/user/genr/checkUserId.do'
        ,method : "post"
		,dataType : 'json'
		,async:false
		,data : { userId:$('#userId').val() }
		,success : function(data, stat, xhr) {
			if(data.isAvail == 'true'){
				_result = true;
			}else{
				_result = false;
			}
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
	return _result;
}

//저장
function insert(){
	$("#defaultForm").submit();
	return false;
}

//
function submit_step_1(){
	$("#defaultForm").submit();
}
function submit_step_2(){
	$("#defaultForm").submit();
}
function submit_step_3(){
	$("#defaultForm").submit();
}

function back_step_1(){
	$('[id^=prgrs_]').removeClass('on');
	$('#prgrs_1').addClass('on');
	
	$('[id^=step_]').hide();
	$('#step_1').show();
	
	$('#currentStep').val(1);
	console.log($('#currentStep').val());
}
//-->
</script>
</head>

<body>
<form:form commandName="genrUserVO" id="defaultForm" name="defaultForm" method="post" action="insert.do">
<input type="hidden" id="currentStep" name="currentStep" value="1" />
<div class="cont_tab_wrap">
	<ul class="cont_tab">
		<li id="prgrs_1" class="first on"><a href="#none">개인정보동의</a></li>
		<li id="prgrs_2"><a href="#none">정보입력</a></li>
		<li id="prgrs_3"><a href="#none">가입완료</a></li>
	</ul>
</div>

<div id="step_1">
	<div>
		<ol class="list_st0 mt10"  style="height:100px; overflow-y:scroll; border:1px solid #dadada; padding:2%;">
			<li>
				<ol class="list_st1">
					<li></li>
				</ol>
			</li>
		</ol>
		<p style="margin-top:5px;text-align:right;">
			<input class="va_m validate[required]" id="prvtApprvFlg" name="prvtApprvFlg" value="Y" type="checkbox" title="개인정보의 수집 및 이용"/>
			<label for="prvtApprvFlg" class="ml5">개인정보의 수집 및 이용에 대한 <span class="pc_o">동의</span> (필수)</label>
		</p>
	</div>
	<div style="margin-top:20px; text-align:center;">
		<input type="button" value="다음" title="다음" class="btn_st0" onclick="submit_step_1();"/>
	</div>
</div>

<div id="step_2" style="display:none;">
	<table cellpadding="0" class="tb_base" summary="">
		<caption><span>회원가입</span></caption>
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
					<c:choose>
						<c:when test="${not empty genrUserVO.userId}">
							<form:input path="userId" cssClass="validate[required,minSize[4],maxSize[20]] tb_ipty" maxlength="20" cssStyle="width:192px;" readonly="true" title="아이디"/>
						</c:when>
						<c:otherwise>
							<form:input path="userId" cssClass="validate[required,minSize[4],maxSize[20],funcCall[cfCheckUserId]] tb_ipty" maxlength="20" cssStyle="width:192px;" title="아이디"/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th><label for="userPw">비밀번호</label></th>
				<td>
					<c:choose>
						<c:when test="${not empty genrUserVO.userId}">
							<form:password path="userPw" cssClass="validate[minSize[6],maxSize[20]] tb_ipty" maxlength="20" cssStyle="width:192px;" title="비밀번호"/>
						</c:when>
						<c:otherwise>
							<form:password path="userPw" cssClass="validate[required,minSize[6],maxSize[20]] tb_ipty" maxlength="20" cssStyle="width:192px;" title="비밀번호"/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th><label for="userNm">이름</label></th>
				<td><form:input path="userNm" cssClass="validate[required,maxSize[20]] tb_ipty" maxlength="20" cssStyle="width:192px;" title="이름"/></td>
			</tr>
			<tr>
				<th><label for="tel1">전화번호</label></th>
				<td>
					<input id="tel1" name="tel1" value="${paramVO.tel1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="전화번호 앞자리"/>
					-
					<input id="tel2" name="tel2" value="${paramVO.tel2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="전화번호 중간자리"/>
					-
					<input id="tel3" name="tel3" value="${paramVO.tel3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="전화번호 끝자리"/>
				</td>
			</tr>
			<tr>
				<th><label for="mob1">휴대폰번호</label></th>
				<td>
					<input id="mob1" name="mob1" value="${paramVO.mob1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="휴대폰번호 앞자리"/>
					-
					<input id="mob2" name="mob2" value="${paramVO.mob2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="휴대폰번호 중간자리"/>
					-
					<input id="mob3" name="mob3" value="${paramVO.mob3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="휴대폰번호 끝자리"/>
				</td>
			</tr>
			<tr>
				<th><label for="email">이메일</label></th>
				<td>
					<form:input path="email" cssClass="validate[maxSize[50],custom[email]] tb_ipty" maxlength="50" style="width:240px;" title="이메일"/>
				</td>
			</tr>
			<tr>
				<th><label for="zip">우편번호</label></th>
				<td>
					<form:input path="zip" cssClass="validate[maxSize[6],custom[integer]] tb_ipty" maxlength="6" style="width:80px;" title="우편번호"/>
				</td>
			</tr>		
			<tr>
				<th><label for="addr1">주소</label></th>
				<td>
					<form:input path="addr1" cssClass="validate[maxSize[100]] tb_ipty" maxlength="100" style="width:400px;" title="주소"/>
				</td>
			</tr>
			<tr>
				<th><label for="addr2">상세주소</label></th>
				<td>
					<form:input path="addr2" cssClass="validate[maxSize[100]] tb_ipty" maxlength="100" style="width:400px;" title="상세주소"/>
				</td>
			</tr>
			
		</tbody>
	</table>
	
	<div style="margin-top:20px; text-align:center;">
		<input type="button" value="이전" title="이전" class="btn_st0" onclick="back_step_1();"/>
		<input type="button" value="다음" title="다음" class="btn_st0" onclick="submit_step_2();"/>
	</div>
</div>

<div id="step_3" style="display:none;">
	<div style="margin-top:20px;text-align:center;">
		<span id="sUserNm" style="color:blue;"></span>님 가입이 완료되었습니다
	</div>
	<div style="margin-top:20px; text-align:center;">
		<input type="button" value="메인" title="메인" class="btn_st0" onclick="location.href='/index.do'"/>
		<input type="button" value="로그인" title="로그인" class="btn_st0" onclick="location.href='/sub.do?menuKey=75'"/>
	</div>
</div>

</form:form>
</body>
</html>