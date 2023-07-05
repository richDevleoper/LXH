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
	<c:when test="${searchVO.kudIdx eq 'MBB'}">
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
                                <button type="button" class="${cssOn1}" onclick="onclick_tab('6SIG')">6σ인재 육성계획</button>
                                <button type="button" class="${cssOn2}" onclick="onclick_tab('MBB')">MBB 활용율 계획</button>
                            </div>
                            <div class="tab-inr">
                                <div class="tab-box ${cssOn1}">
                                    <div class="list-wrap">
			<form:form commandName="searchVO" id="defaultForm" name="defaultForm"  action="${action}" method="get" modelAttribute="searchVO">
				${searchVO.superHiddenTag}
				<form:hidden path="kudIdx"/>
				<input type="hidden" name="update_fields" id="updateFields">                                    
                                        <div class="list-header mg-t20">
			                                        
                                            <p class="title">대상연도 선택</p>
                                            <jsp:useBean id="now" class="java.util.Date" />
											<c:set var="yearStart" value="2023"/>
								            <fmt:formatDate value="${now}" pattern="yyyy" var="yearNow"/>
								            <form:select path="searchYear" class="limit">
											<c:forEach begin="${yearStart}" end="${yearNow}" var="result" step="1">
												<option value="<c:out value="${result}" />" <c:if test="${(result) == searchVO.searchYear}"> selected="selected"</c:if>><c:out value="${result}" /></option>
											</c:forEach>
											</form:select>                                         
                                        </div>
			</form:form>                                           
                                        <!-- tabulator-->
                                        <div class="list-wrap">
                                            <div class="list-content">
                                                <div id="example-table" class="list-table list tabulator point-type"></div>
                                            </div>
                                        </div>
                                        <!-- //tabulator-->
                                        <div class="list-footer">
                                            <div class="list-btns center">
                                                <button type="button" class="btn bg-gray" id="btnSave">계획저장</button>
                                                <button type="button" class="btn-excel">
                                                    <img src="/assets/images/icon_excel.png" alt="">
                                                    <span>다운로드</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-box ${cssOn2}">
                                    <div class="list-wrap">
 			<form:form commandName="searchVO" id="defaultForm" name="defaultForm"  action="${action}" method="get" modelAttribute="searchVO">
				${searchVO.superHiddenTag}
				<form:hidden path="kudIdx"/>
				<input type="hidden" name="update_fields" id="updateFields">                                    
                                        <div class="list-header mg-t20">
			                                        
                                            <p class="title">대상연도 선택</p>
								            <fmt:formatDate value="${now}" pattern="yyyy" var="yearNow"/>
								            <form:select path="searchYear" class="limit">
											<c:forEach begin="${yearStart}" end="${yearNow}" var="result" step="1">
												<option value="<c:out value="${result}" />" <c:if test="${(result) == searchVO.searchYear}"> selected="selected"</c:if>><c:out value="${result}" /></option>
											</c:forEach>
											</form:select>                                         
                                        </div>
			</form:form>        
                                        
                                        <div class="list-wrap">
                                            <div class="list-content">
                                                <div id="example-table2" class="list-table list tabulator point-type"></div>
                                            </div>
                                        </div>
                                        
                                        <div class="list-footer">
                                            <div class="list-btns center">
                                                <button type="button" class="btn bg-gray" id="btnSave2">계획저장</button>
                                                <button type="button" class="btn-excel">
                                                    <img src="/assets/images/icon_excel.png" alt="">
                                                    <span>다운로드</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

    <fmt:formatDate value="${now}" pattern="yy년 M월 d일" var="yearNowString"/>
    <script>
        //custom input
		var customInput = function(cell, onRendered, success, cancel){
			//cell - the cell component for the editable cell
			//onRendered - function to call when the editor has been rendered
			//success - function to call to pass thesuccessfully updated value to Tabulator
			//cancel - function to call to abort the edit and return to a normal cell
			//create and style input
			var cellValue = cell.getValue();

			//create and style input
			inputDiv = document.createElement("div");
			inputDiv.classList.add("row");
			inputList = document.createElement("input");
			inputList.setAttribute("type", "text");

			inputDiv.innerHTML = '<div class="input_text col s12"></div>';
			inputDiv.children[0].append(inputList);

			inputList.style.width = "100%";

			input = inputList;

			onRendered(function(){
				input.focus();
				input.style.height = "32px";
			});

			function onChange(){
				if(input.value != cellValue && input.value != ''){
					success(input.value);

					console.log(input.value+ "/" + cellValue);
				}else{
					cancel(cellValue);
				}
			}

			//submit new value on blur or change
			input.addEventListener("blur", onChange);

			//submit new value on enter
			input.addEventListener("keydown", function(e){
				if(e.keyCode == 13){
					onChange();
				}

				if(e.keyCode == 27){
					cancel();
				}
			});

			return inputDiv;
		};

        
        var tableDataNested = ${tableData};
        var kudIdx = "${searchVO.kudIdx}";
		
      
		
		$(document).ready(init);
		function init(){
			
			setTable();
			setTable2();
			setEvent();
		}
		
		function setTable(){
			
			var table = new Tabulator("#example-table", {
				data:tableDataNested,
				dataTree:true,
				dataTreeStartExpanded:true,
	            columnHeaderVertAlign:"middle", //align header contents to bottom of cell
				columns:[
	                { title:"대상구분", field:"name",headerSort:false, width:250, frozen: true },
	                { //create column group
	                    title:"‘${fn:substring(searchVO.searchYear-1,2,4)}년(직전년도)",field:"name2",
	                    columns:[
	                        {
	                            title:"GB",field:"GB1",
	                            columns:[
	                                {title:"인원", field:"GB1_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"GB1_2",headerSort:false, width:40},
	                            ],
	                        },
	                        {
	                            title:"BB",field:"BB1",
	                            columns:[
	                                {title:"인원", field:"BB1_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"BB1_2",headerSort:false, width:40},
	                            ],
	                            
	                        },
	                        {
	                            title:"MBB",field:"MBB1",
	                            columns:[
	                                {title:"인원", field:"MBB1_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"MBB1_2",headerSort:false, width:40},
	                            ],
	                        },
	                        {
	                            title:"BB이상",field:"BB이상1",
	                            columns:[
	                                {title:"인원", field:"BB이상1_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"BB이상1_2",headerSort:false, width:40},
	                            ],
	                        }
	                    ],
	                },
	                {//create column group
	                    title:"‘${fn:substring(searchVO.searchYear,2,4)}년 육성 계획",field:"name3",
	                    columns:[
	                        {
	                            title:"GB",field:"GB2",
	                            columns:[
	                                {title:"인원", field:"GB2_1",headerSort:false, width:40,formatter: gridCellFormatter},
	                                {title:"율(%)", field:"GB2_2",headerSort:false, width:40},
	                            ],
	                        },
	                        {
	                            title:"BB",field:"BB2",
	                            columns:[
	                                {title:"인원", field:"BB2_1",headerSort:false, width:40,formatter: gridCellFormatter},
	                                {title:"율(%)", field:"BB2_2",headerSort:false, width:40},
	                            ],
	                            
	                        },
	                        {
	                            title:"MBB",field:"MBB2",
	                            columns:[
	                                {title:"인원", field:"MBB2_1",headerSort:false, width:40,formatter: gridCellFormatter},
	                                {title:"율(%)", field:"MBB2_2",headerSort:false, width:40},
	                            ],
	                        },
	                        {
	                            title:"BB이상",field:"BB이상2",
	                            columns:[
	                                {title:"인원", field:"BB이상2_1",headerSort:false, width:40,formatter: gridCellFormatter},
	                                {title:"율(%)", field:"BB이상2_2",headerSort:false, width:40},
	                            ],
	                        }
	                    ],
	                },
	                {//create column group
	                    title:"<span class='color primary'>‘${yearNowString} 기준</span>",field:"name4",
	                    columns:[
	                        {
	                            title:"GB",field:"GB3",
	                            columns:[
	                                {title:"인원", field:"GB3_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"GB3_2",headerSort:false, width:40},
	                            ],
	                        },
	                        {
	                            title:"BB",field:"BB3",
	                            columns:[
	                                {title:"인원", field:"BB3_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"BB3_2",headerSort:false, width:40},
	                            ],
	                            
	                        },
	                        {
	                            title:"MBB",field:"MBB3",
	                            columns:[
	                                {title:"인원", field:"MBB3_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"MBB3_2",headerSort:false, width:40},
	                            ],
	                        },
	                        {
	                            title:"BB이상",field:"BB이상3",
	                            columns:[
	                                {title:"인원", field:"BB이상3_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"BB이상3_2",headerSort:false, width:40},
	                            ],
	                        }
	                    ],
	                },
	                {title:"대상인원", field:"name5",headerSort:false, width:60},
	            ],
			});
		}
		
		function setTable2(){
			/* var tableDataNested2 = [
	            {DEPT_NAME:"생산/기술/R&D/품질",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55"},
				{DEPT_NAME:"창호 사업부",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55",
	                _children:[
	                    {DEPT_NAME:"창호 사업부",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55",
	                    _children:[
	                        {DEPT_NAME:"창호 사업부",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55"}
	                    ]}
	                ]
	            },
	            {DEPT_NAME:"창호.생산담당",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55",
	                _children:[
	                    {DEPT_NAME:"창호.프로파일생산팀",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55"},
	                    {DEPT_NAME:"창호.기술팀",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55"},
	                    {DEPT_NAME:"창호.공정혁신팀",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55"},
	                    {DEPT_NAME:"창호.완성창공정기술팀",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55"},
	                ]
	            },
	            {DEPT_NAME:"창호 사업부",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55",
	                _children:[
	                    {DEPT_NAME:"창호 사업부",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55",
	                    _children:[
	                        {DEPT_NAME:"창호 사업부",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55"}
	                    ]}
	                ]
	            },
	            {DEPT_NAME:"생산/기술/R&D/품질 外",MBB_23:"47",MBB_CNT:"26",MBB_RATE:"15",ST_DIRECT:"11",ST_DIRECT_RMK:"-",ST_SUPORT:"26",ST_SUPORT_RMK:"-",ST_TMBB:"26",ST_TMBB_RMK:"-",ACT_CNT:"26",ACT_RATE:"55",YPLAN_CNT:"26",YPLAN_RATE:"+55"},
			]; */

			var table2 = new Tabulator("#example-table2", {
				data: tableDataNested,
				dataTree:true,
				dataTreeStartExpanded:true,
	            columnHeaderVertAlign:"middle", //align header contents to bottom of cell
	            columnHeaderStyles: {
	              fontSize: "smaller"
	            },
				columns:[
	                {title:"대상구분", field:"DEPT_NAME",headerSort:false, width:220, frozen: true},
	                {title:"‘${fn:substring(searchVO.searchYear,2,4)}MBB 인원", field:"MBB_23",headerSort:false},
	                {//create column group
	                    title:"‘${fn:substring(searchVO.searchYear,2,4)}년 육성",field:"name3",
	                    columns:[
	                        {title:"인원", field:"MBB_CNT",headerSort:false, width:40,formatter: gridCellFormatter},
	                        {title:"율(%)", field:"MBB_RATE",headerSort:false, width:40},
	                    ],
	                },
	                {//create column group
	                    title:"활동 현황",field:"name4",
	                    columns:[
	                        {title:"직접 수행",field:"ST_DIRECT",headerSort:false, width:80},
	                        {title:"비고(직접수행)",field:"ST_DIRECT_RMK",headerSort:false, width:100},
	                        {title:"지원MBB",field:"ST_SUPORT",headerSort:false, width:80},
	                        {title:"비고(지원MBB활동)",field:"ST_SUPORT_RMK",headerSort:false, width:130},
	                        {title:"팀장MBB",field:"ST_TMBB",headerSort:false, width:80},
	                        {title:"비고(팀장MBB활동)",field:"ST_TMBB_RMK",headerSort:false, width:130}
	                    ],
	                },
	                {//create column group
	                    title:"활동인원(계)",field:"name5",
	                    columns:[
	                    {title:"인원(명)", field:"ACT_CNT",headerSort:false, width:60},
	                        {title:"활용율(%)", field:"ACT_RATE",headerSort:false, width:80},
	                    ],
	                },
	                {//create column group
	                    title:"계획대비(연간)",field:"name6",
	                    columns:[
	                    {title:"인원(명)", field:"YPLAN_CNT",headerSort:false, width:60},
	                        {title:"활용율(%)", field:"YPLAN_RATE",headerSort:false, width:80},
	                    ],
	                }
	            ],
			});
		}
		
		function gridCellFormatter(cell){
        	
        	let fieldCol = cell.getColumn().getDefinition().field;
        	let rowId = cell.getRow().getData().id
            const value = cell.getValue();
            return '<input type="text" id="'+ fieldCol +'__'+rowId+'" name="'+ fieldCol +'__'+rowId+'" value="'+value+'" class="align-right" onchange="onchange_gridInput(\''+ fieldCol +'__'+rowId+'\');">';
        }

		function onchange_gridInput(objId){
			dataStg = $("#"+objId);
			dataStg.addClass("grid-text-box");
		}
			
		function setEvent(){
			
			// common.js 이벤트 비활성
			$(".tab-group > .tab-btn > button").off("click");
			
			$("#btnSave").off("click").on("click", onclick_btnSave);
			$("#btnSave2").off("click").on("click", onclick_btnSave);
			
		}
		
		function onclick_tab(idx){
			location.replace("/kpi/MgrPlan.do?menuKey=${menuKey}&kudIdx="+idx)
		}
		
		function onclick_btnSave(e){
			debugger;
			let arrTextObj = $("input.grid-text-box");
			if(arrTextObj.length>0){
				let arrTextVal = {};
				for(let i=0; i<arrTextObj.length; i++){
					let tmp = arrTextObj[i];
					arrTextVal[tmp.id] = tmp.value;
				}
				arrTextVal["km_year"] = $("#searchYear").val();
				
				let params = arrTextVal;
				
				$.ajax({
					url:'/kpi/procPlanSave.do',
					type: 'POST',
					data: params,
					dataType : 'json',
					success:function(data){
						//console.log("return", data);
						alert("저장되었습니다.");
						location.reload();
					}
				});
			} else {
				alert("입력/수정된 내용이 없습니다.");
			}
		}
	</script>
</body>
</html>