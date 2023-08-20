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
                            <div class="list-search">
                                <form:form commandName="proposalSearchVO" id="defaultForm" method="get" action="memolist.do" >
                                	${proposalSearchVO.superHiddenTag}
                                    <div class="search-form">
<%--                                         <div class="form-inline form-input">
                                            <label style="margin-right: 5px;">구분</label>
                                            <form:select name="select-type-code" id="select-type-code" path="searchPropTypeCode">
                                                <option value="">전체</option>
                                                <c:forEach var="item" items="${PP_TY_LIST }">
                                                	<c:choose>
                                                		<c:when test="${item.codeId eq PROP_TYPE_CODE}">
                                                			<option value="${item.codeId }" selected="selected">${item.codeNm }</option>
                                                		</c:when>
                                                		<c:otherwise>
                                                			<option value="${item.codeId }">${item.codeNm }</option>
                                                		</c:otherwise>
                                                	</c:choose>
                                                </c:forEach>
                                            </form:select>                                            
                                        </div> --%>
                                        <div class="form-inline form-input">
	                                        <label style="margin-right: 5px;">제안명</label>
	                                        <div class="form-inline form-select" style="">
	                                            <form:input type="text" name="input-proposal-name" id="input-proposal-name" style="width: 130px;" path="searchPropName" value="${PROP_NAME }"/>
	                                        </div>
                                        </div>
                                        <div class="form-inline form-select">
                                            <label style="margin-right: 5px;">제안유형</label>                                            
                                            <form:select name="select-category-code" id="select-category-code" path="searchPropCategoryCode">
                                                <option value="">전체</option>
                                                <c:forEach var="item" items="${CATEGORY_LIST }">
                                                	<c:choose>
                                                		<c:when test="${item.codeId eq PROP_CATEGORY_CODE}">
                                                			<option value="${item.codeId }" selected="selected">${item.codeNm }</option>
                                                		</c:when>
                                                		<c:otherwise>
                                                			<option value="${item.codeId }">${item.codeNm }</option>
                                                		</c:otherwise>
                                                	</c:choose>
                                                </c:forEach>
                                            </form:select>
                                        </div>
<%--                                         <div class="form-inline form-select">
                                            <label style="margin-right: 5px;">등급</label>
                                            <form:select name="select-class-code" id="select-class-code" path="searchPropClassCode">
                                                <option value="">전체</option>
                                                <c:forEach var="item" items="${CLASS_LIST }">
                                                	<c:choose>
                                                		<c:when test="${item.codeId eq PROP_CLASS_CODE}">
                                                			<option value="${item.codeId }" selected="selected">${item.codeNm }</option>
                                                		</c:when>
                                                		<c:otherwise>
                                                			<option value="${item.codeId }">${item.codeNm }</option>
                                                		</c:otherwise>
                                                	</c:choose>
                                                </c:forEach>
                                            </form:select>
                                        </div> --%>
                                        
                                        <div class="form-inline form-select inline-calendar">
                                        	<div class="s6 input-text input-date form-inline" style="cursor: pointer;">
	                                            <form:input type="text" id="input-from-date" name="input-from-date" class="datepicker" readonly="readonly" style="background-color: #FFF; cursor: inherit; width: 100px;" value="${PROP_FROM_DATE }" path="searchPropFromDate"/>
	                                            <i class="ico calendar"></i>                                        	
                                        	</div>                                 
                                            <span class="text-bul align-center">~</span>
                                            <div class="s6 input-text input-date form-inline" style="cursor: pointer;">
	                                            <form:input type="text" id="input-to-date" name="input-to-date" class="datepicker" readonly="readonly" style="background-color: #FFF; cursor: inherit; width: 100px;" value="${PROP_TO_DATE }" path="searchPropToDate"/>
	                                            <i class="ico calendar"></i>
                                            </div>
                                        </div>
                                        <button type="button" class="btn-submit" id="button-search">조회</button>
                                    </div>
                                </form:form>
                            </div>

                            <div class="list-header">
                                <p class="title">나의 쪽지제안</p>
                                <span class="bar"></span>
                                <p class="total">총  ${SUMMARY.tt }</p>
                                <select name="limit" class="limit" onchange="onchange_recordCountPerPage(this.value)">
                                    <option value="10" <c:if test="${proposalSearchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
                                    <option value="50" <c:if test="${proposalSearchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
                                    <option value="100" <c:if test="${proposalSearchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="centered even">
                                        <colgroup>
                                            <col style="width:50px">
                                            <col>
                                            <col style="width:60px">
                                            <col style="width:80px">
                                            <col style="width:170px">
                                            <col style="width:100px">
                                            <col style="width:130px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray">NO</th>
                                                <th class="bg-gray">제안명</th>
                                                <th class="bg-gray">제안자</th>
                                                <th class="bg-gray">제안유형</th>
                                                <th class="bg-gray">조직명</th>
                                                <th class="bg-gray">분임조</th>
                                                <th class="bg-gray">제안일</th>                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${PROP_LIST }" var="item">
	                                            <tr>
	                                                <td>${item.idx }</td>
	                                                <td class="align-left"><a href="javascript: onclick_poposalInfo('${item.propSeq}');">${item.propName }</a></td>
	                                                <td>${item.propUserName }</td>
	                                                <td>${item.propCategoryCodeName }</td>
	                                                <td>${item.propGroupName }</td>
	                                                <td>${item.propCircleName }</td>                                                
	                                                <td>${item.propDate }</td>                                                
	                                            </tr>                                        	
                                        	</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">
                            	<ui:pagination paginationInfo="${proposalSearchVO}" type="defDefault" jsFunction="cfnPageLink" />
                                <div class="list-btns">
                                    <button type="button" class="btn bg-gray" onclick="location.href='/proposal/memodetail.do?menuKey=49'">                                        
                                        <span>쪽지제안등록</span>
                                    </button>                                    
                                </div>

                            </div>
                        </div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#button-search').off('click').on('click', function(){
			onclick_search();
		});
	});
	
	function onclick_search(){
		$("#defaultForm")[0].submit();				
	}
	
	function onchange_recordCountPerPage(vCount){
		$("#currentPageNo").val("1");
		$("#recordCountPerPage").val(vCount);
		onclick_search();// 검색 '조회'버튼 클릭
	}
	
	function onclick_poposalInfo(propSeq){
		location.href="/proposal/memodetail.do?menuKey=49&propSeq="+propSeq;
	}
</script>
</body>
</html>