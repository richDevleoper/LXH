<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
<%
	pageContext.setAttribute("CR", "\r");
	pageContext.setAttribute("LF", "\n");
%>
<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<title>글보기</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<script type="text/javascript">
<!--
$(function() {
	//달력
	$('.datepicker').datepicker({
		showOn: "both",
		dateFormat: "yy-mm-dd",
		changeYear: true,
		changeMonth: true,
		buttonImage: "/def/img/article/btn_calender.gif",
		buttonImageOnly: true,
		showButtonPanel: true,
		closeText: "닫기",
		onClose: function(){/**/}
	}).next('img').css('vertical-align', 'middle').css('margin-left','5px');
});

//완전삭제
function remove(){
	if (confirm("완전삭제 하시겠습니까?")) {
		$("#defaultForm").validationEngine('detach');
		$("#defaultForm").attr('action', 'delete.do');
		$("#defaultForm").submit();
	}else{
		return false;
	}
}
//삭제
function disable() {
	if (confirm("삭제하시겠습니까?")) {
		$("#defaultForm").validationEngine('detach');
		$("#defaultForm").attr('action', 'disable.do');
		$("#defaultForm").submit();
	}else{
		return false;
	}
}
//답변
function replyForm(){
	$("#defaultForm").validationEngine('detach');
	$("#defaultForm").attr('action', 'replyForm.do');
	$("#defaultForm").submit();
}
//수정
function updateForm(){
	$("#defaultForm").validationEngine('detach');
	$("#defaultForm").attr('action', 'updateForm.do');
	$("#defaultForm").submit();
}
//목록
function list(){
	$("#defaultForm").validationEngine('detach');
	$("#defaultForm").attr('method', 'post');
	$("#defaultForm").attr('action', 'list.do');
	$("#defaultForm").submit();
}
//-->
</script>
</head>
<body>

<form:form commandName="articleSearchVO" id="defaultForm" name="defaultForm" method="post" action="list.do">
${articleSearchVO.superHiddenTag}

<input type="hidden" id="boardKey" name="boardKey" value="${articleSearchVO.boardKey }" />
<input type="hidden" id="articleKey" name="articleKey" value="${articleVO.articleKey }" />

