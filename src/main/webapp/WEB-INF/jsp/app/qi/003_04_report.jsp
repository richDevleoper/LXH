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
                                            <label>조회기간</label>
                                        </div>
                                        <div class="pd-l10 col s12">
                                            <div class="col s5 input-date">
                                                <input type="text">
                                                <i class="ico calendar"></i>
                                            </div>
                                            <span class="col s1 text-bul align-center">~</span>
                                            <div class="col s6 input-date">
                                                <input type="text">
                                                <i class="ico calendar"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s6 align-right">
                                            <label>조직</label>
                                        </div>
                                        <div class="pd-l10 col s6">
                                            <input type="text" name="">
                                            <button type="button" class="btn-org">검색</button>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s7 align-right">
                                            <label>사업장</label>
                                        </div>
                                        <div class="pd-l10 col s12">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s6 align-right">
                                            <label>6σ Full Process 여부</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s6 align-right">
                                            <label>과제유형</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s5 align-right">
                                            <label>과제리더밸트</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s6 align-right">
                                            <label>활동분야</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s6 align-right">
                                            <label>진행현황</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="col s8 align-right">
                                        <button type="button" class="btn-submit">조회</button>
                                    </div>
                                </div>
                            </div>

                            <div class="list-header">
                                <p class="title">검색결과(Report)</p>                                
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="centered odd">
                                        <caption></caption>
                                            <colgroup>
                                                <col style="width:30px">
                                                <col style="width:60px">
                                                <col>
                                                <col>
                                                <col>
                                            </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray font-weight-bold" rowspan="2" colspan="2">구분</th>
                                                <th class="bg-gray font-weight-bold" rowspan="2">년내 Total</th>
                                                <th class="font-weight-bold" colspan="5">활동 실적(년내)</th>
                                                <th class="font-weight-bold" colspan="5">활동 실적(년간)</th>                                                
                                            </tr>      
                                            <tr>
                                                <th>품질개선</th>
                                                <th>개발</th>
                                                <th>생산성향상</th>
                                                <th>원가개선</th>
                                                <th>기타</th>
                                                <th>품질개선</th>
                                                <th>개발</th>
                                                <th>생산성향상</th>
                                                <th>원가개선</th>
                                                <th>기타</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="bg-white">
                                                <th class="bg-gray font-weight-bold" colspan="2">과제수(건)</th>
                                                <th class="bg-gray font-weight-bold">65</th>
                                                <td>8</td>
                                                <td>8</td>
                                                <td>8</td>
                                                <td>8</td>
                                                <td>8</td>
                                                <td>8</td>
                                                <td>8</td>
                                                <td>8</td>
                                                <td>8</td>
                                                <td>8</td>                                                
                                            </tr>
                                            <tr>
                                                <th class="bg-gray font-weight-bold" rowspan="3">예상효과</th>
                                                <th class="bg-gray font-weight-bold" >외부실패</th>
                                                <td class="bg-gray font-weight-bold">22.2</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                            </tr>
                                            <tr class="bg-white">
                                                <th class="bg-gray font-weight-bold">내부실패</th>
                                                <td class="bg-gray font-weight-bold">-</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                            </tr>
                                            <tr>
                                                <th class="bg-gray font-weight-bold">영업이익</th>
                                                <td class="bg-gray font-weight-bold">-</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                            </tr>
                                            <tr class="bg-white">
                                                <th class="bg-gray font-weight-bold" colspan="2">매출액</th>
                                                <th class="bg-gray font-weight-bold">80.4</th>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">                               
                                <div class="list-btns">
                                    <button type="button" class="btn-excel">
                                        <img src="/assets/images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>                                    
                                </div>

                            </div>
                        </div>

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