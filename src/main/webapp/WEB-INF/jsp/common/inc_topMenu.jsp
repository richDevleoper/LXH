<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<script>
				$(".header-top .inner h1").off("click").on("click", function(){
					location.href="/index.do";
				}).css("cursor","pointer");
			</script>
            <div class="header-top">
                <div class="inner">
                    <h1>
                        <img src="./assets/images/logo.png" alt="">
                        <span>품질혁신지원시스템</span>
                    </h1>
                    <div class="header-util">
                        <p>홍길동(품질관리팀) 과제 <a href="" class="lx-red">3</a>건, 결재 <a href="" class="lx-red">1</a>건, 교육 <a href="" class="lx-red">1</a>건</p>
                        <ul>
                            <li><a href=""><img src="./assets/images/icon_mypage.png" alt=""><span>마이페이지</span></a></li>
                            <li><a href=""><img src="./assets/images/icon_help.png" alt=""><span>도움말</span></a></li>
                            <li><a href=""><img src="./assets/images/icon_logout.png" alt=""><span>로그아웃</span></a></li>
                            <li><a href=""><img src="./assets/images/icon_admin.png" alt=""></a></li>
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
								<li><a href="/sub.do?menuKey=${topMenu.menuKey}">${topMenu.menuNm }</a></li>
							</c:forEach>
                                <!-- <li><a href="">품질KPI</a></li>
                                <li><a href="">과제/10+ No Policy활동</a></li>
                                <li><a href="">분임조활동</a></li>
                                <li><a href="">제안활동</a></li>
                                <li><a href="">품질인재육성</a></li>
                                <li><a href="">Big Data/커뮤니티</a></li> -->
                            </ul>
                        </nav>
                    </div>
                    <div class="search-box">
                        <div class="search-form">
                            <form method="GET">
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
                            <ul>
                                <li>
                                    <a href="">품질KPI</a>
                                    <div>
                                        <ul class="depth1">
                                            <li><a href="">6σ인재 현황</a></li>
                                            <li><a href="">팀장MBB율</a></li>
                                            <li><a href="">MBB활용율</a></li>
                                            <li>
                                                <a class="lx-red" href="">KPI관리</a>
                                                <ul class="depth2">
                                                    <li><a class="lx-red" href="">- 관리대상</a></li>
                                                    <li><a class="lx-red" href="">- 계획수립</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="">과제/10+ No Policy활동</a>
                                    <div>
                                        <ul class="depth1">
                                            <li>
                                                <a href="">나의 과제</a>                                                
                                            </li>
                                            <li><a href="">과제검색</a></li>
                                            <li><a href="" class="lx-red">Report</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="">분임조활동</a>
                                    <div>
                                        <ul class="depth1">
                                            <li>
                                                <a href="">나의 분임조과제</a>                                                
                                            </li>
                                            <li><a href="">과제검색</a></li>
                                            <li><a href="" class="lx-red">분임조 편성</a></li>
                                            <li><a href="" class="lx-red">Report</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="">제안활동y</a>
                                    <div>
                                        <ul class="depth1">
                                            <li>
                                                <a href="">나의 제안</a>
                                                <ul class="depth2">
                                                    <li><a href="">- 실시제안</a></li>
                                                    <li><a href="">- 쪽지제안</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="">제안검색</a></li>
                                            <li><a href="" class="lx-red">제안 심사</a></li>
                                            <li>
                                                <a href="" class="lx-red">제안 마감</a>
                                                <ul class="depth2">
                                                    <li><a href="">- 등급평가</a></li>
                                                    <li><a href="">- 비용지급</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="">10+ No Policy</a></li>
                                            <li><a href="" class="lx-red">Report</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="">품질인재육성</a>
                                    <div>
                                        <ul class="depth1">
                                            <li><a href="">나의 육성 현황</a></li>
                                            <ul class="depth2">
                                                <li><a href="">- GB</a></li>
                                                <li><a href="">- MGB</a></li>
                                                <li><a href="">- BB</a></li>
                                                <li><a href="">- MBB</a></li>
                                            </ul>
                                            <li><a href="">년간계획(교육,Test)</a></li>                                            
                                            <li>
                                                <a href="" class="lx-red">교육/Test/인증</a>
                                                <ul class="depth2">
                                                    <li><a href="">- 계획수립</a></li>
                                                    <li><a href="">- 실적입력</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="">Big Data/커뮤니티</a>
                                    <div>
                                        <ul class="depth1">
                                            <li><a href="">Big DATA</a></li>
                                            <li><a href="">자료실</a></li>
                                            <li><a href="">BP사례</a></li>
                                            <li><a href="">공지사항</a></li>
                                            <li><a href="">Q&A</a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
        
                        <button type="button" class="btn-close">닫기</button>
                    </div>
                </div>
            </div>