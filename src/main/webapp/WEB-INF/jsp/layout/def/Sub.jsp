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

	<!-- 이부분이 잘못되어 부모  자식관계가  2 DEPT 이상시 오륙가 날수  밖에 없음,   개선 필요 -->
	<c:set var="parentMenu" value="" />
	<c:set var="childList" value="" />
	<c:choose>
		<c:when test="${currentMenu.gkey eq 0 }">
			<c:forEach var="topMenu" items="${treeMenuList}">
				<c:if test="${topMenu.menuKey eq currentMenu.menuKey }">
					<c:set var="parentMenu" value="${topMenu }" />
				</c:if>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:forEach var="topMenu" items="${treeMenuList }">
				<c:choose>
					<c:when test="${topMenu.menuKey eq currentMenu.pkey}">
						<%-- <c:out value="<script type='text/javascript'>alert('${topMenu.menuKey}  ${currentMenu.pkey }');</script>" escapeXml="false"/> --%>
						<c:if test="${topMenu.menuKey eq currentMenu.pkey }">
							<c:set var="parentMenu" value="${topMenu }" />
							<c:set var="childList" value="${topMenu.childList }" />
						</c:if>						
					</c:when>						
					<c:otherwise>
						<c:forEach var="childMenu" items="${topMenu.childList }">
							<c:if test="${childMenu.childList != null }">
								<%-- <c:out value="<script type='text/javascript'>alert('${childMenu.menuKey}  ${currentMenu.pkey }');</script>" escapeXml="false"/> --%> 
								<c:if test="${childMenu.menuKey eq currentMenu.pkey }">
									<c:set var="parentMenu" value="${topMenu }" />
									<c:set var="childList" value="${topMenu.childList }" />								
								</c:if>
							</c:if>
						</c:forEach>					
					</c:otherwise>			
				</c:choose>
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
	<script  type="text/javascript">
		console.log('${parentMenu}');
	</script>
    <div id="wrap">
        <!-- container -->
        <div id="container">
            <div id="page-header">
                <div class="inner">
                 <c:if test="${not empty parentMenu }">
                    <div class="page-category">${parentMenu.menuNm }</div>
                    <div id="path">
                   
                        <a href="">홈</a>
                        <span class="arr">></span>
                        <a href="">${parentMenu.menuNm }</a>
                        <span class="arr">></span>
                        <a href="javascript:void(0);">${currentMenu.menuNm }</a>
                    
                    </div>
                    <button tpye="button" class="btn-print">
                        <img src="/assets/images/btn_print.png" alt="">
                        <span>인쇄</span>
                    </button>
                    </c:if>
                </div>
            </div>
            <div id="page-container">
                <div class="inner">
                    <nav id="page-left">
                    
             
             			<ul class="depth1">
						<c:forEach var="topMenu" items="${treeMenuList}">							
							<c:if test="${topMenu.naviFlg eq 'Y'}">
<%-- 								<li><a href="/sub.do?menuKey=${depth1Menu.menuKey }">${depth1Menu.menuNm }</a> --%>
								<c:choose>
									<c:when test="${empty topMenu.childList}"></c:when>
									<c:otherwise>
										<ul class="depth2">
											<c:forEach var="depth1Menu" items="${topMenu.childList }">
												<li><a href="/sub.do?menuKey=${depth1Menu.menuKey}">${depth1Menu.menuNm}</a>
												<c:choose>
													<c:when test="${empty depth1Menu.childList}">
														
													</c:when>
													<c:otherwise>
														
														<ul>
															<c:forEach var="depth2Menu" items="${depth1Menu.childList }">
																<li><a href="/sub.do?menuKey=${depth2Menu.menuKey}">${depth2Menu.menuNm}</a>
																<c:choose>
																	<c:when test="${empty depth2Menu.childList}">
																		
																	</c:when>
																	<c:otherwise>
										
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
							
						</c:forEach>
						</ul>                    
                    
                    
                    
                        <ul class="depth1">

                        <c:if test="${not empty childList}">
                        	<c:forEach var="depth1Menu" items="${childList }">
								<c:choose>
									<c:when test="${empty depth1Menu.childList}">
										<li><a href="/sub.do?menuKey=${depth1Menu.menuKey }"  <c:if test="${depth1Menu.menuKey eq currentMenu.menuKey}"> class="cur" </c:if>>${depth1Menu.menuNm }</a></li>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${depth1Menu.menuKey eq currentMenu.menuKey or (currentMenu.gkey eq '2' and depth1Menu.menuKey eq currentMenu.pkey)}">
												<li><a href="javascript:void(0)" class="has-depth active cur">${depth1Menu.menuNm}</a>
												<ul class="depth2" style="display: block;">
											</c:when>
											<c:otherwise>
												<li><a href="javascript:void(0)" class="has-depth">${depth1Menu.menuNm}</a>
												<ul class="depth2">
											</c:otherwise>
										</c:choose>	
										
											<c:forEach var="depth2Menu" items="${depth1Menu.childList }">

												<c:choose>
													<c:when test="${empty depth2Menu.childList}">
														<li><a href="/sub.do?menuKey=${depth2Menu.menuKey}" <c:if test="${depth2Menu.menuKey eq currentMenu.menuKey}"> class="lx-red" </c:if>>${depth2Menu.menuNm}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="javascript:void(0)" >${depth2Menu.menuNm}</a></li>
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
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
                            
                        </ul>
                    </nav>
                    <section id="page-content">
                    
                    	<decorator:body />

                    </section>
                </div>
            </div>
        </div>                    
           <div class="dimmed"></div>

	<%@ include file="/WEB-INF/jsp/layout/def/Footer.jsp" %>
	</div>
</body>
</html>