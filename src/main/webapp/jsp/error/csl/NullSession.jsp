<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="redirectFlag" value="false" />
<c:if test="${empty errorRequestReferer or fn:endsWith(errorRequestReferer, '/csl') or fn:endsWith(errorRequestReferer, '/csl/') or fn:endsWith(errorRequestReferer, '/csl/index.jsp')}">
	<c:set var="redirectFlag" value="true" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>로그인 정보 확인</title>
<c:if test="${redirectFlag}">
	<meta http-equiv="refresh" content="0;url=/csl/user/mngr/loginForm.do" />
</c:if>

<script type="text/javascript">
<!--
//이전 페이지
function prevPage(){
	history.go(-1);
}

//관리자로그인
function mngrLoginForm(){
	window.location.href = mngrUserLoginFormUrl;	
}
//-->
</script>
</head>
<body>
<center>
<c:if test="${!redirectFlag}">
	<div style="margin-top:100px;width:800px;">
		<table cellpadding="0" class="tb_base" summary="">
			<caption><span>로그인정보 확인</span></caption>
			<colgroup>
				<col style="width:15%"/>
				<col style="width:35%"/>
				<col style="width:15%"/>
				<col style="width:35%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col" colspan="4">로그인정보 확인</th>
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
					<th><label for="">로그인정보</label></th>
					<td colspan="3">사용자 세션이 만료되었습니다.</td>
				</tr>
			</tbody>
		</table>
		
		<p class="btn_list">
			<button class="jListButton" onclick="mngrLoginForm();" title="로그인 이동">로그인 이동</button>
		</p>
	</div>
</c:if>
</center>
</body>
</html>