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

<script type="text/javascript" src="<c:url value='/editor/smart-editor-2.2.1/js/HuskyEZCreator.js'/>"></script>
<script type="text/javascript">
<!--
var contentsEditors = [];
$(function() {
	
	$("#defaultForm").validationEngine({
		unbindEngine:false,
		validationEventTrigger: "submit",
		promptPosition : "topLeft",
		showOneMessage : true,
		onValidationComplete : function(form, status) {

			if (status == true) {
				if (confirm("저장하시겠습니까?")) {
					contentsEditors.getById["headHtml"].exec("UPDATE_CONTENTS_FIELD", []);
					contentsEditors.getById["footHtml"].exec("UPDATE_CONTENTS_FIELD", []);
					return true;
				}
				return false;
			}
		}
	});
	
	//smart editor
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: contentsEditors,
		elPlaceHolder: "headHtml",
		sSkinURI: "<c:url value='/editor/smart-editor-2.2.1/SmartEditor2Skin_csl.html'/>",	
		htParams : {bUseToolbar : true,
			fOnBeforeUnload : function(){
			}
		},
		fOnAppLoad : function(){
		},
		fCreator: "createSEditor2"
	});
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: contentsEditors,
		elPlaceHolder: "footHtml",
		sSkinURI: "<c:url value='/editor/smart-editor-2.2.1/SmartEditor2Skin_csl.html'/>",	
		htParams : {bUseToolbar : true,
			fOnBeforeUnload : function(){
			}
		},
		fOnAppLoad : function(){
		},
		fCreator: "createSEditor2"
	});
	
	$("input[name=replyFlg]").click(function() {
		if($(this).val() == 'N') {
			$(this).parent().find('div>span').text('정렬기준:등록일시 내림차순');
		}else {
			$(this).parent().find('div>span').text('정렬기준:답변형 모듈기준');
		}
	});
	
	$("input[name=attachFlg]").click(function() {
		if($(this).val() == 'N') {
			$(this).parent().parent().next().hide();
		}else {
			$(this).parent().parent().next().show();
		}
	});
	
	$("input[name=catgrFlg]").click(function(){
		if($(this).val() == 'Y'){
			$(this).parent().next().children().removeAttr('disabled');
		}else{
			$(this).parent().next().children().attr('disabled', 'disabled');
		}
	});
	
	$(".authCheck").each(function() {
		if($(this).is(":checked")) {
			$(this).nextAll("input[type=checkbox]").attr("disabled", true);
		} else {
			$(this).nextAll("input[type=checkbox]").attr("disabled", false);
		}
		$(".jButtonSet").buttonset('refresh');	
	});
	
	$(".authCheck").click(function() {
		if($(this).is(":checked")) {
			$(this).nextAll("input[type=checkbox]").attr("disabled", true);
		}else{
			$(this).nextAll("input[type=checkbox]").attr("disabled", false);
		}
		$(".jButtonSet").buttonset('refresh');
	});
	
	<c:if test="${empty mngAuthIdList}">
		$("input[name=mngAuthIdList]").eq(0).prop('checked', true);
		$(".jButtonSet").buttonset('refresh');
	</c:if>
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
//카테고리선택
function selectCatgrGrpId(){
	$( "#create-user" ).button().on( "click", function() {
		dialog.dialog( "open" );
	});
}
//-->
</script>
</head>
<body>
<form:form commandName="boardVO" name="defaultForm" id="defaultForm" method="post" action="${action }">
<form:hidden path="boardKey" />
${boardSearchVO.hiddenTag }

<input type="hidden" id="editorUploadPath" name="editorUploadPath" value="file.content.path" />
<input type="hidden" id="editorUploadSize" name="editorUploadSize" value="file.content.size" />
<input type="hidden" id="editorUploadSubDir" name="editorUploadSubDir" value="" />

<table cellpadding="0" class="tb_base" summary="게시판를 관리하는 테이블입니다.">
<caption><span>게시판설정</span></caption>
<colgroup>
	<col style="width:15%"/>
	<col style="width:35%"/>
	<col style="width:15%"/>
	<col style="width:35%"/>	
