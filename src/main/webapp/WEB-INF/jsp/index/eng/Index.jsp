<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tld/string-taglib.tld" prefix="string"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>index</title>
</head>
<body>
	<div style="border:solid 1px #eee;margin:0 5px 5px 5px;padding:5px;">
		<div><b><a href="/eng/sub.do?menuKey=105">ARTICLE</a></b></div>
		<ul>
			<c:if test="${not empty noticeList}">
				<ul>
					<c:forEach var="item" items="${noticeList}">
						<li style="padding:2px;">
							<a href="/eng/article/view.do?boardKey=${item.boardKey}&amp;articleKey=${item.articleKey}&amp;menuKey=105">${item.title}</a>
							<span>
								<!-- fmt:formatDate pattern="yyyy-MM-dd" value="${item.frstOperDt}" /-->
								<fmt:parseDate value='${item.frstOperDt}' var='frstOperDt' pattern='yyyymmdd'/> <!-- J's 20230202 -->
								<fmt:formatDate value="${frstOperDt}" pattern="yyyy-mm-dd"/>
							</span> 
						</li>	
					</c:forEach>
				</ul>
			</c:if>
		</ul>
	</div>
	
	<div style="border:solid 1px #eee;margin:5px;padding:5px;">
		<div><b>POPUP</b></div>
		<ul>
			<c:if test="${not empty popupList}">
				<ul>
					<c:forEach var="item" items="${popupList}">
						<li>${item}</li>	
					</c:forEach>
				</ul>
			</c:if>
		</ul>
	</div>
	
	<div style="border:solid 1px #eee;margin:5px;padding:5px;">
		<div><b>BANNER</b></div>
		<ul>
			<c:if test="${not empty bannerList}">
				<ul>
					<c:forEach var="item" items="${bannerList}">
						<li>${item}</li>	
					</c:forEach>
				</ul>
			</c:if>
		</ul>
	</div>
	
	<div style="border:solid 1px #eee;margin:5px;padding:5px;">
		<div><b>LINK</b></div>
		<ul>
			<c:if test="${not empty linkList}">
				<ul>
					<c:forEach var="item" items="${linkList}">
						<li>${item}</li>	
					</c:forEach>
				</ul>
			</c:if>
		</ul>
	</div>
</body>
</html>
