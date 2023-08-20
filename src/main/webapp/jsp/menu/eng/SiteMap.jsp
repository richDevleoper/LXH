<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>

<!-- 사이트맵 -->
<div class="siteMap">
	<c:forEach var="topMenu" items="${treeMenuList}">
		<ul>
		<c:if test="${topMenu.naviFlg eq 'Y'}">
			<li>
			<c:choose>
				<c:when test="${empty topMenu.childList}">
					<a href="/sub.do?menuKey=${topMenu.menuKey }">${topMenu.menuNm}</a>
				</c:when>
				<c:otherwise>
					<a href="/sub.do?menuKey=${topMenu.menuKey }">${topMenu.menuNm}</a>
					<ul>
						<c:forEach var="depth1Menu" items="${topMenu.childList }">
							<li>
							<c:choose>
								<c:when test="${empty depth1Menu.childList}">
									<a href="/sub.do?menuKey=${depth1Menu.menuKey}">${depth1Menu.menuNm}</a>
								</c:when>
								<c:otherwise>
									<a href="/sub.do?menuKey=${depth1Menu.menuKey}">${depth1Menu.menuNm}</a>
									<ul>
										<c:forEach var="depth2Menu" items="${depth1Menu.childList }">
											<li>
											<c:choose>
												<c:when test="${empty depth2Menu.childList}">
													<a href="/sub.do?menuKey=${depth2Menu.menuKey}">${depth2Menu.menuNm}</a>
												</c:when>
												<c:otherwise>
													<a href="/sub.do?menuKey=${depth2Menu.menuKey}">${depth2Menu.menuNm}</a>
													<ul>
														<c:forEach var="depth3Menu" items="${depth2Menu.childList }">
															<li><a href="/sub.do?menuKey=${depth3Menu.menuKey}">${depth3Menu.menuNm}</a></li>
														</c:forEach>
													</ul>
												</c:otherwise>
											</c:choose>
											</li>
										</c:forEach>
									</ul>
								</c:otherwise>
							</c:choose>
							</li>
						</c:forEach>
					</ul>
				</c:otherwise>
			</c:choose>
			</li>
		</c:if>
		</ul>
	</c:forEach>
</div>
<!-- //사이트맵 -->
				
</body>
</html>