<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld"%>
<%--
	1. 마이페이지 > 내 결재함 > 상세보기
	2. 과제/10+ > 과제검색 > 상세보기
	3. 분임조활동 > 과제검색 > 상세보기 
--%>
<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<title>${fn:split(boardVO.boardNm,'>')[fn:length(fn:split(boardVO.boardNm,'>'))-1]}</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>

             <div id="page-container">
                <div class="inner">
					<form:form commandName="frmApprove" id="defaultForm" name="defaultForm" action="${action}" onsubmit="return false" method="post" modelAttribute="approveVO">  
					<form:input type="hidden" path="aprovalCode"/>
					<form:input type="hidden" path="aprovalType"/>
					<form:input type="hidden" path="aprovalState"/>
					<form:input type="hidden" path="refBusType"/>
					<form:input type="hidden" path="refBusCode"/>
					<form:input type="hidden" path="detailList[0].aprovalCode"/>
					<form:input type="hidden" path="detailList[0].aprovalSeq"/>
					<form:input type="hidden" path="detailList[0].comNo"/>
					<form:input type="hidden" path="detailList[0].aprovalStatCode" cssClass="aproval-state-code"/>
					<form:input type="hidden" path="detailList[0].aprovalComment" cssClass="detail-comment"/>
					<form:input type="hidden" path="detailList[0].score1" cssClass="detail-score1"/>
					<form:input type="hidden" path="detailList[0].score4" cssClass="detail-score4"/>
					<form:input type="hidden" path="detailList[0].score5" cssClass="detail-score5"/>
					<form:input type="hidden" path="detailList[0].score6" cssClass="detail-score6"/>
					<form:input type="hidden" path="detailList[0].score7" cssClass="detail-score8"/>
					<form:input type="hidden" path="detailList[0].scoreTotal" cssClass="detail-total"/>
										
                    <section id="page-content">
                        <!-- breadcrumb -->
<c:if test="${ empty repMenuCode }"><%-- 해당 값은 "과제/분임조과제" 에서만 나옴. --%>
                        <div class="breadcrumb">
                            <ul>
                                <li>결제종류 : 과제 > 과제선정	<!-- 과제 > 6σ Full Process > DMAIC > Define --></li>
                            </ul>
							<div class="header-btns">
							<c:if test="${approveVO.aprovalState ne '3' && approveVO.aprovalState ne '4'}">
								<button type="button" class="btn bg-gray" onclick="onclick_procApprove('4')">승인</button>
                                <button type="button" class="btn bg-gray" onclick="onclick_procApprove('3');">반려</button>
                            </c:if>        
                                <a href="/apprv/list.do?menuKey=${menuKey}" class="btn">목록</a>
							</div>
                        </div>
</c:if>
                        <p class="content_title">1. 과제정보/수행</p>
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
                                                <th><label for="text1">과제명</label></th>
                                                <td colspan="3">${reportVO.repName}</td>
                                            </tr>
                                            <tr>
                                                <th>6σ Full Process여부</th>
                                                <td>${reportVO.repDivision}</td>
                                                <th>과제유형</th>
                                                <td>${reportVO.repType}</td>
                                            </tr>
                                            <tr>
                                                <th><label for="text4" class="color primary">부문</label></th>
                                                <td>${reportVO.repSector}</td>
                                                <th>제품군</th>
                                                <td>${reportVO.repProductClassName}</td>
                                            </tr>
<c:choose>  
	<c:when test="${repMenuCode eq 'REPORT'}">                                            
                                            <tr>
                                                <th><label for="text4" class="color primary">과제리더벨트</label></th>
                                                <td>${reportVO.repLeaderBelt}</td>
                                                <th><label for="text4" class="color primary">활동분야</label></th>
                                                <td>${reportVO.repActionType}</td>
                                            </tr>
                                            <tr>
                                                <th>MBB활용율</th>
                                                <td>${reportVO.repMbbUseRate}</td>
                                                <th>활용율 반영년도</th>
                                                <td>${reportVO.repUseRefDate}년</td>
                                            </tr>
	</c:when>
	<c:otherwise>
                                            <tr>
                                                <th><label for="text4" class="color primary">Leader</label></th>
                                                <td>${reportVO.repLeaderName}</td>
                                                <th><label for="text4" class="color primary">활동분야</label></th>
                                                <td>${reportVO.repActionType}</td>
                                            </tr>
                                            <tr>
                                                <th>분임조</th>
                                                <td>${circleVO.deptName}</td>
                                                <th>분임조장</th>
                                                <td>${circleVO.cirLeaderName}</td>
                                            </tr>	
	</c:otherwise>
