<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>

<!-- frame -->
<div class="frame">
	<!-- header -->
	<div id="header">
		<div class="logo"><a href="/eng/index.do">Index</a></div>
		<div class="sitemap">
			<a href="/eng/sub.do?menuKey=119" >Sitemap</a>
			<a href="/index.do" target="_blank" >Korean</a>
		</div>
		<div class="userInfo">
			<%-- 
			<c:choose>
				<c:when test="${userSession.genrUser }">
					<a href="/eng/sub.do?menuKey=78">정보수정</a>
					<a href="/eng/sub.do?menuKey=79">회원탈퇴</a>
					<a href="/user/genr/logout.do">로그아웃</a>
				</c:when>
				<c:when test="${userSession.corpUser }">
					<a href="/eng/sub.do?menuKey=85">정보수정</a>
					<a href="/eng/sub.do?menuKey=86">회원탈퇴</a>
					<a href="/user/corp/logout.do">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="/eng/sub.do?menuKey=69">회원가입</a>
					<a href="/eng/sub.do?menuKey=70">로그인</a>
					<a href="/eng/sub.do?menuKey=71">아이디찾기</a>
					<a href="/eng/sub.do?menuKey=72">비밀번호찾기</a>
				</c:otherwise>
			</c:choose>
			--%>
		</div>
		<div class="gnb">
			<div>
				<div class="toggle">
					<a href="#none" onclick="$(this).parent().next().toggle();">Main Menu(Toggle)</a>
				</div>
				<ul style="display:none;">
				<c:forEach var="topMenu" items="${treeMenuList}">
					<c:if test="${topMenu.naviFlg eq 'Y'}">
						<li>
						<c:choose>
							<c:when test="${empty topMenu.childList}">
								<a href="/eng/sub.do?menuKey=${topMenu.menuKey }" <c:if test="${historyMenuList[0].menuKey eq topMenu.menuKey}">style="color:#aa1d1d;"</c:if>>${topMenu.menuNm}</a>
							</c:when>
							<c:otherwise>
								<a href="/eng/sub.do?menuKey=${topMenu.menuKey }" <c:if test="${historyMenuList[0].menuKey eq topMenu.menuKey}">style="color:#aa1d1d;"</c:if>>${topMenu.menuNm}</a>
								<ul>
									<c:forEach var="depth1Menu" items="${topMenu.childList }">
										<li>
											<a href="/eng/sub.do?menuKey=${depth1Menu.menuKey}" <c:if test="${historyMenuList[1].menuKey eq depth1Menu.menuKey}">style="color:#aa1d1d;"</c:if>>${depth1Menu.menuNm}</a>
											<%-- 
											<c:choose>
												<c:when test="${empty depth1Menu.childList}">
													<a href="/eng/sub.do?menuKey=${depth1Menu.menuKey}" <c:if test="${historyMenuList[1].menuKey eq depth1Menu.menuKey}">style="color:#aa1d1d;"</c:if>>${depth1Menu.menuNm}</a>
												</c:when>
												<c:otherwise>
													<a href="/eng/sub.do?menuKey=${depth1Menu.menuKey}" <c:if test="${historyMenuList[1].menuKey eq depth1Menu.menuKey}">style="color:#aa1d1d;"</c:if>>${depth1Menu.menuNm}</a>
													<ul>
														<c:forEach var="depth2Menu" items="${depth1Menu.childList }">
															<li><a href="/eng/sub.do?menuKey=${depth2Menu.menuKey}" <c:if test="${historyMenuList[2].menuKey eq depth2Menu.menuKey}">style="color:#aa1d1d;"</c:if>>${depth2Menu.menuNm}</a></li>
														</c:forEach>
													</ul>
												</c:otherwise>
											</c:choose>
											--%>
										</li>
									</c:forEach>
								</ul>
							</c:otherwise>
						</c:choose>
						</li>
					</c:if>
				</c:forEach>
				</ul>
			</div>
		</div>
		<div class="locate-current">
			Current Menu : ${currentMenu.menuNm}
		</div>
		<div class="locate-history">
			Current Location : 
			<c:if test="${not empty historyMenuList}">
				<c:forEach var="item" items="${historyMenuList }" varStatus="i">
					<c:if test="${i.index > 0 }">
						&gt;
					</c:if>
					${item.menuNm }
				</c:forEach>
			</c:if>
		</div>
	</div>
	<!-- //header -->
	
	<!-- container -->
	<div class="container">
		<!-- snb -->
		<div class="snb">
			<ul class="snb-top">
				<c:forEach var="topMenu" items="${treeMenuList }">
					<c:if test="${topMenu.menuKey eq historyMenuList[0].menuKey}">
						<li class="snb-top-item">
							<a href="#none">${topMenu.menuNm}</a>
							<c:if test="${not empty topMenu.childList }">
								<ul class="snb-list">
									<c:forEach var="depth1Menu" items="${topMenu.childList }">
										<li class="snb-item">
											<c:choose>
												<c:when test="${empty depth1Menu.childList }">
													<a href="/eng/sub.do?menuKey=${depth1Menu.menuKey}" class="snb-link" <c:if test="${historyMenuList[1].menuKey eq depth1Menu.menuKey}">style="color:#aa1d1d;"</c:if>>${depth1Menu.menuNm}</a>
												</c:when>
												<c:otherwise>
													<a href="/eng/sub.do?menuKey=${depth1Menu.menuKey}" class="snb-link" <c:if test="${historyMenuList[1].menuKey eq depth1Menu.menuKey}">style="color:#aa1d1d;"</c:if>>${depth1Menu.menuNm}</a>
													<ul>
														<c:forEach var="depth2Menu" items="${depth1Menu.childList }">
															<li class="snb-item">
																<c:choose>
																	<c:when test="${empty depth2Menu.childList }">
																		<a href="/eng/sub.do?menuKey=${depth2Menu.menuKey}" class="snb-link" <c:if test="${historyMenuList[2].menuKey eq depth2Menu.menuKey}">style="color:#aa1d1d;"</c:if>>${depth2Menu.menuNm}</a>
																	</c:when>
																	<c:otherwise>
																		<a href="/eng/sub.do?menuKey=${depth2Menu.menuKey}" class="snb-link" <c:if test="${historyMenuList[2].menuKey eq depth2Menu.menuKey}">style="color:#aa1d1d;"</c:if>>${depth2Menu.menuNm}</a>
																		<ul>
																			<c:forEach var="depth3Menu" items="${depth2Menu.childList }">
																				<li><a href="/eng/sub.do?menuKey=${depth3Menu.menuKey}" class="snb-link" <c:if test="${historyMenuList[3].menuKey eq depth3Menu.menuKey}">style="color:#aa1d1d;"</c:if>>${depth3Menu.menuNm}</a></li>
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
							</c:if>
						</li>
					</c:if>
				</c:forEach>
				<!-- 
				<li class="snb-item"><a href="" class="snb-link">Menu-1</a></li>
				<li class="snb-item"><a href="" class="snb-link">Menu-2</a></li>
				<li class="snb-item"><a href="" class="snb-link">Menu-3</a></li>
				-->
			</ul>
		</div>
		<!-- //snb -->
		<!-- content-body -->
		<div class="content-wrap">
			<div class="content-body">
		
		