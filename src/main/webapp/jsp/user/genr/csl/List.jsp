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
	$("#userId").attr('value', key);
	$("#defaultForm").submit();
}
//삭제
function remove(key) {
	if (confirm("삭제하시겠습니까?")) {
		$("#defaultForm").validationEngine('detach');
		$("#defaultForm").attr('action', 'delete.do');
		$("#userId").attr('value', key);
		$("#defaultForm").submit();
	}else{
		return false;
	}
}
//메뉴사용설정
function menuUse(key){
	$("#defaultForm").validationEngine('detach');
	$("#defaultForm").attr('action', 'menuUse.do');
	$("#userId").attr('value', key);
	$("#defaultForm").submit();
}
//-->
</script>
</head>
<body>

<form:form commandName="genrUserSearchVO" id="defaultForm" method="get" action="list.do" >
${genrUserSearchVO.superHiddenTagWithoutToggle}

<input type="hidden" id="userId" name="userId" value="" />

<!-- 검색 -->
<div id="search_header">
	<div class="search">
		<fieldset>
			<legend class="hidden">검색</legend>
			<ul>
				<li>
					<label class="w_none" for="searchStartFrstOperDt">가입일자</label>
					<input type="text" id="searchStartFrstOperDt" name="searchStartFrstOperDt" value="${genrUserSearchVO.searchStartFrstOperDt}" class="validate[custom[date]] input_box datepicker" style="width:75px;" maxlength="10" />
					~
					<input type="text" id="searchEndFrstOperDt" name="searchEndFrstOperDt" value="${genrUserSearchVO.searchEndFrstOperDt}" class="validate[custom[date]] input_box datepicker" style="width:75px" maxlength="10" />
					
					<label class="w_none" for="searchRegSt">회원상태</label>
					<form:select path="searchRegSt">
						<form:option value="" label="전체" />
						<form:option value="A01" label="승인대기" />
						<form:option value="B01" label="정상사용" />
						<form:option value="C01" label="사용정지" />
						<form:option value="D01" label="회원탈퇴" />
					</form:select>
					
					<label class="w_none" for="searchAuthId">회원그룹</label>
					<select id="searchAuthId">
						<option value="">전체</option>
						<c:forEach var="item" items="${userAuthList}">
							<option value="${item.authId}" <c:if test="${searchAuthId eq item.authId}">selected="selected"</c:if>>${item.authNm}</option>
						</c:forEach>
					</select>
					<label class="w_none" for="searchClass">검색구분</label>
					<form:select path="searchClass">
						<form:option value="USER_NM" label="이름" />
						<form:option value="USER_ID" label="아이디" />
						<form:option value="TEL" label="전화번호" />
						<form:option value="MOB" label="휴대폰번호" />
						<form:option value="EMAIL" label="이메일" />
					</form:select>
					<form:input path="searchValue" cssClass="input_box" title="검색어" size="30" style="width:180px;" />
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
						<form:option value="USER_NM" label="이름" />
						<form:option value="FRST_OPER_DT" label="최근가입" />
					</form:select>
					<span class="result">검색결과 ( <fmt:formatNumber value="${genrUserSearchVO.totalRecordCount}" />건  )</span>
					<p class="btn">
						<button class="jCreateButton" onclick="insertForm();">추가</button>
					</p>
				</li>
			</ul>
		</fieldset>
	</div>
</div>
<!-- 검색 //-->

<table cellpadding="0" class="tb_base" summary="회원정보 테이블입니다.">
	<caption>
		<span>회원목록</span>
	</caption>
	<colgroup>
		<col style="width:6%" />
		<col style="width:10%" />
		<col style="width:10%" />
		<col style="width:10%" />
		<col style="width:16%" />
		<col style="width:10%" />
		<col style="width:10%" />
		<col style="width:8%" />
		<col style="width:8%" />
		<col style="width:12%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">이름</th>
			<th scope="col">아이디</th>
			<th scope="col">전화번호</th>
			<th scope="col">이메일</th>
			<th scope="col">권한</th>
			<th scope="col">상태</th>
			<th scope="col">가입일</th>
			<th scope="col">최종접속일</th>
			<th scope="col">관리</th>
		</tr>
	</thead>
	<tbody class="list">
	<c:forEach var="item" items="${genrUserList}" varStatus="i">
		<tr>
			<td>${i.count }</td>
			<td>${item.userNm }</td>
			<td>${item.userId }</td>
			<td>${item.tel }</td>
			<td>${item.email }</td>
			<td>${item.authNm }</td>
			<td>
				<c:choose>
					<c:when test="${item.regSt eq 'A01'}"><span class="clr_info">승인대기</span></c:when>
					<c:when test="${item.regSt eq 'B01'}"><span>정상사용</span></c:when>
					<c:when test="${item.regSt eq 'C01'}"><span class="clr_warning">사용정지</span></c:when>
					<c:when test="${item.regSt eq 'D01'}"><span class="clr_warning">회원탈퇴</span></c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</td>
			<td>
				<!-- fmt:formatDate pattern="yyyy-MM-dd" value="${item.frstOperDt}" /-->
				<fmt:parseDate value='${item.frstOperDt}' var='frstOperDt' pattern='yyyymmdd'/> <!-- J's 20230202 -->
				<fmt:formatDate value="${frstOperDt}" pattern="yyyy-mm-dd"/>
			</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.lastLoginDt}" /></td>
			<td>
				<button class="jButton" onclick="updateForm('${item.userId}');">수정</button>
				<button class="jButton" onclick="return remove('${item.userId}');">삭제</button>
			</td>
		</tr>
	</c:forEach>
	<c:if test="${empty genrUserList }">
		<tr>
			<td colspan="10">검색된 정보가 없습니다.</td>
		</tr>		
	</c:if>
	</tbody>
</table>

<!-- 페이징 -->
<ui:pagination paginationInfo="${genrUserSearchVO }" type="cslDefault" jsFunction="cfnPageLink" />
<!-- //페이징 -->

</form:form>
</body>
</html>