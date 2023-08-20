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
<link type="text/css" rel="stylesheet" href="<c:url value='/csl/jquery/time-picker-addon-1.6.3/jquery-ui-timepicker-addon.css' />" />
<script type="text/javascript" src="<c:url value='/csl/jquery/time-picker-addon-1.6.3/jquery-ui-timepicker-addon.js'/>"></script>
<script type="text/javascript" src="<c:url value='/csl/jquery/time-picker-addon-1.6.3/i18n/jquery-ui-timepicker-ko.js'/>"></script>

<script type="text/javascript" src="<c:url value='/editor/smart-editor-2.2.1/js/HuskyEZCreator.js'/>"></script>

<script type="text/javascript">
<!--
var contentsEditors = [];

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
					contentsEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
					return true;									
				} 
				return false;
			}
		}
	});

	//smart editor
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: contentsEditors,
		elPlaceHolder: "content",
		sSkinURI: "<c:url value='/editor/smart-editor-2.2.1/SmartEditor2Skin_csl.html'/>",	
		htParams : {bUseToolbar : true,
			fOnBeforeUnload : function(){
			}
		},
		fOnAppLoad : function(){
		},
		fCreator: "createSEditor2"
	});
	
	//달력
	/*
	$('#startDt, #endDt').datepicker({
		showOn: "both",
		dateFormat: "yy-mm-dd",
		changeYear: true,
		changeMonth: true,
		buttonImage: "/csl/img/common/icon_calendar.png",
		buttonImageOnly: true,
		showButtonPanel: true,
		closeText: "닫기",
		autoSize: true,
		onClose: function(){}
	});
	*/
	
	$('#startDt, #endDt').datetimepicker({
		showOn: "both",
		dateFormat: "yy-mm-dd",
		timeInput: true,
		timeFormat: "HH:mm",
		changeYear: true,
		changeMonth: true,
		buttonImage: "/csl/img/common/icon_calendar.png",
		buttonImageOnly: true,
		showButtonPanel: true,
		closeText: "닫기"
	});
	
	//기간제한여부 버튼 제어
	$("input[name=periodFlg]").bind('click', function() {
		if ($(this).val() == 'Y') {
			$(this).parent().parent().next().show();
		} else {
			$(this).parent().parent().next().hide();
			$(this).parent().parent().next().find('input').val('');
		}
	});
	
	//창 자동조절 버튼 제어
	$("input[name=sizeAutoFlg]").bind('click', function() {
		if ($(this).val() == 'N') {
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

<form:form commandName="popupVO" id="defaultForm" name="defaultForm" method="post" action="${action}">
<form:hidden path="popupKey"/>
${popupSearchVO.hiddenTag }

<input type="hidden" id="editorUploadPath" name="editorUploadPath" value="file.popup.path" />
<input type="hidden" id="editorUploadSize" name="editorUploadSize" value="file.popup.size" />
<input type="hidden" id="editorUploadSubDir" name="editorUploadSubDir" value="" />

<table cellpadding="0" class="tb_base" summary="">
	<caption><span>팝업</span></caption>
	<colgroup>
		<col style="width:15%"/>
		<col style="width:85%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col" colspan="2">팝업정보</th>
		</tr>
	</thead>
	<tbody class="write">
	
		<tr>
			<th><label for="locateTyp">분류</label></th>
			<td>
				<form:select path="locateTyp" cssClass="validate[required] sel_type" title="분류">
					<form:option value="">분류선택</form:option>
					<form:option value="DEF_POPUP_01" label="메인팝업" />
					<form:option value="DEF_POPUP_02" label="서브팝업" />
				</form:select>
			</td>
		</tr>
		<tr>
			<th><label for="title">제목</label></th>
			<td><form:input path="title" cssClass="validate[required,maxSize[255]] tb_ipty" maxlength="255" title="제목"/></td>
		</tr>
		<tr>
			<th>기간제한</th>
			<td class="jLockRadio">
				<form:radiobutton path="periodFlg" id="period_y" value="Y" cssClass="validate[required] va_m datePicker" /> <label for="period_y" class="va_m">있음</label> 
				<form:radiobutton path="periodFlg" id="period_n" value="N" cssClass="validate[required] va_m datePicker" /> <label for="period_n" class="va_m">없음</label>
			</td>
		</tr>
		<tr <c:if test="${popupVO.periodFlg eq 'N' }">style="display:none"</c:if>>
			<th><label for="sdate">게시기간</label></th>
			<td>
				<input type="text" id="startDt" name="startDt" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${popupVO.startDt}" />" class="validate[required] tb_ipty" style="width:110px;" readonly="readonly" maxlength="8" title="게시기간 시작일" />
				~
				<input type="text" id="endDt" name="endDt" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${popupVO.endDt}" />" class="validate[required,funcCall[checkPeriod]] tb_ipty" style="width:110px" readonly="readonly" maxlength="8" title="게시기간 종료일" />
			</td>
		</tr>
		<tr>
			<th>창 자동조절</th>
			<td class="jLockRadio">
				<form:radiobutton path="sizeAutoFlg" id="sizeAutoFlg_y" value="Y" cssClass="validate[required] va_m datePicker" disabled="true" /> <label for="sizeAutoFlg_y" class="va_m">사용</label> 
				<form:radiobutton path="sizeAutoFlg" id="sizeAutoFlg_n" value="N" cssClass="validate[required] va_m datePicker" /> <label for="sizeAutoFlg_n" class="va_m">사용안함</label>
			</td>
		</tr>
		<tr <c:if test="${popupVO.sizeAutoFlg eq 'Y' }">style="display:none"</c:if>>
			<th><label for="sizeWdh">창크기(가로x세로)</label></th>
			<td>
				<form:input path="sizeWdh" cssClass="validate[required,maxSize[4],custom[integer]] tb_ipty" style="width:50px;" maxlength="4" title="창크기(가로)"/>
				x
				<form:input path="sizeHgt" cssClass="validate[required,maxSize[4],custom[integer]] tb_ipty" style="width:50px;" maxlength="4" title="창크기(세로)"/>
			</td>
		</tr>
		<tr>
			<th>활성여부</th>
			<td class="jLockRadio">
				<form:radiobutton path="actFlg" id="act_y" value="Y" cssClass="validate[required] va_m" /> <label for="act_y" class="va_m">활성</label> 
				<form:radiobutton path="actFlg" id="act_n" value="N" cssClass="validate[required] va_m" /> <label for="act_n" class="va_m">비활성</label>
			</td>
		</tr>
		<tr>
			<th><label for="content">내용</label></th>
			<td>
				<!-- 에디터 -->
				<div>
					<form:textarea path="content"  cssClass="wirte_edit" cssStyle="width:99%; height:400px"/>
				</div>
				<!-- //에디터 -->
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