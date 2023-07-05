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
<script type="text/javascript" src="/assets/js/xlsx.full.min.js"></script>

<script type="text/javascript">
	
	$(function() {
		
		if ($("#defaultForm").validationEngine) {
			$("#defaultForm").validationEngine('attach', {
				unbindEngine : false,
				customFunctions : {
				//	
				},
				onValidationComplete : function(form, status) {
					if (status == true) {
						return true;
					}
					return false;
				}
			});
		}

		//달력
		if ($('.datepicker').datepicker) {
			$('.datepicker').datepicker({
				showOn : "both",
				dateFormat : "yy-mm-dd",
				changeYear : true,
				changeMonth : true,
				buttonImage : "/def/img/article/btn_calender.gif",
				buttonImageOnly : true,
				showButtonPanel : true,
				closeText : "닫기",
				onClose : function() {/**/
				}
			}).next('img').css('vertical-align', 'middle').css('margin-left',
					'5px');
		}
	});

	//검색
	function searchList() {
		$('#currentPageNo').val('1');
		$("#defaultForm").submit();
	}
	//추가
	function insertForm() {
		$("#defaultForm").attr('action', 'insertForm.do');
		$("#defaultForm").submit();
	}
	//조회
	function view(key) {
		$("#defaultForm").attr('action', 'view.do');
		$("#articleKey").attr('value', key);
		$("#defaultForm").submit();
	}
