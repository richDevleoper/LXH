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
<title>정보수정</title>
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
				if(confirm("저장하시겠습니까?")) {
					return true;									
				} 
				return false;
			}
		}
	});
	
	$('#defaultForm').ajaxForm({
		url: '/user/genr/update.do'
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
					alert('회원정보가 수정되었습니다');
				}
			}
	    }
	});
});

//저장
function update(){
	$("#defaultForm").submit();
}

//비밀번호변경폼
function updateUserPwForm(){
	$('#updateUserPwBtn').hide();
	$('#updateUserPwForm').show();
}
//비밀번호변경
function updateUserPw(){
	var $userPw = $('#userPw');
	var $userPwRe = $('#userPwRe');
	var userPw = $('#userPw').val().replace(/\\s/, '');
	var userPwRe = $('#userPwRe').val().replace(/\\s/, '');
	
	if(userPw.length < 6){
		alert('* 비밀번호를 최소 6자리 이상 입력하세요');
		$($userPw).focus();
		return;
	}
	if(userPwRe.length < 6){
		alert('* 비밀번호확인을 최소 6자리 이상 입력하세요');
		$($userPwRe).focus();
		return;
	}
	
	if(userPw != userPwRe){
		alert('* 비밀번호와 비밀번호확인 정보가 일치하지 않습니다');
		$($userPw).focus();
		return;
	}
	
	$.ajax({
		url : '/user/genr/updateUserPw.do' 
        ,method : "post"
		,dataType : 'json'
		,async: true
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,complete : function(){
			$.unblockUI();
		}
		,data : {
			userId:$("#userId").val()
			,userPw:$("#userPw").val()
		}
		,success : function(result, stat, xhr) {
			if(result.isAvail == 'true'){
				alert('비밀번호가 변경되었습니다');
				$('#updateUserPwBtn').show();
				$('#updateUserPwForm').hide();				
			}
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

//정보확인
function checkInfo(){
	var $checkUserPw = $('#checkUserPw');
	var checkUserPw = $('#checkUserPw').val().replace(/\\s/, '');
	
	if(checkUserPw.length < 6){
		alert('* 비밀번호를 최소 6자리 이상 입력하세요');
		$($checkUserPw).focus();
		return;
	}
	
	$.ajax({
		url : '/user/genr/checkLoginInfo.do' 
        ,method : "post"
		,dataType : 'json'
		,async: true
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,complete : function(){
			$.unblockUI();
		}
		,data : {
			userId:$("#userId").val()
			,userPw:$("#checkUserPw").val()
		}
		,success : function(result, stat, xhr) {
			if(result.isAvail == 'true'){
				$('#checkInfo').hide();
				$('#viewInfo').show();
			}else{
				alert('* 비밀번호가 일치하지 않습니다');
			}
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}
//-->
</script>
</head>

<body>
<form:form commandName="genrUserVO" id="defaultForm" name="defaultForm" method="post" action="update.do">
${genrUserSearchVO.hiddenTag }
<form:hidden path="userId" />
<form:hidden path="userNm" />

<div id="checkInfo">
	<div>
		<table cellpadding="0" class="tb_base" summary="">
			<caption><span>정보확인</span></caption>
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
						<input type="password" id="checkUserPw" name="checkUserPw" class="tb_ipty" maxlength="20" style="width:192px;" title="비밀번호"/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="margin-top:20px; text-align:center;">
		<input type="button" value="확인" title="확인" class="btn_st0" onclick="checkInfo();" id="checkInfo_btn"/>
	</div>
</div>
<div id="viewInfo" style="display:none;">
	<div>
		<table cellpadding="0" class="tb_base" summary="">
			<caption><span>정보수정</span></caption>
			<colgroup>
				<col style="width:15%"/>
				<col style="width:85%"/>
			</colgroup>
			<thead>
			</thead>
			<tbody class="write">
				<tr>
					<th><label for="userId">아이디</label></th>
					<td>${userSession.genrUserVO.userId }</td>
				</tr>
				<tr>
					<th><label for="userPw">비밀번호</label></th>
					<td>
						<div id="updateUserPwBtn">
							<input type="button" value="비밀번호변경" title="비밀번호변경" class="btn_st0" onclick="updateUserPwForm();" id="updateUserPwForm_btn"/>
						</div>
						<div id="updateUserPwForm" style="display:none;">
							<table cellpadding="0" class="tb_base" summary="" style="">
								<caption><span>비밀번호 재설정 결과</span></caption>
								<colgroup>
									<col style="width:13%"/>
									<col style="width:87%"/>
								</colgroup>
								<tbody class="write">
									<tr>
										<th><label for="userPw">비밀번호</label></th>
										<td>
											<input type="password" id="userPw" name="userPw" class="tb_ipty" maxlength="20" style="width:192px;" title="비밀번호"/>
										</td>
									</tr>
									<tr>
										<th><label for="userPw">비밀번호 확인</label></th>
										<td>
											<input type="password" id="userPwRe" name="userPwRe" class="tb_ipty" maxlength="20" style="width:192px;" title="비밀번호 확인"/>
											<input type="button" value="비밀번호변경" title="비밀번호변경" class="btn_st0" style="vertical-align:middle;" onclick="updateUserPw();" id="updateUserPw_btn"/>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<th><label for="userNm">이름</label></th>
					<td>${userSession.genrUserVO.userNm }</td>
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
	</div>
	
	<div style="margin-top:20px; text-align:center;">
		<input type="button" value="저장" title="저장" class="btn_st0" onclick="update();" id="update_btn"/>
	</div>
</div>

</form:form>
</body>
</html>