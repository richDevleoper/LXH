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
                            <form:form commandName="reportSearchVO" id="defaultForm" method="get" action="Search.do" >
                            	${reportSearchVO.superHiddenTag}
                            	<div class="search-form row">
                                    <div class="form-inline form-input col s8">
                                        <div class="col s2 align-right">
                                            <label>과제명(키워드)</label>
                                        </div>
                                        <div class="pd-l10 col s10">
                                            <form:input type="text" path="searchRepName" />
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s5 align-right">
                                            <label>6o Full Process여부</label>
                                        </div>
                                        <div class="pd-l10 col s7">
                                            <form:select path="searchDivision">
                                                <option value="">전체</option>
                                                <c:forEach var="item" items="${searchDivision}">
													<option value="${item.codeId}" <c:if test="${item.codeId eq reportSearchVO.searchDivision }">selected="selected"</c:if>>${item.codeNm}</option>
												</c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s8">
                                        <div class="col s2 align-right">
                                            <label>과제참여자</label>
                                        </div>
                                        <div class="pd-l10 col s2">
                                            <form:select path="searchTeamMemberType" title="부문을 선택하세요." cssClass="validate[required]">
                                            </form:select>
                                        </div>
                                        <div class="pd-l10 col s3">
                                            <form:input type="text" path="searchTeamMemberName" />
                                        </div>
                                        <div class="col s2 align-right">
                                            <label>부문</label>
                                        </div>
                                        <div class="pd-l10 col s3">
                                            <form:select path="searchSectorCode" title="부문을 선택하세요." cssClass="validate[required]">
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s5 align-right">
                                            <label>과제유형</label>
                                        </div>
                                        <div class="pd-l10 col s7">
                                            <form:select path="searchType" cssClass="w-90p">
                                                <option value="">전체</option>
                                            </form:select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s8">
                                        <div class="col s2 align-right">
                                            <label>사업장</label>
                                        </div>
                                        <div class="pd-l10 col s5">
                                            <form:select path="searchPlaceCode">
                                                <option value="">전체</option>
                                            </form:select>
                                        </div>
                                        <div class="col s2 align-right">
                                            <label>활동분야</label>
                                        </div>
                                        <div class="pd-l10 col s3">
                                            <form:select path="searchActionTypeCode">
                                                <option value="">전체</option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s5 align-right">
                                            <label>과제리더벨트</label>
                                        </div>
                                        <div class="pd-l10 col s7">
                                            <form:select path="searchLeaderBeltCode">
                                                <option value="">전체</option>
                                            </form:select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s10">
                                        <div class="col s2 align-right">
                                            <label>진행구분</label>
                                        </div>
                                        <div class="pd-l10 col s5">
                                            <form:select path="searchStatus">
                                                <option value="">전체</option>
                                            </form:select>
                                        </div>
                                        <div class="col s2 align-right">
                                            <label>조회기간</label>
                                        </div>
                                        <div class="pd-l10 col s6">
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
                                    <div class="col s2 align-right">
                                        <button type="button" class="btn-submit" onclick="onclick_search()">조회</button>
                                    </div>
                                </div>
                            </form:form>
                            </div>
                            <div class="new_group">
                                <div class="list-header mg-t20">
                                    <p class="title">
<c:forEach items="${countList}" var="item" varStatus="i">
<c:if test="${i.index ne 0}">, </c:if>
${item.repDivision} ${item.cnt}건
</c:forEach>
                                    </p>
                                    <span class="bar"></span>
                                    <p class="total">총 ${totalCount}건</p>
                                    <select name="limit" class="limit"  onchange="onchange_recordCountPerPage(this.value)">
                                        <option value="10" <c:if test="${reportSearchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
                                    <option value="50" <c:if test="${reportSearchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
                                    <option value="100" <c:if test="${reportSearchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
                                    </select>
                                </div>
                                <div class="new_list">
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
                                                    <a href="./SearchView.do?menuKey=${menuKey}&repCode=${item.repCode}" title="${item.repName}">과제명 : ${item.repName}</a>
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
<c:if test="${fn:length(reportList) eq 0}">
<li style="height: 80px; width:100%; text-align:center; margin: auto; line-height: 7em;">
검색결과가 없습니다.
</li>
</c:if>

                                            <!-- <li class="border">
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
                                            </li> -->
                                        </ul>
                                    </div>
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
                                        <div class="list-btns">
                                            <button type="button" class="btn-excel" id="btnExcel">
                                                <img src="/assets/images/icon_excel.png" alt="">
                                                <span>다운로드</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
