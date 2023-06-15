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
    <style>
   		.num-align { text-align: right !important; padding: 10px !important;}
   	</style>
</head>
<body>
<form:form commandName="reportSearchVO" id="defaultForm" method="get" action="ReportList.do" >
	<input type="hidden" name="menuKey" value="${menuKey}" />
                        <div class="list-wrap">
                            <div class="list-search">
                                <div class="search-form row">
                                    <div class="form-inline form-input col s5">
                                        <div class="col s5 align-right">
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
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>조직</label>
                                        </div>
                                        <div class="pd-l10 form-inline form-input col s8">
                                            <input type="text" name="">
                                            <button type="button" class="btn-org">검색</button>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s5 align-right">
                                            <label>사업장</label>
                                        </div>
                                        <div class="pd-l10 col s7">
                                            <form:select path="searchPlaceCode" cssClass="w-90p">
                                            </form:select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s5">
                                        <div class="col s5 align-right">
                                            <label>6σ Full Process 여부</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                            <form:select path="searchDivision" cssClass="w-90p">
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>과제유형</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                             <form:select path="searchType" cssClass="w-90p">
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s5 align-right">
                                            <label>과제리더벨트</label>
                                        </div>
                                        <div class="pd-l10 col s7">
                                            <form:select path="searchLeaderBeltCode" cssClass="w-90p">
                                            </form:select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s5">
                                        <div class="col s5 align-right">
                                            <label>활동분야</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                           <form:select path="searchActionTypeCode" cssClass="w-90p">
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>진행현황</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <form:select path="searchStatus" cssClass="w-90p">
                                            </form:select>
                                        </div>
                                    </div>
                                    
                                    <div class="col s4 align-right">
                                        
                                        <button type="button" class="btn-submit" onclick="onclick_search()">조회</button>
                                    </div>
                                </div>
                            </div>
</form:form>
                            <div class="list-header">
                                <p class="title">검색결과(Report)</p>                                
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="centered odd">
                                        <caption></caption>
                                            <colgroup>
                                                <col style="width:30px">
                                                <col style="width:60px">
                                                <col>
                                                <col>
                                                <col>
                                            </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray font-weight-bold" rowspan="2" colspan="2">구분</th>
                                                <th class="bg-gray font-weight-bold" rowspan="2">년내 Total</th>
                                                <th class="font-weight-bold" colspan="5">활동 실적(년내)</th>
                                                <th class="font-weight-bold" colspan="5">활동 실적(년간)</th>                                                
                                            </tr>      
                                            <tr>
                                                <th>품질개선</th>
                                                <th>개발</th>
                                                <th>생산성향상</th>
                                                <th>원가개선</th>
                                                <th>기타</th>
                                                <th>품질개선</th>
                                                <th>개발</th>
                                                <th>생산성향상</th>
                                                <th>원가개선</th>
                                                <th>기타</th>
                                            </tr>
                                        </thead>