<!-- article_view -->
<div id="article_view">
	<!-- 게시판출력 -->
	<h4 class="skin2">
		${articleVO.title }
		<c:if test="${articleVO.secretFlg eq 'Y'}">
			<img src="/def/img/article/icon_secret.gif" alt="비밀글" />
		</c:if>
		<c:if test="${articleVO.operPrd <= boardVO.newPrd}">
			<img src="/def/img/article/icon_new.png" alt="새글" />
		</c:if>
	</h4>
	<div class="article_date">
		<dl>
			<dt>등록일 :</dt>
			<dd><fmt:formatDate pattern="yyyy-MM-dd" value="${articleVO.frstOperDt}" /></dd>
			<dt>작성자 :</dt>
			<dd>${articleVO.writer}</dd>
			<dt>조회수 :</dt>
			<dd>${articleVO.viewCnt}</dd>
		</dl>
	</div>
	<div class="article_cont">
		${fn:replace(articleVO.content, LF, '<br />')}
	</div>
	<div class="file_show">
		<c:if test="${boardVO.attachFlg eq 'Y'}">
			<c:if test="${not empty articleVO.fileList }">
				<div class="file_show">
					<p>
						첨부파일 ${fn:length(articleVO.fileList)}개
						<c:if test="${fn:length(articleVO.fileList) > 1}">
							&nbsp;&nbsp;&nbsp;
							<img src="/def/img/article/icon_multiple.gif" alt="전체 다운로드" />
							<a href="/attachfile/downloadAll.do?fileId=article_${articleVO.articleKey}" class="bd_btn_st1" target="downloadFrame">
								전체 다운로드
							</a>
						</c:if>
					</p>
					<ul>
						<c:forEach var="file" items="${articleVO.fileList }" varStatus="i">
							<li>
								<c:set var="extList" value="hwp,xls,xlsx,ppt,pptx,pdf,doc,docx" />
								<c:set var="ext" value="${fn:split(file.fileNm, '.')}" />
								<c:choose>
									<c:when test="${fn:indexOf(extList, ext[fn:length(ext)-1]) != -1}">
										<img src="/def/img/article/icon_${ext[fn:length(ext)-1]}.gif" alt="파일 다운로드" />
									</c:when>
									<c:otherwise>
										<img src="/def/img/article/icon_default.gif" alt="파일 다운로드" />
									</c:otherwise>
								</c:choose>
								<a href="/attachfile/downloadFile.do?fileId=${file.fileId}&amp;fileSeq=${file.fileSeq}" title="[다운로드]${fn:replace(file.fileNm, '&', '&amp;')}" target="downloadFrame">
									${fn:replace(file.fileNm, '&', '&amp;')}
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
		</c:if>
	</div>
	<!-- //게시판출력 -->

	<div class="article_bottom">
		<!-- 버튼 -->
		<p class="ta_r">
			<c:if test="${boardVO.replyFlg eq 'Y'}">
				<c:if test="${isUseGrpForReply}">
					<a href="#none" class="at_btn_st2" onclick="return replyForm();">답변</a>
				</c:if>
			</c:if>
			<c:if test="${isUseGrpForWrite}">
				<a href="#none" class="at_btn_st2" onclick="return updateForm();">수정</a>
				<a href="#none" class="at_btn_st2" onclick="return disable();">삭제</a>			
			</c:if>
			<a href="#none" class="at_btn_st2" onclick="list();">목록</a>
		</p>
		<!-- //버튼 -->
	</div>

	<c:if test="${boardVO.commentFlg eq 'Y'}">
		<div class="comment_area">
			<%@ include file="/WEB-INF/jsp/article/def/Comment.jsp" %>
		</div>
	</c:if>
</div>
<!-- //article_view -->


