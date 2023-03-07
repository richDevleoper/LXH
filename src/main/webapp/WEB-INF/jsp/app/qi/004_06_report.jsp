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
                                        <div class="col s3 align-right">
                                            <label>제안명</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <input type="text" name="">
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>조직</label>
                                        </div>
                                        <div class="pd-l10 form-inline form-input col s8">
                                            <input type="text" name="">
                                            <button type="button" class="btn-org">검색</button>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s5 align-right">
                                            <label>등급 평가마감</label>
                                        </div>
                                        <div class="pd-l10 col s7">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>제안자</label>
                                        </div>
                                        <div class="pd-l10 form-inline form-input col s8">
                                            <input type="text" name="">
                                            <button type="button" class="btn-org">검색</button>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>실시/쪽지</label>
                                        </div>
                                        <div class="pd-l10 col s8">
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
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>제안유형</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s6">
                                        <div class="col s2 align-right">
                                            <label>조회기간</label>
                                        </div>
                                        <div class="pd-l10 col s10">
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
                                <p class="title">전체</p>
                                <span class="bar"></span>
                                <P>총 100 (실시제안 50, 쪽지제안 50)</P>
                            </div>
                            <div class="list-content">
                                <div class="row">
                                    <div class="list-table list col s8 pd-r10">
                                        <table class="centered odd">
                                            <caption></caption>
                                            <colgroup>
                                                <col style="width:70px">
                                                <col style="width:70px">
                                                <col>
                                                <col>
                                                <col>
                                                <col>
                                                <col>
                                                <col>
                                                <col>
                                                <col>
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th class="bg-gray" colspan="2" rowspan="2">구분</th>
                                                    <th class="bg-gray" colspan="8">실시제안</th>
                                                </tr>
                                                <tr>
                                                    <th class="bg-gray">계</th>
                                                    <th class="bg-gray">S급</th>
                                                    <th class="bg-gray">A급</th>
                                                    <th class="bg-gray">B급</th>
                                                    <th class="bg-gray">C급</th>
                                                    <th class="bg-gray">D급</th>
                                                    <th class="bg-gray">E급</th>
                                                    <th class="bg-gray">심사중</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="bg-gray" colspan="2">건수</td>
                                                    <td>50</td>
                                                    <td>10</td>
                                                    <td>10</td>
                                                    <td>10</td>
                                                    <td>10</td>
                                                    <td>10</td>
                                                    <td>10</td>
                                                    <td>10</td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-gray" rowspan="2">포상액</td>
                                                    <td class="bg-gray">지급완료</td>
                                                    <td>25</td>
                                                    <td>5</td>
                                                    <td>5</td>
                                                    <td>5</td>
                                                    <td>5</td>
                                                    <td>5</td>
                                                    <td>5</td>
                                                    <td>5</td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-gray">미지급</td>
                                                    <td>25</td>
                                                    <td>5</td>
                                                    <td>5</td>
                                                    <td>5</td>
                                                    <td>5</td>
                                                    <td>5</td>
                                                    <td>5</td>
                                                    <td>5</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="list-table list col s4">
                                        <table class="centered mg-l10">
                                            <caption></caption>
                                            <colgroup>
                                                <col style="width:70px">
                                                <col style="width:70px">
                                                <col>
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th class="bg-gray" colspan="2">구분</th>
                                                    <th class="bg-gray">쪽지제안</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="bg-gray" colspan="2">건수</td>
                                                    <td>50</td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-gray" rowspan="2">포상액</td>
                                                    <td class="bg-gray">지급완료</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-gray">미지급</td>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="list-footer mg-t10">
                                <div class="list-btns">
                                    <button type="button" class="btn-excel">
                                        <img src="../images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="list-wrap mg-t20">
                            <div class="list-header mg-t20">
                                <p class="title">목록</p>
                                <span class="bar"></span>
                                <select name="limit" class="limit">
                                    <option value="10">10개</option>
                                    <option value="50">50개</option>
                                    <option value="100">100개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="even">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:50px">
                                            <col style="width:50px">
                                            <col>
                                            <col style="width:80px">
                                            <col style="width:80px">
                                            <col style="width:150px">
                                            <col>
                                            <col style="width:80px">
                                            <col style="width:80px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray font-weight-bold">NO</th>
                                                <th class="bg-gray font-weight-bold">구분</th>
                                                <th class="bg-gray font-weight-bold">제안명</th>
                                                <th class="bg-gray font-weight-bold">제안자</th>
                                                <th class="bg-gray font-weight-bold">제안유형</th>
                                                <th class="bg-gray font-weight-bold">조직명</th>
                                                <th class="bg-gray font-weight-bold">등급</th>
                                                <th class="bg-gray font-weight-bold">포상액</th>
                                                <th class="bg-gray font-weight-bold">마감(제안)일</th>
                                            </tr>                                            
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>10</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>생산성향상</td>
                                                <td>조직명</td>
                                                <td>S급</td>
                                                <td>지급완료</td>
                                                <td>2023.01.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>9</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>원가개선</td>
                                                <td>조직명</td>
                                                <td>S급</td>
                                                <td>미지급</td>
                                                <td>2023.01.30</td>                                                
                                            </tr>     
                                            <tr>
                                                <td>8</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>에너지</td>
                                                <td>조직명</td>
                                                <td>S급</td>
                                                <td>지급완료</td>
                                                <td>2023.01.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>생산성향상</td>
                                                <td>조직명</td>
                                                <td>S급</td>
                                                <td>미지급</td>
                                                <td>2023.01.30</td>                                                
                                            </tr>   
                                            <tr>
                                                <td>6</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>원가개선</td>
                                                <td>조직명</td>
                                                <td>심사중</td>
                                                <td>지급완료</td>
                                                <td>2023.01.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>에너지</td>
                                                <td>조직명</td>
                                                <td>S급</td>
                                                <td>미지급</td>
                                                <td>2023.01.30</td>                                                
                                            </tr>     
                                            <tr>
                                                <td>4</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>생산성향상</td>
                                                <td>조직명</td>
                                                <td>S급</td>
                                                <td>지급완료</td>
                                                <td>2023.01.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>원가개선</td>
                                                <td>조직명</td>
                                                <td>S급</td>
                                                <td>미지급</td>
                                                <td>2023.01.30</td>                                                
                                            </tr>    
                                            <tr>
                                                <td>2</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>에너지</td>
                                                <td>조직명</td>
                                                <td>S급</td>
                                                <td>지급완료</td>
                                                <td>2023.01.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>기타</td>
                                                <td>조직명</td>
                                                <td>S급</td>
                                                <td>미지급</td>
                                                <td>2023.01.30</td>                                                
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
                                <div class="list-btns">
                                    <button type="button" class="btn-excel">
                                        <img src="../images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    
</body>
</html>