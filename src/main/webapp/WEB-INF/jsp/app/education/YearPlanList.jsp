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


	<div class="list-wrap">
		<div class="list-content">
			<div class="list-table even list">
				<table class="centered" id="listTab">
					<colgroup>
						<col style="width: 50px">
						<col style="width: 70px">
						<col style="width: 70px">
						<col style="width: 200px">
						<col style="width: 200px">
						<col style="width: 200px">
						<col style="width: 200px">
					</colgroup>
					<thead>
						<tr>
							<th class="bg-gray">구분</th>
							<th class="bg-gray" colspan="2"></th>
							<th class="bg-gray">1Q</th>
							<th class="bg-gray">2Q</th>
							<th class="bg-gray">3Q</th>
							<th class="bg-gray">4Q</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="yearPlanResult" items="${selectYearPlanList}" varStatus="status">
				        	<tr>
                                <td class="bg-white align-center" id="t${yearPlanResult.eduBeltCode}">${yearPlanResult.eduBeltCodeName}</td>
								<td class="bg-white align-center" id="t${yearPlanResult.eduBeltCode}${yearPlanResult.eduClassType}">${yearPlanResult.eduClassTypeName}</td>
								<td class="bg-white align-center" id="t${yearPlanResult.eduBeltCode}${yearPlanResult.eduClassDivision}">${yearPlanResult.eduClassDivisionName}</td>
								<td>
									<div class="link-group">
										<ul>
											<li><a href="javascript: detailView('${yearPlanResult.eduCode}')" title="바로가기">${yearPlanResult.eduName01}</a></li>
										</ul>
									</div>
								</td>
								<td>
									<div class="link-group">
										<ul>
											<li><a href="javascript: detailView('${yearPlanResult.eduCode}')" title="바로가기">${yearPlanResult.eduName02}</a></li>
										</ul>
									</div>
								</td>
								<td>
									<div class="link-group">
										<ul>
											<li><a href="javascript: detailView('${yearPlanResult.eduCode}')" title="바로가기">${yearPlanResult.eduName03}</a></li>
										</ul>
									</div>
								</td>
								<td>
									<div class="link-group">
										<ul>
											<li><a href="javascript: detailView('${yearPlanResult.eduCode}')" title="바로가기">${yearPlanResult.eduName04}</a></li>
										</ul>
									</div>
								</td>
                           </tr>
				        </c:forEach>
					
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<div class="tab-group" id="detailDiv">
		<form:form commandName="frmYearPlan" id="defaultForm" name="defaultForm" onsubmit="return false" method="post" modelAttribute="EducationVO">
           <form:hidden path="eduCode" id="eduCode"/>
           <form:hidden path="eduFixed" id="eduFixed"/>
           <form:hidden path="mode" />
           <%-- <form:hidden path="comCertBelt" id="comCertBelt" value="${comCertBelt}"/>    --%>  
         </form:form>     
            
		<div class="tab-btn">
			<!-- [D] 현재 활성화된 메뉴에 on클래스 추가해주세요. -->
			<button type="button" class="on" id="titTab">1차 교육 (1/20~26)</button>
			<span id="titTab2"></span>
			
		</div>
		<div class="tab-inr">
			<!-- [D] 현재 활성화된 내용에 on클래스 추가해주세요. -->
			<div class="tab-box on">
				<div class="list-wrap mg-t20">
					<div class="list-content">
						<div class="list-table list">
							<table>
								<caption></caption>
								<colgroup>
									<col style="width: 110px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>교육과정명</th>
										<td id="eduCol1"></td>
									</tr>
									<tr>
										<th>교육일정</th>
										<td id="eduCol7"></td>
									</tr>
									<tr>
										<th>교육방식</th>
										<td id="eduCol2"></td>
									</tr>
									<tr>
										<th>대상자</th>
										<td id="eduCol3"></td>
									</tr>
									<tr>
										<th>이수기준</th>
										<td id="eduCol4"></td>
									</tr>
									<tr>
										<th>준비사항</th>
										<td id="eduCol5"></td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td id="eduCol6"></td>
									</tr>
									<tr>
										<th colspan="2" class="align-center">최소 정원(5명) 미달 시 해당 교육이 폐강될 수 있습니다.</th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="btn-group">
			<button type="button" class="btn bg-gray" id="btnRegEdu" style="display: none;">신청</button>
			<button type="button" class="btn bg-white" id="btnCnlEdu" style="display: none;">취소</button>
		</div>
		 
	</div>


