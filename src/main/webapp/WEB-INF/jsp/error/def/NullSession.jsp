<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>로그인 정보 확인</title>
<c:if test="${empty errorRequestReferer}">
	<%-- <meta http-equiv="refresh" content="0;url=/user/genr/loginForm.do?menuKey=75" /> --%>
</c:if>

<script type="text/javascript">
<!--
//이전 페이지
function prevPage(){
	history.go(-1);
}

//개인회원
function genrLoginForm(){
	window.location.href = genrUserLoginFormUrl;	
}

//기업회원
function corpLoginForm(){
	window.location.href = corpUserLoginFormUrl;	
}
//-->
</script>
</head>
<body>
<center>
<c:if test="${not empty errorRequestReferer}">
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
			<input type="button" value="개인회원 로그인" title="개인회원 로그인" class="btn_st0" onclick="genrLoginForm();" />
			<input type="button" value="기업회원 로그인" title="기업회원 로그인" class="btn_st0" onclick="corpLoginForm();" />
		</p>
	</div>
</c:if>
</center>
</body>
</html>