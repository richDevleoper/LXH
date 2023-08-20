<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
<%@ taglib prefix="attachfile" uri="http://www.freedi.kr/attachfile-taglib"%>

<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
	<title>${fn:split(boardVO.boardNm,'>')[fn:length(fn:split(boardVO.boardNm,'>'))-1]}</title>
	<meta name="keywords" content="" />
	<meta name="description" content="insertForm.jsp" />
	
	<link type="text/css" rel="stylesheet" href="<c:url value='/def/attachfile/css/jquery.fileupload.css'/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/def/attachfile/css/jquery.fileupload-ui.css'/>" />
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-tmpl.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.iframe-transport.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-process.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-validate.js?ver=1'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-jquery-ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/attachfile-fileuploader.js'/>"></script>
	
	<style>
		.td-user-nm, .td-com-jobx, .td-com-pos, .td-belt-nm  { text-align: center !important;}
	</style>

</head>
<body>
	<form:form commandName="frmReport" id="defaultForm" name="defaultForm" action="${action}" onsubmit="return false" method="post" modelAttribute="reportVO">
		<form:hidden path="repStatusCode" />
		<form:hidden path="repCode" />
		<form:hidden path="repMenuCode" />
		<form:hidden path="repCurrStepCode" />
		<form:hidden path="repCurrApproveState" />
		<form:hidden path="mode" />
		<!-- breadcrumb -->
		<div class="breadcrumb">
			<ul>
				<li>과제등록 | <span style="color: #9a3530b3;">일반과제<c:if test="${reportVO.repMenuCode eq 'REPORT'}"> 및 10+No Policy 활동과제</c:if>는 활동결과까지 함께 등록합니다.</span></li>
			</ul>
		</div>
		<p class="content_title">1. 과제정보 <span style="color: #9a3530b3;">과제정보/수행 영역은 수정 시에 챔피언에게 다시 결재가 의뢰됩니다.</span></p>
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
								<th><form:label path="repName"><span class="asterisk">*</span>과제명</form:label></th>
								<td colspan="3">
									<div class="row">
										<div class="col s12 input-text">
											<form:input type="text" id="txtRepName" path="repName" value="" title="과제명을 입력해주세요." cssClass="validate[required]" />
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th><form:label path="repDivisionCode"><span class="asterisk">*</span>6σ Full Process여부</form:label> <i
									class="ico tip" onclick="popAdvice.open('6sigma-yn')"><em>tip.</em></i></th>
								<td>
									<div class="row">
										<div class="col s12 select-group"
											<c:if test="${reportVO.mode eq 'UPDATE' }">style="pointer-events: none;"</c:if>>
											<form:select path="repDivisionCode"
												title="6σ Full Process여부 선택" cssClass="validate[required]">
												<c:forEach var="item" items="${divisionCode}">
													<option value="${item.codeId}"
														<c:if test="${item.codeId eq reportVO.repDivisionCode }">selected="selected"</c:if>>${item.codeNm}</option>
												</c:forEach>
											</form:select>
										</div>
									</div>
								</td>
								<th><form:label path="repTypeCode"><span class="asterisk">*</span>과제유형</form:label></th>
								<td>
									<div class="row">
										<div class="col s12 select-group" <c:if test="${reportVO.mode eq 'UPDATE' }">style="pointer-events: none;"</c:if>>
											<form:select path="repTypeCode" title="과제유형을 선택하세요." cssClass="validate[required]"></form:select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th><form:label path="repSectorCode"><span class="asterisk">*</span>부문</form:label></th>
								<td>
									<div class="row">
										<div class="col s12 select-group">
											<form:select path="repSectorCode" title="부문을 선택하세요." cssClass="validate[required]">
											</form:select>
										</div>
									</div>
								</td>
								<th><form:label path="repProductClass"><span class="asterisk">*</span>제품군</form:label></th>
								<td>
									<div class="row">
										<div class="col s12 select-group">
											<%-- <form:input type="text" path="repProductClass" title="제품군을 입력해주세요." cssClass="validate[required]" /> --%>
											<form:select path="repProductClass" title="제품군을 선택하세요." cssClass="validate[required]">
											</form:select>
										</div>
									</div>
								</td>
							</tr>
							<c:choose>
								<c:when test="${repMenuCode eq 'REPORT'}">
									<tr>
										<th>
											<form:label path="repLeaderBeltCode">
												<span class="asterisk">*</span>과제리더벨트
											</form:label> <i class="ico tip" onclick="popAdvice.open('rep-reader')"></i>
										</th>
										<td>
											<div class="row">
												<div class="col s12 select-group">
													<form:select path="repLeaderBeltCode" title="과제리더벨트를 선택하세요." cssClass="validate[required]"></form:select>
												</div>
											</div>
										</td>
										<th><form:label path="repActionTypeCode"><span class="asterisk">*</span>활동분야</form:label></th>
										<td>
											<div class="row">
												<div class="col s12 select-group">
													<form:select path="repActionTypeCode" title="활동분야를 선택하세요." cssClass="validate[required]"></form:select>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<%-- <th>
											<form:label path="repMbbUseRateCode">
											<span class="asterisk">*</span>MBB활용율</form:label>
										</th> --%>
										<%-- <th>
											<div class="row">											
												<div class="col s12 select-group">
													<select id="ddlRepMbbUseRateCode" title="MBB활용율을 선택하세요." class="validate[required]"></select>
													<form:hidden path="repMbbUseRateCode"></form:hidden>
												</div>
											</div>
										</th> --%>
										<th>MBB활용율 반영년도</th>
										<td colspan="3"><%-- <span id="lblUseRefDt">-</span>년 <form:input type="hidden" path="repUseRefDate" /> --%>
										<div class="row">											
											<div class="col s12 select-group">
												<jsp:useBean id="now" class="java.util.Date" />
									            <fmt:formatDate value="${now}" pattern="yyyy" var="yearNow"/>
									            <form:select path="repUseRefDate" class="limit" cssClass="only-first validate[required]" >
													<option value="1900">해당없음</option>
													<option value="${yearNow}">${yearNow}년</option>
													<option value="${yearNow+1}">${yearNow+1}년</option>
													<option value="${yearNow+2}">${yearNow+2}년</option>
												</form:select>
											</div>
										</div>
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<th><form:label path="repLeaderBeltCode"><span class="asterisk">* </span>Leader</form:label></th>
										<td>
											<div class="row">
												<div class="col s12 input-text search">
													<form:input type="hidden" path="repLeaderCode" />
													<form:input type="text" path="repLeaderName"
														readonly="true" />
													<button type="button" class="btn-search-leader">검색</button>
												</div>
											</div>
										</td>
										<th><form:label path="repActionTypeCode"><span class="asterisk">*</span>활동분야</form:label></th>
										<td>
											<div class="row">
												<div class="col s12 select-group">
													<form:select path="repActionTypeCode" title="활동분야를 선택하세요." cssClass="validate[required]"></form:select>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th style="height: 20px;">분임조</th>
										<td>${circleVO.deptName} <input type="hidden" name="repCirCode"></td>
										<th>분임조장ㅋㅋ</th>
										<td>${circleVO.cirLeaderName}</td>
									</tr>
								</c:otherwise>
							</c:choose>

							<tr id="trRepDate1" class="tr-rep-date">
								<th><span class="asterisk">*</span>일정계획<br>(완료예정일)</th>
								<td colspan="3">
									<div class="list-table list">
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col class="dt-6sig">
												<col class="dt-6sig">
												<col class="dt-6sig">
												<col class="dt-6sig">
												<col>
											</colgroup>
											<thead>
												<tr id="trPlanDateLabel">
													<th str1="Define" str2="Define">Define</th>
													<th str1="Measure" str2="Measure" class="dt-6sig">Measure</th>
													<th str1="Analyze" str2="Explore" class="dt-6sig">Analyze</th>
													<th str1="Improve" str2="Develop" class="dt-6sig">Improve</th>
													<th str1="Control" str2="Implement" class="dt-6sig">Control</th>
													<th str1="Finish" str2="Finish">Finish</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<c:forEach var="item" items="${reportVO.repDetailList}" varStatus="status">

														<td class="pd3">
															<div class="row">
																<!-- Define -->
																<form:input type="hidden" path="repDetailList[${status.index}].repSeq" />
																<form:input type="hidden" path="repDetailList[${status.index}].repCode" />
																<form:input type="hidden" path="repDetailList[${status.index}].repDivisionCode" />
																<form:input type="hidden" path="repDetailList[${status.index}].repStepCode" />
																<form:input type="hidden" path="repDetailList[${status.index}].repApprovalMemCode" />
																<form:input type="hidden" path="repDetailList[${status.index}].repApprovalMemRole" />
																<form:input type="hidden" path="repDetailList[${status.index}].repStatus" />
																
																<div class="col s12 input-text input-date">
																	<form:input type="text"
																		path="repDetailList[${status.index}].repPlanStartDate"
																		seq="${status.index}"
																		title="일정계획을 입력하세요."
																		cssClass="datepicker validate[required] date-6sigma" />
																	<i class="ico calendar"></i>
																</div>
															</div>
														</td>
													</c:forEach>
												</tr>
											</tbody>
										</table>
									</div>
								</td>
							</tr>
							<tr id="trRepDate2" class="tr-rep-date" style="display: none;">
								<th><span class="asterisk">*</span>일정계획<br>(완료예정일)</th>
								<td colspan="3">
									<div class="list-wrap toggle">
										<!-- [D] 상태에따라 열기/닫기 텍스트 구분해주세요. -->
										<span class="blind">열기/닫기</span>
										<ul>
											<li>
												<!-- [D] 열린상태일 경우 active 클래스를 추가해주세요. -->
												<div class="list-content">
													<div class="list-table list">
														<input type="hidden" name="repDetailList[0].repStepCode"
															value="7" />
														<table>
															<caption>일정계획 및 수행 테이블</caption>
															<colgroup>
																<col style="width: 60px">
																<col style="width: 80px">
																<col>
																<col style="width: 80px">
																<col style="width: 60px">
															</colgroup>
															<thead>
																<tr>
																	<th>구분</th>
																	<th colspan="2">착수(예정)일</th>
																	<th colspan="3">완료(예정)일</th>
																</tr>
															</thead>

															<tbody>
																<tr id="trPlanDate">
																	<td>계획</td>

																	<td class="pd3" colspan="2">
																		<div class="row">
																			<div class="col s12 input-text input-date"
																				style="float: none; width: 120px; margin: 0 auto !important">
																				<input type="text"
																					id="repDetailList0_1.repPlanStartDate"
																					name="repDetailList[0].repPlanStartDate"
																					class="datepicker" /> <i class="ico calendar"></i>
																			</div>
																		</div>
																	</td>
																	<td class="pd3" colspan="3">
																		<div class="row">
																			<div class="col s12 input-text input-date"
																				style="float: none; width: 120px; margin: 0 auto !important">
																				<input type="text"
																					id="repDetailList0_1.repPlanEndDate"
																					name="repDetailList[0].repPlanEndDate"
																					class="datepicker" /> <i class="ico calendar"></i>
																			</div>
																		</div>
																	</td>

																</tr>
																<tr>
																	<td>실시</td>
																	<td class="pd3" colspan="2">
																		<div class="row">
																			<div class="col s12 input-text input-date"
																				style="float: none; width: 120px; margin: 0 auto !important">
																				<input type="text"
																					id="repDetailList0_1.repActStartDate"
																					name="repDetailList[0].repActStartDate"
																					class="datepicker act-date" /> <i
																					class="ico calendar"></i>
																			</div>
																		</div>
																	</td>
																	<td class="pd3" colspan="3">
																		<div class="row">
																			<div class="col s12 input-text input-date"
																				style="float: none; width: 120px; margin: 0 auto !important">
																				<input type="text"
																					id="repDetailList0_1.repActEndDate"
																					name="repDetailList[0].repActEndDate"
																					class="datepicker act-date" /> <i
																					class="ico calendar"></i>
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<th rowspan="2">활동계획</th>
																	<th>추진배경</th>
																	<td td colspan="4">
																		<div class="input-text">
																			<form:textarea path="repDetailList[0].repPropelBg" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<th>주요활동</th>
																	<td colspan="4"><div class="input-text">
																			<form:textarea path="repDetailList[0].repActivity" />
																		</div></td>
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
																<col style="width: 60px">
																<col style="width: 80px">
																<col>
																<col style="width: 70px">
																<%-- <col style="width: 70px">
																<col style="width: 70px">
																<col style="width: 70px"> --%>
															</colgroup>
															<tbody>
																<tr>
																	<th colspan="4">Finish 요약</th>
																	<!-- <th colspan="3">활동결과(실적)</th> -->
																</tr>
																<tr>
																	<td colspan="4">
																		<div class="input-text">
																			<form:textarea path="repDetailList[0].repFinishSummary" style="height: 65px;" />
																		</div>
																	</td>
																	<!-- <td>CTQ/CTP</td>
																	<td>KPI</td>
																	<td>예상성과</td> -->
																</tr>
																<%-- <tr>
																	<td><div class="col s2 input-text pd3"><form:input type="text" path="repDetailList[0].repCtqCtp" /> </div></td>
																	<td><div class="col s2 input-text pd3" style="width: 100%"> <form:input type="text" path="repDetailList[0].repKpi"/></div></td>
																	<td><div class="col s2 input-text pd-r10" style="width: 100%"><form:input type="text" path="repDetailList[0].repExpectationResult" /></div></td>
																</tr> --%>
																<tr>
																	<th colspan="2" class="pd-r10 align-right"><span class="asterisk">*</span> 첨부파일<br>(Up to 10)</th>
																	<td colspan="2" style="text-align: left;">
																		<div class="col s12 input-text file">
																			<attachfile:fileuploader
																				objectId="fileUpload_report_sub_07" ctx=""
																				wrapperId="fileUploadWrap_7"
																				fileId="reportDetail_7_${reportVO.repCode}"
																				fileGrp="reportDetail" autoUpload="false"
																				maxFileSize="${30*1000000}" maxNumberOfFiles="10" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td colspan="4" class="pd0 border0">
																		<div class="toggle-box">
																			<div class="list-table list">
																				<table>
																					<caption>일정계획 및 수행 테이블</caption>
																					<colgroup>
																						<col style="width: 60px">
																						<col style="width: 145px">
																						<col>
																						<col style="width: 80px">
																						<col style="width: 80px">
																						<col style="width: 80px">
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
																						<col style="width: 60px">
																						<col style="width: 80px">
																						<col>
																						<col style="width: 60px">
																						<col style="width: 60px">
																						<col style="width: 60px">
																						<col style="width: 60px">
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
																							<td>자동차소재부품 사업부 &gt; 경량화사업담당 &gt;
																								자동차소재부품.투명과학플라스틱연구PJT</td>
																							<td>홍길동</td>
																							<td>책임</td>
																							<td>팀장</td>
																							<td>BB</td>
																						</tr>
																						<tr>
																							<th colspan="2" class="pd-r10 align-right">
																								<span class="asterisk">*</span> 첨부파일<br> (Up to 10)
																							</th>
																							<td colspan="5">
																								<div class="file-list">
																									<ul>
																										<li>
																											<div class="input-text">
																												<input type="text" id="" name=""
																													value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]"
																													readonly>
																											</div>
																										</li>
																										<li>
																											<div class="input-text">
																												<input type="text" id="" name=""
																													value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]"
																													readonly>
																											</div>
																										</li>
																										<li>
																											<div class="input-text">
																												<input type="text" id="" name=""
																													value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]"
																													readonly>
																											</div>
																										</li>
																										<li>
																											<div class="input-text">
																												<input type="text" id="" name=""
																													value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]"
																													readonly>
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
											<!---->
											<!---->
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th><label path="select6"><span class="asterisk">*</span>키워드</label>
									<i class="ico tip" onclick="popAdvice.open('keyword')"><em>tip.</em></i></th>
								<td colspan="3">
									<div class="row">
										<div class="col s8">
											<div class="col s2 input-text pd-r10" style="width: 20%">
												<form:input type="hidden" path="repKeyword" />
												<input type="text" id="txtRepKeyword_1" name="REP_KEYWORD" class="obj-rep-keyword validate[required]" value=""
													title="키워드를 입력하세요." onkeyup="onkeypress_repKeyword(this)" cssClass="">
											</div>
											<div class="col s2 input-text pd-r10" style="width: 20%">
												<input type="text" id="txtRepKeyword_2" name="REP_KEYWORD" class="obj-rep-keyword" value="" title="키워드를 입력하세요."
													onkeyup="onkeypress_repKeyword(this)">
											</div>
											<div class="col s2 input-text pd-r10" style="width: 20%">
												<input type="text" id="txtRepKeyword_3" name="REP_KEYWORD" class="obj-rep-keyword" value="" title="키워드를 입력하세요."
													onkeyup="onkeypress_repKeyword(this)">
											</div>
											<div class="col s2 input-text pd-r10" style="width: 20%">
												<input type="text" id="txtRepKeyword_4" name="REP_KEYWORD" class="obj-rep-keyword" value="" title="키워드를 입력하세요."
													onkeyup="onkeypress_repKeyword(this)">
											</div>
											<div class="col s2 input-text pd-r10" style="width: 20%">
												<input type="text" id="txtRepKeyword_5" name="REP_KEYWORD" class="obj-rep-keyword" value="" title="키워드를 입력하세요."
													onkeyup="onkeypress_repKeyword(this)">
											</div>
										</div>
										<span class="col s4 text-bul" style="letter-spacing: -1px">과제 검색 시 키워드를 생성합니다.(띄어쓰기 없이 입력) </span>
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
					<!-- 
									REP_ROLE	1	과제리더
									REP_ROLE	2	팀멤버
									REP_ROLE	3	과제지도/사원
									REP_ROLE	4	PROCESS OWNER
									REP_ROLE	5	챔피언
									REP_ROLE	6	분임조장
									REP_ROLE	7	분임조사무국
									REP_ROLE	8	분임조팀장                                
                                 -->
					<table class="centered">
						<caption></caption>
						<colgroup>
							<col style="width: 180px">
							<col style="width: 200px">
							<col>
                            <col style="width: 80px">
                            <col style="width: 80px">
                            <col style="width: 80px">
							<col style="width: 70px">
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
						<!-- # To-Do -->
						<tbody>

