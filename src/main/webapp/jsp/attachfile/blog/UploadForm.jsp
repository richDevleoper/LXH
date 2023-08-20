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
	                <span>Choose file</span>
	                <input type="file" name="files[]" multiple>
	            </span>
	            <button id="startAll" type="submit" class="start">Attach all</button>
	            <!--  <button type="reset" class="cancel">취소</button> -->
	            <button type="button" class="delete">Delete all</button>
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
		    	<colgroup><col style="width:40%;" /><col style="width:15%;" /><col style="width:15%;" /><col style="width:30%;" /></colgroup>
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
						<button class="start" disabled>Attach</button>
					{% }else { %}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					{% } %}
					{% if (!i) { %}
						<button class="cancel">Delete</button>
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
						{% if (file.thumbnailUrl) { %}
							<a href="/attachfile/preview.do?attachFileKey={%=file.attachFileKey%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
						{% } %}
					</span>
				</td>
				-->
				<td style="text-align:left;">
					<p class="name">
						{%=file.fileNm%}
					</p>
					{% if (file.error) { %}
						<div><span class="error" style="color:#ce5252;">Error</span> {%=file.error%}</div>
					{% } %}
				</td>
				<td>
					<div class="progress" style="height:20px;"></div>
				</td>
				<td style="text-align:right;">
					<span class="size">{%=o.formatFileSize(file.fileSiz)%}</span>
				</td>
				<td style="text-align:center;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="delete" data-type="DELETE" data-url="#ctx#/attachfile/delete.do?fileMsk={%= file.fileMsk %}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>Delete</button>
					<!-- <input type="checkbox" name="delete" value="1" class="toggle"> -->
				</td>
			</tr>
		{% } %}
	</script>