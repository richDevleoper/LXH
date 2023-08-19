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
<style>
#article_view h4.skin1{padding:20px 0; border-top:2px solid #151515; border-bottom:1px solid #aaaaaa; font-size:14px; color:#333; text-align:center;}
#article_view h4.skin2{padding:20px 0; border-top:2px solid #151515; border-bottom:1px solid #aaaaaa; font-size:14px; color:#333; text-align:center; background:#fafafa;}
#article_view h4 img {vertical-align:middle; }
#article_view .article_date{padding:13px 0 11px 10px; color:#5c6472; text-align:right;}
#article_view .article_date dl{overflow:hidden;}
#article_view .article_date dl dt{display:inline; padding:0; margin:0; font-weight:bold; color:#555;}
#article_view .article_date dl dd{display:inline; padding:0 20px 0 0; margin:0; color:#666;}

#article_view .article_cont{min-height:200px; padding:20px 10px;   color:#5c6472; text-align:left; line-height:180%; text-align:justify;}
#article_view .movie_cont{overflow:hidden; _height:1%; padding:20px 10px;}
#article_view .movie_cont p.movie_area {float:left; width:50%; padding:15px; background:#f8f8f8; border:1px solid #b4b4b4;}
#article_view .movie_cont p.movie_area img{width:100%;}
#article_view .movie_cont .movie_content{float:right; width:40%; margin-top:15px;}
#article_view .movie_cont .movie_content h4{font-size:13px; letter-spacing:-1px;}
#article_view .movie_cont .movie_summary{overflow-y:scroll; width:94%; height:250px; margin-top:10px; padding:10px 7px; line-height:18px; text-align:justify;}

#article_view .file_show{color:#555;}
#article_view .file_show p{border-bottom:1px dotted #b9b9b9;}
#article_view .file_show p img{ vertical-align:middle; padding-bottom:1px;}
#article_view .file_show p a{padding:13px 0 11px 2px; color:#666; font-weight:bold;}
#article_view .file_show ul{overflow:hidden; padding:13px 0 11px 0;  }
#article_view .file_show ul li{float:left; width:48%; /*width:48.8%;*/ padding:5px 0 4px 12px; vertical-align:middle;}
#article_view .file_show ul li img{ vertical-align:middle; padding-bottom:3px;}
#article_view .file_show ul li a{padding:13px 0 11px 2px; color:#666; font-weight:bold;}

.article_cont img { width: 70% !important;}

.hidden {display: none;}


