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
                                        <form:form commandName="searchVO" id="defaultForm" name="defaultForm"  action="MgrList.do" method="get" modelAttribute="searchVO">
	                                        ${searchVO.superHiddenTag}
	                                        <form:hidden path="kudIdx"/>
                                        
                                            <div class="search-form">
                                                <div class="form-inline form-input">
                                                    <label>연도</label>
                                                    <jsp:useBean id="now" class="java.util.Date" />
													<c:set var="yearStart" value="2023"/>
										            <fmt:formatDate value="${now}" pattern="yyyy" var="yearNow"/>
										            <form:select path="searchYear" class="limit">
													<c:forEach begin="${yearStart}" end="${yearNow}" var="result" step="1">
														<option value="<c:out value="${result}" />" <c:if test="${(result) == searchVO.searchYear}"> selected="selected"</c:if>><c:out value="${result}" /></option>
													</c:forEach>
													</form:select>
                                                </div>
                                                <div class="form-inline form-select">
                                                    <label>조직</label>                                            
                                                    <form:input type="hidden" path="searchDepart"/>
                                                    <form:input type="text" path="searchDepartName" readonly="true" />
                                                    <button type="button" class="btn-org btn-search-dept">검색</button>
                                                </div>
                                                <div class="form-inline form-select">
                                                    <label>인증현황</label>
                                                    <form:select path="searchBelt">
                                                        <form:option value="">전체</form:option>
														<form:option value="D000">GB</form:option>
														<form:option value="D001">BB</form:option>
														<form:option value="D002">MBB</form:option>
														<form:option value="D003">MGB</form:option>
														<form:option value="7">No Belt</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="form-inline form-select">
                                                    <label>구분</label>
                                                    <form:select path="searchIdx">
                                                        <form:option value="">전체</form:option>
                                                        <form:option value="1">사번</form:option>
                                                        <form:option value="2">이름</form:option>
                                                        <form:option value="3">부문</form:option>
                                                        <form:option value="4">소속명</form:option>
                                                        <form:option value="5">팀명</form:option>
                                                        <form:option value="6">직무명</form:option>
                                                    </form:select>                                                    
                                                </div>
                                                <div class="form-inline form-select">
                                                    <form:input type="text" path="searchText" />
                                                </div>
                                                <button type="button" class="btn-submit" onclick="onclick_search()">조회</button>
                                            </div>
                                        </form:form>
                                        </div>

                                        <div class="list-header">
                                        <p class="title">
                                        <c:choose>
											<c:when test="${makeVO.kudIdx eq 'MBB'}">
												${searchVO.searchYear}년 팀장 MBB 관리 대상
											</c:when>
											<c:otherwise>
												${searchVO.searchYear}년 6σ 인재 관리 대상
											</c:otherwise>
										</c:choose>   
                                        </p>
                                        <span class="bar"></span>
                                        <p class="total">총  ${totalCount}명</p>
                                        <select name="limit" class="limit" onchange="onchange_recordCountPerPage(this.value)">
                                            <option value="10" <c:if test="${searchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
		                                    <option value="50" <c:if test="${searchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
		                                    <option value="100" <c:if test="${searchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
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
                                                        <col style="width:90px">
                                                        <col>
                                                        <col style="width:120px">
                                                        <col>
                                                        <col style="width:80px">
                                                        <col style="width:50px">
                                                        <col style="width:70px">
                                                        <col style="width:50px">
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th class="bg-gray font-weight-bold">NO</th>
                                                            <th class="bg-gray font-weight-bold">사번</th>
                                                            <th class="bg-gray font-weight-bold">이름</th>
                                                            <th class="bg-gray font-weight-bold">근무지명</th>
                                                            <th class="bg-gray font-weight-bold">부문</th>
                                                            <th class="bg-gray font-weight-bold">팀명</th>
                                                            <th class="bg-gray font-weight-bold">소속명</th>                                                            
                                                            <th class="bg-gray font-weight-bold">직무명</th>
                                                            <th class="bg-gray font-weight-bold">직위</th>
                                                            <th class="bg-gray font-weight-bold">직책</th>
                                                            <th class="bg-gray font-weight-bold">인증현황</th>
                                                        </tr>                                            
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="item" items="${mgrList}" varStatus="status">
                            			                 <tr id="tr_${item.comNo}" param='${item}'>
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
                                                            <td>${item.kudTeamName}</td>
                                                            <td>${item.kudBelongName}</td>
                                                            <td>${item.kudJimu}</td>
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
                                                <button type="button" class="btn bg-gray" onclick="onclick_mgrSelectLink()">                                        
                                                    <span>대상선정</span>
                                                </button>     
                                                <button type="button" class="btn-excel" onclick="onclick_excelDownload()">
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
                                        <td><span id="comNo"></span></td>
                                        <th>이름</th>
                                        <td><span id="kudUserName"></span></td>                                        
                                    </tr>
                                
                                    <tr>
                                        <th>근무지명</th>
                                        <td><span id="kudPlace"></span></td>
                                        <th>부문</th>
                                        <td><span id="kudPart"></span></td>                                        
                                    </tr>
                                    <tr>
                                        <th>소속명</th>
                                        <td><span id="kudBelongName"></span></td>
                                        <th>팀명</th>
                                        <td><span id="kudTeamName"></span></td>                                        
                                    </tr>
                                    <tr>
                                        <th>직위</th>
                                        <td><span id="kudJobx"></span></td>
                                        <th>직책</th>
                                        <td><span id="kudPosition"></span></td>                                        
                                    </tr>
                                    <tr>
                                        <th>신분유형</th>
                                        <td><span id="kudUserIdentity"></span></td>
                                        <th>입사일</th>
                                        <td><span id="kudJoinDate"></span></td>                                        
                                    </tr>
                                    <tr>
                                        <th>직무명</th>
                                        <td><span id="kudJimu"></span></td>
                                        <th>최종학력</th>
                                        <td><span id="kudLastDegree"></span></td>                                        
                                    </tr>
                                    <tr>
                                        <th>인증현황</th>
                                        <td colspan="3"><span id="kudCertBelt"></span><!-- GB(2020.02.10) MGB(비대상), BB(2021.02.10) --></td>                                        
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
		
		// common.js 이벤트 비활성
		$(".tab-group > .tab-btn > button").off("click");
		
		initFooterDeptPopup();
	}
	
	function initFooterDeptPopup(){
		$('#objDeptTree').jstree({
	    	"core": {
	    	      "data": objDeptTreeData	// controller에서 데이터 바인딩.
	    	    },
	        "plugins" : ['checkbox','search'],
	        "search" : {
	            "show_only_matches" : true,
            	"show_only_matches_children" : true,
    		},
	    })
	    .on("check_node.jstree uncheck_node.jstree", function (e, data) {

	        if (e.type == "uncheck_node") {
	        	debugger;
	            $("#orgSelAllDept").prop( "checked", false );                
	        }
		    else if (e.type == "check_node") {
		    	debugger;
	            if ($(this).jstree().get_json('#', {flat:true}).length === $(this).jstree().get_checked(true).length)
	                $("#orgSelAllDept").prop( "checked", true ); 					
	        }
	    });
	}
	
	// 조직 조회 호출부
	function callPopup_searchDepartment(obj){

		popMDept.init();
		popMDept.returnObjId = "searchDepart";
		popMDept.returnFunc = callback_popDept;
		popMDept.open();
	}
	
	function onchange_recordCountPerPage(vCount){
		$("#recordCountPerPage").val(vCount);
		onclick_search();// 검색 '조회'버튼 클릭
	}
	
	// 조직 조회 콜백부
	function callback_popDept(objId, data){
		
		$("#"+objId).val(data.deptCodes);
		$("#searchDepartName").val(data.deptNames);
	}

	function onclick_userid(comNo){
		$(".modal-custom, .userinfo").show();
		item = JSON.parse($("#tr_"+comNo).attr("param"));
		$("#comNo").text(item.comNo);
		$("#kudUserName").text(item.kudUserName);
		$("#kudPlace").text(item.kudPlace);
		$("#kudPart").text(item.kudPart);
		$("#kudBelongName").text(item.kudBelongName);
		$("#kudTeamName").text(item.kudTeamName);
		$("#kudJobx").text(item.kudJobx);
		$("#kudPosition").text(item.kudPosition);
		$("#kudUserIdentity").text(item.kudUserIdentity);
		$("#kudJoinDate").text(item.kudJoinDate);
		$("#kudJimu").text(item.kudJimu);
		$("#kudLastDegree").text(item.kudLastDegree);
		$("#kudCertBelt").text(item.kudCertBelt);
	}
	
	function onclick_tab(idx){
		location.replace("/kpi/MgrList.do?menuKey=${menuKey}&kudIdx="+idx)
	}
	
	function onclick_search(){
		$("#defaultForm").attr("action", "MgrList.do");
		$("#defaultForm")[0].submit();
	}
	
	function onclick_excelDownload(){
		$("#defaultForm").attr("action", "excelBuild.do");
		$("#defaultForm")[0].submit();
	}
	
	function onclick_mgrSelectLink(){
		if('${makeVO.kudIdx}'==='MBB'){
			location.href='./MgrSelect.do?menuKey=${menuKey}&kudIdx=MBB';
		} else {
			location.href='./MgrSelect.do?menuKey=${menuKey}&kudIdx=6SIG';
		}
			
	}
	
	const objDeptTreeData = ${deptFullList};
	
</script>


</body>
</html>