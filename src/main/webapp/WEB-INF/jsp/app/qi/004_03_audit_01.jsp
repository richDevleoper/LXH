<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>

<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
	<title>${fn:split(boardVO.boardNm,'>')[fn:length(fn:split(boardVO.boardNm,'>'))-1]}</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
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
                    <div class="page-category">제안활동</div>
                    <div id="path">
                        <a href="">홈</a>
                        <span class="arr">></span>
                        <a href="">제안활동</a>
                        <span class="arr">></span>
                        <a href="">제안심사(관리)</a>                        
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
                            <li>
                                <a href="javascript:void(0)" class="has-depth">나의 제안</a>
                                <ul class="depth2">
                                    <li><a href="">실시 제안</a></li>
                                    <li><a href="">쪽지 제안</a></li>
                                </ul>
                            </li>
                            <li><a href="">제안 검색</a></li>
                            <li><a href="" class="cur">제안 심사(관리)</a></li>
                            <li>
                                <a href="javascript:void(0)" class="has-depth">제안 마감(관리)</a>
                                <ul class="depth2">
                                    <li><a href="">등급평가</a></li>
                                    <li><a href="">비용지급</a></li>
                                </ul>
                            </li>
                            <li><a href="">10+ No Policy</a></li>
                            <li><a href="">Report(관리)</a></li>
                        </ul>
                    </nav>
                    <section id="page-content">
                        <!-- breadcrumb -->
                        <div class="breadcrumb">
                            <ul>
                                <li>실시 제안정보</li>
                            </ul>
                        </div>
                        <p class="content_title">1. 실시 제안 정보</p>
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:180px">
                                            <col>
                                            <col style="width:180px">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th><label for="text1"><span class="asterisk">*</span>제안명</label></th>
                                                <td colspan="3">제안내용</td>
                                            </tr>
                                            <tr>
                                                <th><label for="text2"><span class="asterisk">*</span>제안자</label></th>
                                                <td>제안자</td>
                                                <th><label for="text3"><span class="asterisk">*</span>관련 쪽지 제안</label></th>
                                                <td>관련 쪽지</td>
                                            </tr>
                                            <tr>
                                                <th><span class="asterisk">*</span>조직명</th>
                                                <td>조직명1</td>
                                                <th><span class="asterisk">*</span>분임조</th>
                                                <td>분임조명1</td>
                                            </tr>
                                            <tr>
                                                <th><label for="select1"><span class="asterisk">*</span>제안유형</label></th>
                                                <td>제안유형1</td>
                                                <th><label for="text4"><span class="asterisk">*</span>제안일</label></th>
                                                <td>2023.06.30</td>
                                            </tr>
                                            <tr>
                                                <th><label for="text5"><span class="asterisk">*</span>실행 완료일</label></th>
                                                <td>2023.06.30</td>
                                                <th><label for="select1"><span class="asterisk">*</span>년간 효과금액</label></th>
                                                <td>년간 20억</td>
                                            </tr>
                                            <tr>
                                                <th colspan="4" class="align-center"><span class="asterisk">*</span>제안내용</th>
                                            </tr>
                                            <tr>
                                                <th><label for="text6">현상 및 문제점</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text6" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text7">개선내용</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text7" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text8">기대효과</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text8" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>활동결과</th>
                                                <td colspan="3" class="pd0">
                                                    <div class="list-wrap" style="margin:-1px">
                                                        <div class="list-content">
                                                            <div class="list-table list">
                                                                <table class="centered">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col style="width:50%">
                                                                        <col>
                                                                    </colgroup>
                                                                    <thead>
                                                                        <tr>
                                                                            <th>개선 전</th>
                                                                            <th>개선 후</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="themb-box">
                                                                                    <figure>
                                                                                        <img src="../images/@sample.jpg" alt="" class="btn-org">
                                                                                    </figure>
                                                                                    <button type="button" class="themb_del"><i class="ico file_del"><em>파일삭제</em></i></button>
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="themb-box">
                                                                                    <figure>
                                                                                        <img src="../images/@sample.jpg" alt="" class="btn-org">
                                                                                    </figure>
                                                                                    <button type="button" class="themb_del"><i class="ico file_del"><em>파일삭제</em></i></button>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="themb-box">
                                                                                    <figure>
                                                                                        <img src="../images/@sample.jpg" alt="" class="btn-org">
                                                                                    </figure>
                                                                                    <button type="button" class="themb_del"><i class="ico file_del"><em>파일삭제</em></i></button>
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="themb-box">
                                                                                    <figure>
                                                                                        <img src="../images/@sample.jpg" alt="" class="btn-org">
                                                                                    </figure>
                                                                                    <button type="button" class="themb_del"><i class="ico file_del"><em>파일삭제</em></i></button>
                                                                                </div>
                                                                            </td>
                                                                        </tr>                                                                        
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><span class="asterisk">*</span>결재자 지정</th>
                                                <td colspan="3" class="pd0">
                                                    <div class="list-wrap" style="margin:-1px">
                                                        <div class="list-content">
                                                            <div class="list-table list">
                                                                <table class="centered">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col>
                                                                        <col style="width:70px">
                                                                        <col style="width:70px">
                                                                        <col style="width:70px">
                                                                        <col style="width:70px">
                                                                    </colgroup>
                                                                    <thead>
                                                                        <tr>
                                                                            <th>소속</th>
                                                                            <th>이름</th>
                                                                            <th>직위</th>
                                                                            <th>직책</th>
                                                                            <th>Belt</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr></tr>
                                                                        <td class="pd3">소속정보1</td>
                                                                        <td>홍길동</td>
                                                                        <td>책임</td>
                                                                        <td>팀장</td>
                                                                        <td>MBB</td>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <p class="content_title">2. 첨부파일</p>
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table class="centered">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:180px">
                                            <col>
                                        </colgroup>
                                        <tbody>                                            
                                            <tr>
                                                <th>첨부파일 (조회)</th>
                                                <td>
                                                    <div class="file-link">
                                                        <ul>
                                                            <li><a href="#" title="다운받기">UI표준정의서.pptx</a><a href="#" title="다운받기" class="btn color gray mg-l15">다운받기</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <p class="content_title">승인/반려_결재이력</p>
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table class="centered">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:160px">
                                            <col style="width:80px">
                                            <col style="width:60px">
                                            <col style="width:120px">
                                            <col style="width:130px">
                                            <col>
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>결재상태 및 결재일</th>
                                                <th>결재자</th>
                                                <th>직책</th>
                                                <th>결재종류</th>
                                                <th>평가점수(등급)</th>
                                                <th>결재의견</th>                                                
                                            </tr>
                                        <tbody>
                                            <tr>
                                                <td>1차 승인(2023.06.30)</td>
                                                <td>홍길동</td>
                                                <td>실장</td>
                                                <td>제안>실시제안</td>
                                                <td>70점(C)</td>
                                                <td>수고하셨습니다. 2차 팀장님 결재 의뢰</td>                                                
                                            </tr>
                                            <tr>
                                                <td>2차 승인(2023.06.30)</td>
                                                <td>홍길동</td>
                                                <td>실장</td>
                                                <td>제안>실시제안</td>
                                                <td>90점(A)</td>
                                                <td>심의위원회 제안을 상정하였습니다. 오프라인 제안 심의 후 등급 평가완료 예정</td>
                                            </tr>
                                        </tbody>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="list-footer">
                            <div class="list-btns">
                                <button type="button" class="btn light-gray">저장</button>
                                <button type="button" class="btn bg-gray">결제의뢰</button>
                                <button type="button" class="btn bg-gray">Drop신청</button>
                                <a href="#" class="btn">목록</a>
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
                <h4>이미지 크게보기</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <figure>
                    <img src="../images/@sample.jpg" width="100%" alt="">
                </figure>
            </div>
        </div>
    </div>
</body>
</html>