<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>

<!-- header_wrap -->
<div id="header_wrap">
	<div class="bg_header_wrap">
		<!-- header -->
		<div id="header">
			<div class="header_top">
				<h1><a href="/index.do"><img src="/def/img/common/logo.png" alt="HEUNGDEOK Construction 흥덕건설" /></a></h1>
				<div class="clear_box">
					<div id="lnb">
						<ul class="lnb_mn">
							<li><a href="/sub.do?menuKey=39">SITEMAP</a></li>
							<li><a href="/sub.do?menuKey=27">CONTACT US</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- gnb_mn -->
			<div id="gnb_mn">
				<h2 class="hidden">주메뉴</h2>
				<p class="gnb_img" style="display:none;"><img src="/def/img/common/img_gnb.png" alt="NAVIGATION"/></p>
				<ul>
					<c:forEach var="topMenu" items="${treeMenuList }">
						<li><a href="/sub.do?menuKey=${topMenu.menuKey}">${topMenu.menuNm }</a>
						<c:if test="${not empty topMenu.childList }">
							<div class="top1">
								<ul>
									<c:forEach var="depth1Menu" items="${topMenu.childList }">
										<li><a href="/sub.do?menuKey=${depth1Menu.menuKey}" class="snb-link" <c:if test="${historyMenuList[1].menuKey eq depth1Menu.menuKey}">style="color:#aa1d1d;"</c:if> >${depth1Menu.menuNm}</a></li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<!-- //gnb_mn -->
		</div>
		<!-- //header -->
	</div>
</div>
<!-- //header_wrap -->