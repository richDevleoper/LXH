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
	$("input[name=periodFlg]").click(function() {
		if ($(this).val() == 'Y') {
			$(this).parent().parent().next().show();
		} else {
			$(this).parent().parent().next().hide();
			$(this).parent().parent().next().find('input').val('');
		}
	});
});

//파일삭제
function removeFile(){
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			url : '/csl/banner/deleteFile.do'
	        ,method : "post"
			,dataType : 'json'
			,data : {
				bannerKey:$('#bannerKey').val()
				}
			//,processData : false
			//,contentType : "application/json; charset=UTF-8"
			,beforeSend : function(){
				$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
			}
			,complete : function(){
				$.unblockUI();
			}
			,success : function(data, stat, xhr) {
				//console.log(data);
				$("#file").siblings().css('display', 'none');
			}
		    ,error : function(xhr, stat, err) {
		    	console.log(err);
		    }
		});
	}
	return false;
}

//저장
function insert(){
	$("#defaultForm").submit();
	return false;
}
//목록
function list(){
	$("#defaultForm").validationEngine('detach');
	$("#defaultForm").attr('enctype', '');
	$("#defaultForm").attr('method', 'post');
	$("#defaultForm").attr('action', 'list.do');
	$("#defaultForm").submit();
}
//-->
</script>
</head>
<body>

<form:form commandName="bannerVO" id="defaultForm" name="defaultForm" method="post" action="${action}" enctype="multipart/form-data">
<form:hidden path="bannerKey"/>
${bannerSearchVO.hiddenTag }

<table cellpadding="0" class="tb_base" summary="">
	<caption><span>배너</span></caption>
	<colgroup>
		<col style="width:15%"/>
		<col style="width:85%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col" colspan="2">배너정보</th>
		</tr>
	</thead>
	<tbody class="write">
	
		<tr>
			<th><label for="locateTyp">분류</label></th>
			<td>
				<form:select path="locateTyp" cssClass="validate[required] sel_type" title="분류">
					<form:option value="">분류선택</form:option>
					<form:option value="MAIN_VISUAL" label="메인비주얼배너" />
					<form:option value="MAIN_BOTTOM" label="메인하단배너" />
					<form:option value="SUB_VISUAL" label="서브비주얼배너" />
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
			<th><label for="file">파일</label></th>
			<td>
				<input type="file" id="file" name="file" title="파일"/>
				<c:if test="${not empty bannerVO.fileMsk }">
					<img src="<c:url value='/upload/banner/${bannerVO.fileMsk }'/>" alt="${bannerVO.title }" width="110px" height="30px" />
					<button class="jButton" onclick="return removeFile();" title="파일삭제" style="vertical-align:middle;">파일삭제</button>
				</c:if>
			</td>
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
		<tr <c:if test="${bannerVO.periodFlg eq 'N' }">style="display:none"</c:if>>
			<th><label for="sdate">게시기간</label></th>
			<td>
				<input type="text" id="startDt" name="startDt" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${bannerVO.startDt}" />" class="validate[required] tb_ipty" style="width:110px;" readonly="readonly" maxlength="8" title="게시기간 시작일" />
				~
				<input type="text" id="endDt" name="endDt" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${bannerVO.endDt}" />" class="validate[required,funcCall[checkPeriod]] tb_ipty" style="width:110px" readonly="readonly" maxlength="8" title="게시가간 종료일" />
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