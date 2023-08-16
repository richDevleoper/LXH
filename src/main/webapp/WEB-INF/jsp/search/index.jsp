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
                        	<form:form commandName="reportSearchVO" id="defaultForm" method="get" action="./" >
                                ${reportSearchVO.superHiddenTag}
                                <span>전체</span>
                                <form:input path="searchRepName" placeholder="검색어를 입력하세요" />
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
                                <button type="button" class="on" param="1">과제검색</button>
                                <button type="button" param="2">분임조활동검색</button>
                                <button type="button" param="3">제안검색</button>
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
                                        <p class="total">총 <fmt:formatNumber value="${reportSearchVO.totalRecordCount}" pattern="#,###"/>건</p>
                                        <select name="limit" class="limit"  onchange="onchange_recordCountPerPage(this.value)">
	                                        <option value="10" <c:if test="${reportSearchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
		                                    <option value="50" <c:if test="${reportSearchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
		                                    <option value="100" <c:if test="${reportSearchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
	                                    </select>
                                    </div>
                                    <section class="new_list" style="width: 100% !important;">
                                        <div class="inr">
                                        
                                            <ul>
<c:forEach items="${reportList}" var="item" varStatus="i">
                                            <li class="border">
                                                <div>
                                                    <ul>
                                                        <li class="title <c:if test="${item.repStatusCode eq '5'}">gray</c:if>">
                                                            <span>${item.repStatus}</span>
                                                        </li>
                                                        <li>
                                                            <span>${item.repDivision}</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <p class="list">
                                                    <a href="/report/SearchView.do?menuKey=30&repCode=${item.repCode}" title="${item.repName}">과제명 : ${item.repName}</a>
                                                    <span>활동Process(소) : ${item.repType}
                                                    , 활동분야 : ${item.repActionType}
                                                    , MBB활용율 : ${item.repMbbUseRate}
                                                    , 부문 : ${item.repSector}
                                                    , 사업장 : ${item.repPlace}
                                                    , 과제리더 : ${item.repTeamLeaderName}
                                                    , 팀원 : ${item.repTeamMemberName}
<c:if test="${item.repTeamProcessOwnerName eq ''}">                                       
                                                    , Process Owner : ${item.repTeamProcessOwnerName}
</c:if>                                             
                                                    , 챔피언 : ${item.repTeamChapionName}
                                                    , 착수(예정)일 : <fmt:formatDate pattern="yyyy.MM.dd" value="${item.repStartDate}" />
                                                    , 완료(예정)일 : <fmt:formatDate pattern="yyyy.MM.dd" value="${item.repFinishDate}" />
                                                    <%-- <c:out value="${item}"/> --%>
                                                    </span>
                                                </p>
                                            </li>
</c:forEach>                                            
                                            
                                            <!-- 
                                                <li class="border">
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
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
                                                    <div>
                                                        <ul>
                                                            <li class="title gray">
                                                                <span>Drop</span>
                                                            </li>
                                                            <li>
                                                                <span>6σ Full Process</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <p class="list">
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
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
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
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
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
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
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
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
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
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
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
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
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
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
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                <li class="border">
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
                                                        <a href="" title="바로가기">과제명 : 예시) 23년 신제품 싸움닭 초기 유동관리를 통한 품질 안정화 과제</a>
                                                        <span>활동Process(소) : DMAIC, 활동분야 : 품질개선, 활동유형 : MBB, 부문 : 창호, 사업장 : 청주공장, 과제리더 : 홍길동, 팀원 : 홍길동, 이길동, Process Owner : 홍길동, 챔피언 : 홍길동, 착수(예정)일 : 2023.01.01, 완료(예정)일 : 2023.06.30</span>
                                                    </p>
                                                </li>
                                                -->
                                            </ul>
                                        
                                        </div>
                                    </section>
                                    <div class="list-footer">
                                    	<ui:pagination paginationInfo="${reportSearchVO}" type="defDefault" jsFunction="cfnPageLink" />
                                        <!-- <div class="pagination">
                                            <a href="" class="first">처음</a>
                                            <a href="" class="prev">이전</a>
                                            <a href="" class="cur num">1</a>
                                            <a href="" class="num">2</a>
                                            <a href="" class="num">3</a>
                                            <a href="" class="num">4</a>
                                            <a href="" class="num">5</a>
                                            <a href="" class="next">다음</a>
                                            <a href="" class="last">끝</a>
                                        </div> -->
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
		
	$("#defaultForm").attr("action", "./"+strAction);
	onclick_search();
}
</script>
</body>
</html>