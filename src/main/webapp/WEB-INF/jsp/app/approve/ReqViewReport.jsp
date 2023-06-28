<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld"%>

<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<title>${fn:split(boardVO.boardNm,'>')[fn:length(fn:split(boardVO.boardNm,'>'))-1]}</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>

                        <!-- breadcrumb -->
						<p class="content_title">승인/반려_결재이력</p>
						<div class="list-wrap">
							<div class="list-content">
								<div class="list-table list">
									<table class="centered">
										<caption></caption>
										<colgroup>
											<col style="width:180px">
											<col style="width:70px">
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
										    <c:forEach var="item" items="${approveVO.detailHistory}">
												<tr>
												<td>${item.aprovalStat}
													<c:if test="${not empty item.aprovalCompltDate}">
														(<fmt:formatDate pattern="yyyy.MM.dd" value="${item.aprovalCompltDate}" />)
													</c:if>
												</td>
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
						<div class="line_bar mg-t20"></div>
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
                                            <tr>
                                                <th><label for="text4" class="color primary">과제리어벨트</label></th>
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
                                            <tr>
												<th>일정계획 및 수행</th>
												<td colspan="3">
<c:choose>  
	<c:when test="${reportVO.repDivisionCode eq '1'}">
	<!-- 6시그마 -->

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
                                                                                    <th><label id="lbl6sigmaStepNm_${status.count}"></label></th>
                                                                                    <th colspan="4">활동요약</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td colspan="6" class="pd0 border0">
                                                                                        <div class="toggle-box" style="display: block;"><%-- <c:if test="${item.repStatus eq '1'}">style="display: block;"</c:if> --%>
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
															
															let arrTypeCodeNm;
															if("${reportVO.repDivisionCode}"==="1"){
																if("${reportVO.repTypeCode}"==="11"){
																	// DMAIC : Define, Measure, Analyze, Improve, Control, Finish
																	arrTypeCodeNm = ["Define", "Measure", "Analyze", "Improve", "Control", "Finish"];
																} else {
																	// DMEDI : Define, Measure, Explore, Develop, Implement, Finish
																	arrTypeCodeNm = ["Define", "Measure", "Explore", "Develop", "Implement", "Finish"];
																}
																for ( var i in arrTypeCodeNm) {
																	$("#lbl6sigmaStepNm_"+(Number(i)+1)).text(arrTypeCodeNm[i]);
																}
															}
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
                        <div class="list-footer">
                            <div class="list-btns">  
                                <a href="/sub.do?menuKey=${menuKey}" class="btn">목록</a>
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