</c:choose>
	                                            
                                            <tr>
												<th>일정계획 및 수행</th>
												<td colspan="3">
												
<!-- 일정계획 및 수행 -->						
<c:choose>  
	<c:when test="${reportVO.repDivisionCode eq '1'}">
	<!-- 6시그마 -->

		<c:choose>
			<c:when test="${approveVO.aprovalType eq '1'}">
			<!-- 6시그마 과제선정 결재(시작) -->
                                                   <div class="list-wrap">
                                                        <!-- [D] 상태에따라 열기/닫기 텍스트 구분해주세요. -->
                                                        
                                                        <ul>
                                                            <!-- [D] 열린상태일 경우 active 클래스를 추가해주세요. -->
                                                            <li> <!-- class="active" -->
                                                                <div class="list-content">
                                                                    <div class="list-table list">
                                                                    
                                                                        <table>
                                                                            <caption>일정계획 및 수행 테이블</caption>
                                                                            <colgroup>
                                                                                <col>
				                                                                <col class="dt-6sig">
				                                                                <col class="dt-6sig">
				                                                                <col class="dt-6sig">
				                                                                <col class="dt-6sig">
				                                                                <col>
                                                                            </colgroup>
                                                                            <thead>
                                                                                <tr>
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
                                                                        <div class="row" style="padding: 11px; text-align: center;">
                                                                       		<fmt:formatDate pattern="yyyy.MM.dd" value="${item.repPlanStartDate}" />
                                                                        </div>
                                                                    </td>                                                                
                                                                </c:forEach>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>

                                                        </ul>
                                                    </div>				
			<!-- 6시그마 과제선정 결재(끝) --> 			
			</c:when>
			<c:otherwise>
			<!-- 6시그마 단계별 결재(시작) -->
                                                   <div class="list-wrap toggle">
                                                        <!-- [D] 상태에따라 열기/닫기 텍스트 구분해주세요. -->
                                                        <span class="blind">열기/닫기</span>
                                                        <ul>
		<c:forEach var="item" items="${reportVO.repDetailList}" varStatus="status">


                                                            <!-- [D] 열린상태일 경우 active 클래스를 추가해주세요. -->
                                                            <li> <!-- class="active" -->
                                                                <div class="list-content">
                                                                    <div class="list-table list">
                                                                    
                                                                        <table <c:if test="${approveVO.refBusSubCode eq item.repStepCode}">style="border: 3px solid #9a3530;"</c:if> >
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
                                                                                        <div class="toggle-box" <c:if test="${approveVO.refBusSubCode eq item.repStepCode}">style="display: block;"</c:if>><%-- <c:if test="${item.repStatus eq '1'}">style="display: block;"</c:if> --%>
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
                                                                                                            <td class="pd3">
                                                                                                                <div class="row">
                                                                                                                    <div class="col s12 input-text">
                                                                                                                    	<fmt:formatDate pattern="yyyy.MM.dd" value="${item.repPlanStartDate}" />
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </td>
                                                                                                            <td rowspan="2" colspan="4">
                                                                                                            
                                                                                                                <div class="input-text align-left">
                                                                                                                ${item.repFinishSummary}
                                                                                                                </div>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>실시</td>
                                                                                                            <td class="pd3">
                                                                                                                <div class="row">
                                                                                                                    <div class="col s12 input-text">
                                                                                                                    <fmt:formatDate pattern="yyyy.MM.dd" value="${item.repActStartDate}" />
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </td>
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
                                                                                                            <td>${item.repApprovalMemRoleName}</td>
                                                                                                            <td class="align-left">${item.repApprovalMemDeptName}<!-- 자동차소재부품 사업부 &gt; 경량화사업담당 &gt; 자동차소재부품.투명과학플라스틱연구PJT --></td>
                                                                                                            <td>${item.repApprovalMemName}</td>
                                                                                                            <td>${item.repApprovalMemComJobx}</td>
                                                                                                            <td>${item.repApprovalMemComPosition}</td>
                                                                                                            <td>${item.repApprovalMemComCertBelt}</td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <th colspan="2" class="pd-r10 align-right">첨부파일</th>
                                                                                                            <td colspan="5">
                                                                                                                <div class="file-drop-box">
                                                                                                                    <%-- <c:out value="${item.repDetailFileList }"/> --%>
																													<div class="file-link">
																														<ul>
			<c:forEach var="item_sub" items="${item.repDetailFileList}" varStatus="status">														
																															<li><a href="/attachfile/downloadFile.do?fileId=${item_sub.fileId}&fileSeq=${item_sub.fileSeq}" title="다운받기">${item_sub.fileNm}</a><a href="/attachfile/downloadFile.do?fileId=${item_sub.fileId}&fileSeq=${item_sub.fileSeq}" title="다운받기" class="btn color gray mg-l15">다운받기</a></li>
			</c:forEach>															
																														</ul>
																													</div>                                                                                                                    
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
		</c:forEach>
                                                        </ul>
                                                    </div>				
			<!-- 6시그마 단계별 결재(끝) -->			
			</c:otherwise>
		</c:choose>	
	
	<!-- End of 6시그마 -->
	</c:when>
	<c:otherwise>
	<!-- 일반 / 10+ -->
		<c:forEach var="item" items="${reportVO.repDetailList}" varStatus="status">
			<%-- <c:out value="${item}"/> --%>
