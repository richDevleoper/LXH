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
                        <!-- breadcrumb -->
                        <div class="breadcrumb">
                            <ul>
                                <li>자동차소재부품 사업부 &gt;</li>
                                <li>경량화사업담당 &gt;</li>
                                <li>자동차소재부품.투명과학플라스틱연구PJT</li>
                            </ul>
                        </div>
                        <!-- //breadcrumb -->
                        <div class="tab-group">
                            <div class="tab-btn">
                                <!-- [D] 현재 활성화된 메뉴에 on클래스 추가해주세요. -->
                                <button type="button" class="on">홍길동</button>
                                <button type="button">이길동</button>
                                <button type="button">이길동</button>
                                <button type="button">이길동</button>
                            </div>
                            <div class="tab-inr">
                                <!-- [D] 현재 활성화된 내용에 on클래스 추가해주세요. -->
                                <div class="tab-box on">
                                    <div class="tab-group underline-type">
                                        <div class="tab-btn">
                                            <button type="button" class="on">과제정보1</button>
                                            <button type="button">과제정보2</button>
                                            <button type="button">과제정보3</button>
                                        </div>
                                        <div class="tab-inr">
                                            <div class="tab-box on">
                                                <p class="content_title">1. 과제정보/수행</p>
                                                <div class="list-wrap">
                                                    <div class="list-content">
                                                        <div class="list-table list">
                                                            <table>
                                                                <caption></caption>
                                                                <colgroup>
                                                                    <col style="width:160px">
                                                                    <col>
                                                                    <col style="width:160px">
                                                                    <col>
                                                                </colgroup>
                                                                <tbody>
                                                                    <tr>
                                                                        <th>과제명</th>
                                                                        <td colspan="3">예시) 진행중인 과제명 </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>6σ Full Process여부</th>
                                                                        <td>6σ Full Process</td>
                                                                        <th>과제유형</th>
                                                                        <td>DMAIC</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>부문</th>
                                                                        <td>바닥재</td>
                                                                        <th>제품군</th>
                                                                        <td>직접입력</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>과제리더벨트</th>
                                                                        <td>MBB</td>
                                                                        <th>활동분야</th>
                                                                        <td>품질개선</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>MBB활용율</th>
                                                                        <td>선택</td>
                                                                        <th>활용율 반영년도</th>
                                                                        <td>2023년</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>일정계획 및 수행</th>
                                                                        <td colspan="3">
                                                                            <div class="list-wrap toggle">
                                                                                <!-- [D] 상태에따라 열기/닫기 텍스트 구분해주세요. -->
                                                                                <span class="blind">열기/닫기</span>
                                                                                <ul>
                                                                                    <!-- [D] 열린상태일 경우 active 클래스를 추가해주세요. -->
                                                                                    <li>
                                                                                        <div class="list-content">
                                                                                            <div class="list-table list">
                                                                                                <table>
                                                                                                    <caption>일정계획 및 수행 테이블</caption>
                                                                                                    <colgroup>
                                                                                                        <col style="width:60px">
                                                                                                        <col style="width:145px">
                                                                                                        <col>
                                                                                                        <col style="width:80px">
                                                                                                        <col style="width:80px">
                                                                                                        <col style="width:80px">
                                                                                                    </colgroup>
                                                                                                    <thead>
                                                                                                        <tr>
                                                                                                            <th>구분</th>
                                                                                                            <th>Define</th>
                                                                                                            <th colspan="4">활동요약</th>
                                                                                                        </tr>
                                                                                                    </thead>
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td colspan="6" class="pd0 border0">
                                                                                                                <div class="toggle-box">
                                                                                                                    <div class="list-table list">
                                                                                                                        <table>
                                                                                                                            <caption>일정계획 및 수행 테이블</caption>
                                                                                                                            <colgroup>
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:145px">
                                                                                                                                <col>
                                                                                                                                <col style="width:80px">
                                                                                                                                <col style="width:80px">
                                                                                                                                <col style="width:80px">
                                                                                                                            </colgroup>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td>계획</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                    <td rowspan="2" colspan="4">
                                                                                                                                        <div class="input-text">
                                                                                                                                            <textarea name="" id="">활동요약 내용(실시결과 내용)</textarea>
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>실시</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>계획</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                    <td rowspan="2">
                                                                                                                                        <div class="input-text">
                                                                                                                                            <textarea name="" id="">활동요약 내용(실시결과 내용)</textarea>
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                    <td>CTQ/CTP</td>
                                                                                                                                    <td>KPI</td>
                                                                                                                                    <td>예상성과</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>실시</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </div>
                                                                                                                    <div class="list-table list">
                                                                                                                        <table>
                                                                                                                            <caption>일정계획 및 수행 테이블</caption>
                                                                                                                            <colgroup>
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:80px">
                                                                                                                                <col>
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:60px">
                                                                                                                            </colgroup>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <th rowspan="2">승인자</th>
                                                                                                                                    <th>참여형태</th>
                                                                                                                                    <th>소속</th>
                                                                                                                                    <th>이름</th>
                                                                                                                                    <th>직위</th>
                                                                                                                                    <th>직책</th>
                                                                                                                                    <th>Belt</th>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>지도사원</td>
                                                                                                                                    <td>자동차소재부품 사업부 &gt; 경량화사업담당 &gt; 자동차소재부품.투명과학플라스틱연구PJT</td>
                                                                                                                                    <td>홍길동</td>
                                                                                                                                    <td>책임</td>
                                                                                                                                    <td>팀장</td>
                                                                                                                                    <td>BB</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <th colspan="2" class="pd-r10 align-right">
                                                                                                                                        첨부파일<br>
                                                                                                                                        (Up to 10)
                                                                                                                                    </th>
                                                                                                                                    <td colspan="5">
                                                                                                                                        <div class="file-list">
                                                                                                                                            <ul>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                            </ul>
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </div>
                                                                                    </li>
                                                                                    <li>
                                                                                        <div class="list-content">
                                                                                            <div class="list-table list">
                                                                                                <table>
                                                                                                    <caption>일정계획 및 수행 테이블</caption>
                                                                                                    <colgroup>
                                                                                                        <col style="width:60px">
                                                                                                        <col style="width:145px">
                                                                                                        <col>
                                                                                                        <col style="width:80px">
                                                                                                        <col style="width:80px">
                                                                                                        <col style="width:80px">
                                                                                                    </colgroup>
                                                                                                    <thead>
                                                                                                        <tr>
                                                                                                            <th>구분</th>
                                                                                                            <th>Define</th>
                                                                                                            <th colspan="4">활동요약</th>
                                                                                                        </tr>
                                                                                                    </thead>
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td colspan="6" class="pd0 border0">
                                                                                                                <div class="toggle-box">
                                                                                                                    <div class="list-table list">
                                                                                                                        <table>
                                                                                                                            <caption>일정계획 및 수행 테이블</caption>
                                                                                                                            <colgroup>
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:145px">
                                                                                                                                <col>
                                                                                                                                <col style="width:80px">
                                                                                                                                <col style="width:80px">
                                                                                                                                <col style="width:80px">
                                                                                                                            </colgroup>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td>계획</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                    <td rowspan="2" colspan="4">
                                                                                                                                        <div class="input-text">
                                                                                                                                            <textarea name="" id="">활동요약 내용(실시결과 내용)</textarea>
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>실시</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>계획</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                    <td rowspan="2">
                                                                                                                                        <div class="input-text">
                                                                                                                                            <textarea name="" id="">활동요약 내용(실시결과 내용)</textarea>
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                    <td>CTQ/CTP</td>
                                                                                                                                    <td>KPI</td>
                                                                                                                                    <td>예상성과</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>실시</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </div>
                                                                                                                    <div class="list-table list">
                                                                                                                        <table>
                                                                                                                            <caption>일정계획 및 수행 테이블</caption>
                                                                                                                            <colgroup>
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:80px">
                                                                                                                                <col>
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:60px">
                                                                                                                            </colgroup>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <th rowspan="2">승인자</th>
                                                                                                                                    <th>참여형태</th>
                                                                                                                                    <th>소속</th>
                                                                                                                                    <th>이름</th>
                                                                                                                                    <th>직위</th>
                                                                                                                                    <th>직책</th>
                                                                                                                                    <th>Belt</th>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>지도사원</td>
                                                                                                                                    <td>자동차소재부품 사업부 &gt; 경량화사업담당 &gt; 자동차소재부품.투명과학플라스틱연구PJT</td>
                                                                                                                                    <td>홍길동</td>
                                                                                                                                    <td>책임</td>
                                                                                                                                    <td>팀장</td>
                                                                                                                                    <td>BB</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <th colspan="2" class="pd-r10 align-right">
                                                                                                                                        첨부파일<br>
                                                                                                                                        (Up to 10)
                                                                                                                                    </th>
                                                                                                                                    <td colspan="5">
                                                                                                                                        <div class="file-list">
                                                                                                                                            <ul>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                            </ul>
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </div>
                                                                                    </li>
                                                                                    <li>
                                                                                        <div class="list-content">
                                                                                            <div class="list-table list">
                                                                                                <table>
                                                                                                    <caption>일정계획 및 수행 테이블</caption>
                                                                                                    <colgroup>
                                                                                                        <col style="width:60px">
                                                                                                        <col style="width:145px">
                                                                                                        <col>
                                                                                                        <col style="width:80px">
                                                                                                        <col style="width:80px">
                                                                                                        <col style="width:80px">
                                                                                                    </colgroup>
                                                                                                    <thead>
                                                                                                        <tr>
                                                                                                            <th>구분</th>
                                                                                                            <th>Define</th>
                                                                                                            <th colspan="4">활동요약</th>
                                                                                                        </tr>
                                                                                                    </thead>
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td colspan="6" class="pd0 border0">
                                                                                                                <div class="toggle-box">
                                                                                                                    <div class="list-table list">
                                                                                                                        <table>
                                                                                                                            <caption>일정계획 및 수행 테이블</caption>
                                                                                                                            <colgroup>
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:145px">
                                                                                                                                <col>
                                                                                                                                <col style="width:80px">
                                                                                                                                <col style="width:80px">
                                                                                                                                <col style="width:80px">
                                                                                                                            </colgroup>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td>계획</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                    <td rowspan="2" colspan="4">
                                                                                                                                        <div class="input-text">
                                                                                                                                            <textarea name="" id="">활동요약 내용(실시결과 내용)</textarea>
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>실시</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>계획</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                    <td rowspan="2">
                                                                                                                                        <div class="input-text">
                                                                                                                                            <textarea name="" id="">활동요약 내용(실시결과 내용)</textarea>
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                    <td>CTQ/CTP</td>
                                                                                                                                    <td>KPI</td>
                                                                                                                                    <td>예상성과</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>실시</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </div>
                                                                                                                    <div class="list-table list">
                                                                                                                        <table>
                                                                                                                            <caption>일정계획 및 수행 테이블</caption>
                                                                                                                            <colgroup>
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:80px">
                                                                                                                                <col>
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:60px">
                                                                                                                            </colgroup>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <th rowspan="2">승인자</th>
                                                                                                                                    <th>참여형태</th>
                                                                                                                                    <th>소속</th>
                                                                                                                                    <th>이름</th>
                                                                                                                                    <th>직위</th>
                                                                                                                                    <th>직책</th>
                                                                                                                                    <th>Belt</th>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>지도사원</td>
                                                                                                                                    <td>자동차소재부품 사업부 &gt; 경량화사업담당 &gt; 자동차소재부품.투명과학플라스틱연구PJT</td>
                                                                                                                                    <td>홍길동</td>
                                                                                                                                    <td>책임</td>
                                                                                                                                    <td>팀장</td>
                                                                                                                                    <td>BB</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <th colspan="2" class="pd-r10 align-right">
                                                                                                                                        첨부파일<br>
                                                                                                                                        (Up to 10)
                                                                                                                                    </th>
                                                                                                                                    <td colspan="5">
                                                                                                                                        <div class="file-list">
                                                                                                                                            <ul>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                            </ul>
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </div>
                                                                                    </li>
                                                                                    <li>
                                                                                        <div class="list-content">
                                                                                            <div class="list-table list">
                                                                                                <table>
                                                                                                    <caption>일정계획 및 수행 테이블</caption>
                                                                                                    <colgroup>
                                                                                                        <col style="width:60px">
                                                                                                        <col style="width:145px">
                                                                                                        <col>
                                                                                                        <col style="width:80px">
                                                                                                        <col style="width:80px">
                                                                                                        <col style="width:80px">
                                                                                                    </colgroup>
                                                                                                    <thead>
                                                                                                        <tr>
                                                                                                            <th>구분</th>
                                                                                                            <th>Define</th>
                                                                                                            <th colspan="4">활동요약</th>
                                                                                                        </tr>
                                                                                                    </thead>
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td colspan="6" class="pd0 border0">
                                                                                                                <div class="toggle-box">
                                                                                                                    <div class="list-table list">
                                                                                                                        <table>
                                                                                                                            <caption>일정계획 및 수행 테이블</caption>
                                                                                                                            <colgroup>
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:145px">
                                                                                                                                <col>
                                                                                                                                <col style="width:80px">
                                                                                                                                <col style="width:80px">
                                                                                                                                <col style="width:80px">
                                                                                                                            </colgroup>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td>계획</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                    <td rowspan="2" colspan="4">
                                                                                                                                        <div class="input-text">
                                                                                                                                            <textarea name="" id="">활동요약 내용(실시결과 내용)</textarea>
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>실시</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>계획</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                    <td rowspan="2">
                                                                                                                                        <div class="input-text">
                                                                                                                                            <textarea name="" id="">활동요약 내용(실시결과 내용)</textarea>
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                    <td>CTQ/CTP</td>
                                                                                                                                    <td>KPI</td>
                                                                                                                                    <td>예상성과</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>실시</td>
                                                                                                                                    <td>2023.01.01</td>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </div>
                                                                                                                    <div class="list-table list">
                                                                                                                        <table>
                                                                                                                            <caption>일정계획 및 수행 테이블</caption>
                                                                                                                            <colgroup>
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:80px">
                                                                                                                                <col>
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:60px">
                                                                                                                                <col style="width:60px">
                                                                                                                            </colgroup>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <th rowspan="2">승인자</th>
                                                                                                                                    <th>참여형태</th>
                                                                                                                                    <th>소속</th>
                                                                                                                                    <th>이름</th>
                                                                                                                                    <th>직위</th>
                                                                                                                                    <th>직책</th>
                                                                                                                                    <th>Belt</th>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>지도사원</td>
                                                                                                                                    <td>자동차소재부품 사업부 &gt; 경량화사업담당 &gt; 자동차소재부품.투명과학플라스틱연구PJT</td>
                                                                                                                                    <td>홍길동</td>
                                                                                                                                    <td>책임</td>
                                                                                                                                    <td>팀장</td>
                                                                                                                                    <td>BB</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <th colspan="2" class="pd-r10 align-right">
                                                                                                                                        첨부파일<br>
                                                                                                                                        (Up to 10)
                                                                                                                                    </th>
                                                                                                                                    <td colspan="5">
                                                                                                                                        <div class="file-list">
                                                                                                                                            <ul>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                                <li>
                                                                                                                                                    <div class="input-text">
                                                                                                                                                        <input type="text" id="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]" readonly>
                                                                                                                                                    </div>
                                                                                                                                                </li>
                                                                                                                                            </ul>
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </div>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>키워드</th>
                                                                        <td colspan="3">키워드1, 키워드2, 키워드3, 키워드4, 키워드5</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <p class="content_title">2. 팀구성 및 승인자</p>
                                                        <div class="list-wrap">
                                                            <div class="list-content">
                                                                <div class="list-table list">
                                                                    <table class="centered">
                                                                        <caption></caption>
                                                                        <colgroup>
                                                                            <col style="width:160px">
                                                                            <col>
                                                                            <col style="width:60px">
                                                                            <col style="width:60px">
                                                                            <col style="width:60px">
                                                                            <col style="width:60px">
                                                                        </colgroup>
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="align-right" style="padding-right:23px">참여형태</th>
                                                                                <th>소속</th>
                                                                                <th>이름</th>
                                                                                <th>직위</th>
                                                                                <th>직책</th>
                                                                                <th>Belt</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th>과제리더</th>
                                                                                <td class="align-left">자동차소재부품 사업부 &gt; 경량화사업담당 &gt; 자동차소재부품.투명과학플라스틱연구PJT</td>
                                                                                <td><b>홍길동</b></td>
                                                                                <td>책임</td>
                                                                                <td>팀장</td>
                                                                                <td>MBB</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>팀멤버</th>
                                                                                <td class="align-left">자동차소재부품 사업부 &gt; 경량화사업담당 &gt; 자동차소재부품.투명과학플라스틱연구PJT</td>
                                                                                <td><b>홍길동</b></td>
                                                                                <td>책임</td>
                                                                                <td>팀장</td>
                                                                                <td>MBB</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>팀멤버</th>
                                                                                <td class="align-left">자동차소재부품 사업부 &gt; 경량화사업담당 &gt; 자동차소재부품.투명과학플라스틱연구PJT</td>
                                                                                <td><b>홍길동</b></td>
                                                                                <td>책임</td>
                                                                                <td>팀장</td>
                                                                                <td>MBB</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>팀멤버</th>
                                                                                <td class="align-left">자동차소재부품 사업부 &gt; 경량화사업담당 &gt; 자동차소재부품.투명과학플라스틱연구PJT</td>
                                                                                <td><b>홍길동</b></td>
                                                                                <td>책임</td>
                                                                                <td>팀장</td>
                                                                                <td>MBB</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>과제지도/사원</th>
                                                                                <td class="align-left">자동차소재부품 사업부 &gt; 경량화사업담당 &gt; 자동차소재부품.투명과학플라스틱연구PJT</td>
                                                                                <td><b>홍길동</b></td>
                                                                                <td>책임</td>
                                                                                <td>팀장</td>
                                                                                <td>MBB</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th class="color primary">Process Owner</th>
                                                                                <td class="align-left">자동차소재부품 사업부 &gt; 경량화사업담당 &gt; 자동차소재부품.투명과학플라스틱연구PJT</td>
                                                                                <td><b>홍길동</b></td>
                                                                                <td>책임</td>
                                                                                <td>팀장</td>
                                                                                <td>MBB</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th class="color primary">챔피언</th>
                                                                                <td class="align-left">자동차소재부품 사업부 &gt; 경량화사업담당 &gt; 자동차소재부품.투명과학플라스틱연구PJT</td>
                                                                                <td><b>홍길동</b></td>
                                                                                <td>책임</td>
                                                                                <td>팀장</td>
                                                                                <td>MBB</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <p class="content_title">3. 성과 및 주요지표</p>
                                                        <div class="list-wrap">
                                                            <div class="list-content">
                                                                <div class="list-table list">
                                                                    <table class="centered">
                                                                        <caption></caption>
                                                                        <colgroup>
                                                                            <col style="width:120px">
                                                                            <col>
                                                                            <col style="width:120px">
                                                                            <col>
                                                                            <col style="width:120px">
                                                                            <col>
                                                                        </colgroup>
                                                                        <thead>
                                                                            <tr>
                                                                                <th colspan="6">예상성과</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th class="align-center">성과항목</th>
                                                                                <td>성과항목1</td>
                                                                                <th class="align-center">년내(당해년)</th>
                                                                                <td>10억</td>
                                                                                <th class="align-center">산출 Logic</th>
                                                                                <td>산출로직정보</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th class="align-center">성과항목</th>
                                                                                <td>성과항목2</td>
                                                                                <th class="align-center">년내(당해년)</th>
                                                                                <td>10억</td>
                                                                                <th class="align-center">산출 Logic</th>
                                                                                <td>산출로직정보</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="list-table list">
                                                                    <table class="centered">
                                                                        <caption></caption>
                                                                        <colgroup>
                                                                            <col style="width:100px">
                                                                            <col style="width:100px">
                                                                            <col style="width:100px">
                                                                            <col style="width:100px">
                                                                            <col style="width:100px">
                                                                            <col style="width:100px">
                                                                            <col style="width:100px">
                                                                            <col style="width:100px">
                                                                        </colgroup>
                                                                        <thead>
                                                                            <tr>
                                                                                <th colspan="4">Project Y (CTQ / CTP)</th>
                                                                                <th colspan="4">KPI</th>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>항목</th>
                                                                                <th>단위</th>
                                                                                <th>개선전</th>
                                                                                <th>개선목표</th>
                                                                                <th>항목</th>
                                                                                <th>단위</th>
                                                                                <th>개선전</th>
                                                                                <th>개선목표</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>항목1</td>
                                                                                <td>단위1</td>
                                                                                <td>10</td>
                                                                                <td>10</td>
                                                                                <td>항목1</td>
                                                                                <td>단위1</td>
                                                                                <td>10</td>
                                                                                <td>10</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>항목2</td>
                                                                                <td>단위2</td>
                                                                                <td>10</td>
                                                                                <td>10</td>
                                                                                <td>항목2</td>
                                                                                <td>단위2</td>
                                                                                <td>10</td>
                                                                                <td>10</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <p class="content_title">4. 과제등록서</p>
                                                        <div class="list-wrap">
                                                            <div class="list-content">
                                                                <div class="list-table list">
                                                                    <table class="centered">
                                                                        <caption></caption>
                                                                        <colgroup>
                                                                            <col style="width:175px">
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
                                                    </div>
                                                    <div class="list-footer">
                                                        <div class="list-btns">
                                                            <button type="button" class="btn-excel">
                                                                <img src="/assets/images/icon_excel.png" alt="">
                                                                <span>다운로드</span>
                                                            </button>
                                                            <a href="">목록</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-box"></div>
                                            <div class="tab-box"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-box"></div>
                                <div class="tab-box"></div>
                                <div class="tab-box"></div>
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