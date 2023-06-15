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

<c:choose>
	<c:when test="${makeVO.kudIdx eq 'MBB'}">
		<c:set var="cssOn1" value=""></c:set>
		<c:set var="cssOn2" value="on"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="cssOn1" value="on"></c:set>
		<c:set var="cssOn2" value=""></c:set>
	</c:otherwise>
</c:choose>   

                        <div class="tab-group">
							<div class="tab-btn">
								<button type="button" class="${cssOn1}" onclick="onclick_tab('6SIG')">6σ 인재 관리 대상</button>
								<button type="button" class="${cssOn2}" onclick="onclick_tab('MBB')">팀장MBB 관리 대상</button>
							</div>                        
                            
                            <div class="tab-inr">
                                <div class="tab-box on">
                                    <div class="tab-group underline-type">
                                        <div class="list-wrap">
                                        <div class="list-search">
                                        <form:form commandName="searchVO" id="defaultForm" name="defaultForm"  action="MgrList.do" onsubmit="return false" method="get" modelAttribute="searchVO">
                                        ${searchVO.superHiddenTag}
                                        <form:hidden path="kudIdx"/>
                                            <div class="search-form">
                                                <div class="form-inline form-input">
                                                    <label>연도</label>
                                                    <select name="searchYear">
                                                        <option value="">2023년</option>
                                                    </select>
                                                </div>
                                                <div class="form-inline form-select">
                                                    <label>조직</label>                                            
                                                    <form:input type="hidden" path="searchDepart"/>
                                                    <form:input type="text" path="searchDepartName" disabled="true" />
                                                    <button type="button" class="btn-org btn-search-dept">검색</button>
                                                </div>
                                                <div class="form-inline form-select">
                                                    <label>인증현황</label>
                                                    <select name="searchBelt">
                                                        <option value="">전체</option>
                                                    </select>
                                                </div>
                                                <div class="form-inline form-select">
                                                    <label>구분</label>
                                                    <select name="searchIdx">
                                                        <option value="">전체</option>
                                                        <option value="">사번</option>
                                                        <option value="">이름</option>
                                                        <option value="">부문</option>
                                                        <option value="">소속명</option>
                                                        <option value="">팀명</option>
                                                        <option value="">직무명</option>
                                                    </select>                                                    
                                                </div>
                                                <div class="form-inline form-select">
                                                    <input type="text" name="searchText">
                                                </div>
                                                <button type="button" class="btn-submit" onclick="onclick_search()">조회</button>
                                            </div>
                                        </form:form>
                                        </div>

                                        <div class="list-header">
                                        <p class="title">2023년 6σ 인재 관리 대상</p>
                                        <span class="bar"></span>
                                        <p class="total">총 305</p>
                                        <select name="limit" class="limit">
                                            <option value="10">10개</option>
                                            <option value="50">50개</option>
                                            <option value="100">100개</option>
                                        </select>
                                        </div>
                                        <div class="list-content">
                                            <div class="list-table">
                                                <table class="even">
                                                    <caption></caption>
                                                    <colgroup>
                                                        <col style="width:40px">
                                                        <col style="width:70px">
                                                        <col style="width:70px">                                                        
                                                        <col style="width:70px">
                                                        <col>
                                                        <col>
                                                        <col>
                                                        <col>
                                                        <col style="width:50px">
                                                        <col style="width:50px">
                                                        <col style="width:50px">
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th class="bg-gray font-weight-bold">NO</th>
                                                            <th class="bg-gray font-weight-bold">사번</th>
                                                            <th class="bg-gray font-weight-bold">이름</th>
                                                            <th class="bg-gray font-weight-bold">근무지명</th>
                                                            <th class="bg-gray font-weight-bold">부문</th>
                                                            <th class="bg-gray font-weight-bold">소속명</th>
                                                            <th class="bg-gray font-weight-bold">팀명</th>
                                                            <th class="bg-gray font-weight-bold">직무명</th>
                                                            <th class="bg-gray font-weight-bold">직위</th>
                                                            <th class="bg-gray font-weight-bold">직책</th>
                                                            <th class="bg-gray font-weight-bold">인증현황</th>
                                                        </tr>                                            
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="item" items="${mgrList}" varStatus="status">
                            			                 <tr id="tr_${item.comNo}" >                                                            
                                                            <td>${item.idx}</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="javascript:onclick_userid('${item.comNo}')" title="바로가기" class="btn-org">${item.comNo}</a></li>                                                                
                                                                    </ul>
                                                                </div>                                                                   
                                                            <td>${item.kudUserName}</td>
                                                            <td>${item.kudPlace}</td>
                                                            <td>${item.kudPart}</td>
                                                            <td>${item.kudBelongName}</td>
                                                            <td>${item.kudTeamName}</td>
                                                            <td></td>
                                                            <td>${item.kudJobx}</td>
                                                            <td>${item.kudPosition}</td>
                                                            <td>${item.kudCertBelt}</td>
                                                        </tr>
                                                    </c:forEach>       
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="list-footer">
                                        	
                                            <ui:pagination paginationInfo="${searchVO}" type="defDefault" jsFunction="cfnPageLink" />
                                            <div class="list-btns">
                                                <button type="button" class="btn bg-gray" onclick="location.href='./MgrSelect.do?menuKey=${menuKey}';">                                        
                                                    <span>대상선정</span>
                                                </button>     
                                                <button type="button" class="btn-excel">
                                                    <img src="/assets/images/icon_excel.png" alt="">
                                                    <span>다운로드</span>
                                                </button>                               
                                            </div>

                                        </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-box on"></div>
                                <div class="tab-box on"></div>
                            </div>
                        </div>
                    
        <!-- 상세정보 팝업 -->
        <div class="modal-dimmed modal-custom"></div>
        <div class="org-modal userinfo">
            <div class="modal-header">
                <h4>상세정보</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="list-wrap">
                    <div class="list-content">
                        <div class="list-table list">
                            <table class="centered">
                                
                                <caption></caption>
                                <colgroup>
                                    <col style="width:100px">
                                    <col>
                                    <col style="width:100px">
                                    <col>                                    
                                </colgroup>
                                
                                <tbody>
                                    <tr>
                                        <th>사번</th>
                                        <td>사번1</td>
                                        <th>이름</th>
                                        <td>이름1</td>                                        
                                    </tr>
                                
                                    <tr>
                                        <th>근무지명</th>
                                        <td>근무지명1</td>
                                        <th>부문</th>
                                        <td>부문1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>소속명</th>
                                        <td>소속명1</td>
                                        <th>팀명</th>
                                        <td>팀명1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>직위</th>
                                        <td>직위1</td>
                                        <th>직책</th>
                                        <td>직책1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>신분유형</th>
                                        <td>신분유형1</td>
                                        <th>입사일</th>
                                        <td>입사일1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>직무명</th>
                                        <td>직무명1</td>
                                        <th>최종학력</th>
                                        <td>최종학력1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>인증형황</th>
                                        <td colspan="3">GB(2020.02.10) MGB(비대상), BB(2021.02.10)</td>                                        
                                    </tr>                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>                
            </div>
        </div> 


<script type="text/javascript">

	$(document).ready(init);
	function init(){
		setEvent();
	}
	
	function setEvent(){
		
		// 부서검색
		$(".btn-search-dept").off("click").on("click", function(){
			callPopup_searchDepartment(this);
		});
	}
	
	// 조직 조회 호출부
	function callPopup_searchDepartment(obj){

		popDept.init();
		// footer.jsp 내 영역 호출
		popDept.returnObjId = "searchDepart";
		popDept.returnFunc = callback_popDept;
		popDept.open();
	}
	
	// 조직 조회 콜백부
	function callback_popDept(objId, data){
		
		$("#"+objId).val(data.deptCode);
		$("#searchDepartName").val(data.deptName);
	}

	function onclick_userid(comNo){
		$(".modal-custom, .userinfo").show();
	}
	
	function onclick_tab(idx){
		location.replace("/kpi/MgrList.do?menuKey=${menuKey}&kudIdx="+idx)
	}
	
	function onclick_search(){
		$("#defaultForm").attr("action", "MgrList.do");
		$("#defaultForm")[0].submit();
	}
</script>


</body>
</html>