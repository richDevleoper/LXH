<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<c:set var="parentMenu" value="" />
	<c:set var="childList" value="" />
	<c:choose>
		<c:when test="${currentMenu.gkey eq 0 }">
			<c:forEach var="topMenu" items="${treeMenuList }">
				<c:if test="${topMenu.menuKey eq currentMenu.menuKey }">
					<c:set var="parentMenu" value="${topMenu }" />
				</c:if>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:forEach var="topMenu" items="${treeMenuList }">
				<c:if test="${topMenu.menuKey eq currentMenu.pkey }">
					<c:set var="parentMenu" value="${topMenu }" />
					<c:set var="childList" value="${topMenu.childList }" />
				</c:if>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<%@ include file="/WEB-INF/jsp/layout/def/Head.jsp" %>
	<script type="text/javascript" src="/def/js/sub.cmmn.js"></script>
	<script type="text/javascript">
		$(function(){
			<c:choose>
				<c:when test="${not empty parentMenu }">
					$(".sub_visual_wrap").css('background', 'url(/upload/menu/${parentMenu.titleImg}) no-repeat 50% 0');
				</c:when>
				<c:otherwise>
				$(".sub_visual_wrap").css('background', 'url(/upload/banner/${subBanner.fileMsk}) no-repeat 50% 0');
				</c:otherwise>
			</c:choose>
		});
	</script>
	<decorator:head />
</head>

<body>
	<!-- skipnavigation -->
	<div id="skipnavigation">
		<ul>
			<li><a href="#container_wrap">본문 바로가기</a></li>
			<li><a href="#gnb">주요메뉴 바로가기</a></li>
		</ul>
	</div>
	<!-- //skipnavigation -->
	<hr />

	<div id="wrap">
	<%@ include file="/WEB-INF/jsp/layout/def/Header.jsp" %>
		<!-- sub_visual_wrap -->
		<%-- ${subBannerList } --%>
		<div class="sub_visual_wrap"></div>
		<!-- //sub_visual_wrap -->
		
		<c:if test="${not empty parentMenu }">
			<!-- location_box -->
			<div class="location_box">
				<div class="location">
					<a class="home" href="/" title="메인으로 이동합니다"><img alt="home" src="/def/img/contents/btn_home.png" /></a>
					<div class="first">
						<a href="#none" onclick="hideLocation('#location1');$('#location1').slideToggle()" title="${parentMenu.menuNm }">${parentMenu.menuNm }<img alt="home" src="/def/img/contents/btn_location_arrow.png" /></a>
						<ul id="location1" style="display:none;">
							<c:forEach var="topMenu" items="${treeMenuList }">
								<li><a href="/sub.do?menuKey=${topMenu.menuKey}">${topMenu.menuNm }</a></li>
							</c:forEach>
						</ul>
					</div>
					<c:if test="${not empty childList}">
						<span>&gt;</span>
						<div class="">
							<a href="#none" onclick="hideLocation('#location2');$('#location2').slideToggle()" title="${currentMenu.menuNm }">${currentMenu.menuNm }<img alt="home" src="/def/img/contents/btn_location_arrow.png" /></a>
							<ul id="location2" style="display:none;">
								<c:forEach var="depth1Menu" items="${childList }">
									<li><a href="/sub.do?menuKey=${depth1Menu.menuKey }">${depth1Menu.menuNm }</a></li>
								</c:forEach>
							</ul>
						</div>
					</c:if>
				</div>
			</div>
			<!-- //location_box -->
		</c:if>

		<!-- container_wrap -->
		<div id="container_wrap" >
			<div id="main_container_box">
				<div id="con_header">
					<h3>${currentMenu.menuNm}</h3>
					<p class="text">혁신적인 건설문화를 위한 새로운도전!</p>
				</div>
				<div id="con_body">
					<decorator:body />
				</div>
			</div>
		</div>
		<!-- //container_wrap -->
	<%@ include file="/WEB-INF/jsp/layout/def/Footer.jsp" %>
	</div>
</body>
</html>