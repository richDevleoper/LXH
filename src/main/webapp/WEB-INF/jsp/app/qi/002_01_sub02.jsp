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
                                <li>과제등록</li>
                            </ul>
                        </div>
                        <p class="content_title">1. 과제정보</p>
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
                                                <th><label for="text1"><span class="asterisk">*</span>과제명</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text1" name="" value="" title="과제명을 입력해주세요.">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="select1"><span class="asterisk">*</span>6σ Full Process여부</label> <i class="ico tip"><em>tip.</em></i></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <select name="" id="select1" title="6σ Full Process여부 선택">
                                                                <option value="">6σ Full Process</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><label for="select2"><span class="asterisk">*</span>과제유형</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <select name="" id="select2" title="과제유형 선택">
                                                                <option value="">선택</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="select3"><span class="asterisk">*</span>부문</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <select name="" id="select3" title="부문 선택">
                                                                <option value="">선택</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><label for="text2"><span class="asterisk">*</span>제품군</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text2" name="" value="" title="제품군을 입력해주세요.">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="select4"><span class="asterisk">*</span>과제리더벨트</label> <i class="ico tip"><em>tip.</em></i></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <select name="" id="select4" title="부문 선택">
                                                                <option value="">선택</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><label for="select5"><span class="asterisk">*</span>활동분야</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <select name="" id="select4" title="활동분야 선택">
                                                                <option value="">선택</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="select6"><span class="asterisk">*</span>MBB활용율</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <select name="" id="select6" title="MBB활용율 선택">
                                                                <option value="">선택</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th>활동분야</th>
                                                <td>2023년</td>
                                            </tr>
                                            <tr>
                                                <th><span class="asterisk">*</span>일정계획<br>(완료예정일)</th>
                                                <td colspan="3">
                                                    <div class="list-table list">
                                                        <table>
                                                            <caption></caption>
                                                            <colgroup>
                                                                <col>
                                                                <col>
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>착수(예정)일</th>
                                                                    <th>완료(예정)일</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td class="pd3">
                                                                        <div class="row">
                                                                            <div class="col s12 input-text input-date" style="float:none;width:120px;margin:0 auto !important">
                                                                                <input type="text" id="" name="" value="">
                                                                                <i class="ico calendar"></i>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td class="pd3">
                                                                        <div class="row">
                                                                            <div class="col s12 input-text input-date" style="float:none;width:120px;margin:0 auto !important">
                                                                                <input type="text" id="" name="" value="">
                                                                                <i class="ico calendar"></i>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="select6"><span class="asterisk">*</span>키워드</label> <i class="ico tip"><em>tip.</em></i></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s8">
                                                            <div class="col s2 input-text pd-r10" style="width:20%">
                                                                <input type="text" id="" name="" value="" title="키워드를 입력해주세요.">
                                                            </div>
                                                            <div class="col s2 input-text pd-r10" style="width:20%">
                                                                <input type="text" id="" name="" value="" title="키워드를 입력해주세요.">
                                                            </div>
                                                            <div class="col s2 input-text pd-r10" style="width:20%">
                                                                <input type="text" id="" name="" value="" title="키워드를 입력해주세요.">
                                                            </div>
                                                            <div class="col s2 input-text pd-r10" style="width:20%">
                                                                <input type="text" id="" name="" value="" title="키워드를 입력해주세요.">
                                                            </div>
                                                            <div class="col s2 input-text pd-r10" style="width:20%">
                                                                <input type="text" id="" name="" value="" title="키워드를 입력해주세요.">
                                                            </div>
                                                        </div>
                                                        <span class="col s4 text-bul" style="letter-spacing:-1px">
                                                            과제 검색 시 키워드를 생성합니다.(띄어쓰기 없이 입력)
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <p class="content_title">2. 팀구성 및 승인자</p>
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table class="centered">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:180px">
                                            <col>
                                            <col style="width:70px">
                                            <col style="width:70px">
                                            <col style="width:70px">
                                            <col style="width:70px">
                                            <col style="width:70px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="align-right pd-r23">참여형태</th>
                                                <th>소속</th>
                                                <th>이름</th>
                                                <th>직위</th>
                                                <th>직책</th>
                                                <th>Belt</th>
                                                <th>추가/삭제</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th><label for="text3"><span class="asterisk">*</span>과제리더</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" id="text3" name="" value="">
                                                            <button type="button">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>홍길동</td>
                                                <td>책임</td>
                                                <td>팀장</td>
                                                <td>MBB</td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn light-gray">추가</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text4"><span class="asterisk">*</span>팀멤버</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" id="text4" name="" value="">
                                                            <button type="button">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>홍길동</td>
                                                <td>책임</td>
                                                <td>팀장</td>
                                                <td>MBB</td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn light-gray">추가</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text5">팀멤버</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" id="text5" name="" value="">
                                                            <button type="button">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>홍길동</td>
                                                <td>책임</td>
                                                <td>팀장</td>
                                                <td>MBB</td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn light-gray">삭제</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text6">팀멤버</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" id="text6" name="" value="">
                                                            <button type="button">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>홍길동</td>
                                                <td>책임</td>
                                                <td>팀장</td>
                                                <td>MBB</td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn light-gray">추가</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text7"><span class="asterisk">*</span>과제지도/사원</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" id="text7" name="" value="">
                                                            <button type="button">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>홍길동</td>
                                                <td>책임</td>
                                                <td>팀장</td>
                                                <td>MBB</td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn light-gray">추가</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text8" class="color primary"><span class="asterisk">*</span>Process Owner</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" id="text8" name="" value="">
                                                            <button type="button">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>홍길동</td>
                                                <td>책임</td>
                                                <td>팀장</td>
                                                <td>MBB</td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn light-gray">추가</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text9" class="color primary"><span class="asterisk">*</span>챔피언</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" id="text9" name="" value="">
                                                            <button type="button">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>홍길동</td>
                                                <td>책임</td>
                                                <td>팀장</td>
                                                <td>MBB</td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn light-gray">추가</button>
                                                    </div>
                                                </td>
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
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col style="width:70px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th colspan="9">예상성과</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th class="pd0 pd-r23"><label for="select7"><span class="asterisk">*</span>성과항목</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <select name="" id="select7" title="성과항목 선택">
                                                                <option value="">선택</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th class="pd0 pd-r23"><label for="text10">년내(당해년)</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text10" name="" value="" title="년내 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th class="pd0 pd-r23">년간(12개월)</th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text11" name="" value="" title="년내 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th class="pd0 pd-r10">산출 Logic <i class="ico tip"><em>tip.</em></i></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text11" name="" value="" title="년내 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn light-gray">추가</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="pd0 pd-r23"><label for="select8">성과항목</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <select name="" id="select8" title="성과항목 선택">
                                                                <option value="">선택</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th class="pd0 pd-r23"><label for="text12">년내(당해년)</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text13" name="" value="" title="년내 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th class="pd0 pd-r23">년간(12개월)</th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text11" name="" value="" title="년내 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th class="align-center">산출 Logic</th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text14" name="" value="" title="년내 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn light-gray">삭제</button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="list-wrap mg-t20">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table class="centered">
                                        <caption></caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col style="width:70px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th colspan="4">Project Y (CTQ / CTP)</th>
                                                <th colspan="4">KPI</th>
                                                <th rowspan="2">추가/삭제</th>
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
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text16" name="" value="" title="단위 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text17" name="" value="" title="개선전 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text18" name="" value="" title="개선목표 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text19" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text20" name="" value="" title="단위 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text21" name="" value="" title="개선전 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text22" name="" value="" title="개선목표 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn light-gray">추가</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text23" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text24" name="" value="" title="단위 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text25" name="" value="" title="개선전 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text26" name="" value="" title="개선목표 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text27" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text28" name="" value="" title="단위 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text29" name="" value="" title="개선전 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text30" name="" value="" title="개선목표 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn light-gray">삭제</button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <p class="content_title">4. 과제등록서 등록</p>
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
                                                <th>첨부파일 (신규/수정)</th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 input-text file">
                                                            <span class="file-path">
                                                                <input type="text" id="file1_text" readonly name="" value="">
                                                                <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                            </span>
                                                            <input type="file" id="file1" name="" value="">
                                                            <label for="file1">파일추가</label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
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
                        <div class="list-footer">
                            <div class="list-btns">
                                <button type="button" class="btn light-gray">저장</button>
                                <button type="button" class="btn bg-gray">결제완료</button>
                                <a href="#" class="btn">목록</a>
                            </div>
                        </div>
                    
        <!-- 조직도 -->
        <div class="modal-dimmed"></div>
        <div class="org-modal">
            <div class="modal-header">
                <h4>직책조회</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="list-wrap">
                    <div class="list-search">
                        <form id="org-form" onsubmit="org_search();return false;">
                            <div class="search-form">
                                <div class="form-inline form-input">
                                    <label>직책명</label>
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
                        직책선택
                    </div>
                </div>
                <div id="org-tree">
                    <ul>
                        <li>사업부장</li>
                        <li>담당</li>
                        <li>팀장</li>
                        <li>책임</li>
                        <li>선임</li>
                        <li>사원1</li>
                        <li>사원2</li>
                        <li>사원3</li>
                        <li>사원4</li>
                        <li>사원5</li>
                        <li>사원6</li>
                        <li>사원7</li>
                        <li>사원8</li>
                        <li>사원9</li>
                        <li>사원10</li>
                        <li>사원11</li>
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