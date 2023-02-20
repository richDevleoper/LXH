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

<%--
<link type="text/css" rel="stylesheet" media="screen" href="<c:out value='/csl/jquery/date-range-picker-1.8.7/ui.daterangepicker.css' />" />
<script type="text/javascript" src="<c:out value='/csl/jquery/date-range-picker-1.8.7/date.js' />"></script>
<script type="text/javascript" src="<c:out value='/csl/jquery/date-range-picker-1.8.7/daterangepicker.jQuery.js' />"></script>
--%>

<script type="text/javascript">
<!--
$(function() {
	$("#defaultForm").validationEngine('attach', {
		unbindEngine:false,
		validationEventTrigger: "submit",
		promptPosition : "topLeft",
		showOneMessage : true,
		customFunctions: {
			'checkPeriod':function() {
				var startDt = $('#startDt').val().replace(/\D/gi, '');
				var endDt = $('#endDt').val().replace(/\D/gi, '');
				if(startDt > endDt){
					return "* 시작일과 종료일을 확인하세요.";
				}
			 }
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

	
	//달력
	$('#startDt, #endDt').datepicker({
		showOn: "both",
		dateFormat: "yy-mm-dd",
		changeYear: true,
		changeMonth: true,
		buttonImage: "/csl/img/common/icon_calendar.png",
		buttonImageOnly: true,
		showButtonPanel: true,
		closeText: "닫기",
		onClose: function(){/**/}
	});	
	
	//기간제한여부 버튼 제어
	$("input[name=periodFlg]").click(function() {
		if ($(this).val() == 'Y') {
			$(this).parent().parent().next().show();
		} else {
			$(this).parent().parent().next().hide();
			$(this).parent().parent().next().find('input').val('');
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

<form:form commandName="linkVO" id="defaultForm" name="defaultForm" method="post" action="${action}">
<form:hidden path="linkKey"/>
${linkSearchVO.hiddenTag }

<table cellpadding="0" class="tb_base" summary="">
	<caption><span>링크</span></caption>
	<colgroup>
		<col style="width:15%"/>
		<col style="width:85%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col" colspan="2">링크정보</th>
		</tr>
	</thead>
	<tbody class="write">
	
		<tr>
			<th><label for="locateTyp">분류</label></th>
			<td>
				<form:select path="locateTyp" cssClass="validate[required] sel_type" title="분류">
					<form:option value="">분류선택</form:option>
					<form:option value="DEF_LINK_01" label="관련사이트" />
					<form:option value="DEF_LINK_02" label="참고사이트" />
				</form:select>
			</td>
		</tr>
		<tr>
			<th><label for="title">제목</label></th>
			<td><form:input path="title" cssClass="validate[required,maxSize[255]] tb_ipty" maxlength="255" title="제목"/></td>
		</tr>
		<tr>
			<th><label for="url">URL</label></th>
			<td><form:input path="url" cssClass="validate[required,maxSize[255]] tb_ipty" maxlength="255" title="URL"/></td>
		</tr>
		<tr>
			<th>타겟</th>
			<td class="jTargetRadio">
				<form:radiobutton path="targetTyp" id="target_blank" value="NEW" cssClass="validate[required] va_m" /> <label for="target_blank" class="va_m">새창</label> 
				<form:radiobutton path="targetTyp" id="target_self" value="SELF" cssClass="validate[required] va_m" /> <label for="target_self" class="va_m">현재창</label>
			</td>
		</tr>
		<tr>
			<th>기간제한</th>
			<td class="jLockRadio">
				<form:radiobutton path="periodFlg" id="period_y" value="Y" cssClass="validate[required] va_m datePicker" /> <label for="period_y" class="va_m">있음</label> 
				<form:radiobutton path="periodFlg" id="period_n" value="N" cssClass="validate[required] va_m datePicker" /> <label for="period_n" class="va_m">없음</label>
			</td>
		</tr>
		<tr <c:if test="${linkVO.periodFlg eq 'N' }">style="display:none"</c:if>>
			<th><label for="sdate">게시기간</label></th>
			<td>
				<input type="text" id="startDt" name="startDt" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${linkVO.startDt}" />" class="validate[required] tb_ipty" style="width:100px;" readonly="readonly" maxlength="8" title="게시기간 시작일" />
				~
				<input type="text" id="endDt" name="endDt" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${linkVO.endDt}" />" class="validate[required,funcCall[checkPeriod]] tb_ipty" style="width:100px" readonly="readonly" maxlength="8" title="게시기간 종료일" />
			</td>
		</tr>		
		<tr>
			<th>활성여부</th>
			<td class="jLockRadio">
				<form:radiobutton path="actFlg" id="act_y" value="Y" cssClass="validate[required] va_m" /> <label for="act_y" class="va_m">활성</label> 
				<form:radiobutton path="actFlg" id="act_n" value="N" cssClass="validate[required] va_m" /> <label for="act_n" class="va_m">비활성</label>
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