<!-- c.code_nm as repResultType
	       , nvl(s.iny_total, 0) inyTotal
	       , nvl(s.iny_act_1, 0) inyAct1
	       , nvl(s.iny_act_2, 0) inyAct2
	       , nvl(s.iny_act_3, 0) inyAct3
	       , nvl(s.iny_act_4, 0) inyAct4
	       , nvl(s.iny_act_5, 0) inyAct5
	       , nvl(s.y_total, 0) yTotal
	       , nvl(s.y_act_1, 0) yAct1
	       , nvl(s.y_act_2, 0) yAct2
	       , nvl(s.y_act_3, 0) yAct3
	       , nvl(s.y_act_4, 0) yAct4
	       , nvl(s.y_act_5, 0) yAct5 -->                                        
                                        <tbody>
                                        <c:forEach items="${reportList}" var="item" varStatus="i">
                                            <tr class="bg-white">
                                                <th class="bg-gray font-weight-bold" colspan="2">${item.represulttype}</th>
                                                <th class="bg-gray font-weight-bold num-align"><fmt:formatNumber value="${item.inyTotal}" pattern="#,###" /></th>
                                                <td class="num-align"><fmt:formatNumber value="${item.inyAct1}" pattern="#,###" /></td>
                                                <td class="num-align"><fmt:formatNumber value="${item.inyAct2}" pattern="#,###" /></td>
                                                <td class="num-align"><fmt:formatNumber value="${item.inyAct3}" pattern="#,###" /></td>
                                                <td class="num-align"><fmt:formatNumber value="${item.inyAct4}" pattern="#,###" /></td>
                                                <td class="num-align"><fmt:formatNumber value="${item.inyAct5}" pattern="#,###" /></td>
                                                <td class="num-align"><fmt:formatNumber value="${item.yAct1}" pattern="#,###" /></td>
                                                <td class="num-align"><fmt:formatNumber value="${item.yAct2}" pattern="#,###" /></td>
                                                <td class="num-align"><fmt:formatNumber value="${item.yAct3}" pattern="#,###" /></td>
                                                <td class="num-align"><fmt:formatNumber value="${item.yAct4}" pattern="#,###" /></td>
                                                <td class="num-align"><fmt:formatNumber value="${item.yAct5}" pattern="#,###" /></td>                                              
                                            </tr>
                                        </c:forEach>
                                            <!-- <tr>
                                                <th class="bg-gray font-weight-bold" rowspan="3">예상효과</th>
                                                <th class="bg-gray font-weight-bold" >외부실패</th>
                                                <td class="bg-gray font-weight-bold">22.2</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                                <td>7.7</td>
                                            </tr>
                                            <tr class="bg-white">
                                                <th class="bg-gray font-weight-bold">내부실패</th>
                                                <td class="bg-gray font-weight-bold">-</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                            </tr>
                                            <tr>
                                                <th class="bg-gray font-weight-bold">영업이익</th>
                                                <td class="bg-gray font-weight-bold">-</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                                <td>10</td>
                                            </tr>
                                            <tr class="bg-white">
                                                <th class="bg-gray font-weight-bold" colspan="2">매출액</th>
                                                <th class="bg-gray font-weight-bold">80.4</th>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                                <td>37.1</td>
                                            </tr> -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">                               
                                <div class="list-btns">
                                    <button type="button" class="btn-excel" id="btnExcel">
                                        <img src="/assets/images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>
                                </div>

                            </div>
                        </div>
                    
