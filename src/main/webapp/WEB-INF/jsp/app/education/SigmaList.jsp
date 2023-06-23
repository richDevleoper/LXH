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
		    <!-- [D] 현재 활성화된 메뉴에 on클래스 추가해주세요. -->
            <c:forEach var="allCodes" items="${allCodes}" varStatus="status">
            	<c:if test="${allCodes.codeId ne 'D003'}">
					<button type="button" id="${allCodes.codeId}">${allCodes.codeNm}</button>
            	</c:if>
            </c:forEach>
	    </div>
	    
	    <form:form commandName="EducationSearchVO" id="defaultForm" method="get" action="sigmalist.do" >
	    ${EducationSearchVO.superHiddenTag}
	    <form:hidden path="tabId" />
	    
	    <div class="list-search mg-t20">
	    
			<div class="search-form row">
				<div class="form-inline form-input col s4">
					<div class="col s3 align-right"><label>이름</label></div>
					<div class="pd-l10 col s8"><form:input type="text" path="searchStdName" /></div>
				</div>
				<div class="form-inline form-input col s4">
					<div class="col s3 align-right"><label>조직</label></div>
					<div class="pd-l10 col s8 form-inline"><form:input type="text" path="searchStdDepart" /></div>
				</div>
				<div class="form-inline form-input col s4">
					<div class="col s3 align-right"><label>직책</label></div>
					<div class="pd-l10 col s8 form-inline"><form:input type="text" path="searchStdPosition" /></div>
				</div>
			</div>
			
			<div class="search-form row">
                <div class="form-inline form-input col s8">
                    <div class="col s2 align-right">
                        <label>조회기간</label>
                    </div>
                    <div class="pd-l10 col s8">
                        <div class="col s5 input-date">
                            <form:input type="text" path="searchCertFromDt" cssClass="datepicker"/> 
                            <i class="ico calendar"></i>
                        </div>
                        <span class="col s1 text-bul align-center">~</span>
                        <div class="col s5 input-date">
                            <form:input type="text" path="searchCertToDt" cssClass="datepicker"/>
                            <i class="ico calendar"></i>
                        </div>
                    </div>
                </div>
                
                <div class="form-inline form-input col s2">
                	<div class="form-inline form-input col s8">
	                   <label>조회대상</label>
	                </div>
                    <div class="pd-l10 col s4">
                         <form:select path="searchEduYear">
                            <option value="">전체</option>
                            <option value="">인증대상자</option>
                         </form:select>			 
                         <!-- <div class="form-check col s2">
                         	<input type="checkbox" name="" id="aa" checked="">
						 	<label for="aa">인증대상자</label>
                         </div> -->
                    </div>
                </div>
              
                <div class="col s2 align-right">
                    <button type="button" class="btn-submit" onclick="onclick_search()">조회</button>
                </div>
            </div>
		</div>
		</form:form>
		
		<div class="tab-inr">
			<div class="tab-box on">
				<div class="list-header mg-t20">
					<p class="title">대상인원</p>
					<span class="bar"></span>
					<p class="total">총 ${totalCount}</p>							
				</div>
				<div class="list-content mg-t10">
					<div class="list-table">
						<!-- <table class="even" id="tab"></table> -->
						
						<table class="even" id="chTab">
							<caption></caption>
							<colgroup>
								<col style="width:50px">
								<col style="width:80px">
								<col style="width:90px">
								<col>
								<col>
								<col style="width:80px">
								<col style="width:70px">
								<col style="width:70px">
								<col style="width:130px">
								<col style="width:100px">
								<c:if test="${gb eq '04'}">
									<col style="width:130px">
									<col style="width:100px">
								</c:if>
								
							</colgroup>
							<thead>
								<tr>
									<th class="bg-gray font-weight-bold"><input type="checkbox" name="ch_list" id="ch_all" /><label for="ch_all"></label></th>
									<th class="bg-gray font-weight-bold">성명</th>
									<th class="bg-gray font-weight-bold">사번</th>
									<th class="bg-gray font-weight-bold">교육</th>
									<th class="bg-gray font-weight-bold">Test</th>
									<th class="bg-gray font-weight-bold">조직</th>
									<th class="bg-gray font-weight-bold">직위</th>
									<th class="bg-gray font-weight-bold">직책</th>
									<th class="bg-gray font-weight-bold">인증일</th>
									<th class="bg-gray font-weight-bold">인증여부</th>
									<c:if test="${gb eq 'D002'}">
										<th class="bg-gray font-weight-bold">자질평가일</th>
										<th class="bg-gray font-weight-bold">합격여부</th>
									</c:if>
								</tr>                                            
							</thead>
							<tbody>
								<c:choose>
								    <c:when test="${fn:length(selectMngList) == 0}">
								           <tr>
                                             <c:choose>
                                             	<c:when test="${gb eq 'D002'}">
                                             		<td colspan="12"><span>조회결과가 없습니다.</span></td>
                                             	</c:when>
                                             	<c:otherwise>
                                             		<td colspan="10"><span>조회결과가 없습니다.</span></td>
                                             	</c:otherwise>
                                             </c:choose>
                                           </tr>
								    </c:when>
								    <c:otherwise>
								        <c:forEach var="selectMngList" items="${selectMngList}" varStatus="status">
								            <tr stdSeq=${selectMngList.stdSeq}>
                                                <td><input type="checkbox" name="ch_list" id="ch_${selectMngList.idx}" /><label for="ch_${selectMngList.idx}"></td>
                                                <td>${selectMngList.stdName}</td>
												<td>${selectMngList.comNo}</td>
												<td class="align-left pd-l10">
												<c:if test="${selectMngList.eduClassType eq '01'}">
													${selectMngList.mngTit}
												</c:if>
												</td>
												<td class="align-left pd-l10">
												<c:if test="${selectMngList.eduClassType eq '02'}">
													${selectMngList.mngTit}
												</c:if>
												</td>
												<td>${selectMngList.stdDepartNm}</td>
												<td>${selectMngList.stdJobxNm}</td>
												<td>${selectMngList.stdPosNm}</td>
												<td><div class="row">
												<div class="col input-text input-date">
												<input type="text" class="datepick" name="stdCertDate" id="stdCertDate_${selectMngList.idx}" value="${selectMngList.stdCertDate}" /> 
												<i class="ico calendar"></i>
												</div>
												</div></td>
												<td class="select-table">
												<div class="pd-l10 col s8">
													<select name="stdCertCode" id="stdCertCode_${selectMngList.idx}">
														<option value="">선택</option>
														<option value="Y" <c:if test ="${selectMngList.stdCertCode eq 'Y'}">selected="selected"</c:if>>인증</option>
														<option value="N" <c:if test ="${selectMngList.stdCertCode eq 'N'}">selected="selected"</c:if>>미인증</option>
													</select>${gb}
												</div>
												</td>
												
												<c:if test="${gb eq 'D002'}">
													<td><div class="row">
													<div class="col input-text input-date">
													<input type="text" class="datepick" name="stdTestDate" id="stdTestDate_${selectMngList.idx}" value="${selectMngList.stdTestDate}" /> 
													<i class="ico calendar"></i>
													</div>
													</div></td>
													<td class="select-table">
													<div class="pd-l10 col s8">
														<select name="stdTestCode" id="stdTestCode_${selectMngList.idx}">
															<option value="">선택</option>
															<option value="Y" <c:if test ="${selectMngList.stdTestCode eq 'Y'}">selected="selected"</c:if>>합격</option>
															<option value="N" <c:if test ="${selectMngList.stdTestCode eq 'N'}">selected="selected"</c:if>>불합격</option>
														</select>
													</div>
													</td>
												</c:if>	
												
                                            </tr>
								        </c:forEach>
								    </c:otherwise> 
								</c:choose>
								
								
							</tbody>
						</table>
						
					</div>
				</div>							
			</div>
		</div>
    </div>
    
    
    <div class="list-footer">
		<ui:pagination paginationInfo="${EducationSearchVO}" type="defDefault" jsFunction="cfnPageLink" />
        <div class="list-btns">
			<button type="button" class="btn light-gray" id="btnSave">저장</button>
			<button type="button" class="btn-excel" id="btnExcel">
				<img src="/assets/images/icon_excel.png" alt="">
				<span>다운로드</span>
			</button>  
        </div>
    </div>
    
