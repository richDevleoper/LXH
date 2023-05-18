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
                            	<form:form commandName="proposalSearchVO" id="defaultForm" method="get" action="list.do" >
                            	${proposalSearchVO.superHiddenTag}
	                                <div class="search-form row">
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>제안명</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                            <form:input type="text" name="input-proposal-name" id="input-proposal-name" path="searchPropName"/>
	                                        </div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>조직</label>
	                                        </div>
                                      		<div class="pd-l10 col s9 input-text search">
                                      			<form:input path="searchGroupCode" type="hidden" id="input-proposal-group-code" name="input-proposal-group-code"/>
                                      			<form:input type="text" id="input-proposal-group" name="input-proposal-group" readonly="readonly" style="background-color: #FFF;" path="searchGroupName"/>
                                      			<button type="button" class="btn-proposal-group-search-modal">검색</button>                               		
                                      		</div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>사업장</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                            <form:select name="select-bizplace-code" id="select-bizplace-code" path="searchBizPlaceCode">
                                                    <option value="">선택</option>
                                                    <c:forEach var="item" items="${BIZ_PLACE_LIST }">
                                                    	<option value="${item.codeId }">${item.codeNm }</option>
                                                    </c:forEach>
	                                            </form:select>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="search-form row">
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>제안자</label>
	                                        </div>
                                      		<div class="pd-l10 col s9 input-text search">
                                      			<form:input path="searchPropUser" type="hidden" id="input-proposal-member-code" name="input-proposal-member-code"/>
                                      			<form:input type="text" id="input-proposal-member" name="input-proposal-member" readonly="readonly" style="background-color: #FFF;" path="searchPropUserName"/>
                                      			<button type="button" class="btn-proposal-member-search-modal">검색</button>                               		
                                      		</div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>실시/쪽지</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                            <form:select name="select-type-code" id="select-type-code" path="searchPropTypeCode">
	                                                <option value="">전체</option>
                                                    <c:forEach var="item" items="${TYPE_LIST }">
                                                    	<option value="${item.codeId }">${item.codeNm }</option>
                                                    </c:forEach>	                                                
	                                            </form:select>
	                                        </div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>등급</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                            <form:select name="select-class-code" id="select-class-code" path="searchPropClassCode">
	                                                <option value="">전체</option>
	                                                <c:forEach var="item" items="${CLASS_LIST }">
														<option value="${item.codeId }">${item.codeNm }</option>                                                   	
                                                    </c:forEach>
	                                            </form:select>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="search-form row">
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>제안유형</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                            <form:select name="select-category-code" id="select-category-code" path="searchPropCategoryCode">
	                                                <option value="">전체</option>
	                                                <c:forEach var="item" items="${CATEGORY_LIST }">
                                                    	<option value="${item.codeId }">${item.codeNm }</option>
                                                    </c:forEach>	                                                
	                                            </form:select>
	                                        </div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>진행단계</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                            <form:select name="select-stat-code" id="select-stat-code" path="searchPropStatCode">
	                                                <option value="">전체</option>
	                                                <c:forEach var="item" items="${PROGRESS_LIST }">
	                                                	<option value="${item.codeId }">${item.codeNm }</option>                                                    	
                                                    </c:forEach>	                                                
	                                            </form:select>
	                                        </div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>제안일</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                        	<div class="col s5 input-date input-date" style="padding-right: 0px; cursor: pointer; width: calc(50% - 10px);">
		                                            <form:input type="text" id="input-from-date" name="input-from-date" class="datepicker" readonly="readonly" style="background-color: #FFF; cursor: inherit; width: 100px;" path="searchPropFromDate"/>
		                                            <i class="ico calendar"></i>                                        	
	                                        	</div>                                 
	                                            <span class="col s1 text-bul align-center">~</span>
	                                            <div class="col s5 input-date input-date" style="padding-right: 0px; cursor: pointer; width: calc(50% - 10px);">
		                                            <form:input type="text" id="input-to-date" name="input-to-date" class="datepicker" readonly="readonly" style="background-color: #FFF; cursor: inherit; width: 100px;" path="searchPropToDate"/>
		                                            <i class="ico calendar"></i>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="search-form row">
	                                    <div class="col s12 align-right">
	                                        <button type="button" class="btn-submit" id="button-search">조회</button>
	                                    </div>
	                                </div>                            	
                            	</form:form>
                            </div>

                            <div class="list-header">
                                <p class="title">제안목록</p>
                                <span class="bar"></span>
                                <p class="total">총 ${SUMMARY.tt } (실시제안 ${SUMMARY.ppsTyp1 }, 쪽지제안 ${SUMMARY.ppsTyp2 })</p>
                                <select name="limit" class="limit" onchange="onchange_recordCountPerPage(this.value)">
                                    <option value="10" <c:if test="${proposalSearchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
                                    <option value="50" <c:if test="${proposalSearchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
                                    <option value="100" <c:if test="${proposalSearchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="even">
                                        <colgroup>                                            
                                            <col style="width:60px">
                                            <col style="width:60px">
                                            <col>
                                            <col style="width:60px">
                                            <col style="width:80px">
                                            <col style="width:170px">
                                            <col style="width:80px">
                                            <col style="width:100px">
                                            <col style="width:100px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray font-weight-bold">NO</th>
                                                <th class="bg-gray font-weight-bold">구분</th>
                                                <th class="bg-gray font-weight-bold">제안명</th>
                                                <th class="bg-gray font-weight-bold">제안자</th>
                                                <th class="bg-gray font-weight-bold">제안유형</th>
                                                <th class="bg-gray font-weight-bold">조직명</th>
                                                <th class="bg-gray font-weight-bold">사업장</th>
                                                <th class="bg-gray font-weight-bold">진행단계</th>
                                                <th class="bg-gray font-weight-bold">제안일</th>
                                            </tr>                                            
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="item" items="${PROP_LIST }">
	                                            <tr>
	                                                <td>${item.idx }</td>                                                
	                                                <td>${item.propTypeCodeName }</td>
	                                                <td class="align-left"><a href="javascript: onclick_poposalInfo('${item.propSeq}', '${item.propTypeCode }');">${item.propName }</a></td>
	                                                <td>${item.propUserName }</td>
	                                                <td>${item.propCategoryCodeName }</td>
	                                                <td>${item.propGroupName }</td>
	                                                <td>${item.propBizPlaceCode }</td>
	                                                <td>
	                                                	<c:choose>
	                                                		<c:when test="${item.propEvalLvCode != null and item.propEvalLvCode ne '' }">
	                                                			${item.propPropStatCodeName }(${item.propEvalLvCodeName })
	                                                		</c:when>	                                                			
	                                                		<c:otherwise>
	                                                			${item.propPropStatCodeName }
	                                                		</c:otherwise>
	                                                	</c:choose>
	                                                </td>
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
                                    <button type="button" class="btn-excel">
                                        <img src="/assets/images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>
                                </div>
                            </div>
                        </div>
<script type="text/javascript">
	$(document).ready(function(){
		//제안자 조회
		$('.btn-proposal-member-search-modal').off('click').on('click', function(){
			popEmp.init();
			
			popEmp.returnObjId = $('#input-proposal');
			popEmp.returnFunc = setProposalMemberInfo;
			
			popEmp.open();
		});
		
		$('#button-search').off('click').on('click', function(){
			onclick_search();
		});
	});
	
	function setProposalMemberInfo(el, d){
		$('#input-proposal-member').val(d.userName);
		$('#input-proposal-member-code').val(d.comNo);
	}
	
	function onclick_search(){
		$("#defaultForm")[0].submit();				
	}
	
	function onchange_recordCountPerPage(vCount){
		$("#recordCountPerPage").val(vCount);
		onclick_search();// 검색 '조회'버튼 클릭
	}
	
	function onclick_poposalInfo(propSeq, propTypeCode){
		if(propTypeCode == 'PPS_TYP_1'){
			location.href="/proposal/judge/detail.do?menuKey=50&propSeq="+propSeq;
		}else{
			location.href="/proposal/judge/memodetail.do?menuKey=50&propSeq="+propSeq;
		}		
	}
</script>
</body>
</html>