<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>목록</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<script type="text/javascript">
<!--
$(function() {
	$("#defaultForm").validationEngine({
		unbindEngine:false,
		customFunctions : {
			//
		},
		onValidationComplete: function(form, status){
			return true;
		}
	});
	
	//달력
	$('.datepicker').datepicker({
		showOn: "both",
		dateFormat: "yy-mm-dd",
		changeYear: true,
		changeMonth: true,
		buttonImage: "/csl/img/common/icon_calendar.png",
		buttonImageOnly: true,
		showButtonPanel: true,
		closeText: "닫기",
		onClose: function(){/**/}
	});
});

//검색
function searchList(){
	$('#currentPageNo').val('1');
	$("#defaultForm").submit();
}
//추가
function insertForm(){
	$("#defaultForm").validationEngine('detach');
	$("#defaultForm").attr('action', 'insertForm.do');
	$("#defaultForm").submit();
}
//수정
function updateForm(key){
	$("#defaultForm").validationEngine('detach');
	$("#defaultForm").attr('action', 'updateForm.do');
	$("#codeGrpId").attr('value', key);
	$("#defaultForm").submit();
}
//삭제
function remove(key) {
	if (confirm("삭제하시겠습니까?")) {
		$("#defaultForm").validationEngine('detach');
		$("#defaultForm").attr('action', 'delete.do');
		$("#codeGrpId").attr('value', key);
		$("#defaultForm").submit();
	}else{
		return false;
	}
}
//-->
</script>
</head>
<body>

<form:form commandName="codeGrpSearchVO" id="defaultForm" method="get" action="list.do" >
${codeGrpSearchVO.superHiddenTagWithoutToggle}

<input type="hidden" id="codeGrpId" name="codeGrpId" value="" />

<!-- 검색 -->
<div id="search_header">
	<div class="search">
		<fieldset>
			<legend class="hidden">검색</legend>
			<ul>
				<li>
					<label class="w_none" for="searchStartFrstOperDt">등록일자</label>
					<input type="text" id="searchStartFrstOperDt" name="searchStartFrstOperDt" value="${codeGrpSearchVO.searchStartFrstOperDt}" class="validate[custom[date]] input_box datepicker" style="width:75px;" maxlength="10" />
					~
					<input type="text" id="searchEndFrstOperDt" name="searchEndFrstOperDt" value="${codeGrpSearchVO.searchEndFrstOperDt}" class="validate[custom[date]] input_box datepicker" style="width:75px" maxlength="10" />
					
					<label class="w_none" for="searchActFlg">활성여부</label>
					<form:select path="searchActFlg">
						<form:option value="" label="전체" />
						<form:option value="Y" label="활성" />
						<form:option value="N" label="비활성" />
					</form:select>
					
					<label class="w_none" for="searchClass">검색구분</label>
					<form:select path="searchClass">
						<form:option value="CODE_GRP_NM" label="그룹명" />
						<form:option value="CODE_GRP_ID" label="그룹아이디" />
					</form:select>
					<form:input path="searchValue" cssClass="input_box" title="검색어" size="30" />
					<button class="jSearchButton" onclick="searchList();" title="검색">검색</button>
				</li>
			</ul>
		</fieldset>
	</div>
	
	<div class="search b_none">
		<fieldset>
			<legend class="hidden">검색결과</legend>
			<ul>
				<li class="btn_wrap">
					<span class="space"></span>
					<label for="recordCountPerPage" class="w_none hidden">목록갯수</label> 
					<form:select path="recordCountPerPage" onchange="searchList();">
						<form:option value="10" label="10개씩 보기" />
						<form:option value="20" label="20개씩 보기" />
						<form:option value="30" label="30개씩 보기" />
						<form:option value="50" label="50개씩 보기" />
						<form:option value="100" label="100개씩 보기" />
					</form:select>
					<label for="orderBy" class="w_none">정렬순서</label> 
					<form:select path="orderBy" onchange="searchList();">
						<form:option value="CODE_GRP_ID" label="코드그룹ID" />
						<form:option value="CODE_GRP_NM" label="코드그룹명" />
						<form:option value="FRST_OPER_DT" label="최근등록" />
					</form:select>
					<span class="result">검색결과 ( <fmt:formatNumber value="${codeGrpSearchVO.totalRecordCount}" />건  )</span>
					<p class="btn">
						<button class="jCreateButton" onclick="insertForm();">추가</button>
					</p>
				</li>
			</ul>
		</fieldset>
	</div>
</div>
<!-- 검색 //-->

<table cellpadding="0" class="tb_base" summary="수정 및 삭제 여부테이블 입니다.">
	<caption><span>목록</span></caption>
	<colgroup>
	<col style="width:6%" />
	<col style="width:12%" />
	<col style="width:40%" />
	<col style="width:10%" />
	<col style="width:10%" />
	<col style="width:10%"/>
	<col style="width:12%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">그룹 아이디</th>
			<th scope="col">그룹명</th>
			<th scope="col">속성</th>
			<th scope="col">활성여부</th>
			<th scope="col">등록일</th>
			<th scope="col">관리</th>
		</tr>
	</thead>
	<tbody class="list">
		<c:forEach items="${codeGrpList }" var="item" varStatus="i">
		<tr>
			<td>${codeGrpSearchVO.totalRecordCount-((codeGrpSearchVO.currentPageNo-1)*codeGrpSearchVO.recordCountPerPage)-(i.count-1) }</td>
			<td style="text-align: center;">${item.codeGrpId}</td>
			<td style="text-align: left;">${item.codeGrpNm}</td>
			<td>
				<c:choose>
					<c:when test="${not empty item.attr }">${item.attr}</c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${item.actFlg eq 'Y' }"><span class="clr_default">활성</span></c:when>
					<c:when test="${item.actFlg eq 'N' }"><span class="clr_warning">비활성</span></c:when>
				</c:choose>
			</td>
			<td>
				<!-- fmt:formatDate pattern="yyyy-MM-dd" value="${item.frstOperDt}" /-->
				<fmt:parseDate value='${item.frstOperDt}' var='frstOperDt' pattern='yyyymmdd'/> <!-- J's 20230202 -->
				<fmt:formatDate value="${frstOperDt}" pattern="yyyy-mm-dd"/>
			</td>
			<td>
				<button class="jButton" onclick="updateForm('${item.codeGrpId}');">수정</button>
				<button class="jButton" onclick="return remove('${item.codeGrpId}');">삭제</button>
			</td>
		</tr>
		</c:forEach>
		
		<c:if test="${empty codeGrpList }">
		<tr>
			<td colspan="10">
				검색된 정보가 없습니다.
			</td>
		</tr>		
		</c:if>
		
	</tbody>
</table>
<!-- 페이징 -->
<ui:pagination paginationInfo="${codeGrpSearchVO }" type="cslDefault" jsFunction="cfnPageLink" />
<!-- //페이징 -->

</form:form>
</body>
</html>