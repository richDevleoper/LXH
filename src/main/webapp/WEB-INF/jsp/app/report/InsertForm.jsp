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
<form:form commandName="frmReport" id="defaultForm" name="defaultForm"  action="${action}" onsubmit="return false" method="post" modelAttribute="reportVO">
<form:hidden path="repStatusCode" />
<form:hidden path="repCode" />
<form:hidden path="mode" />
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
                                                <th><form:label path="repName"><span class="asterisk">*</span>과제명</form:label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <form:input type="text" id="txtRepName" path="repName" value="" title="과제명을 입력해주세요." />
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><form:label path="repDivisionCode"><span class="asterisk">*</span>6σ Full Process여부</form:label> <i class="ico tip"><em>tip.</em></i></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select path="repDivisionCode" title="6σ Full Process여부 선택">
																<c:forEach var="item" items="${divisionCode}">
																	<option value="${item.codeId}" <c:if test="${item.codeId eq reportVO.repDivisionCode }">selected="selected"</c:if>>${item.codeNm}</option>
																</c:forEach>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><form:label path="repTypeCode"><span class="asterisk">*</span>과제유형</form:label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select path="repTypeCode" title="과제유형 선택">
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><form:label path="repSectorCode"><span class="asterisk">*</span>부문</form:label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select path="repSectorCode" title="부문 선택">
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><form:label path="repProductClass"><span class="asterisk">*</span>제품군</form:label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <form:input type="text" path="repProductClass" name="REP_PRODUCT_CLASS" value="" title="제품군을 입력해주세요." />
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><form:label path="repLeaderBeltCode"><span class="asterisk">*</span>과제리더벨트</form:label> <i class="ico tip"><em>tip.</em></i></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select path="repLeaderBeltCode" title="부문 선택">
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><form:label path="repActionTypeCode"><span class="asterisk">*</span>활동분야</form:label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select path="repActionTypeCode" title="활동분야 선택">
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><form:label path="repMbbUseRateCode"><span class="asterisk">*</span>MBB활용율</form:label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select path="repMbbUseRateCode" title="MBB활용율 선택">
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th>활용율 반영년도</th>
                                                <td><span id="lblUseRefDt">-</span>년 <input type="hidden" name="REP_USE_REF_DATE" id="hidUseRefDt" value=""></td>
                                            </tr>
                                            <tr id="trRepDate1" class="tr-rep-date">
                                                <th><span class="asterisk">*</span>일정계획<br>(완료예정일)</th>
                                                <td colspan="3">
                                                    <div class="list-table list">
                                                    
                                                    
		<c:choose>  
			<c:when test="${reportVO.repDivisionCode eq '1'}">
			1
			</c:when>
			<c:otherwise>
			2
			</c:otherwise>
		</c:choose>			

                                                    
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
                                                                    <td class="pd3">
                                                                        <div class="row"><!-- Define -->
                                                                            <div class="col s12 input-text input-date">
                                                                                <%-- <form:input type="text" path="repStartDate" class="datepicker" /> --%>
                                                                                <i class="ico calendar"></i>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td class="pd3 dt-6sig">
                                                                        <div class="row"><!-- Measure -->
                                                                            <div class="col s12 input-text input-date">
                                                                                <%-- <form:input type="text" path="repSixMeasureDate" class="datepicker 6sigma-date"/> --%>
                                                                                <i class="ico calendar"></i>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td class="pd3 dt-6sig">
                                                                        <div class="row"><!-- Analyze / Explore -->
                                                                            <div class="col s12 input-text input-date">
                                                                                <%-- <form:input type="text" path="repSixExploreDate" class="datepicker 6sigma-date"/> --%>
                                                                                <i class="ico calendar"></i>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td class="pd3 dt-6sig">
                                                                        <div class="row"><!-- Improve / Develop -->
                                                                            <div class="col s12 input-text input-date">
                                                                                <%-- <form:input type="text" path="repSixDevelopDate" class="datepicker 6sigma-date"/> --%>
                                                                                <i class="ico calendar"></i>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td class="pd3 dt-6sig">
                                                                        <div class="row"><!-- Control / Implement -->
                                                                            <div class="col s12 input-text input-date">
                                                                                <%-- <form:input type="text" path="repSixImplementDate"  class="datepicker 6sigma-date"/> --%>
                                                                                <i class="ico calendar"></i>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td class="pd3">
                                                                        <div class="row"><!-- Finish -->
                                                                            <div class="col s12 input-text input-date">
                                                                                <%-- <form:input type="text" path="repFinishDate" class="datepicker"/> --%>
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
                                            <tr id="trRepDate2" class="tr-rep-date" style="display: none;">
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
                                                                                <input type="text" id="repStartDate2" name="REP_START_DATE_2" value="" class="datepicker" onchange="onchange_repStartDate(this)">
                                                                                <i class="ico calendar"></i>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td class="pd3">
                                                                        <div class="row">
                                                                            <div class="col s12 input-text input-date" style="float:none;width:120px;margin:0 auto !important">
                                                                                <input type="text" id="repFinishDate2" name="REP_FINISH_DATE_2" value="" class="datepicker" onchange="onchange_repFinishDate(this)">
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
                                                <th><label path="select6"><span class="asterisk">*</span>키워드</label> <i class="ico tip"><em>tip.</em></i></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s8">
                                                            <div class="col s2 input-text pd-r10" style="width:20%">
                                                            	<form:input type="hidden" path="repKeyword" />
                                                                <input type="text" id="txtRepKeyword_1" name="REP_KEYWORD" class="obj-rep-keyword" value="" title="키워드를 입력해주세요." onkeyup="onkeypress_repKeyword(this)">
                                                            </div>
                                                            <div class="col s2 input-text pd-r10" style="width:20%">
                                                                <input type="text" id="txtRepKeyword_2" name="REP_KEYWORD" class="obj-rep-keyword" value="" title="키워드를 입력해주세요." onkeyup="onkeypress_repKeyword(this)">
                                                            </div>
                                                            <div class="col s2 input-text pd-r10" style="width:20%">
                                                                <input type="text" id="txtRepKeyword_3" name="REP_KEYWORD" class="obj-rep-keyword" value="" title="키워드를 입력해주세요." onkeyup="onkeypress_repKeyword(this)">
                                                            </div>
                                                            <div class="col s2 input-text pd-r10" style="width:20%">
                                                                <input type="text" id="txtRepKeyword_4" name="REP_KEYWORD" class="obj-rep-keyword" value="" title="키워드를 입력해주세요." onkeyup="onkeypress_repKeyword(this)">
                                                            </div>
                                                            <div class="col s2 input-text pd-r10" style="width:20%">
                                                                <input type="text" id="txtRepKeyword_5" name="REP_KEYWORD" class="obj-rep-keyword" value="" title="키워드를 입력해주세요." onkeyup="onkeypress_repKeyword(this)">
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
                                            <col style="width:180px">
                                            <col>
                                            <col style="width:70px">
                                            <col style="width:65px">
                                            <col style="width:80px">
                                            <col style="width:65px">
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
                                       <!-- # To-Do -->
                                        <tbody>
                               
		<c:choose>  
			<c:when test="${reportVO.mode eq 'UPDATE'}"> 
				<c:forEach var="item" items="${reportVO.repTemMemberList}">
		
											<tr class="tr-team-role-${item.repTeamMemRole}">
											
											
                                                <th><label <c:if test="${item.repTeamMemRole eq '3' || item.repTeamMemRole eq '5'}">class="color primary"</c:if>><span class="asterisk">*</span>${item.repTeamMemRoleNm}</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                    	
                                                    <!-- <input type="hidden" name="repTemMemberList[0].repTeamCode" value="1"/> -->
                                                    <input type="hidden" name="repTeamMemRole" value="1"/> <!-- 1 과제리더 -->
                                                    <input type="hidden" name="">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" class='dept-full-name' value="${item.deptName}" readonly>
                                                            <button type="button" class="btn-search-emp">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>${item.repTeamMemName}</td>
                                                <td>${item.comJobxNm}</td>
                                                <td>${item.comPositionNm}</td>
                                                <td>${item.beltNm}</td>
                                                <td class="pd3">
                                                  <c:if test="${item.repTeamMemRole eq '2'}">
                                                	<div class="btn-group">
                                                        <button type="button" class="btn light-gray btn-team-member-add">추가</button>
                                                    </div>
                                                  </c:if>
                                                </td>
                                            </tr>                                            
				</c:forEach>
				<script>
					$(".btn-team-member-add").each(function(i, o){ 
					    if(i>0){
					        $(o).text('삭제');
							$(o).removeClass('btn-team-member-add').addClass('btn-team-member-remove');
					    }
					});
					$('.btn-team-member-remove').off("click").on('click', function(){
						$(this).closest('tr').remove();
					});
					$(".tr-team-role-2 th label .asterisk").each(function(i,o){
					    if(i>0){
					        $(o).hide();
					    }
					});
				</script>
			</c:when> 
			<c:otherwise> 
                                            <tr class="tr-team-role-1">
                                                <th><label><span class="asterisk">*</span>과제리더</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                    	
                                                    <!-- <input type="hidden" name="repTemMemberList[0].repTeamCode" value="1"/> -->
                                                    <input type="hidden" name="repTeamMemRole" value="1"/> <!-- 1 과제리더 -->
                                                    <input type="hidden" name="">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" class='dept-full-name' readonly>
                                                            <button type="button" class="btn-search-emp">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td class="pd3"></td>
                                            </tr>
                                            <tr class="tr-team-role-2">
                                                <th><label><span class="asterisk">*</span>팀멤버</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                    
                                                    <input type="hidden" name="repTeamMemRole" value="2"/> <!-- 2 팀멤버 -->
                                                        <div class="col s12 input-text search">
                                                            <input type="text" class='dept-full-name' readonly>
                                                            <button type="button" class="btn-org btn-psmg-search-modal">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="com-name"></td>
                                                <td class="jobx"></td>
                                                <td class="position"></td>
                                                <td class="belt"></td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn light-gray btn-team-member-add">추가</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="tr-team-guide">
                                                <th><label class="color primary"><span class="asterisk">*</span>과제지도/사원</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                    	<input type="hidden" name="repTeamMemRole" value="3"/> <!-- 3 과제지도/사원 -->
                                                        <div class="col s12 input-text search">
                                                            <input type="text" class='dept-full-name' readonly>
                                                            <button type="button">검색</button>
                                                        </div> 
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td class="pd3"></td>
                                            </tr>
                                            <tr class="tr-team-proc-owner">
                                                <th><label for="text8">Process Owner</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                    <input type="hidden" name="repTeamMemRole" value="4"/> <!-- 4	PROCESS OWNER -->
                                                        <div class="col s12 input-text search">
                                                            <input type="text" class='dept-full-name' readonly>
                                                            <button type="button">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td class="pd3"></td>
                                            </tr>
                                            <tr class="tr-team-champion">
                                                <th><label for="text9" class="color primary"><span class="asterisk">*</span>챔피언</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                    <input type="hidden" name="repTeamMemRole" value="5"/> <!-- 5	챔피언 -->
                                                        <div class="col s12 input-text search">
                                                            <input type="text" class='dept-full-name' readonly>
                                                            <button type="button">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td class="pd3"></td>
                                            </tr>				
			</c:otherwise> 
		</c:choose> 
		

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
                                                <th colspan="9">예상성과</th>	<!-- TB_REPORT_RESULT -->
                                            </tr>
                                        </thead>
                                        <tbody>