<script>
	let memMaxSeq = -1;
	let resMaxSeq = -1;
	let indMaxSeq = -1;
</script>
							<c:forEach var="item" items="${reportVO.repTeamMemberList}" varStatus="status">

								<tr class="tr-team-role-${item.repTeamMemRole}" idSeq="repTeamMemberList${status.index}" nameSeq="repTeamMemberList[${status.index}]">
									<th>
									    <label <c:if test="${item.repTeamMemRole eq '3' || item.repTeamMemRole eq '5'}">class="color primary"</c:if> >
										<c:if test="${item.repTeamMemRole ne '4' && item.repTeamMemRole ne '2'}">
										    <span class="asterisk">*</span>
										</c:if> 
										${item.repTeamMemRoleNm}
										</label> 
										<script>
	                                        memMaxSeq = Math.max(memMaxSeq, "${status.index}");
	                                    </script> 
	                                    <form:input type="hidden" cssClass="report-code" path="repTeamMemberList[${status.index}].repCode" />
	                                    <form:input type="hidden" cssClass="team-code" path="repTeamMemberList[${status.index}].repTeamCode" />
	                                    <form:input type="hidden" cssClass="team-dept-cd" path="repTeamMemberList[${status.index}].deptCode" />
	                                    <form:input type="hidden" cssClass="team-role-cd" path="repTeamMemberList[${status.index}].repTeamMemRole" />
										<form:input type="hidden" cssClass="team-com-no" path="repTeamMemberList[${status.index}].comNo" /> 
										<%-- <form:input type="hidden" cssClass="team-mem-nm" path="repTeamMemberList[${status.index}].repTeamMemName" /> --%>
										<form:input type="hidden" cssClass="team-jobx-cd" path="repTeamMemberList[${status.index}].comJobxCode" /> 
										<form:input type="hidden" cssClass="team-position-cd" path="repTeamMemberList[${status.index}].comPositionCode" />
										<form:input type="hidden" cssClass="team-belt-cd" path="repTeamMemberList[${status.index}].beltCode" />
									</th>
									<td class="td-dept-nm">${item.deptName}</td>
									<td class="pd3"><%-- ${item.repTeamMemName} --%>
										<div class="row">
											<div class="col s12 input-text search">
												<c:choose>
													<c:when test="${item.repTeamMemRole ne '4' && item.repTeamMemRole ne '2'}">
														<form:input type="text" path='repTeamMemberList[${status.index}].repTeamMemName' readonly="true" title="(팀구성)필수인원을 지정해하세요." cssClass="validate[required]" />
													</c:when>
													<c:otherwise>
														<form:input type="text" path='repTeamMemberList[${status.index}].repTeamMemName' readonly="true" />
													</c:otherwise>
												</c:choose>
												<button type="button" class="btn-search-emp">검색</button>
											</div>
										</div>
									</td>
									<td class="td-com-jobx">${item.comJobxNm}</td>
									<td class="td-com-pos">${item.comPositionNm}</td>
									<td class="td-belt-nm">${item.beltNm}</td>
									<td class="pd3">
									    <c:if test="${item.repTeamMemRole eq '2'}">
											<div class="btn-group">
												<button type="button" class="btn light-gray btn-team-member-add">추가</button>
											</div>
										</c:if>
									</td>
								</tr>
							</c:forEach>