<div class="list-wrap toggle">
                                                        <!-- [D] 상태에따라 열기/닫기 텍스트 구분해주세요. -->
                                                        <span class="blind">열기/닫기</span>
                                                        <ul>
                                                            <li><!-- [D] 열린상태일 경우 active 클래스를 추가해주세요. -->
                                                                <div class="list-content">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <caption>일정계획 및 수행 테이블</caption>
                                                                            <colgroup>
                                                                                <col style="width:60px">
                                                                                <col style="width:80px">
                                                                                <col>
                                                                                <col style="width:80px">
                                                                                <col style="width:60px">
                                                                            </colgroup>
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>구분</th>
                                                                                    <th colspan="2">착수(예정)일</th>
                                                                                    <th colspan="3">완료(예정)일</th>
                                                                                </tr>
                                                                            </thead>
                                                                            
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td>계획</td>
                                                                                    
                                                                                    <td class="pd3" colspan="2">
                                                                                        <div class="row">
                                                                                            <div class="col s12 input-text input-date" style="float:none;width:120px;margin:0 auto !important">
																								<fmt:formatDate pattern="yyyy.MM.dd" value="${item.repPlanStartDate}" />                                                                                                
                                                                                            </div>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td class="pd3" colspan="3">
                                                                                        <div class="row">
                                                                                            <div class="col s12 input-text input-date" style="float:none;width:120px;margin:0 auto !important">
                                                                                                <fmt:formatDate pattern="yyyy.MM.dd" value="${item.repPlanEndDate}" />
                                                                                            </div>
                                                                                        </div>
                                                                                    </td>
   
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>실시</td>
                                                                                    <td class="pd3" colspan="2">
                                                                                        <div class="row">
                                                                                            <div class="col s12 input-text input-date" style="float:none;width:120px;margin:0 auto !important">
                                                                                                <fmt:formatDate pattern="yyyy.MM.dd" value="${item.repActStartDate}" />
                                                                                            </div>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td class="pd3" colspan="3">
                                                                                        <div class="row">
                                                                                            <div class="col s12 input-text input-date" style="float:none;width:120px;margin:0 auto !important">
                                                                                                <fmt:formatDate pattern="yyyy.MM.dd" value="${item.repActEndDate}" />
                                                                                            </div>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th rowspan="2">활동계획</th>
                                                                                    <th>추진배경</th>                                                                                    
                                                                                    <td td colspan="4">
                                                                                    <div class="input-text align-left">
                                                                                        ${item.repPropelBg}
                                                                                    </div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>                                                                                    
                                                                                    <th>주요활동</th>                                                                                    
                                                                                    <td colspan="4"><div class="input-text align-left">
                                                                                        ${item.repActivity}
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
                                                                                <col style="width:80px">
                                                                                <col>                                                                                
                                                                                <col style="width:70px">
                                                                                <col style="width:70px">
                                                                                <col style="width:70px">
                                                                                <col style="width:70px">
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <th colspan="4">Finish 요약</th>                                                                                    
                                                                                    <th colspan="3">활동결과(실적)</th>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td rowspan="2" colspan="4">
                                                                                        <div class="input-text align-left">
                                                                                            ${item.repFinishSummary}
                                                                                        </div>
                                                                                    </td>                                                                                    
                                                                                    <td>CTQ/CTP</td>
                                                                                    <td>KPI</td>
                                                                                    <td>예상성과</td>                                                                                        
                                                                                </tr>
                                                                                <tr>              
                                                                                    <td><div class="col s2 input-text pd3">${item.repCtqCtp}</div></td>
                                                                                    <td><div class="col s2 input-text pd3" style="width:100%">${item.repKpi}</div></td>
                                                                                    <td><div class="col s2 input-text pd-r10" style="width:100%">${item.repExpectationResult}</div></td>                                 
                                                                                </tr>
                                                                                <tr>
                                                                                    <th colspan="2" class="pd-r10 align-right"> 첨부파일 </th>
                                                                                    <td colspan="5" style="text-align: left;">
                                                                                    	<div class="col s12 input-text file">
	                                                                                    	
								                                                            <!-- [kr.freedi.dev.attachfile.domain.AttachFileVO@790a7e68[fileId=reportDetail_7_167,fileSeq=1,fileGrp=reportDetail
								                                                            ,fileNm=test - 복사본 (1) (1).txt,fileSiz=4,fileMsk=20230503034019bdcytcymqyurby,dwnldCnt=0,deleteFlg=N
								                                                            ,operDt=Wed May 03 03:40:20 KST 2023,filePath=,isImage=false]]
								                                                             -->
								                                                            
								                                                        </div>  
								                                                        <div class="file-link">								                                                        
                                                                                            <ul>
	                                                                                            <c:forEach var="itemFile" items="${item.repDetailFileList}" varStatus="statusSub">
		                                                                                    		<li><a href="/attachfile/downloadFile.do?fileId=${itemFile.fileId}&fileSeq=${itemFile.fileSeq}" title="다운받기">${itemFile.fileNm}</a><a href="/attachfile/downloadFile.do?fileId=${itemFile.fileId}&fileSeq=${itemFile.fileSeq}" title="다운받기" class="btn color gray mg-l15">다운받기</a></li>
		                                                                                    	</c:forEach>
                                                                                            </ul>
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
		</c:forEach>	
	<!-- End of 일반 / 10+ -->	
	</c:otherwise>
