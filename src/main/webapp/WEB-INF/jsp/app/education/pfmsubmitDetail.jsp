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
                                          <td colspan="3">${educationVO.eduName }</td>
                                      </tr>
                                      <tr>
                                          <th><label for="text2">교육연도</label></th>
                                          <td>${educationVO.eduYear }</td>
                                          <th><label for="text3">벨트</label></th>
                                          <td>${educationVO.eduBeltCodeName }</td>
                                      </tr>
									  <tr>
                                          <th><label for="text4">교육유형</label></th>
                                          <td>${educationVO.eduClassTypeName }</td>
                                          <th><label for="text5">상세유형</label></th>
                                          <td>
                                          	<%-- ${educationVO.eduClassDivisionName } --%>
                                          	<c:choose>
											    <c:when test="${educationVO.eduBeltCode eq 'D000'}">
											      <c:if test="${educationVO.eduClassType eq '01'}">
	                                              	  	<c:if test="${educationVO.eduClassDivision eq '01'}">
		                                               		온라인 동영상 교육
		                                               	</c:if>
		                                               	<c:if test="${educationVO.eduClassDivision eq '02'}">
		                                               		온라인 실시간 교육
		                                               	</c:if>
		                                          </c:if>
		                                          <c:if test="${educationVO.eduClassType eq '02' }">
		                                              	<c:if test="${educationVO.eduClassDivision eq '07'}">
		                                               		통계Test
		                                               	</c:if>
	                                              </c:if>
											    </c:when>
											    <c:when test="${educationVO.eduBeltCode eq 'D001'}">
											      <c:if test="${educationVO.eduClassType eq '01'}">
	                                              	  	<c:if test="${educationVO.eduClassDivision eq '01'}">
		                                               		온라인 동영상 교육
		                                               	</c:if>
		                                               	<c:if test="${educationVO.eduClassDivision eq '02'}">
		                                               		온라인 실시간 교육
		                                               	</c:if>
                                              	  </c:if>
                                              	  <c:if test="${educationVO.eduClassType eq '02' }">
		                                              	<c:if test="${educationVO.eduClassDivision eq '07'}">
		                                               		통계Test
		                                               	</c:if>
		                                               	<c:if test="${educationVO.eduClassDivision eq '08'}">
		                                               		과제Test
		                                               	</c:if>
	                                              	  </c:if>
											    </c:when>
											    <c:when test="${educationVO.eduBeltCode eq 'D002'}">
											      	  <c:if test="${educationVO.eduClassType eq '01'}">
	                                              	  	<c:if test="${educationVO.eduClassDivision eq '01'}">
		                                               		온라인 동영상 교육
		                                               	</c:if>
		                                               	<c:if test="${educationVO.eduClassDivision eq '02'}">
		                                               		온라인 실시간 교육
		                                               	</c:if>
		                                               	<c:if test="${educationVO.eduClassDivision eq '03'}">
		                                               		6σ Process 과정
		                                               	</c:if>
		                                               	<c:if test="${educationVO.eduClassDivision eq '04'}">
		                                               		통계적 사고 과정
		                                               	</c:if>
		                                               	<c:if test="${educationVO.eduClassDivision eq '05'}">
		                                               		고급 통계 과정
		                                               	</c:if>
		                                               	<c:if test="${educationVO.eduClassDivision eq '06'}">
		                                               		Summary
		                                               	</c:if>
		                                              </c:if>
		                                              <c:if test="${educationVO.eduClassType eq '02' }">
		                                                <c:if test="${educationVO.eduClassDivision eq '07'}">
	                                               			통계Test
		                                                </c:if>
		                                                <c:if test="${educationVO.eduClassDivision eq '08'}">
		                                               		과제Test
		                                                </c:if>
		                                               	<c:if test="${educationVO.eduClassDivision eq '09'}">
		                                               		자질Test
		                                               	</c:if>
	                                              	  </c:if>	
											    </c:when>
											    <c:when test="${educationVO.eduBeltCode eq 'D003'}">
	                                              	  <c:if test="${educationVO.eduClassType eq '01'}">
	                                              	  	<c:if test="${educationVO.eduClassDivision eq '01'}">
		                                               		온라인 동영상 교육
		                                               	</c:if>
		                                               	<c:if test="${educationVO.eduClassDivision eq '02'}">
		                                               		온라인 실시간 교육
		                                               	</c:if>
		                                              </c:if>
		                                              <c:if test="${educationVO.eduClassType eq '02' }">
	                                              		<c:if test="${educationVO.eduClassDivision eq '07'}">
	                                               			통계Test
		                                                </c:if>
		                                                <c:if test="${educationVO.eduClassDivision eq '08'}">
		                                               		과제Test
		                                                </c:if>
	                                              	  </c:if>
											    </c:when>
											    <c:otherwise>
												</c:otherwise>
											</c:choose>
                                          </td>
                                      </tr>
										<tr>
                                          <th><label for="text6">교육차수</label></th>
                                          <td>${educationVO.eduNumber }차</td>
                                          <th><label for="text7">교육일정</label></th>
                                          <td>${educationVO.eduDate }</td>
                                      </tr>
										<tr>
                                          <th><label for="text8">교육정원/신청</label></th>
                                          <td colspan="3">${educationVO.eduFixed }/${educationVO.tsdCnt }</td>
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
					<p class="total">총 ${totalCount}</p>							
				  </div>
                  
				  <form:form commandName="frmPfSubmit" id="defaultForm" name="defaultForm"  action="${action}" onsubmit="return false" method="post" modelAttribute="studentVO">
		            ${StudentVO.superHiddenTag}
		            <form:hidden path="eduCode" />
					<form:hidden path="mode" />
					<div class="list-content mg-t10">
						<div class="list-table">
							<table class="even" id="chTab">
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
									<c:choose>
									    <c:when test="${fn:length(selectStudentList) == 0}">
									        <tr>
                                                <td colspan="8"><span>조회결과가 없습니다.</span></td>
                                            </tr>
									    </c:when>
									    <c:otherwise>
									        <c:forEach var="studentResult" items="${selectStudentList}" varStatus="status">
	                                            <tr stdSeq=${studentResult.stdSeq}>
													<td><input type="checkbox" name="ch_list" id="ch_${studentResult.idx}" /><label for="ch_${studentResult.idx}"></label></td>
													<td>${studentResult.stdName}</td>
													<td>${studentResult.comNo}</td>
													<td>${studentResult.stdDepartNm}</td>
													<td>${studentResult.stdJobxNm}</td>
													<td>${studentResult.stdPosNm}</td>
													<td>${studentResult.stdBeltNm}</td>
													<td class="select-table">
													<div class="pd-l10 col s8">
														<select name="stdCompleteYn" id="stdCompleteYn_${studentResult.idx}">
															<option value="">선택</option>
															<c:choose>
																<c:when test="${educationVO.eduClassType eq '01'}">
																	<option value="Y" <c:if test ="${studentResult.stdCompleteYn eq 'Y'}">selected="selected"</c:if>>이수</option>
																	<option value="N" <c:if test ="${studentResult.stdCompleteYn eq 'N'}">selected="selected"</c:if>>미이수</option>
																</c:when>
																<c:otherwise>
																	<option value="Y" <c:if test ="${studentResult.stdCompleteYn eq 'Y'}">selected="selected"</c:if>>합격</option>
																	<option value="N" <c:if test ="${studentResult.stdCompleteYn eq 'N'}">selected="selected"</c:if>>불합격</option>
																</c:otherwise>
															</c:choose>
														</select>
													</div>
													</td>
												</tr>
									        </c:forEach>
									    </c:otherwise> 
									</c:choose>
											
									
									
								</tbody>
							</table>
						</div>
					</div>
						
					<div class="list-footer">
                      <div class="list-btns">
                          <button type="button" class="btn light-gray" id="btnSave">저장</button>
                          	<a href="/education/pfmsubmit.do?menuKey=67" class="btn">목록</a>
							<button type="button" class="btn-excel" id="btnExcel">
								<img src="/assets/images/icon_excel.png" alt="">
								<span>다운로드</span>
							</button>  
                      </div>
                  </div>
							
				  </form:form>	
				  
				  <form:form commandName="paramForm" id="paramForm" name="paramForm"  action="/education/excelstddtl.do" onsubmit="return false" method="post" modelAttribute="studentVO">
				  	<form:hidden path="eduCode" />
				  </form:form>
                  

