<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>사용 권한이 없습니다</title>
<c:if test="${not empty error_requestType and error_requestType eq 'ajax'}">
	<script type="text/javascript">
		alert("사용 권한이 업습니다");
		<c:if test="${not empty error_referer}">
			document.location.href = "${error_referer}";
		</c:if>
	</script>
</c:if>
</head>
<body>
<center>
	<c:if test="${not empty error_referer}">
		<p>${error_referer}</p>
	</c:if>
	<p>사용 권한이 없습니다 -> 이전 페이지로 이동</p>
</center>
</body>
</html>