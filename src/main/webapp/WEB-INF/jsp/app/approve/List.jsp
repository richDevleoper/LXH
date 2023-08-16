<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                            <div class="list-search">
							<form:form commandName="approveSearchVO" id="defaultForm" method="get" action="list.do" >
                            ${approveSearchVO.superHiddenTag}                          
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>결재종류</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                         <form:select path="searchType" cssClass="w-90p">
                                               <option value="">전체</option>
                                               <c:forEach var="item" items="${searchTypeCd}">
												<option value="${item.codeId}" <c:if test="${item.codeId eq approveSearchVO.searchType }">selected="selected"</c:if>>${item.codeNm}</option>
											</c:forEach>
                                           </form:select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s8">
                                        <div class="col s2 align-right" style="min-width: 77.17px; width: 77.17px;">
                                            <label>제목</label>
                                        </div>
                                        <div class="pd-l10 col s12">
                                            <form:input path="searchName" title="검색어"  />
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>결재의뢰자</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                           <form:input path="searchReqEmpNm" title="결재의뢰자"  />
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>결재상태</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                            <form:select path="searchStatus" cssClass="w-90p">
                                                  <option value="">전체</option>
                                               <c:forEach var="item" items="${searchStatusCd}">
											  	  <option value="${item.codeId}" <c:if test="${item.codeId eq approveSearchVO.searchStatus }">selected="selected"</c:if>>${item.codeNm}</option>
											   </c:forEach>
                                            </form:select>                                    
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>조회기간</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                            <div class="col s5 input-date">
                                                <form:input type="text" path="searchFromDt" cssClass="datepicker"/>
                                                <i class="ico calendar"></i>
                                            </div>
                                            <span class="col s1 text-bul align-center">~</span>
                                            <div class="col s5 input-date">
                                                <form:input type="text" path="searchToDt" cssClass="datepicker"/>
                                                <i class="ico calendar"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="col s12 align-right">
                                        <button type="button" class="btn-submit" onclick="onclick_search()">조회</button>
                                    </div>
                                </div>
								</form:form>
                            </div>
                            <div class="list-header">
                                <p class="title">나의 결재함</p>
                                <span class="bar"></span>
                                <p class="total">총 ${totalCount}건(승인 : ${count_4}건, 반려 : ${count_3}건, 미결 ${count_2}건)</p>
                                <select name="limit" class="limit" onchange="onchange_recordCountPerPage(this.value)">
                                    <option value="10" <c:if test="${approveSearchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
                                    <option value="50" <c:if test="${approveSearchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
                                    <option value="100" <c:if test="${approveSearchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="centered even">
                                        <colgroup>
                                            <col style="width:50px">
                                            <col style="width:270px">                                            
                                            <col>
                                            <col style="width:80px">
                                            <col style="width:80px">
                                            <col style="width:80px">
                                            <col style="width:100px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray">NO</th>
                                                <th class="bg-gray">결재종류</th>
                                                <th class="bg-gray">결재제목</th>
                                                <th class="bg-gray">결재의뢰</th>
                                                <th class="bg-gray">결재의뢰일</th>
                                                <th class="bg-gray">결재일</th>
                                                <th class="bg-gray">결재상태</th>                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${approveList}" var="item" varStatus="i">
                                            <tr>
                                                <td>${item.idx}</td>
                                                <td class="align-left" style="padding-left: 10px;">${item.aprovalTypeNm}</td>
                                                <td class="align-left" style="padding-left: 10px;"><a href="javascript: onclick_reportName('${item.aprovalCode}')">${item.aprovalSubject}</a></td>
                                                <td>${item.userNm}</td>
                                                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${item.draftingDate}" /></td>
                                                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${item.aprovalDate}" /></td>
                                                <td>${item.aprovalStateNm}</td>                                                
                                            </tr>
                                        </c:forEach>
                                          
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">
                                <ui:pagination paginationInfo="${approveSearchVO}" type="defDefault" jsFunction="cfnPageLink" />
                            </div>
                        </div>

      
    <script type="text/javascript">
    
    $(document).ready(init);
    
	function init(){
		$("#defaultForm input").off("keyup").on("keyup", function(e){
		    if(e.keyCode===13 && this.value.trim().length>0){
		    	onclick_search();
		    }
		});
	}
    
    function onclick_search(){
		$("#defaultForm")[0].submit();
	}
    
    function onchange_recordCountPerPage(vCount){
    	$("#currentPageNo").val("1");
		$("#recordCountPerPage").val(vCount);
		onclick_search();// 검색 '조회'버튼 클릭
	}
    
    function onclick_reportName(aprovalCode){
    	location.href="/apprv/apprForm.do?menuKey=${menuKey}&aprovalCode="+aprovalCode;
	}
    
 // 현재 페이지 정보 저장
    history.pushState(null,null,location.href);
    
    // input / textarea 제외 키보드 뒤로가기 방지
    $(document).keydown(function(e){
    	if(e.keyCode === 8 && e.target.nodeName != 'INPUT' && e.target.nodeName != "TEXTAREA"){
    		return false;
    	}
    });
    
    // 브라우저 뒤로가기 버튼 방지
    window.onpopstate = function(event){
    	history.go(1);
    };
    
    
    </script>
</body>
</html>