</colgroup>
<thead>
	<tr>
		<th scope="col" colspan="4">게시판설정정보</th>
	</tr>
</thead>
<tbody class="write">
	<tr>
		<th><label for="boardNm">게시판명</label></th>
		<td colspan="3"><form:input path="boardNm" cssClass="validate[required,maxSize[255]] tb_ipty" maxlength="255" title="게시판명"/></td>
	</tr>
	
	<tr>
		<th><label for="boardTyp">게시판형태</label></th>
		<td colspan="3" class="jRadioButtonSet">
			<form:radiobutton path="boardTyp" id="boardTyp_basic" value="basic" cssClass="validate[required] va_m" /> <label for="boardTyp_basic" class="va_m">기본</label>
			<form:radiobutton path="boardTyp" id="boardTyp_photo" value="photo" cssClass="validate[required] va_m" /> <label for="boardTyp_photo" class="va_m">포토</label>
		</td>
	</tr>
	
	<tr>
		<th><label for="catgrFlg">카테고리사용</label></th>
		<td colspan="3" style="text-align:left;">
			<div class="jRadioButtonSet" style="float:left;width:160px;">
				<form:radiobutton path="catgrFlg" id="catgrFlg_y" value="Y" cssClass="validate[required] va_m" /> <label for="catgrFlg_y" class="va_m">사용</label>
				<form:radiobutton path="catgrFlg" id="catgrFlg_n" value="N" cssClass="validate[required] va_m" /> <label for="catgrFlg_n" class="va_m">사용안함</label>
			</div>
			<div>
				<select id="catgrId" name="catgrId" class="validate[required] sel_type" style="width:369px;" title="카테고리" <c:if test="${boardVO.catgrFlg eq 'N' }">disabled="disabled"</c:if>>
					<option value="">카테고리선택</option>
					<c:forEach var="item" items="${codeGrpList }">
						<option value="${item.codeGrpId }" <c:if test="${boardVO.catgrId eq item.codeGrpId }">selected="selected"</c:if>>${item.codeGrpNm }(${item.codeGrpId })</option>
					</c:forEach>
				</select>
			</div>
		</td>
	</tr>
	
	<tr>
		<th><label for="actFlg">활성여부</label></th>
		<td class="jRadioButtonSet">
			<form:radiobutton path="actFlg" id="actFlg_y" value="Y" cssClass="validate[required] va_m" /> <label for="actFlg_y" class="va_m">사용</label>
			<form:radiobutton path="actFlg" id="actFlg_n" value="N" cssClass="validate[required] va_m" /> <label for="actFlg_n" class="va_m">사용안함</label>
		</td>
		<th><label for="noticeFlg">공지기능</label></th>
		<td class="jRadioButtonSet">
			<form:radiobutton path="noticeFlg" id="noticeFlg_y" value="Y" cssClass="validate[required] va_m" /> <label for="noticeFlg_y" class="va_m">사용</label> 
			<form:radiobutton path="noticeFlg" id="noticeFlg_n" value="N" cssClass="validate[required] va_m" /> <label for="noticeFlg_n" class="va_m">사용안함</label>		
		</td>			
	</tr>
	
	<tr>
		<th><label for="replyFlg">답변기능</label></th>
		<td class="jRadioButtonSet">
			<form:radiobutton path="replyFlg" id="replyFlg_y" value="Y" cssClass="validate[required] va_m" /> <label for="replyFlg_y" class="va_m" >사용</label>
			<form:radiobutton path="replyFlg" id="replyFlg_n" value="N" cssClass="validate[required] va_m" /> <label for="replyFlg_n" class="va_m" >사용안함</label>
			<div style="margin:5px 0 0 5px;">
				<span class="clr_warning" style="padding-left:5px;">
					<c:choose>
						<c:when test="${boardVO.replyFlg eq 'Y' }">정렬기준:답변형 모듈기준</c:when>
						<c:otherwise>정렬기준:등록일시 내림차순</c:otherwise>
					</c:choose>
				</span>
			</div>
		</td>
		<th><label for="commentFlg">댓글기능</label></th>
		<td class="jRadioButtonSet">
			<form:radiobutton path="commentFlg" id="commentFlg_y" value="Y" cssClass="validate[required] va_m" /> <label for="commentFlg_y" class="va_m">사용</label> 
			<form:radiobutton path="commentFlg" id="commentFlg_n" value="N" cssClass="validate[required] va_m" /> <label for="commentFlg_n" class="va_m">사용안함</label>		
		</td>			
	</tr>
	
	<tr>
		<th><label for="secretFlg">비밀글기능</label></th>
		<td class="jRadioButtonSet">
			<form:radiobutton path="secretFlg" id="secretFlg_y" value="Y" cssClass="validate[required] va_m" /> <label for="secretFlg_y" class="va_m">사용</label>
			<form:radiobutton path="secretFlg" id="secretFlg_n" value="N" cssClass="validate[required] va_m" /> <label for="secretFlg_n" class="va_m">사용안함</label>
		</td>
		<th><label for="viewPrdFlg">기간설정기능</label></th>
		<td class="jRadioButtonSet">
			<form:radiobutton path="viewPrdFlg" id="viewPrdFlg_y" value="Y" cssClass="validate[required] va_m" /> <label for="viewPrdFlg_y" class="va_m">사용</label> 
			<form:radiobutton path="viewPrdFlg" id="viewPrdFlg_n" value="N" cssClass="validate[required] va_m" /> <label for="viewPrdFlg_n" class="va_m">사용안함</label>		
		</td>			
	</tr>
	
	<tr>
		<th><label for="wysiwygFlg">에디터사용</label></th>
		<td class="jRadioButtonSet">
			<form:radiobutton path="wysiwygFlg" id="wysiwygFlg_y" value="Y" cssClass="validate[required] va_m" /> <label for="wysiwygFlg_y" class="va_m">사용</label>
			<form:radiobutton path="wysiwygFlg" id="wysiwygFlg_n" value="N" cssClass="validate[required] va_m" /> <label for="wysiwygFlg_n" class="va_m">사용안함</label>
		</td>
		<th><label for="searchFlg">검색색인</label></th>
		<td class="jRadioButtonSet">
			<form:radiobutton path="searchFlg" id="searchFlg_y" value="Y" cssClass="validate[required] va_m" /> <label for="searchFlg_y" class="va_m">사용</label> 
			<form:radiobutton path="searchFlg" id="searchFlg_n" value="N" cssClass="validate[required] va_m" /> <label for="searchFlg_n" class="va_m">사용안함</label>		
		</td>			
	</tr>
	
	<tr>
		<th><label for="rssFlg">RSS FEED</label></th>
		<td class="jRadioButtonSet">
			<form:radiobutton path="rssFlg" id="rssFlg_y" value="Y" cssClass="validate[required] va_m" /> <label for="rssFlg_y" class="va_m">사용</label>
			<form:radiobutton path="rssFlg" id="rssFlg_n" value="N" cssClass="validate[required] va_m" /> <label for="rssFlg_n" class="va_m">사용안함</label>
		</td>
		<th><label for="newPrd">새글기간</label></th>
		<td class="jRadioButtonSet">
			<form:input path="newPrd" cssClass="validate[required,custom[integer],maxSize[3], min[1]] tb_ipty" cssStyle="width:60px" maxlength="3" title="새글기간"/> 일		
		</td>			
	</tr>
	
	<tr>
		<th><label for="attachFlg">첨부파일</label></th>
		<td colspan="3" class="jRadioButtonSet">
			<form:radiobutton path="attachFlg" id="attachFlg_y" value="Y" cssClass="validate[required] va_m" /> <label for="attachFlg_y" class="va_m">사용</label>
			<form:radiobutton path="attachFlg" id="attachFlg_n" value="N" cssClass="validate[required] va_m" /> <label for="attachFlg_n" class="va_m">사용안함</label>
		</td>
	</tr>
	
	<tr <c:if test="${boardVO.attachFlg eq 'N' }">style="display:none"</c:if>>
		<th><label for="attachCnt">파일첨부 허용 수</label></th>
		<td>
			<form:input path="attachCnt" cssClass="validate[custom[integer],maxSize[3]] tb_ipty" cssStyle="width:60px" maxlength="3" title="파일첨부 허용 수"/> 개
		</td>
		<th><label for="attachSiz">파일첨부 허용 크기</label></th>
		<td>
			<form:input path="attachSiz" cssClass="validate[custom[integer],maxSize[3]] tb_ipty" cssStyle="width:60px" maxlength="3" title="파일첨부 허용 크기"/> MB
		</td>
	</tr>
	
	<tr>
		<th><label for="pageRows">페이지당 게시물수</label></th>
		<td>
			<form:input path="pageRows" cssClass="validate[custom[integer],maxSize[3],min[1],max[100]] tb_ipty" cssStyle="ime-mode:active; width:60px" maxlength="3" title="페이지당 게시물 수"/> 개
			(1개 이상, 최대 100개)
		</td>
		<th><label for="pageCols">페이지수</label></th>
		<td>
			<form:input path="pageCols" cssClass="validate[custom[integer],maxSize[3],min[5],max[50]] tb_ipty" cssStyle="ime-mode:active; width:60px" maxlength="3" title="페이지 수"/> 개
			(5개이상, 50개 이하)
		</td>
	</tr>
	
	<!-- 권한 -->
	<tr>
		<th><label for="mngAuthIdList">관리 권한</label></th>
		<td class="jButtonSet" colspan="3">
			<c:forEach items="${userAuthList }" var="item">
				<input type="checkbox" value="${item.authId }" name="mngAuthIdList" id="mngAuthId_${item.authId }" <c:if test="${fn:indexOf(mngAuthIdList, item.authId) != -1}">checked="checked"</c:if> class="validate[required]"/><label for="mngAuthId_${item.authId}">${item.authNm}</label>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<th><label for="viewAuthIdList">조회 권한</label></th>
		<td class="jButtonSet" colspan="3">
			<input type="checkbox" class="authCheck" id="viewAuthCheck" <c:if test="${empty viewAuthIdList }">checked="checked"</c:if>/><label for="viewAuthCheck">무제한</label>
			<c:forEach items="${userAuthList }" var="item">
				<input type="checkbox" value="${item.authId }" name="viewAuthIdList" id="viewAuthId_${item.authId }" <c:if test="${fn:indexOf(viewAuthIdList, item.authId) != -1}">checked="checked"</c:if> /><label for="viewAuthId_${item.authId}">${item.authNm}</label>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<th><label for="writeAuthIdList">등록 권한</label></th>
		<td class="jButtonSet" colspan="3">
			<input type="checkbox" class="authCheck" id="writeAuthCheck" <c:if test="${empty writeAuthIdList }">checked="checked"</c:if>/><label for="writeAuthCheck">무제한</label>
			<c:forEach items="${userAuthList }" var="item">
				<input type="checkbox" value="${item.authId }" name="writeAuthIdList" id="writeAuthId_${item.authId }" <c:if test="${fn:indexOf(writeAuthIdList, item.authId) != -1}">checked="checked"</c:if> /><label for="writeAuthId_${item.authId}">${item.authNm}</label>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<th><label for="replyAuthIdList">답변 권한</label></th>
		<td class="jButtonSet" colspan="3">
			<input type="checkbox" class="authCheck" id="replyAuthCheck" <c:if test="${empty replyAuthIdList }">checked="checked"</c:if>/><label for="replyAuthCheck">무제한</label>
			<c:forEach items="${userAuthList }" var="item">
				<input type="checkbox" value="${item.authId }" name="replyAuthIdList" id="replyAuthId_${item.authId }" <c:if test="${fn:indexOf(replyAuthIdList, item.authId) != -1}">checked="checked"</c:if> /><label for="replyAuthId_${item.authId}">${item.authNm}</label>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<th><label for="commentAuthIdList">댓글 권한</label></th>
		<td class="jButtonSet" colspan="3">
			<input type="checkbox" class="authCheck" id="commentAuthCheck" <c:if test="${empty commentAuthIdList }">checked="checked"</c:if>/><label for="commentAuthCheck">무제한</label>
			<c:forEach items="${userAuthList }" var="item">
				<input type="checkbox" value="${item.authId }" name="commentAuthIdList" id="commentAuthId_${item.authId }" <c:if test="${fn:indexOf(commentAuthIdList, item.authId) != -1}">checked="checked"</c:if> /><label for="commentAuthId_${item.authId}">${item.authNm}</label>
			</c:forEach>
		</td>
	</tr>
	<!-- //권한 -->
	
	<tr>
		<th><label for="headHtml">게시판상단 HTML</label></th>
		<td colspan="3"><form:textarea path="headHtml"  cssClass="wirte_edit" cssStyle="width:99%; height:100px"/></td>
	</tr>
	<tr>
		<th><label for="footHtml">게시판하단 HTML</label></th>
		<td colspan="3"><form:textarea path="footHtml"  cssClass="wirte_edit" cssStyle="width:99%; height:100px"/></td>
	</tr>	
	
	
	
	<%--
	<tr>
		<th><label for="viewAuthFlag">조회 권한</label></th>
		<td class="jButtonSet" colspan="3">
			<input type="checkbox" class="authCheck" id="viewAuthCheck" <c:if test="${empty viewAuthList }">checked="checked"</c:if>/><label for="viewAuthCheck">무제한</label>
			<c:forEach items="${userAuthList }" var="item">
				<input type="checkbox" value="${item.authCode }" name="viewAuthCode" id="viewAuthCode_${item.authCode }" <c:if test="${fn:indexOf(viewAuthList, item.authCode) != -1}">checked="checked"</c:if>/><label for="viewAuthCode_${item.authCode}">${item.authName}</label>
			</c:forEach>
		</td>		
	</tr>
	<tr>
		<th><label for="writeAuthFlag">등록 권한</label></th>
		<td class="jButtonSet" colspan="3">
			<input type="checkbox" class="authCheck" id="writeAuthCheck" <c:if test="${empty wrtieAuthList }">checked="checked"</c:if>/><label for="writeAuthCheck">무제한</label>
			<c:forEach items="${userAuthList }" var="item">
				<input type="checkbox" value="${item.authCode }" name="writeAuthCode" id="writeAuthCode_${item.authCode }" <c:if test="${fn:indexOf(wrtieAuthList, item.authCode) != -1}">checked="checked"</c:if>/><label for="writeAuthCode_${item.authCode}">${item.authName}</label>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<th><label for="replyAuthFlag">답글 권한</label></th>
		<td class="jButtonSet" colspan="3">
			<input type="checkbox" class="authCheck" id="replyAuthCheck" <c:if test="${empty replyAuthList }">checked="checked"</c:if>/><label for="replyAuthCheck">무제한</label>
			<c:forEach items="${userAuthList }" var="item">
				<input type="checkbox" value="${item.authCode }" name="replyAuthCode" id="replyAuthCode_${item.authCode }" <c:if test="${fn:indexOf(replyAuthList, item.authCode) != -1}">checked="checked"</c:if>/><label for="replyAuthCode_${item.authCode}">${item.authName}</label>
			</c:forEach>
		</td>		
	</tr>
	<tr>
		<th><label for="commentAuthFlag">댓글 권한</label></th>
		<td colspan="3" class="jButtonSet">
			<input type="checkbox" class="authCheck" id="commentAuthCheck" <c:if test="${empty commentAuthList }">checked="checked"</c:if>/><label for="commentAuthCheck">무제한</label>
			<c:forEach items="${userAuthList }" var="item">
				<input type="checkbox" value="${item.authCode }" name="commentAuthCode" id="commentAuthCode_${item.authCode }" <c:if test="${fn:indexOf(commentAuthList, item.authCode) != -1}">checked="checked"</c:if>/><label for="commentAuthCode_${item.authCode}">${item.authName}</label>
			</c:forEach>
		</td>
	</tr>
	--%>
						
</tbody>
</table>

<p class="btn_list">
	<button class="jSaveButton" onclick="return insert();" title="저장">저장</button>
	<button class="jListButton" onclick="list();" title="목록">목록</button>
</p>

</form:form>

</body>
</html>