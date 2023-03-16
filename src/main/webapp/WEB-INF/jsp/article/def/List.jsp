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
		buttonImage: "/def/img/article/btn_calender.gif",
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


<div class="list-wrap">
	<div class="list-search">
     	<!--  검색조건 -->
		<div class="search-form row">
			<div class="form-inline form-input col s5">
	        	<div class="col s2 align-right">
	                <label>조회기간</label>
	            </div>                                        
            <div class="pd-l10 col s10">
                <div class="col s5 input-date">
                    <input type="text" class="datepicker" readonly id="searchStartFrstOperDt" name="searchStartFrstOperDt" value="${articleSearchVO.searchStartFrstOperDt}" >
                    <i class="ico calendar"></i>
                </div>
                <span class="col s1 text-bul align-center">~</span>
                <div class="col s5 input-date">
                    <input type="text" class="datepicker" readonly id="searchEndFrstOperDt" name="searchEndFrstOperDt" value="${articleSearchVO.searchEndFrstOperDt}">
                    <i class="ico calendar"></i>
                </div>
			</div>
			</div>

<c:if test="${boardVO.catgrFlg eq 'Y'}">
<div class="form-inline form-input col s5">
			<label class="hidden" for="searchCatgr">카테고리</label>
			<select id="searchCatgr" name="searchCatgr" class="sel_type ml15" style="width:100px;">
				<option value="" >전체</option>	
				<c:forEach var="item" items="${catgrList }">
					<option value="${item.codeId}">${item.codeNm }</option>
				</c:forEach>
			</select>
</div>                                			
</c:if>

			<div class="form-inline form-input col s6">
            	<div class="col s2 align-right">
                	<label>검색어</label>
                </div>
                <div class="pd-l10 col s3">
                	<form:select path="searchClass" cssClass="sel_type ml15">
                	<form:option value="TITLE" label="제목" />
                	<form:option value="CONTENT" label="내용" />
                	<form:option value="WRITER" label="작성자" />
                	</form:select>
				</div>
                <div class="pd-l10 col s7">
	            	<form:input path="searchValue" cssClass="ip_type va_m" title="검색어"  />
                </div>
			</div>
				<div class="col s1 align-right">
                	<button type="button" class="btn-submit"  id="search" name="search"  onclick="searchList();">조회</button>
				</div>
			</div>
	</div>

	<div class="list-header">
		<p class="title">게시글 수<strong><fmt:formatNumber value="${articleSearchVO.totalRecordCount}" /></strong> 건,&nbsp; 페이지 <strong> <span><fmt:formatNumber value="${articleSearchVO.currentPageNo}" /></span> / <fmt:formatNumber value="${articleSearchVO.totalPageCount}" /></strong></p>
	</div>
	<div class="list-content">
		<div class="list-table">
			<table class="even">
				<thead>
					<tr>
						<th class="bg-gray">번호</th>
						<c:if test="${boardVO.catgrFlg eq 'Y'}">
							<th class="bg-gray">카테고리</th>
						</c:if>
						<th class="bg-gray">제목</th>
						<th class="bg-gray">작성자</th>
						<th class="bg-gray">파일</th>
						<th class="bg-gray">등록일</th>
						<th class="bg-gray">조회</th>
					</tr>
				</thead>
				<tbody>
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
										<img src="/def/img/article/icon_secret.gif" alt="비밀글" />
									</c:if>
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
												<img src="/def/img/board/icon_multiple.gif" alt="파일 다운로드" />
											</a>
										</c:when>
										<c:otherwise>
											<a href="/attachfile/downloadFile.do?fileId=${item.fileList[0].fileId}&amp;fileSeq=${item.fileList[0].fileSeq}" target="downloadFrame">
												<c:set var="extList" value="hwp,xls,xlsx,ppt,pptx,pdf,doc,docx" />
												<c:set var="ext" value="${fn:split(item.fileList[0].fileNm, '.')}" />
												<c:choose>
													<c:when test="${fn:indexOf(extList, ext[fn:length(ext)-1]) != -1}">
														<img src="/def/img/board/icon_${ext[fn:length(ext)-1]}.gif" alt="파일 다운로드" />
													</c:when>
													<c:otherwise>
														<img src="/def/img/board/icon_default.gif" alt="파일 다운로드" />
													</c:otherwise>
												</c:choose>
											</a>
										</c:otherwise>
									</c:choose>
								</c:if>
							</td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${item.frstOperDt}" />
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
		</div> <!--  list-table  -->
	</div> <!-- list-content -->
	
	<div class="list-footer">
		
              <ui:pagination paginationInfo="${articleSearchVO }" type="defDefault" jsFunction="cfnPageLink" />
        
          <div class="list-btns">              
              	<c:if test="${isUseGrpForWrite }">
					<a href="#none" onclick="insertForm();" class="at_btn_st2">글쓰기</a>
				</c:if>
          </div>
	</div> <!-- list-footer -->
	
</div>


</form:form>

</body>
</html>