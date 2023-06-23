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
    
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list even">
                                	<table class="centered">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:50px">
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray">Belt</th>
                                                <th class="bg-gray" colspan="3">GB</th>
                                                <th class="bg-gray" colspan="5">MGB</th>
                                                <th class="bg-gray" colspan="5">BB</th>
                                                <th class="bg-gray" colspan="6">MBB</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>항목</td>
                                                <td>교육<br>이수</td>
                                                <td>필기test</td>
                                                <td>인증</td>
                                                <td>교육<br>이수</td>
                                                <td>필기<br>test</td>
                                                <td>과제<br>수행</td>
                                                <td>과제Test</td>
                                                <td>인증</td>
                                                <td>교육<br>이수</td>
                                                <td>Paper<br>Test</td>
                                                <td>과제<br>수행</td>
                                                <td>과제<br>Test</td>
                                                <td>인증</td>
                                                <td>교육<br>이수</td>
                                                <td>통계<br>Test</td>
                                                <td>과제<br>수행</td>
                                                <td>과제<br>Test</td>
                                                <td>자질<br>평가</td>
                                                <td>인증</td>
                                            </tr>
                                            <tr>
                                                <td>현황</td>
                                                <td>이수<br>완료</td>
                                                <td>합격</td>
                                                <td>인증<br>완료</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>이수<br>완료</td>
                                                <td>합격</td>
                                                <td>수행<br>완료</td>
                                                <td>합격</td>
                                                <td>완료</td>
                                                <td>신청<br>완료</td>
                                                <td>미신청</td>
                                                <td>2건<br>필요</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>처리일</td>
                                                <td>20.01.101</td>
                                                <td>20.02.30</td>
                                                <td>20.01.01</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>20.01.01</td>
                                                <td>20.02.30</td>
                                                <td>20.01.01</td>
                                                <td>20.02.30</td>
                                                <td>20.02.30</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                    <%-- <table class="centered">
                                        <caption></caption>
                                       
                                        <thead>
                                            <tr>
                                                <th class="bg-gray">Belt</th>
                                                <th class="bg-gray" colspan="4">GB</th>
                                                <th class="bg-gray" colspan="4">MGB</th>
                                                <th class="bg-gray" colspan="4">BB</th>
                                                <th class="bg-gray" colspan="4">MBB</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th rowspan="2" class="bg-white align-center">항목</th>
                                                <td colspan="2" class="bg-white align-center">교육</td>
                                                <td colspan="2" class="bg-white align-center">TEST</td>
                                                <td colspan="2" class="bg-white align-center">교육</td>
                                                <td colspan="2" class="bg-white align-center">TEST</td>
                                                <td colspan="2" class="bg-white align-center">교육</td>
                                                <td colspan="2" class="bg-white align-center">TEST</td>
                                                <td colspan="2" class="bg-white align-center">교육</td>
                                                <td colspan="2" class="bg-white align-center">TEST</td>
                                            </tr>
                                            <tr>
                                                <td class="bg-white align-center">이수</td>
                                                <td class="bg-white align-center">미이수</td>
                                                <td class="bg-white align-center">이수</td>
                                                <td class="bg-white align-center">미이수</td>
                                                <td class="bg-white align-center">이수</td>
                                                <td class="bg-white align-center">미이수</td>
                                                <td class="bg-white align-center">이수</td>
                                                <td class="bg-white align-center">미이수</td>
                                                <td class="bg-white align-center">이수</td>
                                                <td class="bg-white align-center">미이수</td>
                                                <td class="bg-white align-center">이수</td>
                                                <td class="bg-white align-center">미이수</td>
                                                <td class="bg-white align-center">이수</td>
                                                <td class="bg-white align-center">미이수</td>
                                                <td class="bg-white align-center">이수</td>
                                                <td class="bg-white align-center">미이수</td>
                                            </tr>
                                            <tr>
                                                <th class="bg-white align-center">건수</th>
                                                <td class="bg-white align-center">${selectMyStatistics.M1}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M2}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M3}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M4}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M5}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M6}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M7}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M8}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M9}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M10}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M11}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M12}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M13}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M14}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M15}</td>
                                                <td class="bg-white align-center">${selectMyStatistics.M16}</td>
                                            </tr>
                                            
                                        </tbody>
                                    </table> --%>
                                </div>
                            </div>
                        </div>
                        
                        <div class="tab-group">
                            <div class="tab-btn">
                            
                                <!-- [D] 현재 활성화된 메뉴에 on클래스 추가해주세요. -->
                                <c:forEach var="allCodes" items="${allCodes}" varStatus="status">
                                	<button type="button" id="${allCodes.codeId}">${allCodes.codeNm}</button>
                                </c:forEach>
                            </div>
                            
			  				<div class="tab-inr">
                                <div class="tab-box">
                                	<div class="list-header mg-t20">
                                        <p class="title">1.교육</p>
                                    </div>
                                    <div class="list-table list">
                                        <table class="centered" id="tab1">
                                            <caption></caption>
                                            <colgroup>
                                                <col>
                                                <col style="width:106px">
                                                <col style="width:230px">
                                                <col>
                                                <col style="width:160px">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>과정명</th>
                                                    <th>차수명</th>
                                                    <th>기간</th>
                                                    <th>이수여부</th>
                                                    <th>수강신청</th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                    <div class="list-header">
                                        <p class="title">2. 과제활동 현황</p>
                                    </div>
                                    <div class="list-table list">
                                        <table class="centered" id="tab2">
                                            <caption></caption>
                                            <colgroup>
                                                <col>
                                                <col style="width:106px">
                                                <col style="width:230px">
                                                <col>
                                                <col>
                                                <col style="width:160px">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>과정명</th>
                                                    <th>과제유형</th>
                                                    <th>과제 수행기간</th>
                                                    <th>참여방식</th>
                                                    <th>진행상황</th>
                                                    <th>과제Test 응시자격</th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                    <div class="list-header">
                                        <p class="title">3. Test 응시 현황</p>
                                    </div>
                                    <div class="list-table list">
                                        <table class="centered" id="tab3">
                                            <caption></caption>
                                            <colgroup>
                                                <col>
                                                <col style="width:106px">
                                                <col style="width:230px">
                                                <col>
                                                <col style="width:160px">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>Test명</th>
                                                    <th>차수명</th>
                                                    <th>기간</th>
                                                    <th>합격여부</th>
                                                    <th>Test신청</th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                    
                                    
                                    
                                </div>
                               
                           	</div>
                            <form:form commandName="paramForm" id="paramForm" name="paramForm" onsubmit="return false" method="post" modelAttribute="studentVO">	
				  			</form:form>
                            
                        </div>
               