<script type="text/javascript">
	
	let cdListSector = []; //[{key:1,value:'창호'},{key:2,value:'바닥재'},{key:3,value:'단열재'},{key:4,value:'벽지'},{key:5,value:'표면소재'},{key:6,value:'산업용필름'},{key:7,value:'자동차소재부품'},{key:8,value:'인테리어'},{key:9,value:'연구소'},{key:10,value:'품질'},{key:11,value:'생산기술(제조혁신)'},{key:12,value:'환경안전'},{key:13,value:'기타'}];
	let cdLeaderBelt = []; // = [{key:1,value:'GB'},{key:2,value:'BB'},{key:3,value:'BB후보'},{key:4,value:'MBB'},{key:5,value:'MBB후보'},{key:6,value:'MGB'},{key:7,value:'No Belt'}];
	let cdActionType = []; // = [{key:1,value:'품질개선'},{key:2,value:'개발'},{key:3,value:'생산성향상'},{key:4,value:'원가개선'},{key:5,value:'기타'}];
	let cdMbbUseRate = []; // = [{key:1,value:'해당없음'},{key:2,value:'직접수행'},{key:3,value:'지원MBB'},{key:4,value:'팀장MBB '}];
	let cdRepResultType = []; // = [{key:1,value:'외부실패비용'},{key:2,value:'내부실패비용'},{key:3,value:'매출액'},{key:4,value:'제조원가'},{key:5,value:'상품원가'},{key:6,value:'기타 영업이익'},{key:7,value:'해당없음 '}];
	let cdWPlace = []; // 사업장
	
	let codes = [
		<c:forEach var="item" items="${allCodes}">{index:"${item.codeGrpId}",key:"${item.codeId}",value:"${item.codeNm}"},
		</c:forEach>
	];
	
	
	
</script>
<script type="text/javascript">

	const vMenuType = "${repMenuCode}";
	$(document).ready(init);
	
	function init(){
		
		
		initCode();
		
		setControl();
		
		$("#defaultForm input").off("keyup").on("keyup", function(e){
			
		    if(e.keyCode===13 && this.value.trim().length>0){
		    	onclick_search();
		    }
		});
		
		$("#searchDivision").off("change").on("change", onchange_ddlRepDevisionCode); // 6σ Full Process여부
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
			arrRepType = cdRepType2;
			break;
		case "3": // 10+No.
			arrRepType = cdRepType3;
			break;
		default:
			arrRepType = [];
			break;
		}
		
		
		if(vMenuType==="TEAM" && repDevCd==="2"){
			setDropDown(targetObjId, [], true, '(해당없음)');
		} else {
			setDropDown(targetObjId, arrRepType, true, '전체');
		}
		
		
	}
	
	function initCode(){
		cdListSector = codes.filter(function(code){ return code.index==="SECTOR"; });
		cdLeaderBelt = codes.filter(function(code){ return code.index==="LDRBELT"; });
		cdActionType = codes.filter(function(code){ return code.index==="ACTTYPE"; });
		cdMbbUseRate = codes.filter(function(code){ return code.index==="MBBUSERT"; });
		cdRepResultType = codes.filter(function(code){ return code.index==="RESULTTY";});
		if(vMenuType==="REPORT"){
			cdRepType1 = codes.filter(function(code){ return code.index==="RP_TY1";});
		} else {
			cdRepType1 = codes.filter(function(code){ return code.index==="RP_TY1" && code.value==="DMAIC";});  // 분임조에서는 DMAIC만 적용(화면설계서)	
		}
		cdRepType2 = codes.filter(function(code){ return code.index==="RP_TY2";});
		cdRepType3 = codes.filter(function(code){ return code.index==="RP_TY3";});
		cdWPlace = codes.filter(function(code){ return code.index==="WPLACE";});
		cdRepStatus = codes.filter(function(code){ return code.index==="REP_STAT";});
		cdRepRole = codes.filter(function(code){ return code.index==="REP_ROLE";});
	}
	
	function setControl(){
		
		
		
		setDropDown("searchSectorCode", cdListSector, true, "전체");//부문코드
		$("#searchSectorCode").val("${reportSearchVO.searchSectorCode}");
		
		setDropDown("searchPlaceCode", cdWPlace, true, "전체");//부문코드
		$("#searchPlaceCode").val("${reportSearchVO.searchPlaceCode}")
		
		setDropDown("searchActionTypeCode", cdActionType, true, "전체");//활동분야
		$("#searchActionTypeCode").val("${reportSearchVO.searchActionTypeCode}");
		
		setDropDown("searchLeaderBeltCode", cdLeaderBelt, true, "전체");//리더벨트
		$("#searchLeaderBeltCode").val("${reportSearchVO.searchLeaderBeltCode}")
		
		setDropDown("searchStatus", cdRepStatus, true, "전체");//부문코드
		$("#searchStatus").val("${reportSearchVO.searchStatus}")
		
		setDropDown("searchTeamMemberType", cdRepRole, true, "전체");//부문코드
		$("#searchTeamMemberType").val("${reportSearchVO.searchTeamMemberType}")
		
		
		
		onchange_ddlRepDevisionCode();	// 과제유형
		$("#searchType").val("${reportSearchVO.searchType}");
		
		$("#btnExcel").off("click").on("click", function(){
			
			$('#defaultForm').attr("action","reportExcelbuild.do");
			$('#defaultForm')[0].submit();
		});		
	}
	
	function onclick_search(){
		$('#defaultForm').attr("action","Search.do");
		$("#defaultForm")[0].submit();
	}
	
	function onchange_recordCountPerPage(vCount){
		$("#currentPageNo").val("1");
		$("#recordCountPerPage").val(vCount);
		onclick_search();// 검색 '조회'버튼 클릭
	}
	
</script>
                   
</body>
</html>