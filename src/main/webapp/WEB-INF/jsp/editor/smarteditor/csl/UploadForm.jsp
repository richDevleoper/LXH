<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>에디터 업로드</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<script type="text/javascript">
<!--
$(function() {
	$("#uploadForm").ajaxForm({
		dataType : "json"
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,complete : function(){
			$.unblockUI();
		}
		,success : function(data) {
			console.log(data);
			if (data.rsltCd == "0000") {

				//이미지 비율에 맞춰 리사이즈
				var limitSize = 100; //가로 최대사이즈 100%
				var imgx, imgy;
				if (data.imageWidth > limitSize) {
					imgx = limitSize;
					imgy = (data.imageHeight * limitSize) / data.imageWidth;

					$("#preview").width(imgx);
					$("#preview").height(imgy);
				}
				$("#preview").attr("src", data.relativePath + "/" + data.serverFileName);

				uploadFile = new Object();

				uploadFile.fileName = data.fileName;
				uploadFile.serverFileName = data.serverFileName;
				uploadFile.relativePath = data.relativePath;
				uploadFile.fileType = data.fileType;
				uploadFile.fileExt = data.fileExt;
				uploadFile.fileSize = data.fileSize;
				uploadFile.imageWidth = data.imageWidth;
				uploadFile.imageHeight = data.imageHeight;

			} else {
				uploadFile = null;
			}
		}
	});
	
	$("input[name='smartUploadFile']").bind("change", function() {
		fileUpload();
	});
});

var uploadFile;

function fileUpload() {
	
	$("#uploadForm").attr("action", "/csl/editor/smarteditor/upload.do");

	var pathProp = $("#editorUploadPath", opener.parent.document).val();
	if (pathProp) {
		$("#pathProp").val(pathProp);
	}
	
	var sizeProp = $("#editorUploadSize", opener.parent.document).val();
	if (sizeProp) {
		$("#sizeProp").val(sizeProp);
	}
	
	var subDirProp = $("#editorUploadSubDir", opener.parent.document).val();
	if (subDirProp) {
		$("#subDirProp").val(subDirProp);
	}

	if (!/.*\.(gif)|(jpeg)|(jpg)|(png)$/.test($("input[name='smartUploadFile']").val().toLowerCase())) {
		alert("이미지만 업로드 하실 수 있습니다.");
		return false;
	}

	$("#uploadForm").submit();
}

function apply() {
	if (uploadFile == null) {
		alert("파일을 첨부하세요.");
		return false;
	} else {
		var aFileInfo = [ {
			sFileName : uploadFile.fileName,
			sFileURL : uploadFile.relativePath + "/" + uploadFile.serverFileName,
			sFileAlt : $("#altValue").val(),
			sFileWidth : uploadFile.imageWidth,
			sFileHeight : uploadFile.imageHeight,
			bNewLine : true
		} ];
		
		console.log(aFileInfo);
		setPhotoToEditor(aFileInfo);
		return false;
	}
}

function setPhotoToEditor(oFileInfo) {
	if (!!opener && !!opener.nhn && !!opener.nhn.husky && !!opener.nhn.husky.PopUpManager) {
		opener.nhn.husky.PopUpManager.setCallback(window, 'SET_PHOTO', [ oFileInfo ]);
	} else {
		alert("업로드된 파일을 첨부 할 에디터가 없습니다.");
	}

	self.close();
}
//-->
</script>
</head>
<body>

<form id="uploadForm" name="uploadForm" action="/csl/editor/smarteditor/upload.do" method="post" enctype="multipart/form-data">
<input type="hidden" id="inputName" name="inputName" value="smartUploadFile" /> 
<input type="hidden" id="pathProp" name="pathProp" value="" />
<input type="hidden" id="sizeProp" name="sizeProp" value="" />
<input type="hidden" id="subDir" name="subDir" value="" />

<div style="margin:10px;">
<table width="100%" class="tb_base">
	<colgroup>
		<col style="width:25%" />
		<col style="width:75%" />
	</colgroup>
	<!-- 
	<thead>
		<tr>
			<th colspan="2">미리보기</th>
		</tr>
	</thead>
	-->
	<tbody>
		<tr>
			<th>미리보기</th>
			<td style="text-align:left;">
				<img id="preview" src="/csl/img/content/img_noimg.gif" style="border:1px solid green; width:320px;height:200px;" alt="미리보는 첨부이미지" />
			</td>
		</tr>
		<tr>
			<th>이미지설명</th>
			<td style="text-align: left;"><input type="text" id="altValue" name="altValue" class="tb_ipty" /></td>
		</tr>
		<tr>
			<th>파일선택</th>
			<td style="text-align: left;"><input type="file" id="smartUploadFile" name="smartUploadFile" style="width: 280px;" /></td>
		</tr>
	</tbody>
</table>

<p class="btn_list" style="text-align: center;">
	<button class="jSaveButton" onclick="return apply();" title="적용">적용</button>
	<button class="jCancelButton" onclick="self.close(); return false;" title="취소">취소</button>
</p>
</div>

</form>

</body>
</html>