<%--         <!-- 조직도 -->
        <div class="modal-dimmed"></div>
        <div class="org-modal">
            <div class="modal-header">
                <h4>조직조회</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="list-wrap">
                    <div class="list-search">
                        <form id="org-form" onsubmit="org_search();return false;">
                            <div class="search-form">
                                <div class="form-inline form-input">
                                    <label>조직명</label>
                                    <input type="text" name="">
                                </div>
                                <button type="submit" class="btn-submit">조회</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="tree-header">
                    <div>
                        <input type="checkbox" id="orgSelAll">
                        <label for="orgSelAll"></label>
                    </div>
                    <div>
                        6σ 인재육성대상 조직명
                    </div>
                </div>
                <div id="org-tree">
                    <ul>
                        <li>창호 사업부
                            <ul>
                                <li>창호.생산담당
                                    <ul>
                                        <li>· 창호.프로파일생산팀</li>
                                        <li>· 창호.기술팀</li>
                                        <li>· 창호.공정혁신팀</li>
                                        <li>· 창호.완성창공정기술팀</li>
                                    </ul>
                                </li>
                                <li>유리</li>
                                <li>연구소 근무</li>
                                <li>창호.시스템창사업담당</li>
                                <li>창호.중문팀</li>
                                <li>바닥재 사업담당	</li>
                            </ul>
                        </li>
                        <li>단열재 사업담당
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>벽지 사업담당	
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>표면소재 사업담당
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>산업용필름 사업담당
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>자동차소재부품 사업부
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>인테리어 사업부
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>연구소
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>품질 담당
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>생산/기술/R&D/품질 外
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="btns">
                    <button type="button" class="btn-submit">확인</button>
                    <button type="button" class="btn-cancel">취소</button>
                </div>
            </div>
        </div> --%>
        <script>        
        let cdListSector = []; //[{key:1,value:'창호'},{key:2,value:'바닥재'},{key:3,value:'단열재'},{key:4,value:'벽지'},{key:5,value:'표면소재'},{key:6,value:'산업용필름'},{key:7,value:'자동차소재부품'},{key:8,value:'인테리어'},{key:9,value:'연구소'},{key:10,value:'품질'},{key:11,value:'생산기술(제조혁신)'},{key:12,value:'환경안전'},{key:13,value:'기타'}];
    	let cdLeaderBelt = [];
    	let cdActionType = [];
    	let cdMbbUseRate = [];
    	let cdRepResultType = [];
    	let cdRepType1 = [];
    	let cdRepType2 = [];
    	let cdRepType3 = [];
    	let cdWPlace = [];
    	let cdRepStatus = [];
    	let cd6SigYn = []; 
    	
    	let codes = [
    		<c:forEach var="item" items="${allCodes}">{index:"${item.codeGrpId}",key:"${item.codeId}",value:"${item.codeNm}"},
    		</c:forEach>
    	];
    	
    	let vMenuType = "${repMenuCode}";
    	
    	$(document).ready(init);
    	
    	function init(){
    		
    		// 코드 데이터 초기화
    		initCode();
    		
    		// 컨트롤 세팅
    		setControl();
    	}
    	
    	function initCode(){
    		/**
    		6SIG_YN - 6σ Full Process 여부
			RP_TY1~3 - 과제유형
			LDRBELT - 과제리더벨트
			ACTTYPE - 활동분야
			WPLACE - 사업장
			REP_STAT - 과제현황
    		****/
    		cd6SigYn = codes.filter(function(code){ return code.index==="6SIG_YN"; });
    		cdLeaderBelt = codes.filter(function(code){ return code.index==="LDRBELT"; });
    		cdActionType = codes.filter(function(code){ return code.index==="ACTTYPE"; });
    		if(vMenuType==="REPORT"){
    			cdRepType1 = codes.filter(function(code){ return code.index==="RP_TY1";});
    		} else {
    			cdRepType1 = codes.filter(function(code){ return code.index==="RP_TY1" && code.value==="DMAIC";});  // 분임조에서는 DMAIC만 적용(화면설계서)	
    		}
    		cdRepType2 = codes.filter(function(code){ return code.index==="RP_TY2";});
    		cdRepType3 = codes.filter(function(code){ return code.index==="RP_TY3";});
    		cdWPlace =  codes.filter(function(code){ return code.index==="WPLACE";});
    		cdRepStatus =  codes.filter(function(code){ return code.index==="REP_STAT";});
    		
    	}
    	
    	function setControl(){
    		
    		
    		setDropDown("searchPlaceCode", cdWPlace, true, "전체");//사업장
    		$("#searchPlaceCode").val("${searchVO.searchPlaceCode}");
    		
    		setDropDown("searchDivision", cd6SigYn, true, "전체");//6시그마 여부
    		$("#searchDivision").val("${searchVO.searchDivision}");
    		
    		setDropDown("searchType", cdLeaderBelt, true, "전체");//과제유형
    		$("#searchType").val("${searchVO.searchType}");
    		
    		setDropDown("searchLeaderBeltCode", cdLeaderBelt, true, "전체");//과제리더벨트
    		$("#searchLeaderBeltCode").val("${searchVO.searchLeaderBeltCode}");
    		
    		setDropDown("searchActionTypeCode", cdActionType, true, "전체");//활동분야
    		$("#searchActionTypeCode").val("${searchVO.searchActionTypeCode}");
    		
    		setDropDown("searchStatus", cdRepStatus, true, "전체");//활동분야
    		$("#searchStatus").val("${searchVO.searchStatus}");
    		
    		$("#searchDivision").off("change").on("change", onchange_ddlRepDevisionCode); // 6σ Full Process여부
    		onchange_ddlRepDevisionCode();
    		$("#searchType").val("${searchVO.searchType}");
    		
    		// 브라우저 자동완성 취소
    		$("input[type=text], input[type=number]").attr("autocomplete", "off");
    		
    		$("#btnExcel").off("click").on("click", function(){
    			
    			$('#defaultForm').attr("action","reportSummary.do");
    			$('#defaultForm')[0].submit();
    		});		
    		
    	}
    	
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
			setDropDown(targetObjId, arrRepType, true, '전체');
		}
    	
    	function onclick_search(){
    		$('#defaultForm').attr("action","ReportList.do");
    		$("#defaultForm")[0].submit();
    	}
    	
        </script>

</body>
</html>