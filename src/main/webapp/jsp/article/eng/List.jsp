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

<script type="text/javascript">
<!--
$(function() {
	$("#defaultForm").validationEngine('attach', {
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
		buttonImage: "/eng/img/article/btn_calender.gif",
		buttonImageOnly: true,
		showButtonPanel: true,
		closeText: "닫기",
		onClose: function(){/**/}
	}).next('img').css('vertical-align', 'middle').css('margin-left','5px');	
});

//검색
function searchList(){
	$('#currentPageNo').val('1');
	$("#defaultForm").submit();
}
//추가
function insertForm(){
	$("#defaultForm").attr('action', 'insertForm.do');
	$("#defaultForm").submit();
}
//조회
function view(key){
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

<div id="article_header">
	<!-- 검색영역 -->
	<fieldset id="article_search">
	<legend class="hidden">게시글 검색</legend>
	<div id="article_sel">
		<label for="event_sdate1" class="hidden">조회기간</label> 
		<input type="text" id="searchStartFrstOperDt" name="searchStartFrstOperDt" value="${articleSearchVO.searchStartFrstOperDt}" class="datepicker ip_type va_m" size="10"/>
		<%-- <input type="button" title="날짜선택" class="at_calender va_m" /> --%>
		~
		<input type="text" id="searchEndFrstOperDt" name="searchEndFrstOperDt" value="${articleSearchVO.searchEndFrstOperDt}" class="datepicker ip_type va_m" size="10"/>
		<%-- <input type="button" title="날짜선택" class="at_calender va_m" /> --%>
		<c:if test="${boardVO.catgrFlg eq 'Y'}">
			<label class="hidden" for="searchCatgr">카테고리</label>
			<select id="searchCatgr" name="searchCatgr" class="sel_type ml15" style="width:100px;">
				<option value="" >전체</option>	
				<c:forEach var="item" items="${catgrList }">
					<option value="${item.codeId}">${item.codeNm }</option>
				</c:forEach>
			</select>
		</c:if>
				
		<label class="hidden" for="searchClass">검색구분</label>
		<form:select path="searchClass" cssClass="sel_type ml15" cssStyle="width:80px;">
			<form:option value="TITLE" label="제목" />
			<form:option value="CONTENT" label="내용" />
			<form:option value="WRITER" label="작성자" />
		</form:select>
		<form:input path="searchValue" cssClass="ip_type va_m" title="검색어" size="20" />
		<input type="button" id="search" name="search" value="검색" class="btn_st1 va_m" onclick="searchList();" />
	</div>
	</fieldset>
	<!-- //검색영역 -->
	<!-- 페이지 정보 -->
	<div id="page_info">
		<p>Result <strong><fmt:formatNumber value="${articleSearchVO.totalRecordCount}" /></strong> ,&nbsp; Page <strong> <span><fmt:formatNumber value="${articleSearchVO.currentPageNo}" /></span> / <fmt:formatNumber value="${articleSearchVO.totalPageCount}" /></strong></p>
	</div>
	<!-- //페이지 정보 -->
</div>
<div id="article_body">
	<!-- 게시판 리스트 영역 -->
	<table cellspacing="0" class="article_list" summary="게시판의 테이블 입니다." >
		<caption><span>게시판 이름</span></caption>
		<colgroup>
			<c:choose>
				<c:when test="${boardVO.catgrFlg eq 'Y'}">
					<col width="6%"/>
					<col width="10%"/>
					<col width="44%"/>
					<col width="12%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="8%"/>
				</c:when>
				<c:otherwise>
					<col width="6%"/>
					<col width="54%"/>
					<col width="12%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="8%"/>
				</c:otherwise>
			</c:choose>
		</colgroup>
		<thead class="skin2">
			<tr>
				<th scope="col">No</th>
				<c:if test="${boardVO.catgrFlg eq 'Y'}">
					<th scope="col">Category</th>
				</c:if>
				<th scope="col">Subject</th>
				<th scope="col">Writer</th>
				<th scope="col">File</th>
				<th scope="col">Date</th>
				<th scope="col">Hit</th>
			</tr>
		</thead>
		<tbody class="tb_center">
			<!-- noticleList -->
			<c:forEach items="${noticeList }" var="item" varStatus="i">
				<tr>
					<td scope="row">
						공지
					</td>
					<c:if test="${boardVO.catgrFlg eq 'Y'}">
						<td scope="row">
							-
						</td>
					</c:if>
					<td class="tx_al">
						<a href="#none" onclick="view('${item.articleKey}');" title="${item.title }">
							${item.title }
							<c:if test="${item.secretFlg eq 'Y'}">
								<img src="/eng/img/article/icon_secret.gif" alt="비밀글" />
							</c:if>
							<c:if test="${item.operPrd <= boardVO.newPrd}">
								<img src="/eng/img/article/icon_new.png" alt="새글" />
							</c:if>
						</a>
					</td>
					<td>${item.writer }</td>
					<td>
						<c:if test="${not empty item.fileList}">
							<c:choose>
								<c:when test="${fn:length(item.fileList) > 1}">
									<a href="/attachfile/downloadAll.do?fileId=article_${item.articleKey}" target="downloadFrame">
										<img src="/eng/img/board/icon_multiple.gif" alt="파일 다운로드" />
									</a>
								</c:when>
								<c:otherwise>
									<a href="/attachfile/downloadFile.do?fileId=${item.fileList[0].fileId}&amp;fileSeq=${item.fileList[0].fileSeq}" target="downloadFrame">
										<c:set var="extList" value="hwp,xls,xlsx,ppt,pptx,pdf,doc,docx" />
										<c:set var="ext" value="${fn:split(item.fileList[0].fileNm, '.')}" />
										<c:choose>
											<c:when test="${fn:indexOf(extList, ext[fn:length(ext)-1]) != -1}">
												<img src="/eng/img/board/icon_${ext[fn:length(ext)-1]}.gif" alt="파일 다운로드" />
											</c:when>
											<c:otherwise>
												<img src="/eng/img/board/icon_default.gif" alt="파일 다운로드" />
											</c:otherwise>
										</c:choose>
									</a>
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
					<td>
						<!-- fmt:formatDate pattern="yyyy-MM-dd" value="${item.frstOperDt}" /-->
						<fmt:parseDate value='${item.frstOperDt}' var='frstOperDt' pattern='yyyymmdd'/> <!-- J's 20230202 -->
						<fmt:formatDate value="${frstOperDt}" pattern="yyyy-mm-dd"/>
					</td>
					<td>${item.viewCnt }</td>
				</tr>			
			</c:forEach>
			
			<!-- articleList -->
			<c:forEach items="${articleList }" var="item" varStatus="i">
				<tr>
					<td scope="row">
						${articleSearchVO.totalRecordCount-((articleSearchVO.currentPageNo-1)*articleSearchVO.recordCountPerPage)-(i.count-1) }
					</td>
					<c:if test="${boardVO.catgrFlg eq 'Y'}">
						<td scope="row">
							<c:forEach var="catgr" items="${catgrList }">
								<c:if test="${item.catgr eq catgr.codeId }">${catgr.codeNm }</c:if>
							</c:forEach>
						</td>
					</c:if>
					<td class="tx_al">
						<c:if test="${boardVO.replyFlg eq 'Y' }">
							<c:if test="${item.gkey > 0}">
								<c:forEach begin="1" end="${item.gkey }">
									&nbsp;&nbsp;
								</c:forEach>
								<img src="/eng/img/article/icon_re.png" alt="답변글" />
							</c:if>
						</c:if>
						<a href="#none" onclick="view('${item.articleKey}');" title="${item.title }">
							${item.title }
							<c:if test="${item.operPrd <= boardVO.newPrd}">
								<img src="/eng/img/article/icon_new.png" alt="새글" />
							</c:if>
						</a>
					</td>
					<td>${item.writer }</td>
					<td>
						<c:if test="${not empty item.fileList}">
							<c:choose>
								<c:when test="${fn:length(item.fileList) > 1}">
									<a href="/attachfile/downloadAll.do?fileId=article_${item.articleKey}" target="downloadFrame">
										<img src="/eng/img/article/icon_multiple.gif" alt="파일 다운로드" />
									</a>
								</c:when>
								<c:otherwise>
									<a href="/attachfile/downloadFile.do?fileId=${item.fileList[0].fileId}&amp;fileSeq=${item.fileList[0].fileSeq}" target="downloadFrame">
										<c:set var="extList" value="hwp,xls,xlsx,ppt,pptx,pdf,doc,docx" />
										<c:set var="ext" value="${fn:split(item.fileList[0].fileNm, '.')}" />
										<c:choose>
											<c:when test="${fn:indexOf(extList, ext[fn:length(ext)-1]) != -1}">
												<img src="/eng/img/article/icon_${ext[fn:length(ext)-1]}.gif" alt="파일 다운로드" />
											</c:when>
											<c:otherwise>
												<img src="/eng/img/article/icon_default.gif" alt="파일 다운로드" />
											</c:otherwise>
										</c:choose>
									</a>
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
					<td>
						<!-- fmt:formatDate pattern="yyyy-MM-dd" value="${item.frstOperDt}" /-->
						<fmt:parseDate value='${item.frstOperDt}' var='frstOperDt' pattern='yyyymmdd'/> <!-- J's 20230202 -->
						<fmt:formatDate value="${frstOperDt}" pattern="yyyy-mm-dd"/>
					</td>
					<td>${item.viewCnt }</td>
				</tr>			
			</c:forEach>
			<c:if test="${empty articleList and empty articleList }">
				<tr>
					<c:choose>
						<c:when test="${boardVO.catgrFlg eq 'Y'}"><td colspan="7">검색된 결과가 없습니다</td></c:when>
						<c:otherwise><td colspan="6">검색된 결과가 없습니다</td></c:otherwise>
					</c:choose>
				</tr>
			</c:if>
		</tbody>
	</table>
	<!-- //게시판 리스트 영역 -->
	<div class="article_bottom">
		<!-- 페이징 -->
		<ui:pagination paginationInfo="${articleSearchVO }" type="defDefault" jsFunction="cfnPageLink" />
		<!-- //페이징 -->
		<!-- 버튼 -->
		<div class="at_btn">
			<p>
				<c:if test="${isUseGrpForWrite }">
					<a href="#none" onclick="insertForm();" class="at_btn_st2">Write</a>
				</c:if>
			</p>
		</div>
		<!-- //버튼 -->
	</div>
</div>
</form:form>

</body>
</html>