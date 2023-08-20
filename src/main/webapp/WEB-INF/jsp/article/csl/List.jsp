<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
    
<!doctype html>
<html lang="ko">
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
//조회
function view(key){
	$("#defaultForm").validationEngine('detach');
	$("#defaultForm").attr('action', 'view.do');
	$("#articleKey").attr('value', key);
	$("#defaultForm").submit();
}
//-->
</script>
</head>
<body>

<form:form commandName="articleSearchVO" id="defaultForm" method="get" action="list.do" >
${articleSearchVO.superHiddenTag}

<input type="hidden" id="boardKey" name="boardKey" value="${articleSearchVO.boardKey }" />
<input type="hidden" id="articleKey" name="articleKey" value="" />

<!-- 검색 -->
<div id="search_header">
	<div class="search">
		<fieldset>
			<legend class="hidden">검색</legend>
			<ul>
				<li>
					<label class="w_none" for="searchStartFrstOperDt">등록일자</label>
					<input type="text" id="searchStartFrstOperDt" name="searchStartFrstOperDt" value="${articleSearchVO.searchStartFrstOperDt}" class="validate[custom[date]] input_box datepicker" style="width:75px;" maxlength="10" />
					~
					<input type="text" id="searchEndFrstOperDt" name="searchEndFrstOperDt" value="${articleSearchVO.searchEndFrstOperDt}" class="validate[custom[date]] input_box datepicker" style="width:75px" maxlength="10" />
					
					<c:if test="${boardVO.catgrFlg eq 'Y'}">
						<label class="w_none" for="searchCatgr">분류구분</label>
						<select id="searchCatgr" name="searchCatgr">
							<option value="" >전체</option>	
							<c:forEach var="item" items="${catgrList }">
								<option value="${item.codeId}">${item.codeNm }</option>
							</c:forEach>
						</select>
					</c:if>
					<label class="w_none" for="searchClass">검색구분</label>
					<form:select path="searchClass">
						<form:option value="TITLE" label="제목" />
						<form:option value="CONTENT" label="내용" />
						<form:option value="WRITER" label="작성자" />
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
					<%-- 
					<label for="recordCountPerPage" class="w_none hidden">목록갯수</label> 
					<form:select path="recordCountPerPage" onchange="searchList();">
						<form:option value="10" label="10개씩 보기" />
						<form:option value="20" label="20개씩 보기" />
						<form:option value="30" label="30개씩 보기" />
						<form:option value="50" label="50개씩 보기" />
						<form:option value="100" label="100개씩 보기" />
					</form:select>
					--%>
					<label for="result" class="w_none">검색결과</label> 
					<span class="result"><fmt:formatNumber value="${articleSearchVO.totalRecordCount}" />건 </span>
					<p class="btn">
						<c:if test="${isMngr or isUseGrpForWrite }">
							<button class="jCreateButton" onclick="insertForm();">글쓰기</button>
						</c:if>
					</p>
				</li>
			</ul>
		</fieldset>
	</div>
</div>
<!-- 검색 //-->

