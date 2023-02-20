<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	<!-- skipnavigation -->
	<div id="skipnavigation">
		<ul>
			<li><a href="#snb">주요메뉴 바로가기</a></li>
			<li><a href="#con_body">본문 바로가기</a></li>
		</ul>
	</div>
	<!-- //skipnavigation -->
	<!-- header -->
	<div id="header">
		<h1>
			<!-- <a href="/csl/index.do"><img src="<c:url value='/csl/img/logo.gif' />" alt="logo" /></a> -->
			<!-- <a href="/csl/index.do"><img src="" alt="logo" /></a> -->
			<a href="/csl/index.do">
				<b>${pageContext.request.serverName }</b>
			</a>
		</h1>
		<div id="lnb">
			<h2 class="hidden">사용자메뉴</h2>
			<a href="/index.do" target="_blank">메인사이트</a>
			<a href="/csl/user/mngr/logout.do">${userSession.mngrUserVO.userNm } 로그아웃</a>
		</div>
	</div>
	<!-- //header -->
	
	<!-- container -->
	<script type="text/javascript">
	//<!--
	function showTree(key){
		$("#TREE_"+key+" > li").each(function(){if($(this).css("display") == 'none'){$(this).show();}else{$(this).hide();}});
	}
	//-->
	</script>
	<div id="container">
		<!-- snb -->
		<div id="snb">
			<h2><img src="<c:url value='/csl/img/common/sub_title.gif'/>" alt="관리자메뉴" /></h2>
			<ul>
			<c:forEach var="topMenu" items="${treeMenuList}">
				<c:set var="auth" value="false"/>
				<c:forEach var="useKey" items="${userSession.cslMenuUseKeys }">
					<c:if test="${useKey eq topMenu.menuKey }">
						<c:set var="auth" value="true"/>		
					</c:if>
				</c:forEach>
				
				<c:if test="${auth}">
					<li>
					<c:choose>
						<c:when test="${empty topMenu.childList}">
							<a href="${topMenu.menuUrl }" <c:if test="${historyMenuList[0].menuKey eq topMenu.menuKey}">class="on"</c:if>>${topMenu.menuNm}</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:showTree(${topMenu.menuKey });" <c:if test="${historyMenuList[0].menuKey eq topMenu.menuKey}">class="on"</c:if>>${topMenu.menuNm}</a>
							<ul id="TREE_${topMenu.menuKey}">
								<c:forEach var="depth1Menu" items="${topMenu.childList }">
									<c:set var="auth" value="false"/>
									<c:forEach var="useKey" items="${userSession.cslMenuUseKeys }">
										<c:if test="${useKey eq depth1Menu.menuKey }">
											<c:set var="auth" value="true"/>		
										</c:if>
									</c:forEach>
									<c:if test="${auth}">
										<c:choose>
											<c:when test="${depth1Menu.linkTyp eq 'EMPTY'}">
												<li <c:if test="${historyMenuList[0].menuKey ne topMenu.menuKey}">style="display:none;"</c:if>><a href="/csl/sub.do?menuKey=${depth1Menu.menuKey}" <c:if test="${historyMenuList[1].menuKey eq depth1Menu.menuKey}">class="on"</c:if>>${depth1Menu.menuNm}</a></li>
											</c:when>
											<c:otherwise>
												<li <c:if test="${historyMenuList[0].menuKey ne topMenu.menuKey}">style="display:none;"</c:if>><a href="${depth1Menu.menuUrl}" <c:if test="${historyMenuList[1].menuKey eq depth1Menu.menuKey}">class="on"</c:if>>${depth1Menu.menuNm}</a></li>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
							</ul>
						</c:otherwise>
					</c:choose>
					</li>
				</c:if>
			</c:forEach>

			</ul>
		</div>
		<!-- //snb -->
		<!-- contents -->
		<div id="contents">
			<!-- con_header -->
			<div id="con_header">
				<h3>
					<%--  
					<c:choose>
						<c:when test="${empty currentMenu.menuNm}">관리자 홈</c:when>
						<c:otherwise>${currentMenu.menuNm }</c:otherwise>
					</c:choose>
					--%>
					<c:choose>
						<c:when test="${not empty historyMenuList}">
							<c:forEach items="${historyMenuList }" var="h" varStatus="i">
								<c:if test="${i.count ne 1 }">
									&gt;
								</c:if>
								${h.menuNm }
							</c:forEach>
							<c:if test="${not empty currentBoard }">
								(${currentBoard.boardNm})
							</c:if>
						</c:when>
						<c:otherwise>
							관리자 홈
						</c:otherwise>
					</c:choose>
				</h3>
				<%-- 
				<p id="location">
					<c:if test="${not empty currentMenu.menuNm}">
						관리자 홈 &gt; 
						<c:forEach items="${historyMenuList }" var="h" varStatus="i">
							${h.menuNm }
							<c:if test="${i.count ne fn:length(historyMenuList) }">
							&gt;
							</c:if>
						</c:forEach>
					</c:if>
					</p>
				--%>
				
				<c:forEach var="topMenu" items="${treeMenuList}">
					<c:set var="auth" value="false"/>
					<c:forEach var="useKey" items="${userSession.cslMenuUseKeys }">
						<c:if test="${useKey eq topMenu.menuKey }">
							<c:set var="auth" value="true"/>		
						</c:if>
					</c:forEach>
					
					<c:if test="${auth and historyMenuList[0].menuKey eq topMenu.menuKey}">
						<c:if test="${not empty topMenu.childList}">
							<c:forEach var="depth1Menu" items="${topMenu.childList }">
								<c:set var="auth" value="false"/>
								<c:forEach var="useKey" items="${userSession.cslMenuUseKeys }">
									<c:if test="${useKey eq depth1Menu.menuKey }">
										<c:set var="auth" value="true"/>		
									</c:if>
								</c:forEach>
								<c:if test="${auth and historyMenuList[1].menuKey eq depth1Menu.menuKey}">
									<c:if test="${not empty depth1Menu.childList}">
										<div class="cont_tab_wrap">
											<ul class="cont_tab">
												<c:forEach var="depth2Menu" items="${depth1Menu.childList }">
													<c:set var="auth" value="false"/>
													<c:forEach var="useKey" items="${userSession.cslMenuUseKeys }">
														<c:if test="${useKey eq depth2Menu.menuKey }">
															<c:set var="auth" value="true"/>		
														</c:if>
													</c:forEach>
													<c:if test="${auth}">
														<li <c:if test="${historyMenuList[2].menuKey eq depth2Menu.menuKey}">class="on"</c:if>><a href="${depth2Menu.menuUrl}">${depth2Menu.menuNm}</a></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</c:if>
								</c:if>
							</c:forEach>
						</c:if>
					</c:if>
				</c:forEach>
				<!-- 
				<div class="cont_tab_wrap">
					<ul class="cont_tab">
						<li class="first"><a href="#none">기본정보</a></li>
						<li><a href="#none">상세정보</a></li>
						<li><a href="#none">상세정보</a></li>
						<li class="on"><a href="#none">상세정보</a></li>
					</ul>
				</div>
				-->
			</div>
			<!-- //con_header -->
			<!-- con_body -->
			<div id="con_body">