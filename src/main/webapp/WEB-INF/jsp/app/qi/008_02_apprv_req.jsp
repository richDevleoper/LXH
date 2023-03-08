<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- CSS -->
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/tree.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/style.css">

    <!-- JS -->
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/jstree.min.js"></script>
    <script src="../js/common.js"></script>

    <title>품질혁신지원시스템</title>
</head>
<body>
    <div id="wrap">
        <!-- header -->
        <header>
            <div class="header-top">
                <div class="inner">
                    <h1>
                        <img src="../images/logo.png" alt="">
                        <span>품질혁신지원시스템</span>
                    </h1>
                    <div class="header-util">
                        <p>홍길동(품질관리팀) 과제 <a href="" class="lx-red">3</a>건, 결제 <a href="" class="lx-red">1</a>건, 교육 <a href="" class="lx-red">1</a>건</p>
                        <ul>
                            <li><a href=""><img src="../images/icon_mypage.png" alt=""><span>마이페이지</span></a></li>
                            <li><a href=""><img src="../images/icon_help.png" alt=""><span>도움말</span></a></li>
                            <li><a href=""><img src="../images/icon_logout.png" alt=""><span>로그아웃</span></a></li>
                            <li><a href=""><img src="../images/icon_admin.png" alt=""></a></li>
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
                                <li><a href="">품질KPI</a></li>
                                <li><a href="">과제/10+ No Policy활동</a></li>
                                <li><a href="">분임조활동</a></li>
                                <li><a href="">제안활동</a></li>
                                <li><a href="">품질인재육성</a></li>
                                <li><a href="">Big Data/커뮤니티</a></li>
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
        </header>
        <div class="dimmed"></div>
        <!-- //header -->
        <!-- container -->
        <div id="container">
            <div id="page-header">
                <div class="inner">
                    <div class="page-category">마이페이지</div>
                    <div id="path">
                        <a href="">홈</a>
                        <span class="arr">&gt;</span>
                        <a href="">마이페이지</a>
                        <span class="arr">&gt;</span>
                        <a href="javascript:void(0);">결재의뢰함</a>
                    </div>
                    <button tpye="button" class="btn-print">
                        <img src="../images/btn_print.png" alt="">
                        <span>인쇄</span>
                    </button>
                </div>
            </div>
            <div id="page-container">
                <div class="inner">
                    <nav id="page-left">
                        <ul class="depth1">                            
                            <li><a href="">결재함</a></li>
                            <li><a href="" class="cur">결재의뢰함</a></li>
                            <li><a href="">교육신청내역</a></li>
                        </ul>
                    </nav>
                    <section id="page-content">
                        <div class="list-wrap">
                            <div class="list-search">
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s5 align-right">
                                            <label>결재종류</label>
                                        </div>
                                        <div class="pd-l10 col s10">
                                        <select name="" id="">
                                            <option value="">전체</option>
                                        </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s7">
                                        <div class="col s2 align-right">
                                            <label>제목</label>
                                        </div>
                                        <div class="pd-l10 col s11">
                                            <input type="text" name="">
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s1">
                                        
                                    </div>
                                    <div class="col s4 align-right"></div>
                                </div>

                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s5 align-right">
                                            <label>결재상태</label>
                                        </div>
                                        <div class="pd-l10 col s10">
                                            <input type="text" name="">
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        
                                            <div class="col s4 align-right">
                                                    <label>조회기간</label>
                                                </div>
                                                <div class="pd-l10 col s10">
                                                    <select name="" id="">
                                                        <option value="">전체</option>
                                                    </select>                                        
                                                </div>
                                        
                                    </div>
                                    <div class="form-inline form-input col s6">                                        
                                        <div class="pd-l10 col s12">
                                            <div class="col s5 input-date">
                                                <input type="text">
                                                <i class="ico calendar"></i>
                                            </div>
                                            <span class="col s1 text-bul align-center">~</span>
                                            <div class="col s5 input-date">
                                                <input type="text">
                                                <i class="ico calendar"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col s2 align-right">
                                        <button type="button" class="btn-submit">조회</button>
                                    </div>
                                </div>
                                
                                
                            </div>
                            <div class="list-header">
                                <p class="title">나의 결재의뢰함</p>
                                <span class="bar"></span>
                                <p class="total">총 10(승인 : 5건, 반려 : 3건, 미결 2건)</p>
                                <select name="limit" class="limit">
                                    <option value="10">10개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="centered even">
                                        <colgroup>
                                            <col style="width:50px">
                                            <col style="width:270px">                                            
                                            <col>
                                            <col style="width:100px">
                                            <col style="width:100px">
                                            <col style="width:120px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray">NO</th>
                                                <th class="bg-gray">결재종류</th>
                                                <th class="bg-gray">결재제목</th>
                                                <th class="bg-gray">결재의뢰일</th>
                                                <th class="bg-gray">결재일</th>
                                                <th class="bg-gray">결재상태</th>                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>10</td>
                                                <td class="align-left">과제 > 6σ Full Process > DMEDI > Define</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 자르기 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>승인</td>                                                
                                            </tr>
                                            <tr>
                                                <td>9</td>
                                                <td class="align-left">분임조과제 > 6σ Full Process > DMEDI > Define</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>반려</td>                                                
                                            </tr>
                                            <tr>
                                                <td>8</td>
                                                <td class="align-left">과제 > 일반과제</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 자르기 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>승인</td>                                                
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td class="align-left">과제 > 10+ No Policy</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>반려</td>                                                
                                            </tr>

                                            <tr>
                                                <td>6</td>
                                                <td class="align-left">과제 > 6σ Full Process > DMEDI > Define</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 자르기 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>승인(1차 70점)</td>                                                
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td class="align-left">실시제안</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>반려</td>                                                
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td class="align-left">쪽지제안</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 자르기 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>승인</td>                                                
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td class="align-left">과제 > 과제선정</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>승인</td>                                                
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td class="align-left">과제 > Drop신청</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 자르기 ...</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>미결</td>                                                
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td class="align-left">분임조과제 > 6σ Full Process > DMAIC > 담계명</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>승인</td>                                                
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">
                                <div class="pagination">
                                    <a href="" class="first">처음</a>
                                    <a href="" class="prev">이전</a>
                                    <a href="" class="cur num">1</a>
                                    <a href="" class="num">2</a>
                                    <a href="" class="num">3</a>
                                    <a href="" class="num">4</a>
                                    <a href="" class="num">5</a>
                                    <a href="" class="next">다음</a>
                                    <a href="" class="last">끝</a>
                                </div>
                                
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- //container -->
        <!-- footer -->
        <footer>
            <div class="inner">
                <div class="footer-logo">
                    <img src="../images/footer_logo.png" alt="LX 하우시스">
                    <span>품질혁신지원시스템</span>
                </div>
                <p class="copyright">COPYRIGHT © 2021 LX HAUSYS. ALL RIGHTS RESERVED.</p>
            </div>
        </footer>
        <!-- //footer -->
        <!-- 조직도 -->
        <div class="modal-dimmed"></div>
        <div class="org-modal">
            <div class="modal-header">
                <h4>조직조회</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="list-wrap">
                    <div class="list-search">
                        <form id="org-form" onsubmit="org_search();return false;">
                            <div class="search-form">
                                <div class="form-inline form-input">
                                    <label>조직명</label>
                                    <input type="text" name="">
                                </div>
                                <button type="submit" class="btn-submit">조회</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="tree-header">
                    <div>
                        <input type="checkbox" id="orgSelAll">
                        <label for="orgSelAll"></label>
                    </div>
                    <div>
                        6σ 인재육성대상 조직명
                    </div>
                </div>
                <div id="org-tree">
                    <ul>
                        <li>창호 사업부
                            <ul>
                                <li>창호.생산담당
                                    <ul>
                                        <li>· 창호.프로파일생산팀</li>
                                        <li>· 창호.기술팀</li>
                                        <li>· 창호.공정혁신팀</li>
                                        <li>· 창호.완성창공정기술팀</li>
                                    </ul>
                                </li>
                                <li>유리</li>
                                <li>연구소 근무</li>
                                <li>창호.시스템창사업담당</li>
                                <li>창호.중문팀</li>
                                <li>바닥재 사업담당	</li>
                            </ul>
                        </li>
                        <li>단열재 사업담당
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>벽지 사업담당	
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>표면소재 사업담당
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>산업용필름 사업담당
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>자동차소재부품 사업부
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>인테리어 사업부
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>연구소
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>품질 담당
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>생산/기술/R&D/품질 外
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="btns">
                    <button type="button" class="btn-submit">확인</button>
                    <button type="button" class="btn-cancel">취소</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>