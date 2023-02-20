<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>사용권한 확인</title>
<script type="text/javascript">
<!--
//이전 페이지
function prevPage(){
	history.go(-1);
}
//-->
</script>
</head>
<body>
<center>
	<div style="margin-top:100px;width:800px;">
		<table cellpadding="0" class="tb_base" summary="">
			<caption><span>사용권한 확인</span></caption>
			<colgroup>
				<col style="width:15%"/>
				<col style="width:35%"/>
				<col style="width:15%"/>
				<col style="width:35%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col" colspan="4">사용권한 확인</th>
				</tr>
			</thead>
			<tbody class="write">
				<tr>
					<th><label for="">Referer</label></th>
					<td colspan="3">
						<c:if test="${not empty errorRequestReferer}">
							<c:choose>
								<c:when test="${fn:indexOf(errorRequestReferer, '?') != -1}">${fn:split(errorRequestReferer, '?')[0]}</c:when>
								<c:otherwise>${errorRequestReferer}</c:otherwise>
							</c:choose>
						</c:if>
					</td>
				</tr>
				<tr>
					<th><label for="">사용권한</label></th>
					<td colspan="3">사용권한이 없습니다.</td>
				</tr>
			</tbody>
		</table>
		
		<p class="btn_list">
			<button class="jListButton" onclick="prevPage();" title="이전페이지 이동">이전페이지 이동</button>
		</p>
	</div>
</center>
</body>
</html>