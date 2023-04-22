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
                        <div class="tab-group">
                            <div class="tab-btn">
                                <button type="button" class="on">6σ 인재 관리 대상</button>
                                <button type="button">팀장MBB 관리 대상</button>
                            </div>
                            <div class="tab-inr">
                                <div class="tab-box on">
                                    <div class="list-wrap">
                                        <div class="list-header mg-t20">
                                            <p class="title">대상연도 선택</p>
                                            <select name="limit" class="limit">
                                                <option value="10">2023년</option>
                                            </select>
                                        </div>
                                        <div class="list-content">
                                            <div class="list-group">
                                                <div class="inr">
                                                    <p>6σ 인재 관리 대상 선정</p>
                                                    <div class="tree-list">
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
                                                </div>
                                                <div class="inr">
                                                    <p>사원목록<span>총 8명</span></p>
                                                    <div class="tree-check">
                                                        <ul>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <thead>
                                                                                <tr>
                                                                                    <th><span>이름</span></th>
                                                                                    <th><span>직책</span></th>
                                                                                    <th><span>학력</span></th>
                                                                                    <th><span>직무</span></th>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="list-wrap">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <colgroup>
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                                <col style="width:25%">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><span>홍길동</span></td>
                                                                                    <td><span>담당</span></td>
                                                                                    <td><span>대졸</span></td>
                                                                                    <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="inr border0">
                                                    <div class="box">
                                                        <p>생산/기술/R&D/품질 인재<span>총 8명</span></p>
                                                        <div class="tree-check">
                                                            <ul>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th><span>이름</span></th>
                                                                                        <th><span>직책</span></th>
                                                                                        <th><span>학력</span></th>
                                                                                        <th><span>직무</span></th>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="btn-group">
                                                            <button type="button"><i class="ico add"><em>추가</em></i></button>
                                                            <button type="button"><i class="ico del"><em>삭제</em></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="box">
                                                        <p>생산/기술/R&D/품질 인재<span>총 8명</span></p>
                                                        <div class="tree-check">
                                                            <ul>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th><span>이름</span></th>
                                                                                        <th><span>직책</span></th>
                                                                                        <th><span>학력</span></th>
                                                                                        <th><span>직무</span></th>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="list-wrap">
                                                                        <div class="list-table list">
                                                                            <table>
                                                                                <colgroup>
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                    <col style="width:25%">
                                                                                </colgroup>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><span>홍길동</span></td>
                                                                                        <td><span>담당</span></td>
                                                                                        <td><span>대졸</span></td>
                                                                                        <td><span>직무1직무1직무1직무1직무1</span></td>
                                                                                    </tr>
                                                                                </thead>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="btn-group">
                                                            <button type="button"><i class="ico add"><em>추가</em></i></button>
                                                            <button type="button"><i class="ico del"><em>삭제</em></i></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-footer">
                                            <div class="list-btns center">
                                                <button type="button" class="btn bg-gray">                                        
                                                    <span>대상선정</span>
                                                </button>
                                                <a href="/app/001_05_01_kpi_list.do?menuKey=46" class="btn">목록</a>                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
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