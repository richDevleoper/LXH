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
		url: '/user/corp/update.do'
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
		url : '/user/corp/updateUserPw.do' 
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
		url : '/user/corp/checkLoginInfo.do' 
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
<form:form commandName="corpUserVO" id="defaultForm" name="defaultForm" method="post" action="${action}">
${corpUserSearchVO.hiddenTag }
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
						${userSession.corpUserVO.userId }
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
			<tbody class="write">
				<tr>
					<th><label for="userId">아이디</label></th>
					<td>${userSession.corpUserVO.userId }</td>
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
					<td>${userSession.corpUserVO.userNm }</td>
				</tr>
				<tr>
					<th><label for="chrTel1">담당자 전화번호</label></th>
					<td>
						<input id="chrTel1" name="chrTel1" value="${paramVO.chrTel1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="전화번호 앞자리"/>
						-
						<input id="chrTel2" name="chrTel2" value="${paramVO.chrTel2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="전화번호 중간자리"/>
						-
						<input id="chrTel3" name="chrTel3" value="${paramVO.chrTel3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="전화번호 끝자리"/>
					</td>
				</tr>
				<tr>
					<th><label for="chrMob1">담당자 휴대폰번호</label></th>
					<td>
						<input id="chrMob1" name="chrMob1" value="${paramVO.chrMob1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="휴대폰번호 앞자리"/>
						-
						<input id="chrMob2" name="chrMob2" value="${paramVO.chrMob2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="휴대폰번호 중간자리"/>
						-
						<input id="chrMob3" name="chrMob3" value="${paramVO.chrMob3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="휴대폰번호 끝자리"/>
					</td>
				</tr>
				<tr>
					<th><label for="chrFax1">담당자 FAX</label></th>
					<td>
						<input id="chrFax1" name="chrFax1" value="${paramVO.chrFax1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="담당자 FAX 앞자리"/>
						-
						<input id="chrFax2" name="chrFax2" value="${paramVO.chrFax2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="담당자 FAX 중간자리"/>
						-
						<input id="chrFax3" name="chrFax3" value="${paramVO.chrFax3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="담당자 FAX 끝자리"/>
					</td>
				</tr>
				<tr>
					<th><label for="chrEmail">담당자 이메일</label></th>
					<td>
						<form:input path="chrEmail" cssClass="validate[maxSize[50],custom[email]] tb_ipty" maxlength="50" style="width:240px;" title="담당자 이메일"/>
					</td>
				</tr>
				<tr>
					<th><label for="chrZip">담당자 우편번호</label></th>
					<td>
						<form:input path="chrZip" cssClass="validate[maxSize[6],custom[integer]] tb_ipty" maxlength="6" style="width:80px;" title="담당자 우편번호"/>
					</td>
				</tr>		
				<tr>
					<th><label for="chrAddr1">담당자 주소</label></th>
					<td>
						<form:input path="chrAddr1" cssClass="validate[maxSize[100]] tb_ipty" maxlength="100" style="width:400px;" title="담당자 주소"/>
					</td>
				</tr>
				<tr>
					<th><label for="chrAddr2">담당자 상세주소</label></th>
					<td>
						<form:input path="chrAddr2" cssClass="validate[maxSize[100]] tb_ipty" maxlength="100" style="width:400px;" title="담당자 상세주소"/>
					</td>
				</tr>
				
				<tr>
					<th><label for="corpId1">사업자번호</label></th>
					<td>
						<input id="corpId1" name="corpId1" value="${paramVO.corpId1 }" class="validate[required,minSize[3],maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:40px;" title="사업자번호 앞자리"/>
						-
						<input id="corpId2" name="corpId2" value="${paramVO.corpId2 }" class="validate[required,minSize[2],maxSize[2],custom[integer]] tb_ipty" maxlength="2" style="width:30px;" title="사업자번호 중간자리"/>
						-
						<input id="corpId3" name="corpId3" value="${paramVO.corpId3 }" class="validate[required,minSize[5],maxSize[5],custom[integer]] tb_ipty" maxlength="5" style="width:60px;" title="사업자번호 끝자리"/>
					</td>
				</tr>
				<tr>
					<th><label for="corpNm">회사명</label></th>
					<td><form:input path="corpNm" cssClass="validate[required,maxSize[20]] tb_ipty" maxlength="20" cssStyle="width:192px;" title="회사명"/></td>
				</tr>
				<tr>
					<th><label for="corpTel1">대표 전화번호</label></th>
					<td>
						<input id="corpTel1" name="corpTel1" value="${paramVO.corpTel1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="대표 전화번호 앞자리"/>
						-
						<input id="corpTel2" name="corpTel2" value="${paramVO.corpTel2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="대표 전화번호 중간자리"/>
						-
						<input id="corpTel3" name="corpTel3" value="${paramVO.corpTel3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="대표 전화번호 끝자리"/>
					</td>
				</tr>
				<tr>
					<th><label for="corpMob1">대표 휴대폰번호</label></th>
					<td>
						<input id="corpMob1" name="corpMob1" value="${paramVO.corpMob1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="대표 휴대폰번호 앞자리"/>
						-
						<input id="corpMob2" name="corpMob2" value="${paramVO.corpMob2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="대표 휴대폰번호 중간자리"/>
						-
						<input id="corpMob3" name="corpMob3" value="${paramVO.corpMob3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="대표 휴대폰번호 끝자리"/>
					</td>
				</tr>
				<tr>
					<th><label for="corpFax1">대표 FAX</label></th>
					<td>
						<input id="corpFax1" name="corpFax1" value="${paramVO.corpFax1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="대표 FAX 앞자리"/>
						-
						<input id="corpFax2" name="corpFax2" value="${paramVO.corpFax2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="대표 FAX 중간자리"/>
						-
						<input id="corpFax3" name="corpFax3" value="${paramVO.corpFax3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="대표 FAX 끝자리"/>
					</td>
				</tr>
				<tr>
					<th><label for="corpEmail">대표 이메일</label></th>
					<td>
						<form:input path="corpEmail" cssClass="validate[maxSize[50],custom[email]] tb_ipty" maxlength="50" style="width:240px;" title="대표 이메일"/>
					</td>
				</tr>
				<tr>
					<th><label for="corpZip">대표 우편번호</label></th>
					<td>
						<form:input path="corpZip" cssClass="validate[maxSize[6],custom[integer]] tb_ipty" maxlength="6" style="width:80px;" title="대표 우편번호"/>
					</td>
				</tr>		
				<tr>
					<th><label for="corpAddr1">대표 주소</label></th>
					<td>
						<form:input path="corpAddr1" cssClass="validate[maxSize[100]] tb_ipty" maxlength="100" style="width:400px;" title="대표 주소"/>
					</td>
				</tr>
				<tr>
					<th><label for="corpAddr2">대표 상세주소</label></th>
					<td>
						<form:input path="corpAddr2" cssClass="validate[maxSize[100]] tb_ipty" maxlength="100" style="width:400px;" title="대표 상세주소"/>
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