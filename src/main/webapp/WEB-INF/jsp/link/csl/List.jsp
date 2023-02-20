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
	$("#searchForm").validationEngine('attach', {
		unbindEngine:false,
		customFunctions : {
			//	
		},
		onValidationComplete: function(form, status){
			if(status == true) {
				return true;	
			}
			return false;
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
	$("#linkKey").attr('value', key);
	$("#defaultForm").submit();
}
//삭제
function remove(key) {
	if (confirm("삭제하시겠습니까?")) {
		$("#defaultForm").validationEngine('detach');
		$("#defaultForm").attr('action', 'delete.do');
		$("#linkKey").attr('value', key);
		$("#defaultForm").submit();
	}else{
		return false;
	}
}
//-->
</script>
</head>
<body>

<form:form commandName="linkSearchVO" id="defaultForm" method="get" action="list.do" >
${linkSearchVO.superHiddenTagWithoutToggle}

<input type="hidden" id="linkKey" name="linkKey" value="" />

<%--
<!-- 검색영역 샘플 -->
<div id="search_header">
	<div class="search">
		<fieldset>
			<legend class="hidden">게시판 검색</legend>
			<ul>
				<li>
					<label for="searchPinstnYn">검색선택</label>
					<select name="searchPinstnYn" id="searchPinstnYn" onchange="searchList()">
						<option selected="selected" value="">전체</option>
						<option value="Y">공공기관</option>
						<option value="N">민간기업</option>
					</select>
					<label for="isuApplDtStart" class="w_none">신청일자</label>
					<input name="isuApplDtStart" class="input_box hasDatepicker" id="isuApplDtStart" type="text" size="10" value=""> ~
					<input name="isuApplDtEnd" class="input_box hasDatepicker" id="isuApplDtEnd" type="text" size="10" value="">
				</li>
				<li>
					<label for="searchLastEvalStatCd">검색선택</label>
					<select name="searchLastEvalStatCd" id="searchLastEvalStatCd" onchange="searchList()">
						<option value="S000">전체</option>
						<option selected="selected" value="S010">발급신청</option><option value="S020">발급반려</option><option value="S030">발급승인</option><option value="S040">갱신신청</option><option value="S050">갱신반려</option><option value="S060">갱신승인</option>
					</select>
					<select name="searchFlag" id="searchFlag">
						<option selected="selected" value="COMP_NM">신청기업</option>
						<option value="BIZ_ID">사업자번호</option>
						<option value="SYS_ISU_NO">일련번호</option>
					</select>
					<input name="searchValue" title="검색" class="validate[funcCall[searchCheck]] input_box" id="searchValue" style="-ms-ime-mode: active;" type="text" size="30" value="">
					<button class="jButton">검색</button>
				</li>
			</ul>
		</fieldset>
	</div>
</div>
<!-- 검색영역 샘플 -->
--%>
	
<!-- 검색 -->
<div id="search_header">
	<div class="search">
		<fieldset>
			<legend class="hidden">검색</legend>
			<ul>
				<li>
					<label class="w_none" for="searchStartFrstOperDt">등록일자</label>
					<input type="text" id="searchStartFrstOperDt" name="searchStartFrstOperDt" value="${linkSearchVO.searchStartFrstOperDt}" class="validate[custom[date]] input_box datepicker" style="width:75px;" maxlength="10" />
					~
					<input type="text" id="searchEndFrstOperDt" name="searchEndFrstOperDt" value="${linkSearchVO.searchEndFrstOperDt}" class="validate[custom[date]] input_box datepicker" style="width:75px" maxlength="10" />
					
					<label class="w_none" for="searchPbsh">게시상태</label>
					<form:select path="searchPbsh">
						<form:option value="" label="전체" />
						<form:option value="Y" label="게시중" />
						<form:option value="N" label="미게시" />
					</form:select>
					
					<label class="w_none" for="searchLocateTyp">분류구분</label>
					<form:select path="searchLocateTyp">
						<form:option value="" label="전체" />
						<form:option value="DEF_LINK_01" label="관련사이트" />
						<form:option value="DEF_LINK_02" label="참고사이트" />
					</form:select>
					
					<label class="w_none" for="searchClass">검색구분</label>
					<form:select path="searchClass">
						<form:option value="TITLE" label="제목" />
						<form:option value="URL" label="URL" />
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
						<form:option value="FRST_OPER_DT" label="최근등록" />
						<form:option value="TITLE" label="제목" />
					</form:select>
					<span class="result">검색결과 ( <fmt:formatNumber value="${linkSearchVO.totalRecordCount}" />건  )</span>
					<p class="btn">
						<button class="jCreateButton" onclick="insertForm();">추가</button>
					</p>
				</li>
			</ul>
		</fieldset>
	</div>
</div>
<!-- 검색 //-->

<!-- 검색결과 -->
<table cellpadding="0" class="tb_base" summary="등록하신 링크의 이미지,제목,주소,새창여부,활성화여부,위치변경여부,수정일 및 수정 및 삭제 여부테이블 입니다.">
	<caption><span>목록</span></caption>
		<colgroup>
		<col style="width:6%" />
		<col style="width:10%"/>
		<col style="width:50%"/>
		<col style="width:6%"/>
		<col style="width:8%"/>
		<col style="width:8%"/>
		<col style="width:12%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">분류</th> 
			<th scope="col">제목</th>
			<th scope="col">타겟</th>
			<th scope="col">활성여부</th>
			<th scope="col">등록일</th>
			<th scope="col">관리</th>
		</tr>
	</thead>
	<tbody class="list">
		<c:forEach items="${linkList }" var="item" varStatus="i">
		<tr>
			<td>
				${linkSearchVO.totalRecordCount-((linkSearchVO.currentPageNo-1)*linkSearchVO.recordCountPerPage)-(i.count-1) }
			</td>
			<td style="text-align:center;">
				<c:choose>
					<c:when test="${item.locateTyp eq 'DEF_LINK_01' }">관련사이트</c:when>
					<c:when test="${item.locateTyp eq 'DEF_LINK_02' }">참고사이트</c:when>
				</c:choose>
			</td>
			<td style="text-align:left;">
				<a href="${item.url }" target="_blank" title="${item.url }">${item.title }</a>
			</td>			
			<td>
				<c:choose>
					<c:when test="${item.targetTyp eq 'NEW' }">새창</c:when>
					<c:when test="${item.targetTyp eq 'SELF' }">현재창</c:when>
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
				<button class="jButton" onclick="updateForm('${item.linkKey}');">수정</button>
				<button class="jButton" onclick="return remove('${item.linkKey}');">삭제</button>
			</td>
		</tr>
		</c:forEach>
		
		<c:if test="${empty linkList }">
			<tr>
				<td colspan="8">검색된 정보가 없습니다.</td>
			</tr>
		</c:if>
		
	</tbody>
</table>
<!-- 검색결과 //-->

<!-- 페이징 -->
<ui:pagination paginationInfo="${linkSearchVO }" type="cslDefault" jsFunction="cfnPageLink" />
<!-- //페이징 -->

</form:form>
</body>
</html>