<script type="text/javascript">
$(document).ready(function(){
	init();
	
 	$("#btnRegEdu").on("click", function(){
 		let eduCode = $("#eduCode").val();
 		let eduFixed = $("#eduFixed").val();
 		let params = {};
 		params.eduCode = eduCode;	

 		$.ajax({
 			url:'/education/chcekedu.do',
 			type: 'POST',
 			data: params,
 			dataType : 'json',
 			success:function(data){
 				if(data.result == "Y"){
 					let result = true;
 	 				let rCnt = data.stdReqCnt;	// 신청개수
 	 				let mCnt = data.stdMyCnt;   // 내 신청개수
 	 				
 	 				if(Number(rCnt) >= Number(eduFixed)){
 	 					result = false;
 	 					alert("교육 인원 정원이 마감되었습니다.");
 	 					return false;
 	 				}
 	 				
 	 				if(Number(mCnt) > 0){
 	 					result = false;
 	 					alert("이미 신청한 교육입니다.");
 	 					return false;
 	 					
 	 				}
 	 				
 	 				if(result){
 	 					reqeustSave();
 	 				}
 				}else if(data.result == "S"){
 					alert("접속정보가 없습니다.");
 				}
 				
 				
 			}
 		});
	});
 	
 	$("#btnCnlEdu").on("click", function(){
		cnacleSave();		
	});
 	
 	
});

function init(){
	$("#detailDiv").hide();
	$("#listTab").find("tbody").mergeClassRowspan(0);
	$("#listTab").find("tbody").mergeClassRowspan(1);
	$("#listTab").find("tbody").mergeClassRowspan(2);
}

function reqeustSave(){
	let tit = $("#eduCol1").text();
	let eduCode = $("#eduCode").val();
	
	let params = {};
	params.eduCode = eduCode;
	params.mode = "Y";	
	
	if(confirm(tit + " 교육을 신청하시겠습니까?")){
		$.ajax({
			url:'/education/requeststd.do',
			type: 'POST',
			data: params,
			dataType : 'json',
			success:function(data){
				if(data.result == "Y"){
					alert(tit + " 교육이 신청되었습니다.");
					location.reload();
				}else if(data.result == "S"){
					alert("접속정보가 없습니다.");
				}
			}
		});
	} 
}

function cnacleSave(){
	let tit = $("#eduCol1").text();
	let eduCode = $("#eduCode").val();
	
	let params = {};
	params.eduCode = eduCode;
	params.mode = "N";	
	
	if(confirm(tit + " 교육을 취소하시겠습니까?")){
		$.ajax({
			url:'/education/canclestd.do',
			type: 'POST',
			data: params,
			dataType : 'json',
			success:function(data){
				if(data.result == "Y"){
					alert(tit + " 교육이 취소되었습니다.");
					location.reload();
				}else if(data.result == "S"){
					alert("접속정보가 없습니다.");
				}else if(data.result == "N"){
					alert("신청한 정보가 없습니다.");
				}
			}
		});
	} 
}

function detailView(eduCode){
	console.log(eduCode);	
	let params = {};
	params.eduCode = eduCode;	
	
	$.ajax({
		url:'/education/searchedu.do',
		type: 'POST',
		data: params,
		dataType : 'json',
		success:function(data){
			$("#titTab").text(data.eduName);
			$("#titTab2").html("정원 : <b>"+data.eduFixed+"</b>명, 신청 : <b>"+data.tsdCnt+"</b>명");
			$("#eduFixed").val(data.eduFixed);
			
			$("#eduCode").val(data.eduCode);
			$("#detailDiv").show();
			$("#eduCol1").text(data.eduName);
			$("#eduCol2").html(data.eduClassIntro);
			$("#eduCol3").html(data.eduClassTarget);
			$("#eduCol4").html(data.eduClassSummary);
			$("#eduCol5").html(data.eduItem);
			//$("#eduCol6").html("");
			
			let eduYear = data.eduYear;
			let eduDate = data.eduDate;
			$("#eduCol7").html(eduDate);
			
			const eDate = eduDate.split(',').reverse()[0];
			let anEdate = eDate.split('/');
			let targetDt = eduYear + "-" + anEdate[0] + "-" + anEdate[1]
	
			let obj_date = new Date();
			let obj_date2 = new Date(targetDt);
			
			if(obj_date2 < obj_date){
				$("#btnRegEdu").hide();
				$("#btnCnlEdu").hide();
			}else{
				$("#btnRegEdu").show();
				$("#btnCnlEdu").show();
			}
			
			let fileList = data.fileList;
			if(data.fileList.length > 0){
				console.log(fileList);
				var flHtml = [];
				for(var i=0; i<fileList.length; i++){
					//fileList[i].fileId
					//fileList[i].fileMsk
					//fileList[i].fileNm
					//fileList[i].fileSeq
					flHtml.push("<li>"+fileList[i].fileNm+"</li>");
				}
				$("#eduCol6").html(flHtml.join(''));
			}
		}
	});
	
	
}

/* rowspan function */
$.fn.mergeClassRowspan = function (colIdx) {
    return this.each(function () {
        var that;
        $('tr', this).each(function (row) {
            $('td:eq(' + colIdx + ')', this).filter(':visible').each(function (col) {
				//console.log($(this).attr('id'));
				//console.log($(that).attr('class'));
				
				if ($(this).attr('id') == $(that).attr('id')) {
               // if ($(this).attr('class') == $(that).attr('class')) {
                    rowspan = $(that).attr("rowspan") || 1;
                    rowspan = Number(rowspan) + 1;
                    $(that).attr("rowspan", rowspan);
                    $(this).hide();

                } else {
                    that = this;
                }

                that = (that == null) ? this : that;
            });
        });
    });
};


</script>
</body>
</html>