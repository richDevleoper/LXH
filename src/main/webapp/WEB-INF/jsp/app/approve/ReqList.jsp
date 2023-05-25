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
                            <div class="list-search">
                            <form:form commandName="approveSearchVO" id="defaultForm" method="get" action="ReqList.do" >
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
                                            <form:select path="searchGubun" cssClass="w-90p">
                                            	<option value="drafting_date" <c:if test="${approveSearchVO.searchGubun eq 'drafting_date'}">selected="selected"</c:if>>결재의뢰일</option>
                                            	<option value="aproval_date" <c:if test="${approveSearchVO.searchGubun eq 'aproval_date'}">selected="selected"</c:if>>결재일</option>
                                            </form:select>                                        
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="pd-l10 col s12">
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
                                <p class="title">나의 결재의뢰함</p>
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
                                            <col style="width:100px">
                                            <col style="width:100px">
                                            <col style="width:120px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray">NO</th>
                                                <th class="bg-gray">결재종류</th>
                                                <th class="bg-gray">결재제목</th>
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
                                                <td class="align-left" style="padding-left: 10px;"><a href="javascript: onclick_approval('${item.aprovalCode}')">${item.aprovalSubject}</a></td>
                                                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${item.draftingDate}" /></td>
                                                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${item.aprovalDate}" /></td>
                                                <td>${item.aprovalStateNm}</td>                                                
                                            </tr>
                                        </c:forEach>
                                          <!-- 
                                            <tr>
                                                <td>10</td>
                                                <td class="align-left">과제 > 6σ Full Process > DMEDI > Define</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 자르기 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>승인</td>                                                
                                            </tr>
                                            <tr>
                                                <td>9</td>
                                                <td class="align-left">분임조과제 > 6σ Full Process > DMEDI > Define</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>반려</td>                                                
                                            </tr>
                                            <tr>
                                                <td>8</td>
                                                <td class="align-left">과제 > 일반과제</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 자르기 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>승인</td>                                                
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td class="align-left">과제 > 10+ No Policy</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>반려</td>                                                
                                            </tr>

                                            <tr>
                                                <td>6</td>
                                                <td class="align-left">과제 > 6σ Full Process > DMEDI > Define</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 자르기 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>승인(1차 70점)</td>                                                
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td class="align-left">실시제안</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>반려</td>                                                
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td class="align-left">쪽지제안</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 자르기 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>승인</td>                                                
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td class="align-left">과제 > 과제선정</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>승인</td>                                                
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td class="align-left">과제 > Drop신청</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 자르기 ...</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>미결</td>                                                
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td class="align-left">분임조과제 > 6σ Full Process > DMAIC > 담계명</td>
                                                <td class="align-left">과제제목 또는 분임조과제, 제안제목 내용이 많음 ...</td>
                                                <td>2023.06.30</td>
                                                <td>2023.06.30</td>
                                                <td>승인</td>                                                
                                            </tr> -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">
                                <ui:pagination paginationInfo="${approveSearchVO}" type="defDefault" jsFunction="cfnPageLink" />
                            </div>
                        </div>
                    
        <script>
        
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
    		$("#recordCountPerPage").val(vCount);
    		onclick_search();// 검색 '조회'버튼 클릭
    	}
        
        function onclick_approval(code){
        	
        	location.href="/apprv/viewApprv.do?menuKey=${menuKey}&aprovalCode="+code;
    	}
        </script>

</body>
</html>