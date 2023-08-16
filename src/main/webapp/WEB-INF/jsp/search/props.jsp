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
    <div id="wrap">

        <!-- //header -->
        <!-- container -->
        <div id="container">
            <div id="page-header">
                <div class="inner">
                    <div class="page-category search">통합검색</div>
                    <div class="search-box">
                        <div class="search-form">
                        	<form:form commandName="proposalSearchVO" id="defaultForm" method="get" action="props.do" >
                        	${proposalSearchVO.superHiddenTag}
                                <span>전체</span>
                                <form:input type="text" path="searchPropName" placeholder="검색어를 입력하세요" />
                                <button type="submit" class="btn-search">검색</button>
                            </form:form>
                        </div>
                    </div>
                    <button tpye="button" class="btn-print" onclick="startPrint('page-content');">
                        <img src="/assets/images/btn_print.png" alt="">
                        <span>인쇄</span>
                    </button>
                </div>
            </div>
            <div id="page-container">
                <div class="inner">
                    <div class="new_group">
                        <div class="tab-group">
                            <div class="tab-btn center">
                                <!-- [D] 현재 활성화된 메뉴에 on클래스 추가해주세요. -->
                                <button type="button" param="1">과제검색</button>
                                <button type="button" param="2">분임조활동검색</button>
                                <button type="button" param="3" class="on">제안검색</button>
                                <button type="button" param="4">커뮤니티</button>
                            </div>
                            <div class="tab-inr">
                                <div class="tab-box"></div>
                                <div class="tab-box"></div>
                                <div class="tab-box"></div>
                                <div class="tab-box"></div>
                                <div class="tab-box"></div>
                                <div class="tab-box on">
                                    <div class="list-header mg-t20">
                                        <p class="title">조회된 과제</p>
                                        <span class="bar"></span>
                                        <p class="total">총 ${PROP_TOTAL}</p>
                                        <select name="limit" class="limit" onchange="onchange_recordCountPerPage(this.value)">
		                                    <option value="10" <c:if test="${proposalSearchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
		                                    <option value="50" <c:if test="${proposalSearchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
		                                    <option value="100" <c:if test="${proposalSearchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
		                                </select>
                                    </div>
                                    <section class="new_list" style="width: 100% !important;">
                                        <div class="inr">
                                            <ul>
                                            <c:forEach items="${PROP_LIST}" var="item">
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
                                            </ul>
                                        </div>
                                    </section>
                                    <div class="list-footer">
                                        <ui:pagination paginationInfo="${proposalSearchVO}" type="defDefault" jsFunction="cfnPageLink" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- //container -->
<script>
$(document).ready(init);
function init(){
	$(".tab-btn button").off("click").on("click", onclick_tab)
}

function onclick_search(){
	$("#defaultForm")[0].submit();
}

function onchange_recordCountPerPage(vCount){
	$("#currentPageNo").val("1");
	$("#recordCountPerPage").val(vCount);
	onclick_search();// 검색 '조회'버튼 클릭
}

function onclick_tab(){
	idx = $(this).attr("param");
	let strAction="";
	if(idx==2)
		strAction="team.do";
	else if(idx==3)
		strAction="props.do";
	else if(idx==4)
		strAction="board.do";	
	else
		strAction="";
		
	$("#currentPageNo").val("1");
	$("#defaultForm").attr("action", "./"+strAction);
	onclick_search();
}
</script>        
</body>
</html>