/* 댓글 */
.cmnt_view{margin:20px 0 0 0;}
.cmnt_view p.cmnt_count{padding:0 0 0 10px; font-weight:bold; color:#555;}
.cmnt_view .cmntListWrap{width:96%; margin:5px 0 0 0; padding:0 2% 10px 2%; background:#f4f4f4;}
.cmnt_view .cmntListWrap ul{margin-bottom:20px;border-bottom:1px dotted #aaa}
.cmnt_view .cmntListWrap ul li{position:relative; margin:0 0 15px 0; padding:15px 0 0 0; border-top:1px dotted #aaa;}
.cmnt_view .cmntListWrap ul li.first{border-top:0;}
.cmnt_view .cmntListWrap ul li:first-child{border:0;}
.cmnt_view .cmntListWrap ul li.reply{padding:0 0 15px 30px; border:0; background:url(/def/img/article/bu_reply.png) no-repeat 18px 0;}
.cmnt_view .cmntListWrap ul li .user{padding:5px 0 0 20px; font-size:13px; font-weight:bold; color:#555; background:url(/def/img/article/icon_rp_wt.gif) no-repeat;}
.cmnt_view .cmntListWrap ul li .date{margin:0 5px; font-size:12px; font-weight:normal; color:#999;}
.cmnt_view .cmntListWrap ul li .answer{position:absolute; top:17px; right:0;}
.cmnt_view .cmntListWrap ul li .answer a{font-size:12px; font-weight:normal; color:#888;}
.cmnt_view .cmntListWrap ul li .answer span{padding:0 0 0 10px; /*background:url(/def/img/article/article_bar.gif) no-repeat 5px 2px;*/}
.cmnt_view .cmntListWrap ul li .cmnt_wt_cont{width:88%; margin:10px 0 0 15px; font-weight:normal; color:#555; line-height:18px;}
.cmnt_view .cmntListWrap ul li .cmnt_wt_cont .reply_user{display:inline-block; margin:0 5px 0 0;}
.cmnt_view .cmntListWrap ul li .cmnt_wt_cont .reply_user a{font-weight:normal; color:#888;}

/* 댓글등록 */
.cmnt_write{position:relative; width:100%; padding:0;}
.cmnt_write input{border:1px solid #dadada; height:17px;}
.cmnt_write .cancel{position:absolute; top:0; right:0;}
.cmnt_write .cancel a{font-size:12px; font-weight:normal; color:#888;}
.cmnt_write .cancel span{padding:0 0 0 10px; }
.cmnt_write label{padding:5px 6px 4px 6px;background-color:#e7e7e7;}
.cmnt_write textarea{float:left; width:85%; height:62px; margin:0 0 20px 0; border:1px solid #dadada; font-size:12px; color:#666; padding:10px 1%;}
.cmnt_write .btn_signup{float:right; display:inline-block; width:11%;}
.cmnt_write .btn_signup a{display:block; width:80%; height:35px; padding:37px 10% 10px 10%; background:#fff; border:1px solid #bbb; text-align:center; font-size:12px; color:#666;}
.cmnt_write .text_num{display:inline;padding-left:5px;}
.cmnt_write .text_num b{color:#ff6257;}

/* 검색영역 */
#article_header {width:100%;}
	#article_search {width:99.8%; padding:15px 0; margin:0 auto; text-align:center; border:1px solid #e2e2e2; background:#fafafa;}
	#article_sel label{font-weight:bold;}
	#article_sel .btn_st1{height:29px; padding:6px 15px 8px 15px; background:#888; text-align:center; font-size:13px; color:#fff; border:0;}
	#page_info {margin:30px 0 0 0; color:#555;}
	#page_info span{color:#222;}
	.at_calender{width:26px; height:25px; border:0; background:url("/def/img/article/btn_calender.gif") no-repeat;}



</style>
<script type="text/javascript">

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

</script>
</head>
<body>

<form:form commandName="articleSearchVO" id="defaultForm" name="defaultForm" method="post" action="list.do">
${articleSearchVO.superHiddenTag}

<input type="hidden" id="boardKey" name="boardKey" value="${articleSearchVO.boardKey }" />
<input type="hidden" id="articleKey" name="articleKey" value="${articleVO.articleKey }" />


                        <!-- breadcrumb -->
                        <div class="breadcrumb">
                            <ul>
                                <li>
								${articleVO.title }
										<c:if test="${articleVO.secretFlg eq 'Y'}">
											<img src="/def/img/article/icon_secret.gif" alt="비밀글" />
										</c:if>
										<c:if test="${articleVO.operPrd <= boardVO.newPrd}">
											<img src="/def/img/article/icon_new.png" alt="새글" />
										</c:if>
								</li>
                            </ul>
                        </div>
                        <p class="content_title"> </p>
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list" id="article_view">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:180px">
                                            <col>
                                            <col style="width:180px">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th><label for="text1">등록일</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${articleVO.frstOperDt}" />
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><label for="text1">작성자</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            ${articleVO.writer}
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text1">조회수</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            ${articleVO.viewCnt}
                                                        </div>
                                                    </div>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <th><label for="text1">내용</label></th>
                                                <td colspan="3">
                                                    <div class="row">
														<div class="article_cont">
															${fn:replace(articleVO.content, LF, '<br />')}
														</div>
                                                    </div>
                                                </td>
                                            </tr>
		<c:if test="${boardVO.attachFlg eq 'Y'}">
			<c:if test="${not empty articleVO.fileList }">

                                            <tr>
                                                <th><label for="select4">첨부파일</label></th>
                                                <td colspan="3">
                                                    <div class="row">

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
                                                     
                                                    </div>
                                                </td>
                                            </tr>
			</c:if>
		</c:if>                                 
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="list-footer">
                            <div class="list-btns">
                            
								<c:if test="${boardVO.replyFlg eq 'Y'}">
									<c:if test="${isUseGrpForReply}">
										<button type="button" class="btn bg-gray" onclick="return replyForm();">답변</button>
									</c:if>
								</c:if>
								<c:if test="${isUseGrpForWrite}">
									<a href="#none" class="at_btn_st2 btn bg-gray" onclick="return updateForm();">수정</a>
									<!-- <a href="#none" class="at_btn_st2 btn bg-gray" onclick="return disable();">삭제</a> -->
									<!--  삭제는 CMS 관리자만 가능하게 임시방편  -->			
								</c:if>
								<a href="#none" class="at_btn_st2 btn" onclick="list();">목록</a>                            
                            
                                
                            </div>
                        </div>


		<c:if test="${boardVO.commentFlg eq 'Y'}">              
                                           
														<div class="comment_area" style="font-size: small;">
															<%@ include file="/WEB-INF/jsp/article/def/Comment.jsp" %>
														</div>
		</c:if>     



</form:form>
</body>
</html>