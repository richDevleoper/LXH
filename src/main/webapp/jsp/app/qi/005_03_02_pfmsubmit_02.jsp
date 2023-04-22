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
						<div class="list-header">
							<p class="title">실적입력</p>						
						</div>
                        <div class="list-wrap mg-t10">
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
                                                <th><label for="text1">교육과정명</label></th>
                                                <td colspan="3">OOOOOOOOOO교육과정명</td>
                                            </tr>
                                            <tr>
                                                <th><label for="text2">교육연도</label></th>
                                                <td>2023</td>
                                                <th><label for="text3">벨트</label></th>
                                                <td>BB</td>
                                            </tr>
											<tr>
                                                <th><label for="text4">교육유형</label></th>
                                                <td>교육</td>
                                                <th><label for="text5">상세유형</label></th>
                                                <td>6 Process 과정</td>
                                            </tr>
											<tr>
                                                <th><label for="text6">교육차수</label></th>
                                                <td>4차</td>
                                                <th><label for="text7">교육일정</label></th>
                                                <td>20.01/02.02/02.04</td>
                                            </tr>
											<tr>
                                                <th><label for="text8">교육정원/신청</label></th>
                                                <td colspan="3">40/10</td>
                                            </tr>
											<tr>
                                                <th colspan="4" class="align-center"><label for="text1">실적입력</label></th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="list-header mg-t20">
							<p class="title">교육인원</p>
							<span class="bar"></span>
							<p class="total">총 10</p>							
						</div>
                        <div class="list-content mg-t10">
							<div class="list-table">
								<table class="even">
									<caption></caption>
									<colgroup>
										<col style="width:50px">
										<col style="width:80px">
										<col style="width:110px">
										<col>
										<col style="width:110px">
										<col style="width:110px">
										<col style="width:110px">
										<col style="width:120px">
									</colgroup>
									<thead>
										<tr>
											<th class="bg-gray font-weight-bold"><input type="checkbox" name="ch_list" id="ch_all" /><label for="ch_all"></label></th>
											<th class="bg-gray font-weight-bold">성명</th>
											<th class="bg-gray font-weight-bold">사번</th>
											<th class="bg-gray font-weight-bold">조직명</th>
											<th class="bg-gray font-weight-bold">직위</th>
											<th class="bg-gray font-weight-bold">직책</th>
											<th class="bg-gray font-weight-bold">소속벨트</th>
											<th class="bg-gray font-weight-bold">이수여부</th>
										</tr>                                            
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox" name="ch_list" id="ch01" /><label for="ch01"></label></td>
											<td>홍길동</td>
											<td>FB00000</td>
											<td>조직명</td>
											<td>직위명</td>
											<td>직책명</td>
											<td>GB</td>
											<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="ch_list" id="ch02" /><label for="ch02"></label></td>
											<td>홍길동</td>
											<td>FB00000</td>
											<td>조직명</td>
											<td>직위명</td>
											<td>직책명</td>
											<td>GB</td>
											<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="ch_list" id="ch03" /><label for="ch03"></label></td>
											<td>홍길동</td>
											<td>FB00000</td>
											<td>조직명</td>
											<td>직위명</td>
											<td>직책명</td>
											<td>GB</td>
											<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="ch_list" id="ch04" /><label for="ch04"></label></td>
											<td>홍길동</td>
											<td>FB00000</td>
											<td>조직명</td>
											<td>직위명</td>
											<td>직책명</td>
											<td>GB</td>
											<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="ch_list" id="ch05" /><label for="ch05"></label></td>
											<td>홍길동</td>
											<td>FB00000</td>
											<td>조직명</td>
											<td>직위명</td>
											<td>직책명</td>
											<td>GB</td>
											<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="ch_list" id="ch06" /><label for="ch06"></label></td>
											<td>홍길동</td>
											<td>FB00000</td>
											<td>조직명</td>
											<td>직위명</td>
											<td>직책명</td>
											<td>GB</td>
											<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="ch_list" id="ch07" /><label for="ch07"></label></td>
											<td>홍길동</td>
											<td>FB00000</td>
											<td>조직명</td>
											<td>직위명</td>
											<td>직책명</td>
											<td>GB</td>
											<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="ch_list" id="ch08" /><label for="ch08"></label></td>
											<td>홍길동</td>
											<td>FB00000</td>
											<td>조직명</td>
											<td>직위명</td>
											<td>직책명</td>
											<td>GB</td>
											<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="ch_list" id="ch09" /><label for="ch09"></label></td>
											<td>홍길동</td>
											<td>FB00000</td>
											<td>조직명</td>
											<td>직위명</td>
											<td>직책명</td>
											<td>GB</td>
											<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="ch_list" id="ch10" /><label for="ch10"></label></td>
											<td>홍길동</td>
											<td>FB00000</td>
											<td>조직명</td>
											<td>직위명</td>
											<td>직책명</td>
											<td>GB</td>
											<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
                        <div class="list-footer">
                            <div class="list-btns">
                                <button type="button" class="btn light-gray">저장</button>
                                <a href="#" class="btn">목록</a>
								<button type="button" class="btn-excel">
									<img src="/assets/images/icon_excel.png" alt="">
									<span>다운로드</span>
								</button>  
                            </div>
                        </div>

                   
</body>
</html>