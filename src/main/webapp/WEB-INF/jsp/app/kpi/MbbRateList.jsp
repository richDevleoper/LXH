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
			<form:form commandName="searchVO" id="defaultForm" name="defaultForm"  action="${action}" method="get" modelAttribute="searchVO">
				${searchVO.superHiddenTag}
				<div class="search-form">
					<div class="form-inline form-input">
						<label>조회연도</label> 
						<jsp:useBean id="now" class="java.util.Date" />
						<c:set var="yearStart" value="2023"/>
			            <fmt:formatDate value="${now}" pattern="yyyy" var="yearNow"/>
			            <form:select path="searchYear" class="limit">
						<c:forEach begin="${yearStart}" end="${yearNow}" var="result" step="1">
							<option value="<c:out value="${result}" />" <c:if test="${(result) == searchVO.searchYear}"> selected="selected"</c:if>><c:out value="${result}" /></option>
						</c:forEach>
						</form:select>
					</div>
					<div class="form-inline form-input">
						<label>조회월 </label>
						<form:select path="searchMonth" class="limit">
						<c:forEach begin="1" end="12" var="result" step="1">
							<form:option value="${result}">${result}월</form:option>
						</c:forEach>
						</form:select>
					</div>
					<div class="form-inline form-input">
						<label>조직</label>
						<form:input type="hidden" path="searchDepart"/>
                        <form:input type="text" path="searchDepartName" readonly="true" />
                        <button type="button" class="btn-org btn-search-dept">검색</button>
					</div>
					<div class="form-inline form-input">
						<label>사업장</label>
						<form:select path="searchWorkPlace" style="width: 120px">
							<form:option value="">전체</form:option>
						<c:forEach var="item" items="${code_wplace}" varStatus="status">
			                 <form:option value="${item.codeId}">${item.codeNm}</form:option>
                        </c:forEach>  
						</form:select>
					</div>
					<button type="button" class="btn-submit" onclick="onclick_search()">조회</button>
				</div>
			</form:form>
         </div>
                            <!-- tabulator-->
                            <div class="list-wrap">
                                <div class="list-content">
                                    <div id="example-table" class="list-table list tabulator point-type"></div>
                                </div>
                            </div>
                            <!-- //tabulator-->
                            <div class="list-footer">
                                <div class="list-btns">
                                    <button type="button" class="btn-excel">
                                        <img src="/assets/images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    
      
    <script>
		var tableDataNested = [
            {id: 101, name:"생산/기술/R&D/품질",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"},
			{id: 102, name:"창호 사업부",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55",
                _children:[
                    {id: 103, name:"창호 사업부",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55",
                    _children:[
                        {name:"창호 사업부",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"}
                    ]}
                ]
            },
            {id: 104, name:"창호.생산담당",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55",
                _children:[
                    {id: 105, name:"창호.프로파일생산팀",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"},
                    {id: 106, name:"창호.기술팀",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"},
                    {id: 107, name:"창호.공정혁신팀",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"},
                    {id: 108, name:"창호.완성창공정기술팀",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"},
                ]
            },
            {id: 109, name:"창호 사업부",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55",
                _children:[
                    {name:"창호 사업부",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55",
                    _children:[
                        {name:"창호 사업부",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"}
                    ]}
                ]
            },
            {id: 110, name:"생산/기술/R&D/품질 外",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"},
		];

		$(document).ready(init);
		function init(){
			
			var table = new Tabulator("#example-table", {
				data:tableDataNested,
				dataTree:true,
				dataTreeStartExpanded:true,
	            columnHeaderVertAlign:"middle", //align header contents to bottom of cell
				columns:[
	                {title:"대상구분", field:"name",headerSort:false, width:160, cssClass: "link-cell", cellClick:onclickCell, frozen: true},
	                {title:"‘${fn:substring(searchVO.searchYear,2,4)}MBB 인원", field:"name2",headerSort:false},
	                {//create column group
	                    title:"‘${fn:substring(searchVO.searchYear,2,4)}년 계획",field:"name3",
	                    columns:[
	                        {title:"인원", field:"data3_1",headerSort:false, width:40},
	                        {title:"율(%)", field:"data3_2",headerSort:false, width:40},
	                    ],
	                },
	                {//create column group
	                    title:"활동 현황",field:"name4",
	                    columns:[
	                        {title:"직접 수행",field:"data4_1",headerSort:false, width:80},
	                        {title:"비고(직접수행)",field:"data4_2",headerSort:false, width:100},
	                        {title:"지원MBB",field:"data4_3",headerSort:false, width:80},
	                        {title:"비고(지원MBB활동)",field:"data4_4",headerSort:false, width:130},
	                        {title:"팀장MBB",field:"data4_5",headerSort:false, width:80},
	                        {title:"비고(팀장MBB활동)",field:"data4_6",headerSort:false, width:130}
	                    ],
	                },
	                {//create column group
	                    title:"활동인원(계)",field:"name5",
	                    columns:[
	                    {title:"인원(명)", field:"data5_1",headerSort:false, width:60},
	                        {title:"활용율(%)", field:"data5_2",headerSort:false, width:80},
	                    ],
	                },
	                {//create column group
	                    title:"계획대비(연간)",field:"name6",
	                    columns:[
	                    {title:"인원(명)", field:"data6_1",headerSort:false, width:60},
	                        {title:"활용율(%)", field:"data6_2",headerSort:false, width:80},
	                    ],
	                }
	            ],
			});
			
			// 부서검색
			$(".btn-search-dept").off("click").on("click", function(){
				callPopup_searchDepartment(this);
			});
			
			//부서검색 팝업 트리 초기화
			initFooterDeptPopup();
		}
		
		function onclickCell(e, cell){
			location.href="MbbRateView.do?idx="+cell.getColumn().getDefinition().field+"&seq="+cell.getRow().getData().id+"&menuKey=${menuKey}";
			//alert( cell.getRow().getData().id);
			console.log(cell.getColumn().getDefinition().field, cell.getRow().getData().id);
		}
		
		// 조직 조회 호출부
		function callPopup_searchDepartment(obj){

			popMDept.init();
			// footer.jsp 내 영역 호출
			popMDept.returnObjId = "searchDepart";
			popMDept.returnFunc = callback_popDept;
			popMDept.open();
		}
		
		// 조직 조회 콜백부
		function callback_popDept(objId, data){
			$("#"+objId).val(data.deptCodes);
			$("#searchDepartName").val(data.deptNames);
		}
		
		
		// 부서검색 팝업 트리 데이터
		let objDeptTreeData = ${deptFullList};
		
		//부서검색 팝업 트리 초기화
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
	</script>
	<style>
	.link-cell { text-decoration: underline; cursor: pointer; }
	</style>
</body>
</html>