<script type="text/javascript">
$(document).ready(function(){
	
 	$("#btnSave").on("click", function(){
		chkBoxSave();
	});
 	
 	$("#btnExcel").on("click", function(){
 		//$('#paramForm').attr("action","/education/excelstddtl.do");
		//$('#paramForm').submit();
		$('#paramForm')[0].submit();
 	});
 	
 	
});

function chkBoxSave(){
	let eduCode = $("#eduCode").val();
	let arrSeq = "";
	let arrVal = "";
	
	let chkNum = 0;
	$("#chTab").children("tbody:first").children("tr[stdSeq]").each(function(i){
		var stdSeq = $(this).attr("stdSeq");
		
		if($(this).find("input:checkbox[name='ch_list']").is(":checked")){
			let stdCompleteYn = $(this).find("select[name=stdCompleteYn]").val();
			
			arrSeq += stdSeq + ",";
			arrVal += stdCompleteYn + ",";
			chkNum = chkNum+1;
		}
	});
	
	if(chkNum==0){
		alert("선택된 인원이 없습니다.");
		return false;
	}
	
	arrSeq = arrSeq.substring(0, arrSeq.length-1);
	arrVal = arrVal.substring(0, arrVal.length-1);
	
	let params = {};
	params.eduCode = eduCode;		
	params.arrSeq = arrSeq;	
	params.arrVal = arrVal;	
	
	$.ajax({
		url:'/education/stdupdate.do',
		type: 'POST',
		data: params,
		dataType : 'json',
		success:function(data){
			alert("저장되었습니다.");
			location.reload();	
		}
	});
	
}

</script>   
                   
</body>
</html>