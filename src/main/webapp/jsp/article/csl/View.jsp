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
<!doctype html>
<html lang="ko">
<head>
<title>글보기</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<script type="text/javascript">
$(function() {
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
//비활성
function disable() {
	if (confirm("비활성으로 변경하시겠습니까?")) {
		$("#defaultForm").validationEngine('detach');
		$("#defaultForm").attr('action', 'disable.do');
		$("#defaultForm").submit();
	}else{
		return false;
	}
}
//활성
function recovery() {
	if (confirm("비활성으로 변경하시겠습니까?")) {
		$("#defaultForm").validationEngine('detach');
		$("#defaultForm").attr('action', 'recovery.do');
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

//게시물이동
var isGetBoardList = false;
var boardActList;
function moveForm(){
	if(isGetBoardList){
		moveFormDialog();
	}else{
		$.ajax({
			url:'/csl/board/actList.do'
		    ,method:'post'
			,dataType:'json'
			,async:true
			,data:{}
		    ,success:function(result, stat, xhr) {
		    	//console.log(result);
		    	if(result != null){
		    		isGetBoardList = true;
		    		boardActList = result.boardActList;
		    		
		    		nowBoardKey = $('#boardKey').val();
		    		$newBoardKey = $('#newBoardKey');
		    		for(i=0; i<boardActList.length; i++){
		    			if(nowBoardKey != boardActList[i].boardKey){
			    			opt = "<option value=\"" + boardActList[i].boardKey + "\">" + boardActList[i].boardNm + "</option>";
			    			$newBoardKey.append(opt);
		    			}
		    		}
		    	}
		    }
		    ,error : function(xhr, stat, err) {
		    	console.log(err);
		    }
		}).done(moveFormDialog);
	}
}

function moveFormDialog(){
	insertDialog = $('#moveForm').dialog({
		css:{'background-color':'red'},
		autoOpen: false,
		height: 400,
		width: 720,
		modal: true,
		buttons: {
			"닫기": function(){insertDialog.dialog( "close" );}
		},
		close: function() {
			//
		}
	}).dialog('open');
	$(".ui-widget-overlay").css("background-color", "#000");
}

function move(){
	
	if($('#newBoardKey').val() == ''){
		alert('이동할 게시판을 선택하세요');
		$('#newBoardKey').focus();
		return false;
	}
	
	if(!confirm('이동하시겠습니까?')){
		return false;
	}
	
	$.ajax({
		url:'/csl/article/move.do'
	    ,method:'post'
		,dataType:'json'
		,async:true
		,data:{
			newBoardKey:$('#newBoardKey').val()
			,articleKey:$('#articleKey').val()
		}
	    ,success:function(result, stat, xhr) {
	    	//console.log(result);
	    	if(result != null){
	    		if(result.isAvail == 'true'){
	    			alert('이동되었습니다');
	    			list();
	    		}else{
	    			alert('이동중 오류가 발생했습니다');
	    		}
	    	}
	    }
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

//-->
</script>
</head>
<body>

<form:form commandName="articleSearchVO" id="defaultForm" name="defaultForm" method="post" action="list.do">
${articleSearchVO.superHiddenTag}

<input type="hidden" id="boardKey" name="boardKey" value="${articleSearchVO.boardKey }" />
<input type="hidden" id="articleKey" name="articleKey" value="${articleVO.articleKey }" />

<table class="tb_base" summary="">
	<caption><span>게시글</span></caption>
	<colgroup>
		<col style="width:15%"/>
		<col style="width:35%"/>
		<col style="width:15%"/>
		<col style="width:35%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col" colspan="4">게시글정보</th>
		</tr>
	</thead>
	<tbody class="write">
	
		<c:if test="${boardVO.catgrFlg eq 'Y'}">
			<tr>
				<th><label for="catgr">분류</label></th>
				<td colspan="3">
					<c:forEach var="item" items="${catgrList }">
						<c:if test="${item.codeId eq articleVO.catgr }">${item.codeNm }</c:if>
					</c:forEach>
				</td>
			</tr>
		</c:if>
		<tr>
			<th><label for="writer">작성자</label></th>
			<td colspan="3">${articleVO.writer }</td>
		</tr>
		<tr>
			<th><label for="noticeFlg">공지글여부</label></th>
			<td colspan="3" class="jLockRadio">
				<c:choose>
					<c:when test="${articleVO.noticeFlg eq 'Y' }"><span class="clr_info">공지글</span></c:when>
					<c:otherwise>일반글</c:otherwise>
				</c:choose>
			</td>
		</tr>
		
		<c:if test="${boardVO.viewPrdFlg eq 'Y' }">
			<tr>
				<th><label for="writer">게시기간</label></th>
				<td colspan="3">
					<c:if test="${not empty articleVO.viewStartDt or not empty articleVO.viewEndDt}">
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${articleVO.viewStartDt}" />
						~
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${articleVO.viewEndDt}" />
					</c:if>
				</td>
			</tr>
		</c:if>
		
		<tr>
			<th><label for="frstOperDt">활성여부</label></th>
			<td>
				<c:choose>
					<c:when test="${articleVO.deleteFlg eq 'Y' }">
						<span class="clr_warning">비활성</span> (by ${articleVO.deleteTyp })
					</c:when>
					<c:otherwise>활성</c:otherwise>
				</c:choose>
			</td>
			<th><label for="lastOperDt">조회수</label></th>
			<td><fmt:formatNumber value="${articleVO.viewCnt}" /></td>
		</tr>
		<tr>
			<th><label for="frstOperDt">최초등록ID</label></th>
			<td>${articleVO.frstOperId}</td>
			<th><label for="frstOperDt">최초등록 일시, IP</label></th>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${articleVO.frstOperDt}" />
				,
				${articleVO.frstOperIp}
			</td>
		</tr>
		<tr>
			<th><label for="lastOperDt">최종수정ID</label></th>
			<td>${articleVO.lastOperId}</td>
			<th><label for="lastOperDt">최종수정 일시, IP</label></th>
			<td>
				<c:if test="${not empty articleVO.lastOperDt }">
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${articleVO.lastOperDt}" />
					,
					${articleVO.lastOperIp}
				</c:if>
			</td>
		</tr>
		<tr>
			<th><label for="title">제목</label></th>
			<td colspan="3"><b>${articleVO.title }</b></td>
		</tr>
		<c:if test="${boardVO.attachFlg eq 'Y'}">
			<tr>
				<th><label for="title">첨부파일</label></th>
				<td colspan="3">
				<c:if test="${not empty articleVO.fileList }">
					<c:forEach var="file" items="${articleVO.fileList }" varStatus="i">
						<span style="display:block;padding:3px 0;">
							<fmt:formatNumber minIntegerDigits="2" value="${i.count}" />.
							<a href="/csl/attachfile/downloadFile.do?fileId=${file.fileId}&amp;fileSeq=${file.fileSeq}" title="[다운로드]${fn:replace(file.fileNm, '&', '&amp;')}" target="downloadFrame">
								${fn:replace(file.fileNm, '&', '&amp;')}
							</a>
						</span>
					</c:forEach>
					<c:if test="${fn:length(articleVO.fileList) > 1 }">
						<span style="display:block;padding:4px 20px;">
							<a href="/csl/attachfile/downloadAll.do?fileId=article_${articleVO.articleKey}"  target="downloadFrame" style="background-color:#ddd;padding:4px 8px;font-weight:bold;">
								전체 다운로드
							</a>
						</span>
					</c:if>
				</c:if>
				</td>
			</tr>
		</c:if>
		<tr>
			<th><label for="content">내용</label></th>
			<td colspan="3" style="height:360px;vertical-align:top;">
				<div>
					${fn:replace(articleVO.content, LF, '<br />')}
				</div>
			</td>
		</tr>
	</tbody>
</table>

<p class="btn_list">
	<button style="display:none;" title=""></button>
	<c:if test="${isMngr }">
		<c:if test="${articleVO.gkey == 0}">
			<button class="jSaveButton" onclick="moveForm(); return false;" title="게시물이동">게시물이동</button>
		</c:if>
		<button class="jDeleteButton" onclick="return remove();" title="완전삭제">완전삭제</button>
	</c:if>
	<c:choose>
		<c:when test="${isMngr }">
			<c:choose>
				<c:when test="${articleVO.deleteFlg eq 'Y' }">
					<button class="jDeleteButton" onclick="return recovery();" title="활성">활성</button>
				</c:when>
				<c:otherwise>
					<button class="jDeleteButton" onclick="return disable();" title="비활성">비활성</button>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<c:if test="${articleVO.deleteFlg eq 'N' }">
				<button class="jDeleteButton" onclick="return disable();" title="비활성">비활성</button>
			</c:if>
		</c:otherwise>
	</c:choose>
	<c:if test="${boardVO.replyFlg eq 'Y'}">
		<c:if test="${isMngr or isUseGrpForReply}">
			<button class="jSaveButton" onclick="return replyForm();" title="답변">답변</button>
		</c:if>
	</c:if>
	<c:if test="${isMngr or isUseGrpForWrite}">
		<button class="jSaveButton" onclick="return updateForm();" title="수정">수정</button>
	</c:if>
	<button class="jListButton" onclick="list();" title="목록">목록</button>
</p>

<div id="moveForm" title="게시물 이동" style="display:none;">
	<div>
		<table class="tb_base" summary="">
			<caption><span>게시글</span></caption>
			<colgroup>
				<col style="width:20%"/>
				<col style="width:80%"/>
			</colgroup>
			<tbody class="write">
				<tr>
					<th><label for="">선택한 게시물</label></th>
					<td>${articleVO.title }</td>
				</tr>
				<tr>
					<th><label for="">이동할 게시판</label></th>
					<td>
						<select id="newBoardKey" name="newBoardKey" class="sel_type">
							<option value="">이동할 게시판 선택</option>
						</select>
					</td>
				</tr>

				<tr>
					<th><label for="">참고사항</label></th>
					<td>
						* 답변글이 있는 경우, 최상위 글을 선택해야 이동이 가능합니다.
						<br />
						* 최상위 글 이동시, 하위의 답변글도 함께 이동됩니다.
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<p class="btn_list">
		<button class="jSaveButton" onclick="move(); return false;" title="이동">이동</button>
	</p>
</div>

<c:if test="${boardVO.commentFlg eq 'Y'}">
	<br /><br />
	<div class="comment_area">
		<%@ include file="/WEB-INF/jsp/article/csl/Comment.jsp" %>
	</div>
</c:if>

<!-- 목록 ============================================================== -->
<script type="text/javascript">
<!--
//검색
function searchList(){
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
			<th scope="col">비활성</th>
		</tr>
	</thead>
	<tbody class="list">
		<c:forEach items="${noticeList }" var="item" varStatus="i">
		<tr class="notice <c:if test="${item.articleKey eq articleVO.articleKey}">view</c:if>">
			<td>
				${articleSearchVO.totalRecordCount-((articleSearchVO.currentPageNo-1)*articleSearchVO.recordCountPerPage)-(i.count-1) }
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
							<a href="/attachfile/downloadAll.do?fileId=article_${item.articleKey}" target="downloadFrame">
								파일(${fn:length(item.fileList)})
							</a>
						</c:when>
						<c:otherwise>
							<a href="/attachfile/downloadFile.do?fileId=${item.fileList[0].fileId}&amp;fileSeq=${item.fileList[0].fileSeq}" target="downloadFrame">
								파일
							</a>
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
		
		<c:forEach items="${articleList }" var="item" varStatus="i">
		<tr <c:if test="${item.articleKey eq articleVO.articleKey}">class="view"</c:if>>
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
							<a href="/attachfile/downloadAll.do?fileId=article_${item.articleKey}" target="downloadFrame">
								파일(${fn:length(item.fileList)})
							</a>
						</c:when>
						<c:otherwise>
							<a href="/attachfile/downloadFile.do?fileId=${item.fileList[0].fileId}&amp;fileSeq=${item.fileList[0].fileSeq}" target="downloadFrame">
								파일
							</a>
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
		<c:if test="${empty articleList and empty articleList }">
			<tr>
				<td colspan="8">검색된 정보가 없습니다.</td>
			</tr>
		</c:if>
		
	</tbody>
</table>
<!-- 검색결과 //-->

<!-- 페이징 -->
<ui:pagination paginationInfo="${articleSearchVO }" type="cslDefault" jsFunction="cfnPageLink" />
<!-- //페이징 -->
</form:form>


<br /><br /><br />
<!-- //목록 ============================================================== -->
</body>
</html>