<!-- 검색결과 -->
<table class="tb_base" summary="게시물 목록 테이블 입니다.">
	<caption><span>게시글목록</span></caption>
	<c:choose>
		<c:when test="${boardVO.catgrFlg eq 'Y'}">
			<colgroup><col style="width:6%" /><col style="width:9%"/><col style="width:47%"/><col style="width:9%"/><col style="width:8%"/><col style="width:8%"/><col style="width:7%"/><col style="width:6%"/></colgroup>
		</c:when>
		<c:otherwise>
			<colgroup><col style="width:6%" /><col style="width:56%"/><col style="width:9%"/><col style="width:8%"/><col style="width:8%"/><col style="width:7%"/><col style="width:6%"/></colgroup>
		</c:otherwise>
	</c:choose>
		
	<thead>
		<tr>
			<th scope="col">번호</th>
			<c:if test="${boardVO.catgrFlg eq 'Y'}">
				<th scope="col">분류</th>
			</c:if>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">파일</th>
			<th scope="col">작성일</th>
			<th scope="col">조회수</th>
			<th scope="col">상태</th>
		</tr>
	</thead>
	<tbody class="list">
		<!-- 공지글 -->
		<c:forEach items="${noticeList }" var="item" varStatus="i">
		<tr class="notice">
			<td>
				공지
			</td>
			<c:if test="${boardVO.catgrFlg eq 'Y'}">
				<td style="text-align:center;">
					-
				</td>
			</c:if>
			<td style="text-align:left;">
				<div>
					<a href="#none" onclick="view('${item.articleKey}');" title="${item.title }">
						<c:choose>
							<c:when test="${item.deleteFlg eq 'Y' }"><strike>${item.title }</strike></c:when>
							<c:otherwise>${item.title }</c:otherwise>
						</c:choose>
					</a>
				</div>
				<c:if test="${not empty item.viewStartDt or not empty item.viewEndDt}">
					<div class="moreInfo" style="padding-top:3px;">
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.viewStartDt}" /> ~ <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.viewEndDt}" />
					</div>
				</c:if>
			</td>
			<td>${item.writer }</td>
			<td>
				<c:if test="${not empty item.fileList}">
					<c:choose>
						<c:when test="${fn:length(item.fileList) > 1}">
							<a href="/jfile/downloadAll.do?fileId=article_${item.articleKey}" target="downloadFrame">파일(${fn:length(item.fileList)})</a>
						</c:when>
						<c:otherwise>
							<a href="/jfile/readDownloadFile.do?fileId=${item.fileList[0].fileId}&amp;fileSeq=${item.fileList[0].fileSeq}" target="downloadFrame">파일</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</td>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${item.frstOperDt}" />
			</td>
			<td>${item.viewCnt }</td>
			<td>
				<div>
					<c:if test="${not empty item.viewStartDt and item.viewStartDt > nowDt }"><span class="clr_info">게시전</span></c:if>
					<c:if test="${not empty item.viewEndDt and item.viewEndDt < nowDt }"><span class="clr_warning">게시종료</span></c:if>
				</div>
				<div style="padding-top:3px;"><c:if test="${item.deleteFlg eq 'Y'}"><span class="clr_warning">비활성</span></c:if></div>
			</td>
		</tr>
		</c:forEach>
		<!-- //공지글 -->
		
		<c:forEach items="${articleList }" var="item" varStatus="i">
		<tr>
			<td>
				${articleSearchVO.totalRecordCount-((articleSearchVO.currentPageNo-1)*articleSearchVO.recordCountPerPage)-(i.count-1) }
			</td>
			<c:if test="${boardVO.catgrFlg eq 'Y'}">
				<td style="text-align:center;">
					<c:forEach var="catgr" items="${catgrList }">
						<c:if test="${item.catgr eq catgr.codeId }">${catgr.codeNm }</c:if>
					</c:forEach>
				</td>
			</c:if>
			<td style="text-align:left;">
				<div>
					<c:if test="${boardVO.replyFlg eq 'Y' }">
						<c:if test="${item.gkey > 0}">
							<c:forEach begin="1" end="${item.gkey }">
								&nbsp;&nbsp;
							</c:forEach>
							<span class="clr_info">[답변]</span>
						</c:if>
					</c:if>
					<a href="#none" onclick="view('${item.articleKey}');" title="${item.title }">
						<c:choose>
							<c:when test="${item.deleteFlg eq 'Y' }"><strike>${item.title }</strike></c:when>
							<c:otherwise>${item.title }</c:otherwise>
						</c:choose>
					</a>
				</div>
				<c:if test="${not empty item.viewStartDt or not empty item.viewEndDt}">
					<div class="moreInfo" style="padding-top:3px;">
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.viewStartDt}" /> ~ <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.viewEndDt}" />
					</div>
				</c:if>
			</td>			
			<td>${item.writer }</td>
			<td>
				<c:if test="${not empty item.fileList}">
					<c:choose>
						<c:when test="${fn:length(item.fileList) > 1}">
							<a href="/csl/attachfile/downloadAll.do?fileId=article_${item.articleKey}" target="downloadFrame">파일(${fn:length(item.fileList)})</a>
						</c:when>
						<c:otherwise>
							<a href="/csl/attachfile/downloadFile.do?fileId=${item.fileList[0].fileId}&amp;fileSeq=${item.fileList[0].fileSeq}" target="downloadFrame">파일</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</td>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${item.frstOperDt}" />
			</td>
			<td>${item.viewCnt }</td>
			<td>
				<div>
					<c:if test="${not empty item.viewStartDt and item.viewStartDt > nowDt }"><span class="clr_info">게시전</span></c:if>
					<c:if test="${not empty item.viewEndDt and item.viewEndDt < nowDt }"><span class="clr_warning">게시종료</span></c:if>
				</div>
				<div style="padding-top:3px;"><c:if test="${item.deleteFlg eq 'Y'}"><span class="clr_warning">비활성</span></c:if></div>
			</td>
		</tr>
		</c:forEach>
		
		<c:if test="${empty noticeList and empty articleList }">
			<tr>
				<td colspan="9">검색된 정보가 없습니다.</td>
			</tr>
		</c:if>
		
	</tbody>
</table>
<!-- 검색결과 //-->

<!-- 페이징 -->
<ui:pagination paginationInfo="${articleSearchVO }" type="cslDefault" jsFunction="cfnPageLink" />
<!-- //페이징 -->

</form:form>
</body>
</html>