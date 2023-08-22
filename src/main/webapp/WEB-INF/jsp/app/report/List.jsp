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
	<style>
		.w-90p { width: 90px !important;}
		table.centered tbody tr td a {text-decoration: underline;}
	</style>
</head>
<body>

                        <div class="list-wrap">
                            <div class="list-search">
                                <form:form commandName="reportSearchVO" id="defaultForm" method="get" action="list.do" >
                                ${reportSearchVO.superHiddenTag}
                                	<%-- <form:hidden path="recordCountPerPage"/> --%>
                                    <div class="search-form">
                                        <div class="form-inline form-input">
                                            <label>과제명 </label>
                                            <form:input path="searchRepName" title="검색어"  />
                                        </div>
                                        <div class="form-inline form-select">
                                            <label>6σFull Process 여부</label>                                            
                                            <form:select path="searchDivision" cssClass="w-90p">
                                                <option value="">전체</option>
                                                <c:forEach var="item" items="${searchRepName}">
                                                	<c:choose>
                                                		<c:when test="${repMenuCode eq 'TEAM'}">
	                                                		<c:if test="${item.codeId ne '3'}">
																<option value="${item.codeId}" <c:if test="${item.codeId eq reportSearchVO.searchDivision }">selected="selected"</c:if>>${item.codeNm}</option>
															</c:if>
                                                		</c:when>
                                                		<c:otherwise>
                                                		<option value="${item.codeId}" <c:if test="${item.codeId eq reportSearchVO.searchDivision }">selected="selected"</c:if>>${item.codeNm}</option>
                                                		</c:otherwise>
                                                	</c:choose>
												</c:forEach>
                                            </form:select>
                                        </div>
                                        <div class="form-inline form-select">
                                            <label>과제유형</label>
                                            <form:select path="searchType" cssClass="w-90p">
                                                <option value="">전체</option>
                                            </form:select>
                                        </div>
                                        <div class="form-inline form-select">
                                            <label>진행현황</label>
                                            <form:select path="searchStatus">
                                                <option value="">전체</option>
                                                <c:forEach var="item" items="${searchStatus}">
													<option value="${item.codeId}" <c:if test="${item.codeId eq reportSearchVO.searchStatus }">selected="selected"</c:if>>${item.codeNm}</option>
												</c:forEach>
                                            </form:select>
                                        </div>
                                        <button type="button" class="btn-submit" onclick="onclick_search()">조회</button>
                                    </div>
                               </form:form>
                            </div>

                            <div class="list-header">
                                <p class="title">나의 과제</p>
                                <span class="bar"></span>
                                <p class="total">총 ${totalCount}건(완료${count_1}, 진행중${count_3+count_4}, 선정중 ${count_2}, Drop ${count_5})</p>
                                <select name="limit" class="limit" onchange="onchange_recordCountPerPage(this.value)">
                                    <option value="10" <c:if test="${reportSearchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
                                    <option value="50" <c:if test="${reportSearchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
                                    <option value="100" <c:if test="${reportSearchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table" style="min-height: 235px;">
                                    <table class="centered even">
                                        <colgroup>
                                            <col style="width:50px">
                                            <col style="width:120px">
                                            <col style="width:150px">
                                            <col>
                                            <col style="width:100px">
                                            <col style="width:100px">
                                            <col style="width:100px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray font-weight-bold">NO</th>
                                                <th class="bg-gray font-weight-bold">6σFull Process 여부</th>
                                                <th class="bg-gray font-weight-bold">과제유형</th>
                                                <th class="bg-gray font-weight-bold">과제명</th>
                                                <th class="bg-gray font-weight-bold">진행현황</th>
                                                <th class="bg-gray font-weight-bold">착수(예정)일</th>
                                                <th class="bg-gray font-weight-bold">완료(예정)일</th>
                                            </tr>                                            
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${reportList}" var="item" varStatus="i">
                                            <tr>
                                                <td>${item.idx}</td>
                                                <td>${item.repDivision}</td>
                                                <td>${item.repType}</td>
                                                <td><a href="javascript: onclick_reportName('${item.repStatusCode}', '${item.repCode}')">${item.repName}</a></td>
                                                <td>${item.repStatus}</td>
                                                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${item.repStartDate}" /></td>
                                                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${item.repFinishDate}" /></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">
                            	<ui:pagination paginationInfo="${reportSearchVO}" type="defDefault" jsFunction="cfnPageLink" />
                                <div class="list-btns">
                                    <button type="button" class="btn bg-gray" onclick="location.href='./insertForm.do?menuKey=${menuKey}'">                                        
                                        <span>과제등록</span>
                                    </button>                                    
                                </div>
                            </div>
                        </div>

<script type="text/javascript">
	$(document).ready(init);
	let paramSearchType = '${reportSearchVO.searchType}';
	let repMenuCode = '${repMenuCode}';
	
	let cdRepType1 = [<c:forEach var="item" items="${typeCode1}">{key:${item.codeId},value:"${item.codeNm}"},</c:forEach>];
	let cdRepType2 = [<c:forEach var="item" items="${typeCode2}">{key:${item.codeId},value:"${item.codeNm}"},</c:forEach>];
	let cdRepType3 = [<c:forEach var="item" items="${typeCode3}">{key:${item.codeId},value:"${item.codeNm}"},</c:forEach>];
	
	if(repMenuCode==="TEAM"){
		cdRepType1 = cdRepType1.filter(function(code){ return code.value==="DMAIC";});  // 분임조에서는 DMAIC만 적용(화면설계서)	
	}
	
	function init(){
		$("#searchDivision").off("change").on("change", onchange_ddlRepDevisionCode); // 6σ Full Process여부
		onchange_ddlRepDevisionCode();
		
		$("#searchType").val(paramSearchType);	
	}
	
	// onchange_ddlRepDevisionCode : 과제유형, 일정계획 입력창 변경
	function onchange_ddlRepDevisionCode(e){
		let repDevCd = $("#searchDivision").val(); //이벤트 트리거 객체의 값
		
		let targetObjId = "searchType";	//바뀔 대상 객체 ID
		let arrRepType = [];
		$(".tr-rep-date").hide();
		
		switch(repDevCd){
		case "1": //6sigma
			arrRepType = cdRepType1;
			break;
		case "2": //일반
			arrRepType = [];
			break;
		case "3": // 10+No.
			arrRepType = cdRepType3;
			break;
		default:
			arrRepType = [];
			break;
		}
		
		if(repDevCd === '2'){
			setDropDown(targetObjId, arrRepType, true, '(해당없음)');		
		}else{
			setDropDown(targetObjId, arrRepType, true, '전체');
		}
	}
	
	function onclick_search(){
		$("#defaultForm")[0].submit();
	}
	
	function onchange_recordCountPerPage(vCount){
		$("#currentPageNo").val("1");
		$("#recordCountPerPage").val(vCount);
		onclick_search();// 검색 '조회'버튼 클릭
	}
	
	function onclick_reportName(statusCode, repCode){
		location.href="/"+ repMenuCode.toLowerCase() +"/updateForm.do?menuKey=${menuKey}&repCode="+repCode;
	}
</script>


</body>
</html>