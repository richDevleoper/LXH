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
			<form:form commandName="MakeSearchVO" id="defaultForm" method="get"
				action="makelist.do">
                    ${MakeSearchVO.superHiddenTag}
                <div class="search-form">
					<div class="form-inline form-select">
						<label>사업장</label>
						<form:select path="searchPlaceCode" title="사업장을 선택하세요."
							cssClass="validate[required]">
						</form:select>
					</div>                
					<div class="form-inline form-select">
						<label>구분</label> 
						<form:select path="searchDiv">
							<form:option value="">전체</form:option>
							<form:option value="comNo">사번</form:option>
							<form:option value="userName">이름</form:option>
							<form:option value="bumun">부문</form:option>
							<form:option value="deptName">소속명</form:option>
							<form:option value="teamName">팀명</form:option>
							<form:option value="jobName">직무명</form:option>
						</form:select>
					</div>
					<div class="form-inline form-select">
						<form:input type="text" path="searchText" />
					</div>

					<div class="form-inline form-select">
						<label>조직</label>
						<form:input type="hidden" path="searchDepart"/>
                        <form:input type="text" path="searchDepartName" readonly="true" />
                        <button type="button" class="btn-org btn-search-dept">검색</button>
					</div>
					<button type="button" class="btn-submit" onclick="onclick_search()">조회</button>
				</div>
			</form:form>
		</div>

		<div class="list-header">
			<p class="title">분임조 편성 현황</p>
			<span class="bar"></span>
			<p class="total">총 ${totalCount}건</p>
			<select name="limit" class="limit"
				onchange="onchange_recordCountPerPage(this.value)">
				<option value="10"
					<c:if test="${MakeSearchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
				<option value="50"
					<c:if test="${MakeSearchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
				<option value="100"
					<c:if test="${MakeSearchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
			</select>
		</div>
		<div class="list-content">
			<div class="list-table">
				<table class="even">
					<caption></caption>
					<colgroup>
						<col style="width: 60px">
						<col style="width: 140px">
						<col>
						<col>
						<col style="width: 120px">
						<col style="width: 120px">
						<col style="width: 80px">
						<col style="width: 100px">
					</colgroup>
					<thead>
						<tr>
							<th class="bg-gray font-weight-bold">NO</th>
							<th class="bg-gray font-weight-bold">분임조명</th>
							<th class="bg-gray font-weight-bold">부문</th>							
							<th class="bg-gray font-weight-bold">소속</th>
							<th class="bg-gray font-weight-bold">사업장</th>
							<th class="bg-gray font-weight-bold">분임조장</th>
							<th class="bg-gray font-weight-bold">분임조원수</th>
							<th class="bg-gray font-weight-bold">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${selectCirclList}" var="item">
							<tr>
								<td>${item.idx}</td>
								<td>
									<div class="link-group center">
										<ul>
											<!--  <li><a href="/app/003_03_mkteam_01.do?menuKey=70" title="바로가기" >분임조명</a></li>   -->
											<li><a href="view.do?menuKey=${menuKey}&cirCode=${item.cirCode}" title="바로가기">${item.cirName }</a></li>
										</ul>
									</div>
								</td>
								<td>${item.comJimu}</td>
								<td>${item.cirLeaderdeptName}</td>
								<td>${item.comWorkPlace}</td>
								<td>${item.cirLName }</td>
								<td>${item.cirMemCnt }</td>
								<td><fmt:formatDate pattern="yyyy.MM.dd" value="${item.cirRegDate }" /></td>
							</tr>
						</c:forEach>




					</tbody>
				</table>
			</div>
		</div>
		<div class="list-footer">
			<ui:pagination paginationInfo="${MakeSearchVO}" type="defDefault"
				jsFunction="cfnPageLink" />
			<div class="list-btns">
				<button type="button" class="btn bg-gray" id="btnRegMake">
					<span>분임조등록</span>
				</button>
			</div>

		</div>
	</div>

	<!-- 조직도 -->
	<div class="modal-dimmed"></div>
	

<script type="text/javascript">
$(documentsa).ready(function(){
	init();
	initCode();
	
 	$("#btnRegMake").on("click", function(){
		location.href="./makeinsert.do?menuKey=70";
	});
 	
 	
});

function init(){	
	$("#defaultForm input").off("keyup").on("keyup", function(e){
	    if(e.keyCode===13 && this.value.trim().length>0){
	    	onclick_search();
	    }
	});
	
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

function initCode(){
	let codes = [
		<c:forEach var="item" items="${allCodes}">{index:"${item.codeGrpId}",key:"${item.codeId}",value:"${item.codeNm}"},
		</c:forEach>
	];
	
	cdWPlace = codes.filter(function(code){ return code.index==="WPLACE";});
	
	setDropDownCustom("searchPlaceCode", cdWPlace, true, "전체");
	$("#searchPlaceCode").val("${MakeSearchVO.searchPlaceCode}")
}

function onclick_search(){
	$("#defaultForm")[0].submit();
}

function onchange_recordCountPerPage(vCount){
	$("#recordCountPerPage").val(vCount);
	onclick_search();// 검색 '조회'버튼 클릭
}

function setDropDownCustom(objId, cdList, flagFirstEmptyYn, emptyTitle){
	htm = "";
	
	if(!emptyTitle){
		emptyTitle = "선택하세요";
	}
	
	if(flagFirstEmptyYn){
		htm += "<option value=''>"+ emptyTitle +"</option>";
	}
	for(i in cdList){
		let item = cdList[i];
		let strSelected = "";
		if(item.selected){
			strSelected = " selected='selected'"
		}
		htm += "<option value='"+item.value+"' "+ strSelected +">"+item.value+"</option>";
	}
	if(objId.indexOf(".")===0){
		// Class Name
		$(objId).each(function(i,o){
			$(o).empty().append(htm);
		})
	} else {
		$("#"+objId).empty().append(htm);	
	}
	
}

</script>

</body>
</html>