<script type="text/javascript">

	$(".btn-team-member-add").each(function(i, o){ 
	    if(i>0){
	        $(o).text('삭제');
			$(o).removeClass('btn-team-member-add').addClass('btn-team-member-remove');
	    }
	});

	$(".tr-team-role-2 th label .asterisk").each(function(i,o){
	    if(i>0){
	        $(o).hide();
	    }
	});
	
	function setRepTeamEvent(){
		
		$('.btn-team-member-remove').off("click").on('click', function(){
			$(this).closest('tr').remove();
		});
	}
	setRepTeamEvent()
					
</script>


						</tbody>
					</table>
				</div>
			</div>
		</div>
		<p class="content_title">3. 성과 및 주요지표</p>
		<div class="list-wrap">
			<div class="list-content">
				<div class="list-table list">

<script>
function onchange_resultType(obj){
	if(obj.value==="7"){
		$(obj).closest("tr").find(".txt-result-value").val("").prop("disabled", true);	
	} else {
		$(obj).closest("tr").find(".txt-result-value").prop("disabled", false);
	}
}
</script>
					<table class="centered">
						<caption></caption>
						<colgroup>
							<col style="width:90px">
							<col style="width:120px">
							<col style="width:90px">
							<col style="width:100px">
							<col style="width:90px">
							<col style="width:100px">
							<col style="width:100px">
							<col>
							<col style="width: 70px">
						</colgroup>
						<thead>
							<tr>
								<th colspan="9">예상성과(백만원)</th>
								<!-- TB_REPORT_RESULT -->
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${reportVO.repResultList}"
								varStatus="status">
								<tr idSeq="repResultList${status.index}"
									nameSeq="repResultList[${status.index}]">
									<th class="pd0 align-center">
									    <form:label path="repResultList[${status.index}].repResultTypeCode">
										<span class="asterisk only-first">*</span>성과항목</form:label>
								    </th>
									<td class="pd3">
										<div class="row">
											<div class="col s12 select-group">
												<script>
			                                   		resMaxSeq = Math.max(resMaxSeq, "${status.index}");
			                                    </script>
												<form:input type="hidden" cssClass="result-code" path="repResultList[${status.index}].repResultCode" />
												<form:input type="hidden" cssClass="result-report-code" path="repResultList[${status.index}].repCode" />
												<c:choose>
													<c:when test="${reportVO.repMenuCode eq 'TEAM'}">
														<form:select path="repResultList[${status.index}].repResultTypeCode" title="성과항목을 선택하세요" cssClass="only-first validate[required]" onchange="onchange_resultType(this)">
															<form:option value="8" label="영업이익" />
														</form:select>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${status.first}">
																<form:select path="repResultList[${status.index}].repResultTypeCode" title="성과항목을 선택하세요" cssClass="only-first validate[required]" onchange="onchange_resultType(this)">
																	<c:forEach var="option" items="${codeResultTy}">
																		<form:option value="${option.codeId}" label="${option.codeNm}" />
																	</c:forEach>
																</form:select>
															</c:when>
															<c:otherwise>
																<form:select path="repResultList[${status.index}].repResultTypeCode" title="성과항목을 선택하세요" onchange="onchange_resultType(this)">
																	<c:forEach var="option" items="${codeResultTy}">
																		<form:option value="${option.codeId}" label="${option.codeNm}" />
																	</c:forEach>
																</form:select>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</td>
									<th class="pd0 align-center"><label for="txtRepResultWithinYear">년내(당해년)</label></th>
									<td class="pd3">
										<div class="row">
											<div class="col s12 input-text">
												<form:input type="number" path="repResultList[${status.index}].repResultWithinYear" title="년내 입력" cssClass="txt-result-value input-text" />
											</div>
										</div>
									</td>
									<th class="pd0 align-center"><label for="txtRepResultYear">년간(12개월)</label></th>
									<td class="pd3">
										<div class="row">
											<div class="col s12 input-text">
												<form:input type="number"
													path="repResultList[${status.index}].repResultYear"
													title="년간 입력" cssClass="txt-result-value input-text" />
											</div>
										</div>
									</td>
									<th class="pd0 align-center"><label for="txtRepResultCalLogic">산출 Logic</label> 
									    <c:if test="${status.first}">
											<i class="ico tip" onclick="popAdvice.open('cal-logic');"><em>tip.</em></i>
										</c:if>
									</th>
									<td class="pd3">
										<div class="row">
											<div class="col s12 input-text">
												<form:input type="text" path="repResultList[${status.index}].repResultCalLogic"
													title="산출 Logic" cssClass="txt-result-value input-text" />
											</div>
										</div>
									</td>
									<td class="pd3">
										<div class="btn-group">
											<c:choose>
												<c:when test="${status.first}">
													<button type="button" class="btn light-gray btn-team-result-add">추가</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn light-gray btn-team-result-remove">삭제</button>
												</c:otherwise>
											</c:choose>
										</div>
									</td>
								</tr>
							</c:forEach>
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
							<col style="width: 70px">
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
							<c:forEach var="item" items="${reportVO.repIndicatorList}"
								varStatus="status">
								<tr idSeq="repIndicatorList${status.index}"
									nameSeq="repIndicatorList[${status.index}]">
									<td class="pd3">
										<div class="row">
											<div class="col s12 input-text">
												<script>
                                                        	indMaxSeq = Math.max(indMaxSeq, "0");
			                                               	</script>
												<form:input type="hidden"
													path="repIndicatorList[${status.index}].repIndiCode" />
												<form:input type="hidden"
													path="repIndicatorList[${status.index}].repCode" />
												<form:input type="text"
													path="repIndicatorList[${status.index}].repIndiPyItem"
													title="항목 입력" />
											</div>
										</div>
									</td>
									<td class="pd3">
										<div class="row">
											<div class="col s12 input-text">
												<form:input type="text"
													path="repIndicatorList[${status.index}].repIndiPyUnit"
													title="단위 입력" />
											</div>
										</div>
									</td>
									<td class="pd3">
										<div class="row">
											<div class="col s12 input-text">
												<form:input type="text"
													path="repIndicatorList[${status.index}].repIndiPyBefore"
													title="개선전 입력" />
											</div>
										</div>
									</td>
									<td class="pd3">
										<div class="row">
											<div class="col s12 input-text">
												<form:input type="text"
													path="repIndicatorList[${status.index}].repIndiPyGoal"
													title="개선목표 입력" />
											</div>
										</div>
									</td>
									<td class="pd3">
										<div class="row">
											<div class="col s12 input-text">
												<form:input type="text"
													path="repIndicatorList[${status.index}].repIndiKpiItem"
													title="KPI 항목 입력" />
											</div>
										</div>
									</td>
									<td class="pd3">
										<div class="row">
											<div class="col s12 input-text">
												<form:input type="text"
													path="repIndicatorList[${status.index}].repIndiKpiUnit"
													title="KPI 단위 입력" />
											</div>
										</div>
									</td>
									<td class="pd3">
										<div class="row">
											<div class="col s12 input-text">
												<form:input type="text"
													path="repIndicatorList[${status.index}].repIndiKpiBefore"
													title="KPI 개선전 입력" />
											</div>
										</div>
									</td>
									<td class="pd3">
										<div class="row">
											<div class="col s12 input-text">
												<form:input type="text"
													path="repIndicatorList[${status.index}].repIndiKpiGoal"
													title="KPI 개선목표 입력" />
											</div>
										</div>
									</td>
									<td class="pd3">
										<div class="btn-group">
											<c:choose>
												<c:when test="${status.first}">
													<button type="button"
														class="btn light-gray btn-team-indi-add">추가</button>
												</c:when>
												<c:otherwise>
													<button type="button"
														class="btn light-gray btn-team-indi-remove">삭제</button>
												</c:otherwise>
											</c:choose>
										</div> <c:if test="${status.last}">
											<script>
                                                    	
                                                    </script>
										</c:if>
									</td>
								</tr>
							</c:forEach>
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
							<col style="width: 180px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th><span class="asterisk">*</span> 첨부파일 (신규/수정)</th>
								<td>
									<div class="row">
										<div class="col s12 input-text file">
											<attachfile:fileuploader objectId="fileUploadObj_01" ctx=""
												wrapperId="fileUploadWrap"
												fileId="report_${reportVO.repCode}" fileGrp="report"
												autoUpload="false" maxFileSize="${30*1000000}"
												maxNumberOfFiles="10" />
										</div>
									</div>
								</td>
							</tr>
							<tr style="display: none;">
								<th><span class="asterisk">*</span> 첨부파일 (조회)</th>
								<td>
									<div class="file-link">
										<ul>
											<li><a href="#" title="다운받기">UI표준정의서.pptx</a><a href="#"
												title="다운받기" class="btn color gray mg-l15">다운받기</a></li>
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
				<c:choose>
					<c:when test="${reportVO.repStatusCode eq '2' || reportVO.repStatusCode eq '9'}">	<!-- 선정중 -->
						<!-- 선정중 -->
						<button type="button" class="btn bg-gray" id="btnCancelApproval">결재취소</button>
					</c:when>
					<c:when
						test="${reportVO.repStatusCode eq '3' || reportVO.repStatusCode eq '4'|| reportVO.repStatusCode eq '5'}">
						<!-- 진행중 -->
						<button type="button" class="btn bg-gray" id="btnReqApproval">결재의뢰</button>
						<button type="button" class="btn bg-gray" id="btnReqDrop">Drop신청</button>
					</c:when>
					<c:when test="${reportVO.repStatusCode eq '6'}"> <!-- Drop -->
					
					</c:when>
					<c:when test="${reportVO.repStatusCode eq '8'}"> <!-- 반려 -->
						<button type="button" class="btn bg-gray" id="btnReqApproval">결재 재요청</button>
						<button type="button" class="btn bg-gray" id="btnDelete">삭제</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn light-gray" id="btnSave">임시저장</button>
						<button type="button" class="btn bg-gray" id="btnReqApproval">결재의뢰</button>
						<c:if test="${not empty reportVO.mode}">
							<button type="button" class="btn bg-gray" id="btnDelete">삭제</button>
						</c:if>
					</c:otherwise>
				</c:choose>
				<a href="./list.do?menuKey=${menuKey}" class="btn">목록</a>
			</div>
		</div>

	</form:form>

	<script type="text/javascript">
	
	
	let cdListSector = []; //[{key:1,value:'창호'},{key:2,value:'바닥재'},{key:3,value:'단열재'},{key:4,value:'벽지'},{key:5,value:'표면소재'},{key:6,value:'산업용필름'},{key:7,value:'자동차소재부품'},{key:8,value:'인테리어'},{key:9,value:'연구소'},{key:10,value:'품질'},{key:11,value:'생산기술(제조혁신)'},{key:12,value:'환경안전'},{key:13,value:'기타'}];
	let cdLeaderBelt = []; // = [{key:1,value:'GB'},{key:2,value:'BB'},{key:3,value:'BB후보'},{key:4,value:'MBB'},{key:5,value:'MBB후보'},{key:6,value:'MGB'},{key:7,value:'No Belt'}];
	let cdActionType = []; // = [{key:1,value:'품질개선'},{key:2,value:'개발'},{key:3,value:'생산성향상'},{key:4,value:'원가개선'},{key:5,value:'기타'}];
	let cdMbbUseRate = []; // = [{key:1,value:'해당없음'},{key:2,value:'직접수행'},{key:3,value:'지원MBB'},{key:4,value:'팀장MBB '}];
	let cdRepResultType = []; // = [{key:1,value:'외부실패비용'},{key:2,value:'내부실패비용'},{key:3,value:'매출액'},{key:4,value:'제조원가'},{key:5,value:'상품원가'},{key:6,value:'기타 영업이익'},{key:7,value:'해당없음 '}];
	let cdRepType1 = [];
	let cdRepType2 = [];
	let cdRepType3 = [];
	let cdBusGrp = [];
	let noneVal = [{key:1,value:'해당없음'}];
	let codes = [
		<c:forEach var="item" items="${allCodes}">{index:"${item.codeGrpId}",key:"${item.codeId}",value:"${item.codeNm}"},
		</c:forEach>
	];
	
	let vMenuType = "${reportVO.repMenuCode}";
	
