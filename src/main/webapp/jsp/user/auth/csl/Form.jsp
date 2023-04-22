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
<title>추가/수정</title>
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
});

//저장
function insert(){
	$("#defaultForm").submit();
	return false;
}
//목록
function list(){
	$("#defaultForm").validationEngine('detach');
	$("#defaultForm").attr('method', 'post');
	$("#defaultForm").attr('action', 'list.do');
	$("#defaultForm").submit();
}
//-->
</script>
</head>

<body>
<form:form commandName="userAuthVO" id="defaultForm" name="defaultForm" method="post" action="${action}">
${userAuthSearchVO.hiddenTag }

<table cellpadding="0" class="tb_base" summary="">
	<caption><span>링크</span></caption>
	<colgroup>
		<col style="width:15%"/>
		<col style="width:85%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col" colspan="2">권한정보</th>
		</tr>
	</thead>
	<tbody class="write">
	
		<tr>
			<th><label for="userGrp">사용그룹</label></th>
			<td>
				<c:choose>
					<c:when test="${not empty userAuthVO.userGrp}">
						<form:hidden path="userGrp" />
						<c:choose>
							<c:when test="${userAuthVO.userGrp eq 'MNGR_USER'}">MNGR_USER(관리자)</c:when>
							<c:when test="${userAuthVO.userGrp eq 'GENR_USER'}">GENR_USER(개인회원)</c:when>
							<c:when test="${userAuthVO.userGrp eq 'CORP_USER'}">CORP_USER(기업회원)</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<form:select path="userGrp" cssClass="validate[required] sel_type" title="사용그룹">
							<form:option value="">분류선택</form:option>
							<form:option value="MNGR_USER" label="MNGR_USER(관리자)" />
							<form:option value="GENR_USER" label="GENR_USER(개인회원)" />
							<form:option value="CORP_USER" label="CORP_USER(기업회원)" />
						</form:select>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th><label for="authId">권한ID</label></th>
			<td>
				<c:choose>
					<c:when test="${not empty userAuthVO.authId}">
						<form:hidden path="authId" />
						${userAuthVO.authId}
					</c:when>
					<c:otherwise>
						<input type="text" id="authId" name="authId" value="${userAuthVO.authId}" class="validate[required,maxSize[20]] tb_ipty" maxlength="20" style="width:200px;" <c:if test="${not empty userAuthVO.authId }">readonly=""readonly"</c:if> title="권한ID"/>
						ex) ROLE_MNGR_TEST						
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th><label for="authNm">권한명</label></th>
			<td><form:input path="authNm" cssClass="validate[required,maxSize[50]] tb_ipty" maxlength="50" style="width:200px;" title="권한명"/></td>
		</tr>
		<tr>
			<th><label for="orderNo">정렬순서</label></th>
			<td><form:input path="orderNo" cssClass="validate[required,custom[integer],maxSize[4]] tb_ipty" maxlength="4" style="width:58px;" title="정렬순서"/></td>
		</tr>		
		<tr>
			<th>활성여부</th>
			<td class="jLockRadio">
				<form:radiobutton path="actFlg" id="act_y" value="Y" cssClass="validate[required] va_m" title="활성여부" /> <label for="act_y" class="va_m">활성</label> 
				<form:radiobutton path="actFlg" id="act_n" value="N" cssClass="validate[required] va_m" title="활성여부" /> <label for="act_n" class="va_m">비활성</label>
			</td>
		</tr>
	</tbody>
</table>

<p class="btn_list">
	<button class="jSaveButton" onclick="return insert();" title="저장">저장</button>
	<button class="jListButton" onclick="list();" title="목록">목록</button>
</p>

</form:form>
</body>
</html>