</c:choose>		
<!-- End of 일정계획 및 수행 -->				

                                                </td>
											</tr>
											<tr>
												<th>키워드</th>
												<td colspan="3">
													<script type="text/javascript">
														$(document).ready(init);
														function init(){
															const vKeyWord = "${reportVO.repKeyword}";
															let arr = vKeyWord.split(",");
															let keyCont = "";
															for(let i=0; i<arr.length; i++){
																if(i>0){
																	keyCont += " ";
																}
																keyCont += '#'+arr[i];
															}
															$("#divKeyword").html(keyCont);
														}
													</script>
													<div id="divKeyword"></div>
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
                                            <col style="">
											<col style="width:70px">
                                            <col style="width:70px">
											<col style="width:70px">
                                            <col style="width:70px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>참여형태</th>
												<th>소속</th>
												<th>이름</th>
												<th>직위</th>
												<th>직책</th>
												<th>Belt</th>
                                            </tr>
                                        </thead>                                            
                                        <tbody>
<c:forEach var="item" items="${reportVO.repTeamMemberList}" varStatus="status">                                        
                                            <tr>
                                                <th>${item.repTeamMemRoleNm}</th>
                                                <td class="align-left">${item.deptName}</td>
												<td>${item.repTeamMemName}</td>
                                                <td>${item.comJobxNm}</td>
												<td>${item.comPositionNm}</td>
                                                <td>${item.beltNm}</td>
                                            </tr>
</c:forEach>
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
                                            <col style="width:100px">
                                            <col style="">
                                            <col style="width:100px">
                                            <col style="">
											<col style="width:100px">
                                            <col style="">
											<col style="width:100px">
                                            <col style="width:210px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th colspan="8">예상결과</th>                                           
                                            </tr>
                                        </thead>
                                        <tbody>
<c:forEach var="item" items="${reportVO.repResultList}" varStatus="status">                                        
                                            <tr>
                                                <th class="pd-r10">성과항목</th>
                                                <td>${item.repResultType}</td>
												<th class="pd-r10">년내(당해년)</th>
                                                <td>${item.repResultWithinYear}</td>
												<th class="pd-r10">년간(12개월)</th>
                                                <td>${item.repResultYear}</td>
												<th class="pd-r10">산출 Logic</th>
                                                <td>${item.repResultCalLogic}</td>
                                            </tr>
