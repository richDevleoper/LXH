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

<link rel="StyleSheet" href="/csl/jquery/zooTree-1.0/css/zooTree.css" />
<script type="text/javascript" src="/csl/jquery/zooTree-1.0/js/zooTree.js"></script>
<script type="text/javascript">
<!--
$(function() {
	
	// search form validation start
	$("#defaultForm").validationEngine('attach', {
		unbindEngine:false,
		customFunctions : {
			//	
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
	$("#boardKey").attr('value', key);
	$("#defaultForm").submit();
}
//삭제
function remove(key) {
	if (confirm("해당 게시판의 게시글, 댓글, 첨부파일 정보가 모두 삭제됩니다\n삭제하시겠습니까?")) {
		$("#defaultForm").validationEngine('detach');
		$("#defaultForm").attr('action', 'delete.do');
		$("#boardKey").attr('value', key);
		$("#defaultForm").submit();
	}else{
		return false;
	}
}
//게시글목록
function articleList(key){
	$("#defaultForm").validationEngine('detach');
	$("#defaultForm").attr('action', '/csl/article/list.do');
	$("#boardKey").attr('value', key);
	$("#defaultForm").submit();
}

var isGetMenuList = false;
var actDefMenuList = [{"menuKey":0,"menuNm":"기본사이트","fkey":0,"pkey":-1,"okey":"0","linkTyp":"EMPTY"}];
var actEngMenuList = [{"menuKey":0,"menuNm":"영문사이트","fkey":0,"pkey":-2,"okey":"0","linkTyp":"EMPTY"}];
function viewMenu(){
	if(isGetMenuList){
		viewMenuDialog();
	}else{
		$.ajax({
			url:'/csl/menu/actTreeList.do'
		    ,method:"post"
			,dataType:'json'
			,async:true
			,data:{}
		    ,success:function(result, stat, xhr) {
		    	//console.log(result);
		    	if(result != null){
		    		isGetMenuList = true;
		    		actDefMenuList[0].childList = result.defTreeList;
		    		actEngMenuList[0].childList = result.engTreeList;
		    		
		    		//console.log(actDefMenuList);
		    		$("#defMenu").zooTree(actDefMenuList, {
		    			forceCreate: true 
		    			,children: 'childList'
		    			,render: function(data) {
		    				var $div = $("<a>").append(data.menuNm);
		    				$($div).attr('href', '#none');
		    				if(data.linkTyp == 'EMPTY'){
		    					$($div).addClass('folder');
		    					$($div).click(function(){
		    						$(this).next('ul').toggle();
		    					});
		    				}else if(data.linkTyp == 'BOARD'){
		    					$($div).attr('onclick', 'articleList("' + data.boardKey + '")');
		    					$($div).css('color', 'blue').css('font-weight','bold');
		    				}else{
		    					//$($div).css('color', '#999');
		    				}
		    				return $div;
		    			}
		    		});
		    		
		    		$("#engMenu").zooTree(actEngMenuList, {
		    			forceCreate: true 
		    			,children: 'childList'
		    			,render: function(data) {
		    				var $div = $("<a>").append(data.menuNm);
		    				$($div).attr('href', '#none');
		    				if(data.linkTyp == 'EMPTY'){
		    					$($div).addClass('folder');
		    					$($div).click(function(){
		    						$(this).next('ul').toggle();
		    					});
		    				}else if(data.linkTyp == 'BOARD'){
		    					$($div).attr('onclick', 'articleList("' + data.boardKey + '")');
		    					$($div).css('color', 'blue').css('font-weight','bold');
		    				}else{
		    					//$($div).css('color', '#999');
		    				}
		    				return $div;
		    			}
		    		});
		    	}
		    }
		    ,error : function(xhr, stat, err) {
		    	console.log(err);
		    }
		}).done(viewMenuDialog);
	}
}

function viewMenuDialog(){
	insertDialog = $('#viewMenu').dialog({
		css:{'background-color':'red'},
		autoOpen: false,
		height: 720,
		width: 1080,
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
//-->
</script>
</head>
<body>

<form:form commandName="boardSearchVO" id="defaultForm" method="get" action="list.do" >
${boardSearchVO.superHiddenTagWithoutToggle}

<input type="hidden" id="boardKey" name="boardKey" value="" />

<!-- 검색 -->
<div id="search_header">
	<div class="search">
		<fieldset>
			<legend class="hidden">검색</legend>
			<ul>
				<li>
					<label class="w_none" for="searchStartFrstOperDt">등록일자</label>
					<input type="text" id="searchStartFrstOperDt" name="searchStartFrstOperDt" value="${boardSearchVO.searchStartFrstOperDt}" class="validate[custom[date]] input_box datepicker" style="width:75px;" maxlength="10" />
					~
					<input type="text" id="searchEndFrstOperDt" name="searchEndFrstOperDt" value="${boardSearchVO.searchEndFrstOperDt}" class="validate[custom[date]] input_box datepicker" style="width:75px" maxlength="10" />
					
					<label class="w_none" for="searchActFlg">활성여부</label>
					<form:select path="searchActFlg">
						<form:option value="" label="전체" />
						<form:option value="Y" label="활성" />
						<form:option value="N" label="비활성" />
					</form:select>
					
					<label class="w_none" for="searchClass">검색구분</label>
					<form:select path="searchClass">
						<form:option value="BOARD_NM" label="게시판명" />
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
						<form:option value="BOARD_NM" label="게시판명" />
						<form:option value="FRST_OPER_DT" label="최근등록" />
					</form:select>
					<span class="result">검색결과 ( <fmt:formatNumber value="${boardSearchVO.totalRecordCount}" />건  )</span>
					<p class="btn">
						<button class="jCreateButton" style="background-color:#ddd;" onclick="viewMenu();return false;">메뉴 기준으로 보기</button>
						<button class="jCreateButton" onclick="insertForm();" <c:if test="${!userSession.mngrUser}">disabled="disabled"</c:if>>추가</button>
					</p>
				</li>
			</ul>
		</fieldset>
	</div>
</div>
<!-- 검색 //-->

<!-- 검색결과 -->
<table cellpadding="0" class="tb_base" summary="게시판 정보 목록 테이블 입니다.">
	<caption><span>목록</span></caption>
		<colgroup>
		<col style="width:5%" />
		<col style="width:41%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:8%"/>
		<col style="width:11%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">게시판명</th>
			<th scope="col">타입</th>
			<th scope="col">공지</th>
			<th scope="col">답변</th>
			<th scope="col">댓글</th>
			<th scope="col">기간</th>
			<th scope="col">비밀글</th>
			<th scope="col">활성</th>
			<th scope="col">등록일</th>
			<th scope="col">관리</th>
		</tr>
	</thead>
	<tbody class="list">
		<c:forEach items="${boardList }" var="item" varStatus="i">
		<tr>
			<td>
				${boardSearchVO.totalRecordCount-((boardSearchVO.currentPageNo-1)*boardSearchVO.recordCountPerPage)-(i.count-1) }
			</td>
			<td style="text-align:left;">
				<div><a href="#none" onclick="articleList('${item.boardKey}');">${item.boardNm}</a></div>
				<div class="moreInfo" style="padding-top:3px;">
					연결메뉴 :
					<c:choose>
						<c:when test="${item.linkMenuCnt == 0 }">
							없음
						</c:when>
						<c:otherwise>
							${item.linkMenuNm }
							<c:if test="${item.linkMenuCnt gt 1}">
								외 ${item.linkMenuCnt -1 }개
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
			</td>
			<td>
				<c:choose>
					<c:when test="${item.boardTyp eq 'basic' }">기본</c:when>
					<c:when test="${item.boardTyp eq 'photo' }"><span class="clr_info">포토</span></c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${item.noticeFlg eq 'Y' }">사용</c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${item.replyFlg eq 'Y' }">사용</c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${item.commentFlg eq 'Y' }">사용</c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${item.viewPrdFlg eq 'Y' }">사용</c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${item.secretFlg eq 'Y' }">사용</c:when>
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
				<button class="jButton" onclick="updateForm('${item.boardKey}');" <c:if test="${userSession.authId ne 'ROLE_MNGR_ADMIN'}">disabled="disabled"</c:if>>수정</button>
				<button class="jButton" onclick="return remove('${item.boardKey}');" <c:if test="${userSession.authId ne 'ROLE_MNGR_ADMIN'}">disabled="disabled"</c:if>>삭제</button>
			</td>
		</tr>
		</c:forEach>
		
		<c:if test="${empty boardList }">
		<tr>
			<td colspan="11">
				검색된 정보가 없습니다.
			</td>
		</tr>		
		</c:if>
		
	</tbody>
</table>
<!-- 검색결과 //-->

<!-- 페이징 -->
<ui:pagination paginationInfo="${boardSearchVO }" type="cslDefault" jsFunction="cfnPageLink" />
<!-- //페이징 -->

</form:form>

<div id="viewMenu" title="게시판관리(메뉴기준으로 보기)" style="display:none;">
	<div id="defMenu" class="horizontalTreeTop"></div>
	<div id="engMenu" class="horizontalTreeTop"></div>
</div>

</body>
</html>