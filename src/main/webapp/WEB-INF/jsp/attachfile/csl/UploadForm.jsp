<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">

	<div id="fileupload" style="padding:0;border:0px solid blue;">
		<!-- 
		<input type="hidden" id="fileId" name="fileId" value="article_1" />
		<input type="hidden" id="fileGrp" name="fileGrp" value="article" />
		-->
	    <div class="fileupload-buttonbar">
	        <div class="fileupload-buttons">
	            <span class="fileinput-button">
	                <span>파일선택</span>
	                <input type="file" name="files[]" multiple>
	            </span>
	            <button id="startAll" type="submit" class="start">전체첨부</button>
	            <!--  <button type="reset" class="cancel">취소</button> -->
	            <button type="button" class="delete">전체삭제</button>
	            <!-- <input type="checkbox" class="toggle"> -->
	            <!-- The global file processing state -->
	            <span class="fileupload-process"></span>
	        </div>
	        <!-- The global progress state -->
	        <!-- 
	        <div class="fileupload-progress fade" style="display:none">
	            <div class="progress" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
	            <div class="progress-extended">&nbsp;</div>
	        </div>
	        -->
	    </div>
	    <!-- The table listing the files available for upload/download -->
	    <div>
		    <table role="presentation" style="width:100%;">
		    	<colgroup><col style="width:59%;" /><col style="width:11%;" /><col style="width:10%;" /><col style="width:20%;" /></colgroup>
		    	<tbody class="files"></tbody>
		    </table>
    	</div>
	</div>
	<!-- The template to display files available for upload -->
	<script id="template-upload" type="text/x-tmpl">
		{% for (var i=0, file; file=o.files[i]; i++) { %}
			<tr class="template-upload fade">
				<!--
				<td>
					<span class="preview"></span>
				</td>
				-->
				<td style="text-align:left;">
					<p class="name">{%=file.name%}</p>
					<strong class="error" style="color:#ce5252;"></strong>
				</td>
				<td>
					<div class="progress" style="height:20px;border:0;"></div>
				</td>
				<td style="text-align:right;">
					<p class="size">Processing...</p>
				</td>
				<td style="text-align:center;">
					{% if (!i && !o.options.autoUpload) { %}
						<button class="start" disabled>첨부</button>
					{% }else { %}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					{% } %}
					{% if (!i) { %}
						<button class="cancel">삭제</button>
					{% } %}
				</td>
			</tr>
		{% } %}
	</script>
	<!-- The template to display files available for download -->
	<script id="template-download" type="text/x-tmpl">
		{% for (var i=0, file; file=o.files[i]; i++) { %}
			<tr class="template-download fade">
				<!--
				<td>
					<span class="preview">
						{% if (file.image) { %}
							<a href="#ctx#/attachfile/previewImage.do?fileId={%= file.fileId %}&fileSeq={%=file.fileSeq%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img style="width:30px;" src="#ctx#/attachfile/previewImage.do?fileId={%= file.fileId %}&fileSeq={%=file.fileSeq%}"></a>
						{% } %}
					</span>
				</td>
				-->
				<td style="text-align:left;">
					<p class="name">
						<a style="color:blue;" href="#ctx#/attachfile/downloadFile.do?fileId={%= file.fileId %}&fileSeq={%=file.fileSeq%}">{%=file.fileNm%}</a>
					</p>
					{% if (file.error) { %}
						<div><span class="error" style="color:#ce5252;">Error</span> {%=file.error%}</div>
					{% } %}
				</td>
				<td>
					<div class="progress" style="height:20px;text-align:center;">
						{% if(file.image){ %}
							<button style="color:green;" class="ui-button ui-corner-all ui-widget" onclick="pasteEditor('image', '', '#ctx#/attachfile/viewImage.do?fileId={%= file.fileId %}&fileSeq={%=file.fileSeq%}');return false;">사진입력</button>
						{% }else { %}
							<button class="ui-button ui-corner-all ui-widget" onclick="pasteEditor('file', '{%=file.fileNm%}', '#ctx#/attachfile/downloadFile.do?fileId={%= file.fileId %}&fileSeq={%=file.fileSeq%}');return false;">파일입력</button>
						{% } %}
					</div>
				</td>
				<td style="text-align:right;">
					<span class="size">{%=o.formatFileSize(file.fileSiz)%}</span>
				</td>
				<td style="text-align:center;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="delete" data-type="DELETE" data-url="#ctx#/attachfile/delete.do?fileId={%= file.fileId %}&fileSeq={%=file.fileSeq%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>삭제</button>
					<!-- <input type="checkbox" name="delete" value="1" class="toggle"> -->
				</td>
			</tr>
		{% } %}
	</script>