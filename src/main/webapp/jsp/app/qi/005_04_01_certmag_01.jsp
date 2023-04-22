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
                                <button type="button" class="on">GB</button>
                                <button type="button" class="">BB</button>
								<button type="button" class="">MBB</button>
                            </div>
							
							<div class="list-search mg-t20">
								<div class="search-form row">
									<div class="form-inline form-input col s4">
										<div class="col s3 align-right"><label>이름</label></div>
										<div class="pd-l10 col s8"><input type="text" name=""></div>
									</div>
									<div class="form-inline form-input col s4">
										<div class="col s3 align-right"><label>조직</label></div>
										<div class="pd-l10 col s8 form-inline"><input type="text" name=""><button type="button" class="btn-org">검색</button></div>
									</div>
									<div class="form-inline form-input col s4">
										<div class="col s3 align-right"><label>직책</label></div>
										<div class="pd-l10 col s8 form-inline"><input type="text" name=""><button type="button" class="btn-org">검색</button></div>
									</div>
								</div>
								<div class="search-form row">
									<div class="form-inline form-input col s7">
										<div class="col s2 align-right">
											<label>조회기간</label>
										</div>
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
									<div class="form-inline form-check col s2">
										<input type="checkbox" name="" id="aa" checked="">
										<label for="aa">인증대상자</label>									
									</div>
									<div class="form-inline form-check col s2">
										<input type="checkbox" name="" id="bb">
										<label for="bb">전체</label>									
									</div>
									<div class="form-inline form-input col s1">
										<button type="button" class="btn-submit">조회</button>
									</div>								
								</div>
							</div>
						
							<div class="tab-inr">
								<div class="tab-box on">
									<div class="list-header mg-t20">
										<p class="title">대상인원</p>
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
													<col style="width:90px">
													<col>
													<col style="width:80px">
													<col style="width:70px">
													<col style="width:70px">
													<col style="width:120px">
													<col style="width:120px">
												</colgroup>
												<thead>
													<tr>
														<th class="bg-gray font-weight-bold"><input type="checkbox" name="ch_list_gb" id="ch_all_gb" class="ch_all"><label for="ch_all_gb"></label></th>
														<th class="bg-gray font-weight-bold">성명</th>
														<th class="bg-gray font-weight-bold">사번</th>
														<th class="bg-gray font-weight-bold">1차 교육 / 2차 통계 / 3차 과제Test</th>
														<th class="bg-gray font-weight-bold">조직</th>
														<th class="bg-gray font-weight-bold">직위</th>
														<th class="bg-gray font-weight-bold">직책</th>
														<th class="bg-gray font-weight-bold">인증일</th>
														<th class="bg-gray font-weight-bold">인증여부</th>
													</tr>                                            
												</thead>
												<tbody>
													<tr>
														<td><input type="checkbox" name="ch_list_gb" id="ch01_gb"><label for="ch01_gb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_gb" id="ch02_gb"><label for="ch02_gb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_gb" id="ch03_gb"><label for="ch03_gb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_gb" id="ch04_gb"><label for="ch04_gb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_gb" id="ch05_gb"><label for="ch05_gb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_gb" id="ch06_gb"><label for="ch06_gb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_gb" id="ch07_gb"><label for="ch07_gb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_gb" id="ch08_gb"><label for="ch08_gb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_gb" id="ch09_gb"><label for="ch09_gb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_gb" id="ch10_gb"><label for="ch10_gb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
                                <div class="tab-box">
									<div class="list-header mg-t20">
										<p class="title">대상인원</p>
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
													<col style="width:90px">
													<col>
													<col style="width:80px">
													<col style="width:70px">
													<col style="width:70px">
													<col style="width:120px">
													<col style="width:120px">
												</colgroup>
												<thead>
													<tr>
														<th class="bg-gray font-weight-bold"><input type="checkbox" name="ch_list_bb" id="ch_all_bb" class="ch_all"><label for="ch_all_bb"></label></th>
														<th class="bg-gray font-weight-bold">성명</th>
														<th class="bg-gray font-weight-bold">사번</th>
														<th class="bg-gray font-weight-bold">1차 교육 / 2차 통계 / 3차 과제Test</th>
														<th class="bg-gray font-weight-bold">조직</th>
														<th class="bg-gray font-weight-bold">직위</th>
														<th class="bg-gray font-weight-bold">직책</th>
														<th class="bg-gray font-weight-bold">인증일</th>
														<th class="bg-gray font-weight-bold">인증여부</th>
													</tr>                                            
												</thead>
												<tbody>
													<tr>
														<td><input type="checkbox" name="ch_list_bb" id="ch01_bb"><label for="ch01_bb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_bb" id="ch02_bb"><label for="ch02_bb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_bb" id="ch03_bb"><label for="ch03_bb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_bb" id="ch04_bb"><label for="ch04_bb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>

														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_bb" id="ch05_bb"><label for="ch05_bb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_bb" id="ch06_bb"><label for="ch06_bb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_bb" id="ch07_bb"><label for="ch07_bb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_bb" id="ch08_bb"><label for="ch08_bb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_bb" id="ch09_bb"><label for="ch09_bb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_bb" id="ch10_bb"><label for="ch10_bb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
                                <div class="tab-box">
									<div class="list-header mg-t20">
										<p class="title">대상인원</p>
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
													<col style="width:90px">
													<col>
													<col style="width:80px">
													<col style="width:70px">
													<col style="width:70px">
													<col style="width:120px">
													<col style="width:120px">
												</colgroup>
												<thead>
													<tr>
														<th class="bg-gray font-weight-bold"><input type="checkbox" name="ch_list_mbb" id="ch_all_mbb" class="ch_all"><label for="ch_all_mbb"></label></th>
														<th class="bg-gray font-weight-bold">성명</th>
														<th class="bg-gray font-weight-bold">사번</th>
														<th class="bg-gray font-weight-bold">1차 교육 / 2차 통계 / 3차 과제Test</th>
														<th class="bg-gray font-weight-bold">조직</th>
														<th class="bg-gray font-weight-bold">직위</th>
														<th class="bg-gray font-weight-bold">직책</th>
														<th class="bg-gray font-weight-bold">인증일</th>
														<th class="bg-gray font-weight-bold">인증여부</th>
													</tr>                                            
												</thead>
												<tbody>
													<tr>
														<td><input type="checkbox" name="ch_list_mbb" id="ch01_mbb"><label for="ch01_mbb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_mbb" id="ch02_mbb"><label for="ch02_mbb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_mbb" id="ch03_mbb"><label for="ch03_mbb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_mbb" id="ch04_mbb"><label for="ch04_mbb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>

														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_mbb" id="ch05_mbb"><label for="ch05_mbb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_mbb" id="ch06_mbb"><label for="ch06_mbb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_mbb" id="ch07_mbb"><label for="ch07_mbb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_mbb" id="ch08_mbb"><label for="ch08_mbb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_mbb" id="ch09_mbb"><label for="ch09_mbb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
													<tr>
														<td><input type="checkbox" name="ch_list_mbb" id="ch10_mbb"><label for="ch10_mbb"></label></td>
														<td>홍길동</td>
														<td>FB00000</td>
														<td class="align-left pd-l10">1차-이수(2023.06.30) / 2차-합격(2023.07.30)</td>
														<td>조직명</td>
														<td>직위명</td>
														<td>직책명</td>
														<td class="pd3"><div class="row">
															<div class="col input-text input-date">
																<input type="text" id="" name="" value="">
																<i class="ico calendar"></i>
															</div>
														</div></td>
														<td class="select-table"><select name="" id=""><option value="">선택</option></select></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
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
								<button type="button" class="btn light-gray">저장</button>
                            </div>
                        </div>
                    

                   
</body>

</html>