<script type="text/javascript">
	$(document).ready(function(){
		
		$('.tab-btn > button').on('click',function(e){
			let tabInx = $('.tab-btn > button').index(this);
			let tabId = e.target.id;
			selectMyEdu(tabId);
		})
		
		$('.tab-btn > button').eq(0).click();
	});
	
	function selectMyEdu(tabId){
		let eduBeltCode = tabId;
		/* 
			과제 활동 - 리더벨트코드
			GB - D000
			BB - D001
			MBB - D002
			MGB - D003
		 */
		let params = {};
		params.eduBeltCode = eduBeltCode;	
		$.ajax({
			url:'/education/searchmyedu.do',
			type: 'POST',
			data: params,
			dataType : 'json',
			success:function(data){
				let myList = data.myList;
				let reportList = data.reportList;
				
				var vHtml = [];
				var vHtml2 = [];
				var rHtml = [];
				
				let myListTr = 0;
				let myListTr2 = 0;
				
				if(myList.length>0){
					for(var i=0; i<myList.length; i++){
						let eduName = myList[i].eduName;
						let eduYear = myList[i].eduYear;
						let eduNumber = myList[i].eduNumber;
						let eduDate = myList[i].eduDate;
						let stdCompleteNm = myList[i].stdCompleteNm;
						let stdStatusNm = myList[i].stdStatusNm;
						let eduClassType = myList[i].eduClassType;
						
						if(eduClassType == "01"){
							vHtml.push("<tr>");
							vHtml.push("<td>"+eduName+"</td>");
							vHtml.push("<td class='bg-white align-center'>"+eduYear+"년 "+eduNumber+"차</td>");
							vHtml.push("<td class='bg-white align-center'>"+eduDate+"</td>");
							vHtml.push("<td class='bg-white align-center'>"+stdCompleteNm+"</td>");
							vHtml.push("<td class='bg-white align-center'>"+stdStatusNm+"</td>");
							vHtml.push("</tr>");
							myListTr = myListTr + 1;
						}else if(eduClassType == "02"){
							vHtml2.push("<tr>");
							vHtml2.push("<td>"+eduName+"</td>");
							vHtml2.push("<td class='bg-white align-center'>"+eduNumber+"차</td>");
							vHtml2.push("<td class='bg-white align-center'>"+eduDate+"</td>");
							vHtml2.push("<td class='bg-white align-center'>"+stdCompleteNm+"</td>");
							vHtml2.push("<td class='bg-white align-center'>"+stdStatusNm+"</td>");
							vHtml2.push("</tr>");
							myListTr2 = myListTr2 + 1;
						}
												
					}
				}else{
					//vHtml.push("<tr>");
					//vHtml.push("<td class='bg-white align-center' colspan='5'>데이터가 없습니다.</td>");
					//vHtml.push("</tr>");	 
				}
				
				console.log(myListTr);
				
				if(myListTr==0){
					vHtml.push("<tr>");
					vHtml.push("<td class='bg-white align-center' colspan='5'>데이터가 없습니다.</td>");
					vHtml.push("</tr>");
				}
				
				if(myListTr2==0){
					vHtml2.push("<tr>");
					vHtml2.push("<td class='bg-white align-center' colspan='5'>데이터가 없습니다.</td>");
					vHtml2.push("</tr>");
				}
				
				$("#tab1").find("tbody").html(vHtml.join(''));
				$("#tab3").find("tbody").html(vHtml2.join(''));
				
				if(reportList.length>0){
					
					for(var i=0; i<reportList.length; i++){
						let repName = reportList[i].repName;
						let typeNm = reportList[i].typeNm;
						let statusNm = reportList[i].statusNm;
						let roleNm = reportList[i].roleNm;
						let repStartDate = reportList[i].repStartDate;
						let repFinishDate = reportList[i].repFinishDate;
						
						rHtml.push("<tr>");
						rHtml.push("<td>"+repName+"</td>");
						rHtml.push("<td class='bg-white align-center'>"+typeNm+"</td>");
						rHtml.push("<td class='bg-white align-center'>"+repStartDate+" ~ "+repFinishDate+"</td>");
						rHtml.push("<td class='bg-white align-center'>"+roleNm+"</td>");
						rHtml.push("<td class='bg-white align-center'>"+statusNm+"</td>");
						rHtml.push("<td class='bg-white align-center'>총 2건 중 1건(미확보)</td>");
						rHtml.push("</tr>");
					}
				}else{
					rHtml.push("<tr>");
					rHtml.push("<td class='bg-white align-center' colspan='6'>데이터가 없습니다.</td>");
					rHtml.push("</tr>");	 
				}
				$("#tab2").find("tbody").html(rHtml.join(''));
				
			}
		});
		


		

	}

</script>

</body>
</html>