<!-- 목록 ============================================================== -->
<script type="text/javascript">
<!--
//검색
function searchList(){
	$('#currentPageNo').val('1');
	$("#defaultForm").attr('action', 'list.do');
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
<br /><br /><br />
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
		<p>검색건수 <strong><fmt:formatNumber value="${articleSearchVO.totalRecordCount}" /></strong> 건,&nbsp; 페이지 <strong> <span><fmt:formatNumber value="${articleSearchVO.currentPageNo}" /></span> / <fmt:formatNumber value="${articleSearchVO.totalPageCount}" /></strong></p>
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
				<th scope="col">번호</th>
				<c:if test="${boardVO.catgrFlg eq 'Y'}">
					<th scope="col">카테고리</th>
				</c:if>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">파일</th>
				<th scope="col">등록일</th>
				<th scope="col">조회</th>
			</tr>
		</thead>
		<tbody class="tb_center">
			<!-- articleList -->
			<c:forEach items="${noticeList }" var="item" varStatus="i">
				<tr>
					<td scope="row">
						<c:choose>
							<c:when test="${item.articleKey eq articleVO.articleKey}"><span style="color:blue;font-weight:bold;">공지</span></c:when>
							<c:otherwise>공지</c:otherwise>
						</c:choose>
					</td>
					<c:if test="${boardVO.catgrFlg eq 'Y'}">
						<td scope="row">
							-
						</td>
					</c:if>
					<td class="tx_al">
						<c:if test="${item.gkey > 0}">
							<c:forEach begin="1" end="${item.gkey }">
								&nbsp;&nbsp;&nbsp;
							</c:forEach>
							<img src="/def/img/article/icon_re.png" alt="답변글" />
						</c:if>
						<a href="#none" onclick="view('${item.articleKey}');" title="${item.title }">
							${item.title }
							<c:if test="${item.operPrd <= boardVO.newPrd}">
								<img src="/def/img/article/icon_new.png" alt="새글" />
							</c:if>
						</a>
					</td>
					<td>${item.writer }</td>
					<td>
						<c:if test="${not empty item.fileList}">
							<c:choose>
								<c:when test="${fn:length(item.fileList) > 1}">
									<a href="/attachfile/downloadAll.do?fileId=article_${item.articleKey}" target="downloadFrame">
										<img src="/def/img/article/icon_multiple.gif" alt="파일 다운로드" />
									</a>
								</c:when>
								<c:otherwise>
									<a href="/attachfile/downloadFile.do?fileId=${item.fileList[0].fileId}&amp;fileSeq=${item.fileList[0].fileSeq}" target="downloadFrame">
										<c:set var="extList" value="hwp,xls,xlsx,ppt,pptx,pdf,doc,docx" />
										<c:set var="ext" value="${fn:split(item.fileList[0].fileNm, '.')}" />
										<c:choose>
											<c:when test="${fn:indexOf(extList, ext[fn:length(ext)-1]) != -1}">
												<img src="/def/img/article/icon_${ext[fn:length(ext)-1]}.gif" alt="파일 다운로드" />
											</c:when>
											<c:otherwise>
												<img src="/def/img/article/icon_default.gif" alt="파일 다운로드" />
											</c:otherwise>
										</c:choose>
									</a>
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.frstOperDt}" /></td>
					<td>${item.viewCnt }</td>
				</tr>			
			</c:forEach>
			<!--//noticeList -->
			
			<!-- articleList -->
			<c:forEach items="${articleList }" var="item" varStatus="i">
				<tr>
					<td scope="row">
						<c:choose>
							<c:when test="${item.articleKey eq articleVO.articleKey}">
								<span style="color:blue;font-weight:bold;">${articleSearchVO.totalRecordCount-((articleSearchVO.currentPageNo-1)*articleSearchVO.recordCountPerPage)-(i.count-1) }</span>
							</c:when>
							<c:otherwise>
								${articleSearchVO.totalRecordCount-((articleSearchVO.currentPageNo-1)*articleSearchVO.recordCountPerPage)-(i.count-1) }
							</c:otherwise>
						</c:choose>
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
								<img src="/def/img/article/icon_re.png" alt="답변글" />
							</c:if>
						</c:if>
						<a href="#none" onclick="view('${item.articleKey}');" title="${item.title }">
							${item.title }
							<c:if test="${item.operPrd <= boardVO.newPrd}">
								<img src="/def/img/article/icon_new.png" alt="새글" />
							</c:if>
						</a>
					</td>
					<td>${item.writer }</td>
					<td>
						<c:if test="${not empty item.fileList}">
							<c:choose>
								<c:when test="${fn:length(item.fileList) > 1}">
									<a href="/attachfile/downloadAll.do?fileId=article_${item.articleKey}" target="downloadFrame">
										<img src="/def/img/article/icon_multiple.gif" alt="파일 다운로드" />
									</a>
								</c:when>
								<c:otherwise>
									<a href="/attachfile/downloadFile.do?fileId=${item.fileList[0].fileId}&amp;fileSeq=${item.fileList[0].fileSeq}" target="downloadFrame">
										<c:set var="extList" value="hwp,xls,xlsx,ppt,pptx,pdf,doc,docx" />
										<c:set var="ext" value="${fn:split(item.fileList[0].fileNm, '.')}" />
										<c:choose>
											<c:when test="${fn:indexOf(extList, ext[fn:length(ext)-1]) != -1}">
												<img src="/def/img/article/icon_${ext[fn:length(ext)-1]}.gif" alt="파일 다운로드" />
											</c:when>
											<c:otherwise>
												<img src="/def/img/article/icon_default.gif" alt="파일 다운로드" />
											</c:otherwise>
										</c:choose>
									</a>
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.frstOperDt}" /></td>
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
					<a href="#none" onclick="insertForm();" class="at_btn_st2">글쓰기</a>
				</c:if>
			</p>
		</div>
		<!-- //버튼 -->
	</div>
</div>

</form:form>
</body>
</html>