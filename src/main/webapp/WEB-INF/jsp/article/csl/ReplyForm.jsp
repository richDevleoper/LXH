<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
<%@ taglib prefix="attachfile" uri="http://www.freedi.kr/attachfile-taglib"%>
    
<!doctype html>
<html lang="ko">
<head>
<title>답변글쓰기</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<link type="text/css" rel="stylesheet" href="<c:url value='/csl/attachfile/css/jquery.fileupload.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/csl/attachfile/css/jquery.fileupload-ui.css'/>" />
<script type="text/javascript" src="<c:url value='/csl/attachfile/js/jquery.fileupload-tmpl.js'/>"></script>
<script type="text/javascript" src="<c:url value='/csl/attachfile/js/jquery.iframe-transport.js'/>"></script>
<script type="text/javascript" src="<c:url value='/csl/attachfile/js/jquery.fileupload.js'/>"></script>
<script type="text/javascript" src="<c:url value='/csl/attachfile/js/jquery.fileupload-process.js'/>"></script>
<script type="text/javascript" src="<c:url value='/csl/attachfile/js/jquery.fileupload-validate.js'/>"></script>
<script type="text/javascript" src="<c:url value='/csl/attachfile/js/jquery.fileupload-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/csl/attachfile/js/jquery.fileupload-jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/csl/attachfile/js/attachfile-fileuploader.js'/>"></script>

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
		sSkinURI: "<c:url value='/editor/smart-editor-2.2.1/SmartEditor2Skin_csl_np.html'/>",	
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

<table class="tb_base" summary="">
	<caption><span>게시글</span></caption>
	<colgroup>
		<col style="width:15%"/>
		<col style="width:35%"/>
		<col style="width:15%"/>
		<col style="width:35%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col" colspan="4">게시글정보</th>
		</tr>
	</thead>
	<tbody class="write">
	
		<c:if test="${boardVO.catgrFlg eq 'Y'}">
			<tr>
				<th><label for="catgr">분류</label></th>
				<td colspan="3">
					<select id="catgr" name="catgr" class="validate[required] sel_type" title="분류">
						<option value="" >전체</option>	
						<c:forEach var="item" items="${catgrList }">
							<option value="${item.codeId}" <c:if test="${item.codeId eq parentVO.catgr }">selected="selected"</c:if>>${item.codeNm }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</c:if>
		<tr>
			<th><label for="writer">작성자</label></th>
			<td colspan="3">
				<form:input path="writer" cssClass="validate[required,maxSize[20]] tb_ipty" style="width:240px;" maxlength="20" title="작성자" disabled="true"/></td>
		</tr>
		<tr>
			<th><label for="title">제목</label></th>
			<td colspan="3">
				<input type="text" id="title" name="title" value="[답변]${parentVO.title }" class="validate[required,maxSize[255]] tb_ipty" maxlength="255" title="제목"/>
			</td>
		</tr>
		<tr>
			<th><label for="parentContent">원글내용</label></th>
			<td colspan="3" style="vertical-align:top;">
				<div><button class="jButton" onclick="return viewParentContent(this);" title="원글보기">원글보기</button></div>
				<div style="margin-top:10px;display:none;">${parentVO.content }</div>
			</td>
		</tr>		
		<tr>
			<th><label for="content">내용</label></th>
			<td colspan="3">
				<!-- 에디터 -->
				<div>
					<form:textarea path="content"  cssClass="validate[required] wirte_edit" cssStyle="width:99%; height:520px" title="내용"/>
				</div>
				<!-- //에디터 -->
			</td>
		</tr>
		<c:if test="${boardVO.attachFlg eq 'Y' }">
		<tr>
			<th><label for="title">첨부파일</label></th>
			<td colspan="3">
				<attachfile:fileuploader
					objectId="fileUploadObj_01"
					ctx="/csl"
					wrapperId="fileUploadWrap"
					fileId="article_${articleVO.articleKey}"
					fileGrp="article"
					autoUpload="false"
					maxFileSize="${boardVO.attachSiz*1000000}"
					maxNumberOfFiles="${boardVO.attachCnt}"/>
			</td>
		</tr>
		</c:if>
	</tbody>
</table>

<p class="btn_list">
	<button class="jSaveButton" onclick="return insert();" title="저장">저장</button>
	<button class="jListButton" onclick="return list();" title="목록">목록</button>
</p>

</form:form>

</body>
</html>