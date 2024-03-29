<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
<%@ taglib prefix="attachfile" uri="http://www.freedi.kr/attachfile-taglib"%>
<%
	pageContext.setAttribute("CR", "\r");
	pageContext.setAttribute("LF", "\n");
%>
<!doctype html>
<html lang="ko">
<head>
<title>추가/수정</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<link type="text/css" rel="stylesheet" href="<c:url value='/def/attachfile/css/jquery.fileupload.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/def/attachfile/css/jquery.fileupload-ui.css'/>" />
<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-tmpl.js'/>"></script>
<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.iframe-transport.js'/>"></script>
<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload.js'/>"></script>
<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-process.js'/>"></script>
<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-validate.js'/>"></script>
<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/def/attachfile/js/attachfile-fileuploader.js'/>"></script>

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
			//
		},
		onValidationComplete: function(form, status){
			if(status == true) {
				if(confirm("저장하시겠습니까?")) {
					//contentsEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
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
		sSkinURI: "<c:url value='/editor/smart-editor-2.2.1/SmartEditor2Skin_def.html'/>",	
		htParams : {bUseToolbar : true,
			fOnBeforeUnload : function(){
			}
		},
		fOnAppLoad : function(){
		},
		fCreator: "createSEditor2"
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
	$("#defaultForm input[type='text']").attr('disabled', true);
	$("#defaultForm").attr('method', 'post');
	$("#defaultForm").attr('action', 'list.do');
	$("#defaultForm").submit();
}
//원글보기
function viewParentContent(ele){
	$(ele).parent().next().toggle();
	return false;
}

function pasteEditor(type, fileNm, url){
	var html = '';
	if(type == 'image'){
		html = '<img src="' + url + '" style="width:100%;" />';		
	}else if(type == 'file'){
		html = '<a href="' + url + '" target="downloadFrame">[다운로드]' + fileNm + '</a>';
	}else{
		console.log('type=' + type + ', url=' + url);
	}
	contentsEditors.getById["content"].exec("PASTE_HTML", [html]);
}
//-->
</script>
</head>
<body>

<form:form commandName="articleVO" id="defaultForm" name="defaultForm" method="post" action="${action}">
${articleSearchVO.hiddenTag }

<form:hidden path="articleKey" />
<form:hidden path="pkey" />

<%-- 
<!-- 게시글 쓰기 -->
<div>
	<fieldset>
		<legend class="hidden">글쓰기</legend>
		<table class="board_write">
			<caption><span>글쓰기</span></caption>
			<colgroup>
			<col style="width:20%;"/>
			<col style="width:80%;"/>
			</colgroup>
			<tbody class="skin1">
				<c:if test="${boardVO.catgrFlg eq 'Y'}">
					<tr>
						<th>카테고리</th>
						<td>
							<select id="catgr" name="catgr" class="validate[required] sel_type va_m">
								<option value="" >전체</option>	
								<c:forEach var="item" items="${catgrList }">
									<option value="${item.codeId}" <c:if test="${item.codeId eq articleVO.catgr }">selected="selected"</c:if>>${item.codeNm }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>작성자</th>
					<td>
						<form:input path="writer" cssClass="validate[required,maxSize[20]] ip_type va_m" cssStyle="width:50%;" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<form:password path="writerPwd" cssClass="validate[required,minSize[4],maxSize[20]] ip_type va_m" cssStyle="width:50%;" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" id="title" name="title" value="[답변]${parentVO.title }" class="validate[required,maxSize[255]] ip_type va_m" style="width:97%;" maxlength="255"/>
					</td>
				</tr>
				<tr>
					<th>원글내용</th>
					<td colspan="3" style="vertical-align:top;">
						<div><a href="#none" onclick="return viewParentContent(this);" class="bd_btn_st1" style="color:#fff;">원글보기</a></div>
						<div style="margin-top:10px;display:none;">
							${fn:replace(parentVO.content, LF, '<br />')}
						</div>
					</td>
				</tr>
				
				<c:if test="${boardVO.attachFlg eq 'Y' }">
				<tr>
					<th><label for="title">첨부파일</label></th>
					<td colspan="3">
						<attachfile:fileuploader
							objectId="fileUploadObj_01"
							ctx=""
							wrapperId="fileUploadWrap"
							fileId="article_${articleVO.articleKey}"
							fileGrp="article"
							autoUpload="false"
							maxFileSize="${boardVO.attachSiz*1000000}"
							maxNumberOfFiles="${boardVO.attachCnt}"/>
					</td>
				</tr>
				</c:if>
				
				<tr>
					<td colspan="2" class="write_box">
						<div>
							<form:textarea path="content"  cssClass="validate[required]" cssStyle="width:100%; height:320px"/>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</fieldset>
--%>


<!-- 게시판 폼 영역 -->
<fieldset>
	<legend class="hidden">게시글2 수정</legend>
	<table class="article_form" summary="현재 누르신 글의 제목,작성자,작성일,조회수, 첨부, 내용에 대한 테이블 정보입니다.">
		<caption><span>글의 제목을 출력해주세요</span></caption>
		<colgroup>
		<col width="15%" />
		<col width="75%" />
		</colgroup>
		<tbody class="skin2">
			<c:if test="${boardVO.catgrFlg eq 'Y'}">
				<tr>
					<th>카테고리</th>
					<td>
						<select id="catgr" name="catgr" class="validate[required] sel_type va_m" title="카테고리">
							<option value="" >전체</option>	
							<c:forEach var="item" items="${catgrList }">
								<option value="${item.codeId}" <c:if test="${item.codeId eq articleVO.catgr }">selected="selected"</c:if>>${item.codeNm }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</c:if>
			<%-- 
			<c:if test="${boardVO.secretFlg eq 'Y'}">
				<tr>
					<th>비밀글 여부</th>
					<td>
						<form:radiobutton path="secretFlg" id="secretFlg_y" value="Y" cssClass="validate[required] va_m" /> <label for="secretFlg_y" class="va_m">Yes</label>
						&nbsp;
						<form:radiobutton path="secretFlg" id="secretFlg_n" value="N" cssClass="validate[required] va_m" /> <label for="secretFlg_n" class="va_m">No</label>
					</td>
				</tr>
			</c:if>
			--%>
			<tr>
				<th scope="row">작성자</th>
				<td>
					<form:input path="writer" title="작성자" cssClass="validate[required,maxSize[20]] ip_type va_m" cssStyle="width:20%;" maxlength="20"/>
				</td>
			</tr>
			<c:if test="${userSession.guestUser}">
				<tr>
					<th scope="row">비밀번호</th>
					<td>
						<form:password path="writerPwd" title="비밀번호" cssClass="validate[required,maxSize[20]] ip_type va_m" cssStyle="width:20%;" maxlength="20" />
					</td>
				</tr>
			</c:if>
			<tr>
				<th scope="row">제목</th>
				<td>
					<form:input path="title" title="제목" cssClass="validate[required,maxSize[255]] ip_type va_m" cssStyle="width:97%;" maxlength="255"/>
				</td>
			</tr>
			<tr>
				<th>원글내용</th>
				<td colspan="3" style="vertical-align:top;">
					<div><a href="#none" onclick="return viewParentContent(this);" class="at_btn_st2">원글보기</a></div>
					<div style="margin-top:10px;display:none;">
						${fn:replace(parentVO.content, LF, '<br />')}
					</div>
				</td>
			</tr>
			<%-- 
			<tr>
				<th scope="row">게시기간</th>
				<td><label for="event_sdate1" class="hidden">조회기간</label> <input type="text" id="event_sdate1" name="event_sdate1" class="ip_type va_m" size="10"/> <input type="button" title="날짜선택" class="bd_calender va_m" /> ~ <input type="text" id="event_edate1" name="event_edate1" class="ip_type va_m" size="10"/> <input type="button" title="날짜선택" class="bd_calender va_m" /></td>
			</tr>
			--%>
			<c:if test="${boardVO.attachFlg eq 'Y' }">
				<tr>
					<th scope="row">첨부</th>
					<td colspan="3">
						<attachfile:fileuploader
							objectId="fileUploadObj_01"
							ctx=""
							wrapperId="fileUploadWrap"
							fileId="article_${articleVO.articleKey}"
							fileGrp="article"
							autoUpload="false"
							maxFileSize="${boardVO.attachSiz*1000000}"
							maxNumberOfFiles="${boardVO.attachCnt}"/>
					</td>
				</tr>
			</c:if>
			<tr>
				<td scope="row" colspan="2" class="write_box">
					<div>
						<form:textarea path="content" title="내용" cssClass="validate[required]" cssStyle="width:100%; height:520px"/>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</fieldset>
<!-- //게시판 폼 영역 -->
	
<div class="article_bottom">
	<!-- 버튼 -->
	<p class="ta_r">
	<a href="#none" onclick="return insert();" class="at_btn_st2">확인</a>
	<a href="#none" onclick="return list();" class="at_btn_st2">취소</a>
	</p>
	<!-- //버튼 -->
</div>
<!-- //게시글 쓰기 -->

</form:form>

</body>
</html>