</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>  
                        <div class="list-wrap mg-t10">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table class="centered">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:12.5%">
											<col style="width:12.5%">
											<col style="width:12.5%">
											<col style="width:12.5%">
											<col style="width:12.5%">
											<col style="width:12.5%">
											<col style="width:12.5%">
											<col style="width:12.5%">
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
<c:forEach var="item" items="${reportVO.repIndicatorList}" varStatus="status">
                                            <tr>
                                                <td>${item.repIndiPyItem}</td>
												<td>${item.repIndiPyUnit}</td>
												<td>${item.repIndiPyBefore}</td>
												<td>${item.repIndiPyGoal}</td>
												<td>${item.repIndiKpiItem}</td>
												<td>${item.repIndiKpiUnit}</td>
												<td>${item.repIndiKpiBefore}</td>
												<td>${item.repIndiKpiGoal}</td>
                                            </tr>
</c:forEach>                                            
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
											<col style="width:180px">
											<col>
										</colgroup>
										<tbody>                                            
											<tr>
												<th>첨부파일 (조회)</th>
												<td>
													<div class="file-link">
														<ul>
<c:forEach var="item" items="${reportVO.fileList}" varStatus="status">														
															<li><a href="/attachfile/downloadFile.do?fileId=${item.fileId}&fileSeq=${item.fileSeq}" title="다운받기">${item.fileNm}</a><a href="/attachfile/downloadFile.do?fileId=${item.fileId}&fileSeq=${item.fileSeq}" title="다운받기" class="btn color gray mg-l15">다운받기</a></li>
</c:forEach>															
														</ul>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
<c:if test="${ empty repMenuCode }"><%-- 해당 값은 "과제/분임조과제" 에서만 나옴. --%>						
                        <div class="list-footer">
                            <div class="list-btns">
								<button type="button" class="btn bg-gray" onclick="onclick_procApprove('4')">승인</button>
                                <button type="button" class="btn bg-gray" onclick="onclick_procApprove('3');">반려</button>        
                                <a href="/apprv/list.do?menuKey=${menuKey}" class="btn">목록</a>
                            </div>
                        </div>
						<div class="line_bar mg-t20"></div>
						<p class="content_title">승인/반려_결재이력</p>
						<div class="list-wrap">
							<div class="list-content">
								<div class="list-table list">
								
									<table class="centered">
										<caption></caption>
										<colgroup>
											<col style="width:180px">
											<col style="width:80px">
											<col>
											<col>
										</colgroup>
										<thead>
											<tr>
												<th>결재상태 및 결재일</th>
												<th>결재자</th>
												<th>결재종류</th>
												<th>결재의견</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="item" items="${approveVO.detailList}" varStatus="status">
										<tr>
												<td>${item.aprovalStat}</td>
												<td>${item.userName}</td>
												<td class="align-left">${item.aprovalType}</td>
												<td class="align-left">${item.aprovalComment}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
</c:if>						
                    </section>
                    </form:form>
                </div>
            </div>
<script type="text/javascript">


function onclick_procApprove(gubn){
	
	$("#aprovalState").val(gubn);
	$(".aproval-state-code").val(gubn);
	
	let popup;
	if(gubn==='4'){ // 승인
		popup = popApprove; 
		popup.init();
		
		popup.returnFunc = callback_popApprove;
		popup.returnObjId = null; //$(obj).closest("td").find("input").attr("id");
	} else { // 반려
		popup = popReject;
		popup.init();
		
		popup.returnFunc = callback_popReject;
		popup.returnObjId = null; //$(obj).closest("td").find("input").attr("id");
	}
	
	popup.open();
}

function callback_popReject(obj, data){
	
	$(".detail-comment").val(data.txtComment);
	$("#defaultForm")[0].submit();
}

function callback_popApprove(obj, data){
	
	$(".detail-score1").val(data.score1);
	$(".detail-score4").val(data.score4);
	$(".detail-score5").val(data.score5);
	$(".detail-score6").val(data.score6);
	$(".detail-score7").val(data.score7);
	$(".detail-total").val(data.scoreTotal);
	$(".detail-comment").val(data.txtComment);	
	
	$("#defaultForm")[0].submit();
}
</script>
    
</body>
</html>