<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
<style>
/* skipnavigation */
#skipnavigation {position:relative; z-index:99999;}
#skipnavigation ul li {position:absolute;  width:100%; text-align:center;}
#skipnavigation ul li a {display:block; height:1px; width:1px; margin-bottom:-1px; padding:0; overflow:hidden; text-align:center; color:#000; white-space:nowrap;}
#skipnavigation ul li a:hover, #skipnavigation ul li a:focus, #skipnavigation ul li a:active { display:block; height:auto; width:100%; padding:10px 0; margin:0; font-size:15px; font-weight:bold; color:#fff; background:#0b4db1; text-align:center; }

hr { display:none; }
</style>
<script>
	$(document).ready(function(){
		
		$(".header-top .inner h1").off("click").on("click", function(){
			location.href="/index.do";
		}).css("cursor","pointer");
		$("hr").remove();
	});
</script>
<!-- header_wrap -->			
        <header>
            <div class="header-top">
                <div class="inner">
                    <h1>
                        <img src="/assets/images/logo.png" alt="">
                        <span>품질혁신지원시스템</span>
                    </h1>
                    <div class="header-util">
                        <p>${userSession.intfUserVO.userName}(${userSession.intfUserVO.comDepartName}) 과제 <a href="/intf/login.do?com_no=89893" class="lx-red">3</a>건, 결재 <a href="" class="lx-red">1</a>건, 교육 <a href="" class="lx-red">1</a>건</p>
                        <ul>
                            <li><a href="/sub.do?menuKey=73"><img src="/assets/images/icon_mypage.png" alt=""><span>마이페이지</span></a></li>
                            <li><a href=""><img src="/assets/images/icon_help.png" alt=""><span>도움말</span></a></li>
                            <li><a href=""><img src="/assets/images/icon_logout.png" alt=""><span>로그아웃</span></a></li>
                            <li><a href=""><img src="/assets/images/icon_admin.png" alt=""></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="header-btm">
                <div class="inner">
                    <div class="header-menu">
                        <button type="button" class="btn-gnb">메뉴</button>
                        <nav>
                            <ul>
                            <c:forEach var="topMenu" items="${treeMenuList }">
                            <c:choose>
								<c:when test="${topMenu.menuNm eq '마이페이지'}">
									
								</c:when>
								<c:when test="${topMenu.menuKey eq '45'}">
									<li><a href="/sub.do?menuKey=${topMenu.menuKey}" target="_blank">${topMenu.menuNm }</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="/sub.do?menuKey=${topMenu.menuKey}">${topMenu.menuNm }</a></li>
								</c:otherwise>
							</c:choose>
							
							</c:forEach>
                            </ul>
                        </nav>
                    </div>
                    <div class="search-box">
                        <div class="search-form">
                            <form method="GET" action="/app/004_02_search.do">
                            <input type="hidden" name="menuKey" value="36">
                                <span>전체</span>
                                <input type="text" name="" placeholder="검색어를 입력하세요">
                                <button type="submit" class="btn-search">검색</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="total-menu">
                    <div class="inner">
                        <div id="gnb">
                        	<button type="button" class="btn-close">닫기</button>
                            <ul>
                            <c:forEach var="topMenu" items="${treeMenuList }">
	                            <c:choose>
									<c:when test="${topMenu.menuNm eq '마이페이지'}">
										
									</c:when>
									<c:otherwise>
										 <c:choose>
											<c:when test="${topMenu.menuKey eq '45'}">
												<li><a href="/sub.do?menuKey=${topMenu.menuKey}" target="_blank">${topMenu.menuNm }</a> <!-- Big Data -->
											</c:when>
											<c:otherwise>
												<li><a href="/sub.do?menuKey=${topMenu.menuKey}">${topMenu.menuNm }</a>
											</c:otherwise>
										</c:choose>
										
										<c:if test="${not empty topMenu.childList }">
											<div>
		                                        <ul class="depth1">
													<c:forEach var="depth1Menu" items="${topMenu.childList }">
														<c:choose>
															<c:when test="${depth1Menu.menuKey eq '56'}">	<!-- Big Data -->
																<li><a href="/sub.do?menuKey=${depth1Menu.menuKey}" target="_blank">${depth1Menu.menuNm }</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="/sub.do?menuKey=${depth1Menu.menuKey}" class="snb-link" <c:if test="${historyMenuList[1].menuKey eq depth1Menu.menuKey}">style="color:#aa1d1d;"</c:if> >${depth1Menu.menuNm}</a>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${empty depth1Menu.childList}">
																
															</c:when>
															<c:otherwise>
																<ul class="depth2">
																	<c:forEach var="depth2Menu" items="${depth1Menu.childList }">
																		<li><a href="/sub.do?menuKey=${depth2Menu.menuKey}">- ${depth2Menu.menuNm}</a></li>
																	</c:forEach>
																</ul>
																</li>
															</c:otherwise>
														</c:choose>
														</li>
													</c:forEach>
												</ul>
											</div>
										</c:if>
									
										
										</li>
									</c:otherwise>
								</c:choose>                            
							</c:forEach>
                            </ul>
                        </div>
        
                        <button type="button" class="btn-close">닫기</button>
                    </div>
                </div>
            </div>
         </header>
         
 <!-- header_wrap -->
<div id="header_wrap" style="display: none;">
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