</script>
<script type="text/javascript">
	$(document).ready(init);
	
	function init(){
		
		initCode();
		
		setControl()
		
		setEvent();
	}
	
	function initCode(){
		cdListSector = codes.filter(function(code){ return code.index==="SECTOR"; });
		cdLeaderBelt = codes.filter(function(code){ return code.index==="LDRBELT"; });
		cdActionType = codes.filter(function(code){ return code.index==="ACTTYPE"; });
		cdMbbUseRate = codes.filter(function(code){ return code.index==="MBBUSERT"; });
		cdRepResultType = codes.filter(function(code){ return code.index==="RESULTTY";});
		if(vMenuType==="REPORT"){
			cdRepType1 = codes.filter(function(code){ return code.index==="RP_TY1";});
		} else {
			cdRepType1 = codes.filter(function(code){ return code.index==="RP_TY1" && code.value==="DMAIC";});  // 분임조에서는 DMAIC만 적용(화면설계서)	
		}
		
		cdRepType2 = codes.filter(function(code){ return code.index==="RP_TY2";});
		cdRepType3 = codes.filter(function(code){ return code.index==="RP_TY3";});
		cdBusGrp = codes.filter(function(code){ return code.index==="BUSGRP"});
	}
	
	function setControl(){
		
		setDropDown("repSectorCode", cdListSector, true);//부문코드
		$("#repSectorCode").val("${reportVO.repSectorCode}")
		onchange_ddlRepSectorCode();
		$("#repProductClass").val("${reportVO.repProductClass}");
		
		setDropDown("repLeaderBeltCode", cdLeaderBelt, true);//리더벨트
		$("#repLeaderBeltCode").val("${reportVO.repLeaderBeltCode}")
		//onchange_ddlRepLeaderBeltCode();
		
		setDropDown("repActionTypeCode", cdActionType, true);//활동분야
		
		$("#repActionTypeCode").val("${reportVO.repActionTypeCode}")
		
		setDropDown("ddlRepMbbUseRateCode", cdMbbUseRate, false);//MBB활용율
		$("#ddlRepMbbUseRateCode").prop("disabled", true);
		/*
		const vRepMbbUseRate = "${reportVO.repMbbUseRateCode}";
		if(vRepMbbUseRate){
			$("#repMbbUseRateCode").val(vRepMbbUseRate)	;
		}
		*/
		
		//setDropDown(".ddl-rep-result-type", cdRepResultType, true);//성과항목
		const currYear = new Date().getFullYear();
		$("#lblUseRefDt").text(currYear); 
		//$("#repUseRefDate").val(currYear);	//활용율 반영년도

		onchange_ddlRepDevisionCode();	// 과제유형
		$("#repTypeCode").val("${reportVO.repTypeCode}");
		
		//setDropDown("repProductClass", [], true);
		
		
		if($("#mode").val()==="UPDATE"){
			//$("#repDivisionCode option").prop("disabled", true); // 바꿀 수 없도록 설정
			/* $("#repDivisionCode").on("change", function(){
				return false;
			}) */
			$("#repStartDate2").val($("#repStartDate").val());
			$("#repFinishDate2").val($("#repFinishDate").val());
			
			// 일정계획 부분 신규입력시 사용할 영역을 수정시 사용하지 않도록.
			$("#trRepDate1").removeClass("tr-rep-date").show().attr("id","");
			$("#trRepDate2").remove();
		}
		
		//키워드 세팅
		if($("#repKeyword").val()){
			let arrKeyword = $("#repKeyword").val().split(",");
			$(arrKeyword).each(function(i,o){
				$(".obj-rep-keyword:eq("+i+")").val(o);
			});
		}
		
		// 브라우저 자동완성 취소
		$("input[type=text], input[type=number]").attr("autocomplete", "off");
	}
	
	function setEvent(){
		
		$(".org-search").off("click").on("click", onclick_orgSearch); // 조직 검색
		
		$("#repDivisionCode").off("change").on("change", onchange_ddlRepDevisionCode); // 6σ Full Process여부
		$("#repTypeCode").off("change").on("change", onchange_ddlRepTypeCode); // 과제유형
		// onchange_ddlRepDevisionCode : 과제유형, 일정계획 입력창 변경
		
		$("#repSectorCode").off("change").on("change", onchange_ddlRepSectorCode); // 부문 선택
		
		$("#repLeaderBeltCode").off("change").on("change", onchange_ddlRepLeaderBeltCode); // 과제리더벨트
		
		//팀멤버 추가
		$('.btn-team-member-add').off("click").on('click', function() {
			
		    addRow("member", this);
		});
		// 팀멤버 삭제
		$('.btn-team-member-remove').off("click").on('click', function(){
			$(this).closest('tr').remove();
		});
		
		// 예상성과 추가
		$(".btn-team-result-add").off("click").on("click", function(){
			addRow("result", this);
		});
		
		// 예상성과 제거
		$(".btn-team-result-remove").off("click").on("click", function(){
			$(this).closest('tr').remove();
		});
		
		// 주요지표 추가
		$(".btn-team-indi-add").off("click").on("click", function(){
			addRow("indi", this);
		});
		
		// 주요지표 제거
		$(".btn-team-indi-remove").off("click").on("click", function(){
			$(this).closest('tr').remove();
		});
		
		//저장버튼
		$("#btnSave").off("click").on("click", function(){
			if($("#defaultForm").validationEngine('validate')){
				$("#repStatusCode").val("1"); // 상태 임시저장 으로 저장
				$("#defaultForm")[0].submit();	
			};
		});
		
		//결재버튼
		$("#btnReqApproval").off("click").on("click", function(){
			if($("#defaultForm").validationEngine('validate')){
				$("#repStatusCode").val("2"); // 상태 임시저장 으로 저장
				$("#defaultForm")[0].submit();	
			};
		});
		
		// 결재취소버튼
		$("#btnCancelApproval").off("click").on("click", function(){
			$("#mode").val("CANCEL");
			$("#defaultForm")[0].submit();
		});
		
		// 삭제버튼
		$("#btnDelete").off("click").on("click", function(){
			if(confirm("삭제하시겠습니까?")){
				//$("#repStatusCode").val("2"); // 상태 임시저장 으로 저장
				$("#mode").val("DELETE");
				$("#defaultForm")[0].submit();	
			};
		});
		
  	 	// 검색 이벤트
		$(".btn-search-emp").off("click").on("click", function(){
			callPopup_searchEmployee(this);
		});
	 	
		$(".btn-search-leader").off("click").on("click", function(){
			callPopup_searchLeader(this);
		});

		$("#defaultForm").validationEngine('attach', {
			unbindEngine:false,
			validationEventTrigger: "submit",
			promptPosition : "topLeft",
			showOneMessage : true,
			customFunctions: {
				//
			},
			onValidationComplete: function(form, status){
				if(status == true) {
					
					if($("#fileUploadWrap").find(".files tr.template-download").length===0){
						alert("과제등록서 첨부파일이 등록되지 않았습니다. \n파일 선택 후 '전체첨부' 혹은 '첨부' 버튼을 클릭하시고 진행해주세요.");
						return false;
					}
					
					
					// 일정 순차 입력여부 확인 (6시그마:date-6sigma, 그 외  act-date)
					let repDevCd = $("#repDivisionCode").val();
					if("2,3".indexOf(repDevCd)>-1){		// 일반과제, 10+과제일 경우
						
						if(vMenuType==="REPORT"){ //6시그마과제의 일반/10+과제일 경우
							if(exeDateCheck("plan-date")){
								alert("단계별 계획 일정이 잘못되었으므로 확인하시기 바랍니다.");
								$(".plan-date:eq(0)").focus();
								return false;
							}
						}
						
						if(exeDateCheck("act-date")){
							alert("단계별 계획 일정이 잘못되었으므로 확인하시기 바랍니다.");
							$(".act-date:eq(0)").focus();
							return false;
						}
						
					} else {
						if(exeDateCheck("date-6sigma")){
							alert("단계별 계획 일정이 잘못되었으므로 확인하시기 바랍니다.");
							$(".date-6sigma:eq(0)").focus();
							return false;
						}
					}
					
					
					//리더벨트 체크
					if(vMenuType==="REPORT" && checkLdrBelt(true)){ // 메시지 출력 여부 true
						return false;
					}
					
					if(confirm("저장하시겠습니까?")) {
						//contentsEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
						//$("#defaultForm").submit();
						return true;
					} 
					return false;
				}
			}
		});
		
		// 6시그마 날짜 순차 체크
		//$(".date-6sigma").off("change").on("change", function(e){
		//    checkDateOrder("date-6sigma", this);
		//});
		// 저장할 때 한번에 체크하기
		
		// 일반과제, 10+과제 날짜 순차 체크
		//$(".act-date").off("change").on("change", function(e){
		//    checkDateOrder("act-date", this);
		//});
		
	}
	
	function exeDateCheck(classNm){
		
		let isWrong = false;
		$("."+classNm).each(function(i, o){
			let currDate = $("."+ classNm +":eq("+i+")").val();
		    //console.log(i+"번째", "반복중 현재 체크할 날짜:", currDate);
		    for(let k=0; k<i; k++){
		    	let tmpDate = $("."+ classNm +":eq("+k+")").val();
		        //console.log(i, k, $(".date-6sigma:eq("+k+")").attr("id"), currDate, tmpDate, currDate>=tmpDate);   
		        if(currDate<tmpDate){
		            //console.log("커!");
		            isWrong = true;
		            return;
		        }
		    }
		    //console.log("---------");
		});
		
		return isWrong;
		
		//checkDateOrder("date-6sigma", this);
		//checkDateOrder("act-date", this);
		
	}
	
	// 순서대로 가면서 현재 입력된 날짜보다 큰 날짜가 있는지 체크
	/* function checkDateOrder(className, currObj){
		
	    $("."+className).each(function(i,o){
	    
	        let currObjDt = $(currObj).val();
	        let tmpObjDt = $(o).val();
	        //console.log("현재ID : ", $(currObj).attr("id"));
	        let currSeq = Number($(currObj).attr("seq"));
	        
	        if(i<currSeq){
		        if($(currObj).attr("id")!=$(o).attr("id") && currObjDt<tmpObjDt){
		            alert("이전 단계 이전의 날짜를 선택할 수 없습니다.");
		            $(currObj).val("");
		            return false;
		        }	
	        }
	    });
	} */
	
	function addRow(mode, obj){

		//mode : member(팀원), result(성과), indi(지표)
		
		let oParent = $(obj).closest('tr')
	    let oClone = oParent.clone();
		let befId = oClone.attr("idSeq");
		let befName = oClone.attr("nameSeq");
		
		let newIdx = -1;
		if(mode==="member"){
			newIdx = ++memMaxSeq;
			hdStr = "repTeamMemberList";
		} else if(mode==="result"){
			newIdx = ++resMaxSeq;
			hdStr = "repResultList";
		} else if(mode==="indi"){
			newIdx = ++indMaxSeq;
			hdStr = "repIndicatorList";
		}
		
	    oClone.find('input, select').val('').each(function(i,o){
	    	let currId = $(o).attr("id");
	    	let currName = $(o).attr("name");
	    	$(o).attr("id", currId.replace(befId, hdStr+newIdx));
	    	$(o).attr("name", currName.replace(befName, hdStr+"["+newIdx+"]"))
	    });
	    oClone.find(".ico.tip").remove();
	    oClone.find('.btn-team-'+ mode +'-add').text('삭제');
	    oClone.find('.btn-team-'+ mode +'-add').removeClass('btn-team-'+ mode +'-add').addClass('btn-team-'+ mode +'-remove');
	    
	    if(mode==="member"){
	    	oClone.find('th > label').text('팀멤버');
	    	oClone.find('.team-role-cd').val("2");

	    	oClone.find('td:nth-child(3), td:nth-child(4), td:nth-child(5), td:nth-child(6)').text('');
	    	$(oClone).children().eq(1).children().children().children().removeClass("validate[required]"); //벨리데이션 생략
	    	oParent.after(oClone);
	    	
	    	setRepTeamEvent();
	    } else if(mode==="result"){
	    	oClone.find('span.only-first').remove();
		    oClone.find('select.only-first').removeClass('validate[required]');
		    oParent.after(oClone);
	    } else {
	    	oParent.parent().find("tr:last").after(oClone);	
	    }
	    
	    //$(".tr-team-role-3").before(oClone);
	 	setEvent();
	}

	
	
	function onclick_orgSearch(e){
		
		let retObj = $(this).find("input")
		popupGetOrgCd(retObj);
	}
	
	function onchange_ddlRepDevisionCode(e){
	
		let repDevCd = $("#repDivisionCode").val(); //이벤트 트리거 객체의 값
		let targetObjId = "repTypeCode";	//바뀔 대상 객체 ID
		let arrRepType = [];
		$(".tr-rep-date").hide();
		switch(repDevCd){
		case "1": //6sigma
			arrRepType = cdRepType1;
			$("#trRepDate1").show();
			$("#trRepDate1 input.datepicker").prop("disabled", false);
			$("#trRepDate2 input.datepicker").prop("disabled", true);
			break;
		case "2": //일반
			arrRepType = cdRepType2;
			$("#trRepDate2").show();
			$("#trRepDate1 input.datepicker").prop("disabled", true);
			$("#trRepDate2 input.datepicker").prop("disabled", false);
			
			break;
		case "3": // 10+No.
			arrRepType = cdRepType3;
			$("#trRepDate2").show();
			$("#trRepDate1 input").prop("disabled", true);
			$("#trRepDate1 input.datepicker").prop("disabled", true);
			$("#trRepDate2 input.datepicker").prop("disabled", false);
			break;
		default:
			break;
		}
		
		if(vMenuType==="TEAM" && (repDevCd==="2" || repDevCd==="3")){
			$("#repTypeCode").prop("disabled", true);
			$("#trPlanDate").remove();
		} else {
			$("#repTypeCode").prop("disabled", false);
		}

		changeTitle();
		setDropDown(targetObjId, arrRepType, true);
	}

	function onchange_ddlRepSectorCode(e){
		
		// 부문 선택시 해당하는 제품군만 리스트에 보여준다.
		let sectorCode = $("#repSectorCode").val();		//부문
		let cdBusGrpFiltered = cdBusGrp.filter(function(code){
		    return code.key.startsWith('0'+sectorCode);
		});

		if(sectorCode===""){
			setDropDown("repProductClass", [], true, "부문을 선택하세요");
			$("label[for=repProductClass]").parent().find("span").show();
			$("#repProductClass").addClass("validate[required]");
		} else if (cdBusGrpFiltered.length===0){
			setDropDown("repProductClass", [], true, "(해당없음)");
			$("label[for=repProductClass]").parent().find("span").hide();
			$("#repProductClass").removeClass("validate[required]");
		} else {
			setDropDown("repProductClass", cdBusGrpFiltered, true);
			$("label[for=repProductClass]").parent().find("span").show();
			$("#repProductClass").addClass("validate[required]");
		}
		
		if(sectorCode === '11' || sectorCode === '12' || sectorCode === '13'){
			setDropDown("repActionTypeCode", [], true, "(해당없음)");
		}else{
			setDropDown("repActionTypeCode", cdListSector, true);
		}
		
		//생산기술(제조혁신) - 11
		//환경안전 - 12
		//기타 - 13
	}
	
	function onchange_ddlRepTypeCode(e){
		
		changeTitle(); // 6sigma 일정계획 타이틀 변경( DMAIC ↔ DMEDI )
	}
	
	function onchange_ddlRepLeaderBeltCode(e){

		// MBB 리더벨트가 MBB일 경우 활용율 '직접수행', 나머지 '해당없음'
		if($("#repLeaderBeltCode").val()==="D002"){
			$("#ddlRepMbbUseRateCode, #repMbbUseRateCode").val("2");
		} else {
			$("#ddlRepMbbUseRateCode, #repMbbUseRateCode").val("1");
		}
	}
	
	function changeTitle(){
		let repDevCd = $("#repDivisionCode").val(); 	// 6sigma F-P 여부
		let repTypeCd = $("#repTypeCode").val();	// 과제유형
		
		if(repDevCd==="1"){
			let focusAttr = "";
			if(repTypeCd==="12"){
				//DMEDI str2
				focusAttr = "str2";
				
			} else {
				//DMAIC str1
				focusAttr = "str1";
			}
			$("#trPlanDateLabel th").each(function(i,o){
			    $(o).text($(o).attr(focusAttr))
			});
		} else {
			// 일반과제, 10+과제
			$(".6sigma-date").each(function(i, o){
				$(o).val("");
			});
		}
	}
	
	function onkeypress_repKeyword(obj){
		
		filterString(obj);
		
		let sumStr = "";
		
		$(".obj-rep-keyword").each(function(i,o){
			if(!$(o).val()){
				//console.log("없음!")
			} else {
				if(i>0)
			    	sumStr += ",";
			    sumStr += $(o).val();	
			}
		});
		
		$("#repKeyword").val(sumStr);
		//console.log($("#repKeyword").val())
	}
	
	function filterString(obj){

		//const reg = /[\{\}\ \[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
		const reg = /[\{\}\ \[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;
		
		// 허용할 특수문자는 여기서 삭제하면 됨
		// 지금은 띄어쓰기도 특수문자 처리됨
		if( reg.test(obj.value) ){
			console.log("특수문자는 입력하실수 없습니다.");
			obj.value = obj.value.replace(reg,'');
		}	
	}
	
	function onchange_repStartDate(obj){
		$("#repStartDate").val(obj.value);
	}
	
	function onchange_repFinishDate(obj){
		$("#repFinishDate").val(obj.value);
	}
	
	function validate(){
		//과제명
		//*6σ Full Process여부 
		//과제유형
		//부문
		//*제품군
		//*과제리더벨트 
		//활동분야
		//*MBB활용율	
		//*일정계획
		//*키워드 
		
		//[승인]
		//*과제리더	
		//팀멤버 (최소1명)
		//*과제지도/사원	
		//*Process Owner	
		//*챔피언	(챔피언이 들어가야 하는 경우와 아닌 경우 구분하기)
		
		//[성과 및 주요지표]
		// 예상성과 아래 열의 갯수만큼 반복하며 체크하기
		// ㄴ *성과항목
		return true;
	}
	
	// 팝업 호출 함수(팀원 검색)
	function callPopup_searchEmployee(obj){

		popEmp.init();
		
		// footer.jsp 내 영역 호출
		popEmp.returnObjId = $(obj).closest("td").find("input").attr("id");
		popEmp.returnFunc = callback_popEmp;
		
		popEmp.open();
	}
	
	// 팝업에서 돌아올 때 함수
	function callback_popEmp(objId, data){
		
		let comNoExists = false;
		$(".team-com-no").each(function(i, o){
		    if($(o).attr("id").indexOf(objId.substring(0, objId.indexOf(".")))===-1){
		    	if($(o).val()===data.comNo){
		    		comNoExists = true;
		    	}
		    }
		});
		
		if(comNoExists){
			alert("이미 지정된 사원입니다.");
			return false;
		}
		
		//data = {"comNo":"00208995","userId":"parksoomin","userName":"박수민","deptFullName":"울산설비팀(전기PM／변전실)","comJobx":"사원","comPosition":"생산파트장","comCertBelt":null}
		let obj = document.getElementById(objId);
		let objTr = $(obj).closest("tr");
		$(obj).val(data.userName);
		
		//$(objTr).find(".td-user-nm").text(data.userName);
		$(objTr).find(".td-dept-nm").text(data.deptFullName);
		$(objTr).find(".td-com-jobx").text(data.comJobxNm);
		$(objTr).find(".td-com-pos").text(data.comPositionNm);
		$(objTr).find(".td-belt-nm").text(data.comCertBeltNm);
		
		//$(objTr).find(".team-role-cd").val(data.repTeamMemRole);
		$(objTr).find(".team-belt-cd").val(data.comCertBelt);
		$(objTr).find(".team-dept-cd").val(data.comDepartCode);
		$(objTr).find(".team-com-no").val(data.comNo);
		$(objTr).find(".team-jobx-cd").val(data.comJobx);
		$(objTr).find(".team-position-cd").val(data.comPosition);
		$(objTr).find(".team-mem-nm").val(data.userName);
		
		$(objTr).find(".report-code").val('${reportVO.repCode}');
	}

	// 팝업 호출 함
	function callPopup_searchLeader(obj){

		popEmp.init();
		
		// footer.jsp 내 영역 호출
		popEmp.returnObjId = $(obj).closest("td").find("input").attr("id");
		popEmp.returnFunc = callback_popLeader;
		
		popEmp.open();
	}
		
	// 팝업에서 돌아올 때 함수
	function callback_popLeader(objId, data){
		
		//data = {"comNo":"00208995","userId":"parksoomin","userName":"박수민","deptFullName":"울산설비팀(전기PM／변전실)","comJobx":"사원","comPosition":"생산파트장","comCertBelt":null}
		let obj = document.getElementById(objId);
		let objTr = $(obj).closest("tr");
		
		$(obj).val(data.comNo);
		$(objTr).find("#repLeaderName").val(data.userName);
	}
	
	function checkLdrBelt(boolMsgOut){
		
		/*
		팀 멤버 리더벨트 값을 기준으로 과제 리더벨트의 지정이 가능한 값인지 확인하고, 아닐 경우 
		D000    GB					D001    BB
		D001-1  BB후보				D002    MBB
		D002-1  MBB후보				D003    MGB				7       No Belt
		
		(팀원) 리더벨트 / (과제) 리더벨트 
	    (벨트 없으면)  / No Belt
		GB         / GB, BB후보
		BB         / BB, MBB후보
		MBB        / MBB
		*/

		let repLdrBelt = $("#repLeaderBeltCode").val();
		let teamLdrBelt = $(".tr-team-role-1").find("input.team-belt-cd").val()
		let teamLdrName = $(".tr-team-role-1").find("input[type=text]").val()

		let flagBeltMatching = false;
		let retMst = "";
		switch(teamLdrBelt) { // 팀멤버 리더벨트 기준으로
		  case '': // 리더벨트 없으면
		    if(repLdrBelt!="7"){ // 과제벨트 No Belt(7)
		        flagBeltMatching = true;
		        retMsg = "과제리더("+ teamLdrName +")의 벨트코드가 없으므로 과제정보의 과제리더벨트는 'No Belt'로 지정해주세요.";
		    }
		    break;
		  case 'D000': // 멤버 리더벨트 GB
		    if(repLdrBelt!="D000" && repLdrBelt!="D001-1"){ // 과제 리더벨트 GB or BB후보
		        flagBeltMatching = true;
		        retMsg = "과제리더("+ teamLdrName +")의 벨트코드가 'GB'이므로 과제정보의 과제리더벨트는 'GB' 혹은 'BB후보'로 지정해주세요.";
		    }
		    break;
		  case 'D001': // 멤버 리더벨트 B
		    if(repLdrBelt!="D001" && repLdrBelt!="D002-1"){ // 과제 리더벨트 BB or MBB후보
		        flagBeltMatching = true;
		        retMsg = "과제리더("+ teamLdrName +")의 벨트코드가 'BB'이므로 과제정보의 과제리더벨트는 'BB' 혹은 'MBB후보'로 지정해주세요.";
		    }
		    break;
		  case 'D002': // MBB
		    if(repLdrBelt!="D002"){ // 과제 리더벨트 GB or BB후보
		        flagBeltMatching = true;
		        retMsg = "과제리더("+ teamLdrName +")의 벨트코드가 'MBB'이므로 과제정보의 과제리더벨트는 'MBB'로 지정해주세요.";
		    }
		    break;
		}
		
		if(flagBeltMatching && boolMsgOut){
			alert(retMsg);
		}
		
		return flagBeltMatching;
	}
	
</script>

</body>
</html>