<script type="text/javascript">
	$(document).ready(function(){
		init();
		$('.tab-btn > button').on('click',function(e){
			$('#defaultForm').attr("action","/education/sigmalist.do");
			let tabInx = $('.tab-btn > button').index(this);
			let tabId = e.target.id;
			selectData(tabInx, tabId);
		})
		
		$('.datepick').each(function(){ 
			$(this).datepicker(); 
		});
		
		$("#btnSave").on("click", function(){
			chkBoxSave();
		});
		
		$("#btnExcel").on("click", function(){
			let gb = "${gb}";
			console.log(gb);
			$('#tabId').val(gb);
	 		$('#defaultForm').attr("action","/education/excelmnglist.do");
			$('#defaultForm').submit();
		});
		
	});
	
	function init(){
		let gb = "${gb}";
		$("#"+gb).addClass('on');
		
		$("#defaultForm input").off("keyup").on("keyup", function(e){
		    if(e.keyCode===13 && this.value.trim().length>0){
		    	onclick_search();
		    }
		});
	}
	
	function selectData(tabInx, tabId){
		$('#tabId').val(tabId);
		$('#defaultForm')[0].submit();
		$("#"+tabId).addClass('on');
	}
	
	function onclick_search(){
		$('#defaultForm').attr("action","/education/sigmalist.do");
		$("#defaultForm")[0].submit();
	}

	function chkBoxSave(){
		let gb = "${gb}";
		let arrSeq = "";
		let arrCertDate = "";
		let arrCertCode = "";
		let arrTestDate = "";
		let arrTestCode = "";
		
		let chkNum = 0;
		$("#chTab").children("tbody:first").children("tr[stdSeq]").each(function(i){
			var stdSeq = $(this).attr("stdSeq");
			 
			if($(this).find("input:checkbox[name='ch_list']").is(":checked")){
				let stdCertDate = $(this).find("input[name=stdCertDate]").val();
				let stdCertCode = $(this).find("select[name=stdCertCode]").val();
				
				arrSeq += stdSeq + ",";
				// 미인증 일자 빈값처리
				if(stdCertCode == "N"){
					arrCertDate += " ,";
				}else{
					arrCertDate += stdCertDate + ",";
				}
				arrCertCode += stdCertCode + ",";
				
				if(gb == "04"){
					let stdTestDate = $(this).find("input[name=stdTestDate]").val();
					let stdTestCode = $(this).find("select[name=stdTestCode]").val();
					// 미합격 일자 빈값처리
					if(stdTestCode == "N"){
						arrTestDate += ",";
					}else{
						arrTestDate += stdTestDate + ",";
					}
					arrTestCode += stdTestCode + ",";
				}
				
				chkNum = chkNum+1;
			}
		});
		
		if(chkNum==0){
			alert("선택된 인원이 없습니다.");
			return false;
		}
		
		arrSeq = arrSeq.substring(0, arrSeq.length-1);
		arrCertDate = arrCertDate.substring(0, arrCertDate.length-1);
		arrCertCode = arrCertCode.substring(0, arrCertCode.length-1);
		
		if(gb == "04"){
			arrTestDate = arrTestDate.substring(0, arrTestDate.length-1);
			arrTestCode = arrTestCode.substring(0, arrTestCode.length-1);
		}

		if(confirm("저장하시겠습니까?")) {
			let params = {};
			params.gb = gb;
			params.arrSeq = arrSeq;		
			params.arrCertDate = arrCertDate;	
			params.arrCertCode = arrCertCode;	
			
			if(gb == "04"){
				params.arrTestDate = arrTestDate;
				params.arrTestCode = arrTestCode;
			}
			
			$.ajax({
				url:'/education/mngupdate.do',
				type: 'POST',
				data: params,
				dataType : 'json',
				success:function(data){
					alert("저장되었습니다.");
					location.reload();	
				}
			});
		}
		

	}
	
	
	
	
	
</script>
</body>
</html>