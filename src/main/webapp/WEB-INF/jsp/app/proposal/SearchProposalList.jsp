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
                                      			<form:input type="text" id="input-proposal-member" name="input-proposal-member" readonly="true" style="background-color: #FFF;" path="searchPropUserName"/>
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
                                                    	<c:choose>
                                                    		<c:when test="${PROP_TYPE_CODE eq item.codeId }">
                                                    			<option value="${item.codeId }" selected="selected">${item.codeNm }</option>
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			<option value="${item.codeId }">${item.codeNm }</option>
                                                    		</c:otherwise>
                                                    	</c:choose>
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
	                                                	<c:choose>
	                                                		<c:when test="${PROP_CLASS_CODE eq item.codeId }">
	                                                			<option value="${item.codeId }" selected="selected">${item.codeNm }</option>
	                                                		</c:when>
	                                                		<c:otherwise>
	                                                			<option value="${item.codeId }">${item.codeNm }</option>          
	                                                		</c:otherwise>
	                                                	</c:choose>                         	
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
                            <div class="new_group">
                                <div class="list-header mg-t20">
                                    <p class="title">조회된 제안</p>
                                    <span class="bar"></span>
                                    <p class="total">총 ${PROP_TOTAL }</p>
	                                <select name="limit" class="limit" onchange="onchange_recordCountPerPage(this.value)">
	                                    <option value="10" <c:if test="${proposalSearchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
	                                    <option value="50" <c:if test="${proposalSearchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
	                                    <option value="100" <c:if test="${proposalSearchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
	                                </select>
                                </div>
                                <div class="new_list">
                                    <div class="inr">
                                        <ul>
                                        	<c:forEach items="${PROP_LIST }" var="item">
                                        		<li class="border">
                                        			<div>
                                        				<ul>
                                        					<c:choose>
                                        						<c:when test="${item.propPropStatCode eq 'NA' }">
                                        							<li class="title_gray">
                                        						</c:when>
                                        						<c:otherwise>
                                        							<li class="title">
                                        						</c:otherwise>
                                        					</c:choose>
                                        					<c:choose>
                                        						<c:when test="${item.propEvalLvCodeName != null  and item.propEvalLvCodeName ne ''}">
                                        							<span>${item.propEvalLvCodeName }</span>
                                        						</c:when>
                                        						<c:otherwise>
                                        							<span>${item.propPropStatCodeName }</span>
                                        						</c:otherwise>
                                        					</c:choose>                                        					
                                        					</li>
                                        					<li>
                                        						<span>${item.propTypeCodeName }제안</span>
                                        					</li>
                                        				</ul>
                                        			</div>
                                        			<p class="list">
                                        				<c:choose>
                                        					<c:when test="${item.propTypeCode eq 'PPS_TYP_1' }">
                                        						<a href="/proposal/detail.do?menuKey=36&propSeq=${item.propSeq }">제안명: ${item.propName }</a>
                                        					</c:when>
                                        					<c:otherwise>
                                        						<a href="/proposal/memodetail.do?menuKey=36&propSeq=${item.propSeq }">제안명: ${item.propName }</a>
                                        					</c:otherwise>
                                        				</c:choose>         
                                        				<br>                               				
                                        				<span>
                                        					제안자: ${item.propUserName }, 조직명: ${item.propGroupName }, 분임조: ${item.propCircleName }, 제안유형: ${item.propCategoryCodeName }, 제안일: ${item.propDate }
                                        					<c:if test="${item.propTypeCode eq 'PPS_TYP_1' }">
                                        						<fmt:formatNumber var="propYearEffect" value="${item.propYearEffect}" type="currency" currencySymbol="₩"/>
                                        						, 실행완료일: ${item.propPracticeCompDate }, 년간 효과금액: ${item.propYearEffectCodeName } ( ${propYearEffect } )
                                        					</c:if>
                                        				</span>
                                        			</p>
                                        		</li>
                                        	</c:forEach>
<!--                                             <li class="border">
                                                <div>
                                                    <ul>
                                                        <li class="title">
                                                            <span>진행중(On-track)</span>
                                                        </li>
                                                        <li>
                                                            <span>6σ Full Process</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <p class="list">
                                                    <a href="/app/004_02_search_01.do?menuKey=36" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                    <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                </p>
                                            </li> -->
                                        </ul>
                                    </div>
                                    <div class="list-footer">
										<ui:pagination paginationInfo="${proposalSearchVO}" type="defDefault" jsFunction="cfnPageLink" />
                                        <div class="list-btns">
                                           <!--  <button type="button" class="btn-excel">
                                                <img src="/assets/images/icon_excel.png" alt="">
                                                <span>다운로드</span>
                                            </button> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#button-search').off('click').on('click', function(){
			onclick_search();
		});
		
		//제안자 조회
		$('.btn-proposal-member-search-modal').off('click').on('click', function(){
			popEmp.init();
			
			popEmp.returnObjId = $('#input-proposal');
			popEmp.returnFunc = setProposalMemberInfo;
			
			popEmp.open();
		});
	});
	
	function onclick_search(){
		$("#defaultForm")[0].submit();				
	}
	
	function onchange_recordCountPerPage(vCount){
		$("#recordCountPerPage").val(vCount);
		onclick_search();// 검색 '조회'버튼 클릭
	}
	
	function setProposalMemberInfo(el, d){
		$('#input-proposal-member').val(d.userName);
		$('#input-proposal-member-code').val(d.comNo);
	}
</script>
</body>
</html>