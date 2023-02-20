<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%-- c:set var="ctx" value="${pageContext.request.contextPath}" --%>

<input type="hidden" id="totalFileSize" value="0" />
<div id="swfupload-control" class="swfupload-control">	
	<div class="fr mb10">
		<span id="spanButtonPlaceHolder"></span>
		<span id="spanThumbnail" class="thumbnail"><img src="/jfile/swfupload/images/preview_img.gif" /></span>
		<span id="btnUploadWrap" <%-- class="btnUploadWrap" --%>><button type="button" onclick="fileUpload1()" class="jUploadButton ml5" style="width:100px;height:25px;">적용</button></span>
	</div>
	<div>
		<div>
			<table id="fileAreaTable"  width="100%" cellpadding="0" cellspacing="0" style="border-collapse: collapse;" class="tb_jfile">
				<col style="width:54%"/><col style="width:12%"/><col style="width:14%"/><col style="width:12%"/><col style="width:8%"/>
				<thead>
					<tr class="tr_jfile">
						<th class="top" style="background-image: url('/jfile/swfupload/images/text-bg.gif');background-repeat: repeat-x;">파일명</th>
						<th class="top" style="background-image: url('/jfile/swfupload/images/text-bg.gif');background-repeat: repeat-x;">사이즈</th>
						<th class="top" style="background-image: url('/jfile/swfupload/images/text-bg.gif');background-repeat: repeat-x;">업로드 진행</th>
						<th class="top" style="background-image: url('/jfile/swfupload/images/text-bg.gif');background-repeat: repeat-x;">열기 및 저장</th>
						<th class="topend" style="background-image: url('/jfile/swfupload/images/text-bg.gif');background-repeat: repeat-x;">삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr id="noDataRow">
						<td class="all_txt" colspan="5" style="text-align: center;">첨부된 파일이 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