<c:forEach var="item" items="${reportVO.repResultList}" varStatus="status">
                                            <tr>
                                                <th class="pd0 pd-r23"><label path="ddlRepResultTypeCode"><c:if test="${status.first}"><span class="asterisk">*</span></c:if>성과항목</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select path="repResultList[${status.index}].repResultTypeCode" title="성과항목 선택" >
                                                            <c:forEach var="option" items="${codeResultTy}" >
	                                                            <form:option value="${option.codeId}" label="${option.codeNm}" />
	                                                        </c:forEach>    
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th class="pd0 pd-r23"><label for="txtRepResultWithinYear">년내(당해년)</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <%-- <input type="text" name="REP_RESULT_WITHIN_YEAR" id="txtRepResultWithinYear" class="" value="${item.repResultWithinYear}" title="년내 입력"> --%>
                                                            <form:input type="text" path="repResultList[${status.index}].repResultWithinYear" title="년내 입력" />
                                                        </div>
                                                    </div>
                                                </td>
                                                <th class="pd0 pd-r23"><label for="txtRepResultYear">년간(12개월)</label></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="txtRepResultYear" name="REP_RESULT_YEAR" class="" value="${item.repResultYear}" title="년내 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th class="pd0 pd-r10"><label for="txtRepResultCalLogic">산출 Logic</label> <c:if test="${status.first}"><i class="ico tip"><em>tip.</em></i></c:if></th>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="txtRepResultCalLogic" name="REP_RESULT_CAL_LOGIC" value="${item.repResultCalLogic}" title="년내 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                    <c:choose>  
														<c:when test="${status.first}">
															<button type="button" class="btn light-gray btn-team-member-add">추가</button>
														</c:when>
														<c:otherwise>
															<button type="button" class="btn light-gray btn-team-member-remove">삭제</button>
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
<c:forEach var="item" items="${reportVO.repIndicatorList}" varStatus="status">                                        
                                            <tr>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="txtRepIndiPy_Item" name="repIndicatorList[${status.index}].repIndiPyItem" value="${item.repIndiPyItem}" title="항목 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="txtRepIndiPy_Unit" name="REP_INDI_PY_UNIT" value="${item.repIndiPyUnit}" title="단위 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="txtRepIndiPy_Before" name="REP_INDI_PY_BEFORE" value="${item.repIndiPyBefore}" title="개선전 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="txtRepIndiPy_Goal" name="REP_INDI_PY_GOAL" value="${item.repIndiPyGoal}" title="개선목표 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="txtRepIndiKPI_Item" name="REP_INDI_KPI_ITEM" value="${item.repIndiKpiItem}" title="항목 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="txtRepIndiKPI_Unit" name="REP_INDI_KPI_UNIT" value="${item.repIndiKpiUnit}" title="단위 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="txtRepIndiKPI_Before" name="REP_INDI_KPI_BEFORE" value="${item.repIndiKpiBefore}" title="개선전 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="txtRepIndiKPI_Goal" name="REP_INDI_KPI_GOAL" value="${item.repIndiKpiGoal}" title="개선목표 입력">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="pd3">
                                                    <div class="btn-group">
                                                    <c:choose>  
														<c:when test="${status.first}">
															<button type="button" class="btn light-gray btn-team-member-add">추가</button>
														</c:when>
														<c:otherwise>
															<button type="button" class="btn light-gray btn-team-member-remove">삭제</button>
														</c:otherwise>
													</c:choose>
                                                    </div>
                                                    <c:if test="${status.last}">
                                                    <script>
                                                    	
                                                    </script>
                                                    </c:if>
                                                </td>
                                            </tr>
