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
			<c:forEach var="allCodes" items="${allCodes}" varStatus="status">
            	<button type="button" id="${allCodes.codeId}">${allCodes.codeNm}</button>
            </c:forEach>
		</div>
		
		<div class="tab-inr">
			<div class="tab-box on">
				<div class="list-table list mg-t20">
					<table class="centered" id="tab1">
						<caption></caption>
						<colgroup>
							<col>
							<col style="width: 100px">
							<col style="width: 250px">
							<col style="width: 100px">
							<col style="width: 150px">
							<col style="width: 100px">
						</colgroup>
						<thead>
							<tr>
								<th>과정명</th>
								<th>차수명</th>
								<th>기간</th>
								<th>이수여부</th>
								<th>신청(취소)일</th>
								<th>내역</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="tab-group" id="detailDiv">
		<form:form commandName="frmMyEdu" id="defaultForm" name="defaultForm" onsubmit="return false" method="post" modelAttribute="EducationVO">
           <form:hidden path="eduCode" id="eduCode"/>
           <form:hidden path="stdSeq" id="stdSeq"/>
           <form:hidden path="eduFixed" id="eduFixed"/>
           <form:hidden path="mode" />
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
			<button type="button" class="btn bg-gray" id="btnRegEdu" style="display: none">재신청</button>
			<button type="button" class="btn bg-white" id="btnCnlEdu" style="display: none">취소</button>
		</div>
		 
	</div>

<script type="text/javascript">
$(document).ready(function(){
	init();
	$('.tab-btn > button').on('click',function(e){
		let tabInx = $('.tab-btn > button').index(this);
		let tabId = e.target.id;
		selectMyEdu(tabId);
		init();
	})
	
	$("#btnRegEdu").on("click", function(){
		reofferSave();		
	});
	
	$("#btnCnlEdu").on("click", function(){
		cnacleSave();		
	});
	
	$('.tab-btn > button').eq(0).click();
});

function init(){
	$("#detailDiv").hide();
	$("#btnRegEdu").hide();
	$("#btnCnlEdu").hide();
}

function selectMyEdu(tabId){
	let eduBeltCode = tabId;
	let params = {};
	params.eduBeltCode = eduBeltCode;	
	
	$.ajax({
		url:'/education/searchmyedu.do',
		type: 'POST',
		data: params,
		dataType : 'json',
		success:function(data){
			let myList = data.myList;

			var vHtml = [];
			if(myList.length>0){
				for(var i=0; i<myList.length; i++){
					let eduCode = myList[i].eduCode;
					let eduName = myList[i].eduName;
					let eduYear = myList[i].eduYear;
					let eduNumber = myList[i].eduNumber;
					let eduDate = myList[i].eduDate;
					let stdSeq = myList[i].stdSeq;
					let stdCompleteNm = myList[i].stdCompleteNm;
					let stdStatus = myList[i].stdStatus;
					let stdStatusNm = myList[i].stdStatusNm;
					let eduClassType = myList[i].eduClassType;
					let stdRegDate = myList[i].stdRegDate;
					let stdUpdateDate = myList[i].stdUpdateDate;
					let stdReapplyYn = myList[i].stdReapplyYn;
					
					let displayDate = ""
					if(stdUpdateDate == null){
						displayDate = stdRegDate
					}else{
						displayDate = stdRegDate+"("+stdUpdateDate+")";
					}
					
					let displayStNm = ""
					if(stdReapplyYn == "Y"){
						displayStNm = "재신청 완료"
					}else{
						displayStNm = stdStatusNm;
					}
					
					vHtml.push("<tr>");
					vHtml.push('<td><a href="javascript: onclick_educationInfo(\''+eduCode+'\',\''+stdSeq+'\',\''+stdStatus+'\')">'+eduName+'</a></td>');
					vHtml.push("<td class='bg-white align-center'>"+eduYear+"년 "+eduNumber+"차</td>");
					vHtml.push("<td class='bg-white align-center'>"+eduDate+"</td>");
					vHtml.push("<td class='bg-white align-center'>"+stdCompleteNm+"</td>");
					vHtml.push("<td class='bg-white align-center'>"+displayDate+"</td>");
					vHtml.push("<td class='bg-white align-center'>"+displayStNm+"</td>");
					vHtml.push("</tr>");
				}
			}else{
				vHtml.push("<tr>");
				vHtml.push("<td class='bg-white align-center' colspan='6'>데이터가 없습니다.</td>");
				vHtml.push("</tr>");	
			}
			$("#tab1").find("tbody").html(vHtml.join(''));
			
			
		}
	});
	
	
}

function onclick_educationInfo(eduCode, stdSeq, status){
	$("#stdSeq").val(stdSeq);
	
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
			
			let eduYear = data.eduYear;
			let eduDate = data.eduDate;
			$("#eduCol7").html(eduDate);
					
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
	
	if(status == "Y"){
		$("#btnRegEdu").hide();
		$("#btnCnlEdu").show();
	}else{
		$("#btnRegEdu").show();
		$("#btnCnlEdu").hide();
	}
}

function reofferSave(){
	let tit = $("#eduCol1").text();
	let eduCode = $("#eduCode").val();
	let stdSeq = $("#stdSeq").val();
	
	let params = {};
	params.eduCode = eduCode;
	params.stdSeq = stdSeq;
	params.mode = "Y";
	
	if(confirm(tit + " 교육을 재신청하시겠습니까?")){
		$.ajax({
			url:'/education/reofferstd.do',
			type: 'POST',
			data: params,
			dataType : 'json',
			success:function(data){
				if(data.result == "Y"){
					alert(tit + " 교육이 재신청되었습니다.");
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



</script>

</body>
</html>