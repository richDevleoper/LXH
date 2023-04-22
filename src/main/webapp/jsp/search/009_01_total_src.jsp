<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld"%>

<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<title>${fn:split(boardVO.boardNm,'>')[fn:length(fn:split(boardVO.boardNm,'>'))-1]}</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
    <div id="wrap">

        <div class="dimmed"></div>
        <!-- //header -->
        <!-- container -->
        <div id="container">
            <div id="page-header">
                <div class="inner">
                    <div class="page-category search">통합검색</div>
                    <div class="search-box">
                        <div class="search-form">
                            <form method="GET">
                                <span>전체</span>
                                <input type="text" name="" placeholder="검색어를 입력하세요">
                                <button type="submit" class="btn-search">검색</button>
                            </form>
                        </div>
                    </div>
                    <button tpye="button" class="btn-print">
                        <img src="/assets/images/btn_print.png" alt="">
                        <span>인쇄</span>
                    </button>
                </div>
            </div>
            <div id="page-container">
                <div class="inner">
                    <div class="new_group">
                        <div class="tab-group">
                            <div class="tab-btn center">
                                <!-- [D] 현재 활성화된 메뉴에 on클래스 추가해주세요. -->
                                <button type="button">과제검색</button>
                                <button type="button">분임조 과제검색</button>
                                <button type="button">제안검색</button>
                                <button type="button">10+ No Policy</button>
                                <button type="button">커뮤니티</button>
                                <button type="button" class="on">상세검색</button>
                            </div>
                            <div class="tab-inr">
                                <div class="tab-box"></div>
                                <div class="tab-box"></div>
                                <div class="tab-box"></div>
                                <div class="tab-box"></div>
                                <div class="tab-box"></div>
                                <div class="tab-box on">
                                    <div class="list-header mg-t20">
                                        <p class="title">조회된 과제</p>
                                        <span class="bar"></span>
                                        <p class="total">총 100</p>
                                        <select name="limit" class="limit">
                                            <option value="10">10개</option>
                                            <option value="50">50개</option>
                                            <option value="100">100개</option>
                                        </select>
                                    </div>
                                    <section class="new_list" style="width: 100% !important;">
                                        <div class="inr">
                                            <ul>
                                                <li class="border">
                                                    <div>
                                                        <ul>
                                                            <li class="title">
                                                                <span>진행중(On-track)</span>
                                                            </li>
                                                            <li>
                                                                <span>6σ Full Process</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <p class="list">
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
                                                    <div>
                                                        <ul>
                                                            <li class="title gray">
                                                                <span>Drop</span>
                                                            </li>
                                                            <li>
                                                                <span>6σ Full Process</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <p class="list">
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
                                                    <div>
                                                        <ul>
                                                            <li class="title">
                                                                <span>진행중(On-track)</span>
                                                            </li>
                                                            <li>
                                                                <span>6σ Full Process</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <p class="list">
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
                                                    <div>
                                                        <ul>
                                                            <li class="title">
                                                                <span>진행중(On-track)</span>
                                                            </li>
                                                            <li>
                                                                <span>6σ Full Process</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <p class="list">
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
                                                    <div>
                                                        <ul>
                                                            <li class="title">
                                                                <span>진행중(On-track)</span>
                                                            </li>
                                                            <li>
                                                                <span>6σ Full Process</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <p class="list">
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
                                                    <div>
                                                        <ul>
                                                            <li class="title">
                                                                <span>진행중(On-track)</span>
                                                            </li>
                                                            <li>
                                                                <span>6σ Full Process</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <p class="list">
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
                                                    <div>
                                                        <ul>
                                                            <li class="title">
                                                                <span>진행중(On-track)</span>
                                                            </li>
                                                            <li>
                                                                <span>6σ Full Process</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <p class="list">
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
                                                    <div>
                                                        <ul>
                                                            <li class="title">
                                                                <span>진행중(On-track)</span>
                                                            </li>
                                                            <li>
                                                                <span>6σ Full Process</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <p class="list">
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
                                                    <div>
                                                        <ul>
                                                            <li class="title">
                                                                <span>진행중(On-track)</span>
                                                            </li>
                                                            <li>
                                                                <span>6σ Full Process</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <p class="list">
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
                                                    <div>
                                                        <ul>
                                                            <li class="title">
                                                                <span>진행중(On-track)</span>
                                                            </li>
                                                            <li>
                                                                <span>6σ Full Process</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <p class="list">
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                            </ul>
                                        </div>
                                    </section>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- //container -->

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

</body>
</html>