</c:forEach>                                            
                                            <!-- <tr>
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
                                            </tr> -->
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
                                                            <label path="file1">파일추가</label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr style="display:none;">
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
                                <button type="button" class="btn light-gray" id="btnSave">임시저장</button>
                                <button type="button" class="btn bg-gray" id="btnReqApproval">결재의뢰</button>
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
	
	let codes = [
		<c:forEach var="item" items="${allCodes}">{index:"${item.codeGrpId}",key:${item.codeId},value:"${item.codeNm}"},
		</c:forEach>
	];
	
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
		cdRepType1 = codes.filter(function(code){ return code.index==="RP_TY1";});
		cdRepType2 = codes.filter(function(code){ return code.index==="RP_TY2";});
		cdRepType3 = codes.filter(function(code){ return code.index==="RP_TY3";});
	}
	
	function setControl(){
		
		setDropDown("repSectorCode", cdListSector, true);//부문코드
		$("#repSectorCode").val("${reportVO.repSectorCode}")
		
		setDropDown("repLeaderBeltCode", cdLeaderBelt, true);//리더벨트
		$("#repLeaderBeltCode").val("${reportVO.repLeaderBeltCode}")
		
		setDropDown("repActionTypeCode", cdActionType, true);//활동분야
		$("#repActionTypeCode").val("${reportVO.repActionTypeCode}")
		
		setDropDown("repMbbUseRateCode", cdMbbUseRate, true);//MBB활용율
		$("#repMbbUseRateCode").val("${reportVO.repMbbUseRateCode}")
		
		//setDropDown(".ddl-rep-result-type", cdRepResultType, true);//성과항목
		$("#lblUseRefDt").text("2023"); $("#hidUseRefDt").val("2023");	//활용율 반영년도
		
		onchange_ddlRepDevisionCode();	// 과제유형
		$("#repTypeCode").val("${reportVO.repTypeCode}");
		
		if($("#mode").val()==="UPDATE"){
			$("#repStartDate2").val($("#repStartDate").val());
			$("#repFinishDate2").val($("#repFinishDate").val());
		}
		
		if($("#repKeyword").val()){
			let arrKeyword = $("#repKeyword").val().split(",");
			$(arrKeyword).each(function(i,o){
				$(".obj-rep-keyword:eq("+i+")").val(o);
			});
		}
	}
	
	function setEvent(){
		
		$(".org-search").off("click").on("click", onclick_orgSearch); // 조직 검색
		
		$("#repDivisionCode").off("change").on("change", onchange_ddlRepDevisionCode); // 6σ Full Process여부
		$("#repTypeCode").off("change").on("change", onchange_ddlRepTypeCode); // 과제유형
		// onchange_ddlRepDevisionCode : 과제유형, 일정계획 입력창 변경
		
		//팀멤버 추가
		$('.btn-team-member-add').on('click', function() {
			
		    addRow("team", this);
		});
		
		
		
		//저장버튼
		$("#btnSave").on("click", function(){
			if(validate()){
				$("#repStatusCode").val("1"); // 상태 임시저장 으로 저장
				$("#defaultForm")[0].submit();	
			};
		});
		
		//결재버튼
		$("#btnReqApproval").on("click", function(){
			if(validate()){
				$("#repStatusCode").val("2"); // 상태 임시저장 으로 저장
				$("#defaultForm")[0].submit();	
			};
		});
		
		$(".btn-search-emp").on("click", function(){
			callPopup_searchEmployee(this);
		});
		
	}
	
	function addRow(mode, obj){

		let oParent = $(obj).closest('tr')
	    let oClone = oParent.clone();
	    oClone.find('input').val('');
	    if(mode==="team"){
	    	oClone.find('th > label').text('팀멤버');
	    	oClone.find('td:nth-child(3), td:nth-child(4), td:nth-child(5), td:nth-child(6)').text('');
	    }
		oClone.find('.btn-team-member-add').text('삭제');
	    oClone.find('.btn-group button').removeClass('btn-team-member-add').addClass('btn-team-member-remove');
	    oParent.after(oClone);
	    
	 	// 팀멤버 삭제
		$('.btn-team-member-remove').off("click").on('click', function(){
			$(this).closest('tr').remove();
		});
	}

	
	
	function onclick_orgSearch(e){
		debugger;
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
			break;
		case "2": //일반
			arrRepType = cdRepType2;
			$("#trRepDate2").show();
			break;
		case "3": // 10+No.
			arrRepType = cdRepType3;
			$("#trRepDate2").show();
			break;
		default:
			break;
		}
		changeTitle();
		setDropDown(targetObjId, arrRepType, true);
	}
	
	function onchange_ddlRepTypeCode(e){
		
		changeTitle(); // 6sigma 일정계획 타이틀 변경( DMAIC ↔ DMEDI )
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
				console.log("없음!")
			} else {
				if(i>0)
			    	sumStr += ",";
			    sumStr += $(o).val();	
			}
		});
		
		$("#repKeyword").val(sumStr);
		console.log($("#repKeyword").val())
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
	
	// 팝업 호출 함수
	function callPopup_searchEmployee(obj){
		
		// footer.jsp 내 영역 호출
		vMemberSearchReturnId = $(obj).closest("td").find("input").attr("id");
		vMemberSearchReturnFunc = returnPopup_searchEmployee;
		$(".modal-dimmed").show();
		$("#comPopup_memberSearch").show();
	}
	
	// 팝업에서 돌아올 때 함수
	function returnPopup_searchEmployee(data){
		
		console.log($("#"+vMemberSearchReturnId));
		vMemberSearchReturnFunc();
		closePopup();
	}
	
	function initPopup(){
		
		$(".tr-data").remove();
		$(".tr-empty").show();
		// text-box 비우기
		
	}
	
	function closePopup(){
		$(".modal-dimmed").hide();
 		$("#comPopup_memberSearch").hide();
 		
 		initPopup();
	}
	

	
</script>
</body>
</html>