</script>
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
				<button type="button" class="btn-excel" onclick="onclick_excelDownload()">
					<img src="/assets/images/icon_excel.png" alt=""> <span>다운로드</span>
				</button>
			</div>
		</div>
	</div>


	<!-- //container -->
	<!-- 조직도 -->
	<div class="modal-dimmed"></div>
	<div class="org-modal">
		<div class="modal-header">
			<h4>직책조회</h4>
			<button type="button" class="btn-close">닫기</button>
		</div>
		<div class="modal-content">
			<div class="list-wrap">
				<div class="list-search">
					<form id="org-form" onsubmit="org_search();return false;">
						<div class="search-form">
							<div class="form-inline form-input">
								<label>직책명</label> <input type="text" name="">
							</div>
							<button type="submit" class="btn-submit">조회</button>
						</div>
					</form>
				</div>
			</div>
			<div class="tree-header">
				<div>
					<input type="checkbox" id="orgSelAll"> <label
						for="orgSelAll"></label>
				</div>
				<div>직책선택</div>
			</div>
			<div id="org-tree">
				<ul>
					<li>사업부장</li>
					<li>담당</li>
					<li>팀장</li>
					<li>책임</li>
					<li>선임</li>
					<li>사원1</li>
					<li>사원2</li>
					<li>사원3</li>
					<li>사원4</li>
					<li>사원5</li>
					<li>사원6</li>
					<li>사원7</li>
					<li>사원8</li>
					<li>사원9</li>
					<li>사원10</li>
					<li>사원11</li>
				</ul>
			</div>
			<div class="btns">
				<button type="button" class="btn-submit">확인</button>
				<button type="button" class="btn-cancel">취소</button>
			</div>
		</div>
	</div>

	<fmt:formatDate value="${now}" pattern="yy년 M월 d일" var="yearNowString"/>
	<script>
		var tableDataNested = ${tableData};

		if (Tabulator) {
			var table = new Tabulator("#example-table", {
				data : tableDataNested,
				dataTree : true,
				dataTreeStartExpanded : true,
				
				columnHeaderVertAlign : "middle", //align header contents to bottom of cell
				columns : [ {
					title : "대상구분",
					field : "name",
					headerSort : false,
					width : 300,
					frozen: true
				}, {//create column group
					title : "‘${fn:substring(searchVO.searchYear-1,2,4)}년(직전년도)",
					field : "name2",
					columns : [ {
						title : "GB",
						field : "GB1",
						columns : [ {
							title : "인원",
							field : "GB1_1",
							headerSort : false,
							width : 40,
							hozAlign : 'right',
							cssClass : "font-small",
							hozAlign : 'right',
							cssClass : "font-small",
							cellClick : onclickCell
						}, {
							title : "율(%)",
							field : "GB1_2",
							headerSort : false,
							width : 40
						}, ],
					}, {
						title : "BB",
						field : "BB1",
						columns : [ {
							title : "인원",
							field : "BB1_1",
							headerSort : false,
							width : 40,
							hozAlign : 'right',
							cssClass : "font-small",
							cellClick : onclickCell
						}, {
							title : "율(%)",
							field : "BB1_2",
							headerSort : false,
							width : 40
						}, ],

					}, {
						title : "MBB",
						field : "MBB1",
						columns : [ {
							title : "인원",
							field : "MBB1_1",
							headerSort : false,
							width : 40,
							hozAlign : 'right',
							cssClass : "font-small",
							cellClick : onclickCell
						}, {
							title : "율(%)",
							field : "MBB1_2",
							headerSort : false,
							width : 40
						}, ],
					}, {
						title : "BB이상",
						field : "BB이상1",
						columns : [ {
							title : "인원",
							field : "BB이상1_1",
							headerSort : false,
							width : 40,
							hozAlign : 'right',
							cssClass : "font-small",
							cellClick : onclickCell
						}, {
							title : "율(%)",
							field : "BB이상1_2",
							headerSort : false,
							width : 40
						}, ],
					} ],
				}, {//create column group
					title : "‘${fn:substring(searchVO.searchYear,2,4)}년 육성 계획",
					field : "name3",
					columns : [ {
						title : "GB",
						field : "GB2",
						columns : [ {
							title : "인원",
							field : "GB2_1",
							headerSort : false,
							width : 40,
							hozAlign : 'right',
							cssClass : "font-small",
							cellClick : onclickCell
						}, {
							title : "율(%)",
							field : "GB2_2",
							headerSort : false,
							width : 40
						}, ],
					}, {
						title : "BB",
						field : "BB2",
						columns : [ {
							title : "인원",
							field : "BB2_1",
							headerSort : false,
							width : 40,
							hozAlign : 'right',
							cssClass : "font-small",
							cellClick : onclickCell
						}, {
							title : "율(%)",
							field : "BB2_2",
							headerSort : false,
							width : 40
						}, ],

					}, {
						title : "MBB",
						field : "MBB2",
						columns : [ {
							title : "인원",
							field : "MBB2_1",
							headerSort : false,
							width : 40,
							hozAlign : 'right',
							cssClass : "font-small",
							cellClick : onclickCell
						}, {
							title : "율(%)",
							field : "MBB2_2",
							headerSort : false,
							width : 40
						}, ],
					}, {
						title : "BB이상",
						field : "BB이상2",
						columns : [ {
							title : "인원",
							field : "BB이상2_1",
							headerSort : false,
							width : 40,
							hozAlign : 'right',
							cssClass : "font-small",
							cellClick : onclickCell
						}, {
							title : "율(%)",
							field : "BB이상2_2",
							headerSort : false,
							width : 40
						}, ],
					} ],
				}, {//create column group
					title : "<span class='color primary'>‘${yearNowString} 기준</span>",
					field : "name4",
					columns : [ {
						title : "GB",
						field : "GB3",
						columns : [ {
							title : "인원",
							field : "GB3_1",
							headerSort : false,
							width : 40,
							hozAlign : 'right',
							cssClass : "font-small",
							cellClick : onclickCell,
							tooltip : true
						}, {
							title : "율(%)",
							field : "GB3_2",
							headerSort : false,
							width : 40
						}, ],
					}, {
						title : "BB",
						field : "BB3",
						columns : [ {
							title : "인원",
							field : "BB3_1",
							headerSort : false,
							width : 40,
							hozAlign : 'right',
							cssClass : "font-small",
							cellClick : onclickCell
						}, {
							title : "율(%)",
							field : "BB3_2",
							headerSort : false,
							width : 40
						}, ],

					}, {
						title : "MBB",
						field : "MBB3",
						columns : [ {
							title : "인원",
							field : "MBB3_1",
							headerSort : false,
							width : 40,
							hozAlign : 'right',
							cssClass : "font-small",
							cellClick : onclickCell
						}, {
							title : "율(%)",
							field : "MBB3_2",
							headerSort : false,
							width : 40
						}, ],
					}, {
						title : "BB이상",
						field : "BB이상3",
						columns : [ {
							title : "인원",
							field : "BB이상3_1",
							headerSort : false,
							width : 40,
							hozAlign : 'right',
							cssClass : "font-small",
							cellClick : onclickCell
						}, {
							title : "율(%)",
							field : "BB이상3_2",
							headerSort : false,
							width : 40
						}, ],
					} ],
				}, {
					title : "대상인원",
					field : "name5",
					headerSort : false,
					width : 60
				}, ],
			});
		}
		
		

		function onclickCell(e, cell) {
			location.href = "statusView.do?idx="
					+ cell.getColumn().getDefinition().field + "&seq="
					+ cell.getRow().getData().id + "&menuKey=${menuKey}";
			//alert(cell.getColumn().getDefinition().field +", "+ cell.getRow().getData().id);
			console.log(cell.getColumn().getDefinition().field, cell.getRow()
					.getData().id);
		}

		$(document).ready(init);
		function init(){
			setEvent();
		}
		
		function setEvent(){
			
			// 부서검색
			$(".btn-search-dept").off("click").on("click", function(){
				callPopup_searchDepartment(this);
			});
			
			//부서검색 팝업 트리 초기화
			initFooterDeptPopup();
		}
		
		function onclick_search(){
			$("#defaultForm").attr("action", "${action}");
			$("#defaultForm")[0].submit();
		}
		
		function onclick_excelDownload(){
			table.download("xlsx", "6σ인재현황.xlsx", {
				sheetName : "6σ인재현황"
			});
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
.font-small {
	padding-left: 0px !important;
	padding-right: 5px !important;
	text-decoration: underline;
	cursor: pointer;
}
</style>
</body>
</html>