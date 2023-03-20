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
                        <div class="list-wrap">
                            <div class="list-search">
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s2 align-right">
                                            <label>제안명</label>
                                        </div>
                                        <div class="pd-l10 col s10">
                                            <input type="text" name="">
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s5 align-right">
                                            <label>조직</label>
                                        </div>
                                        <div class="pd-l10 col s7">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s5 align-right">
                                            <label>사업장</label>
                                        </div>
                                        <div class="pd-l10 col s7">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s8">
                                        <div class="col s2 align-right">
                                            <label>제안자</label>
                                        </div>
                                        <div class="pd-l10 col s2">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                        <div class="pd-l10 col s3">
                                            <input type="text" name="">
                                        </div>
                                        <div class="col s2 align-right">
                                            <label>실시/쪽지</label>
                                        </div>
                                        <div class="pd-l10 col s3">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s5 align-right">
                                            <label>등급</label>
                                        </div>
                                        <div class="pd-l10 col s7">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="search-form row">
                                    <div class="form-inline form-input col s10">
                                        <div class="col s2 align-right">
                                            <label>진행구분</label>
                                        </div>
                                        <div class="pd-l10 col s5">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                        <div class="col s2 align-right">
                                            <label>진행단계</label>
                                        </div>
                                        <div class="pd-l10 col s5">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                        <div class="col s2 align-right">
                                            <label>제안일</label>
                                        </div>
                                        <div class="pd-l10 col s6">
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
                            <div class="new_group">
                                <div class="list-header mg-t20">
                                    <p class="title">조회된 제안</p>
                                    <span class="bar"></span>
                                    <p class="total">총 100</p>
                                    <select name="limit" class="limit">
                                        <option value="10">10개</option>
                                        <option value="50">50개</option>
                                        <option value="100">100개</option>
                                    </select>
                                </div>
                                <div class="new_list">
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
                                                    <a href="/app/004_02_search_01.do?menuKey=36" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
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
                                        <div class="list-btns">
                                            <button type="button" class="btn-excel">
                                                <img src="/assets/images/icon_excel.png" alt="">
                                                <span>다운로드</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                   
</body>
</html>