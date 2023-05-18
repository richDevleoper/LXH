<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
<%@ taglib prefix="attachfile" uri="http://www.freedi.kr/attachfile-taglib"%>

<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
	<title>${fn:split(boardVO.boardNm,'>')[fn:length(fn:split(boardVO.boardNm,'>'))-1]}</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	
	<link type="text/css" rel="stylesheet" href="<c:url value='/def/attachfile/css/jquery.fileupload.css'/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/def/attachfile/css/jquery.fileupload-ui.css'/>" />
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-tmpl.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.iframe-transport.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-process.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-validate.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/jquery.fileupload-jquery-ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/def/attachfile/js/attachfile-fileuploader.js'/>"></script>
</head>
<body>
<form:form id="defaultForm" name="defaultForm"  action="${action}" onsubmit="return false" method="post" modelAttribute="proposalVO" commandName="PROP_INFO">
<form:hidden value="${propSeq }" path="propSeq" id="propSeq"/>
<form:hidden path="propTypeCode" id="propTypeCode"/>
<form:hidden path="propRelMemoYn" id="propRelMemoYn"/>
<form:hidden path="propPropStatCode" id="propPropStatCode" value="${propPropStatCode }"/>
<input type="hidden" value="${crud }" id="crud"/>
                        <!-- breadcrumb -->
                        <div class="breadcrumb">
                            <ul>
                                <li>쪽지 제안정보</li>
                            </ul>
                        </div>
                        <p class="content_title">1. 쪽지 제안 정보</p>
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list">
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
                                                <th><label for="input-proposal-name"><span class="asterisk">*</span>제안명</label></th>
                                                <td colspan="3">${PROP_INFO.propName }</td>
                                            </tr>
                                            <tr>
                                                <th><label for="input-proposal"><span class="asterisk">*</span>제안자</label></th>
                                                <td colspan="3">${PROP_INFO.propUserName }</td>
                                            </tr>
                                            <tr>
                                                <th><span class="asterisk">*</span>조직명</th>
                                                <td id="text-proposal-group">${PROP_INFO.propGroupName }</td>
                                                <th><span class="asterisk">*</span>분임조</th>
                                                <td id="text-proposal-circle">${PROP_INFO.propCircleCode }</td>
                                            </tr>
                                            <tr>
                                                <th><label for="select-category-code"><span class="asterisk">*</span>제안유형</label></th>
                                                <td>${PROP_INFO.propCategoryCodeName }</td>
                                                <th><label for="input-proposal-date"><span class="asterisk">*</span>제안일</label></th>
                                                <td>${PROP_INFO.propDate }</td>
                                            </tr>
                                            <tr>
                                                <th colspan="4" class="align-center"><span class="asterisk">*</span>제안내용</th>
                                            </tr>
                                            <tr>
                                                <th><label for="textarea-proposal-problem">현상 및 문제점</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="textarea-proposal-problem" id="textarea-proposal-problem" rows="4" readonly>${PROP_INFO.propProblem }</textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="textarea-proposal-enhance">개선내용</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="textarea-proposal-enhance" id="textarea-proposal-enhance" rows="4" readonly>${PROP_INFO.propImprovementCont }</textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="textarea-proposal-effect">기대효과</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="textarea-proposal-effect" id="textarea-proposal-effect" rows="4" readonly>${PROP_INFO.propBenefit }</textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><span class="asterisk">*</span>결재자 지정</th>
                                                <td colspan="3" class="pd0">
                                                    <div class="list-wrap" style="margin:-1px">
                                                        <div class="list-content">
                                                            <div class="list-table list">
                                                                <table class="centered">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col>
                                                                        <col style="width:90px">
                                                                        <col style="width:90px">
                                                                        <col style="width:90px">
                                                                        <col style="width:90px">
                                                                    </colgroup>
                                                                    <thead>
                                                                        <tr>
                                                                            <th>소속</th>
                                                                            <th>이름</th>
                                                                            <th>직위</th>
                                                                            <th>직책</th>
                                                                            <th>Belt</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
	                                                                        <td class="pd3">${PROP_INFO.propApprovalName }</td>
	                                                                        <td id="text-approval-name">${PROP_INFO.propApprovalName }</td>
	                                                                        <td id="text-approval-level">${PROP_INFO.propApprovalLevel }</td>
	                                                                        <td id="text-approval-duty">${PROP_INFO.propApprovalDuty }</td>
	                                                                        <td id="text-approval-belt">${PROP_INFO.propApprovalBelt }</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <p class="content_title">2. 첨부파일 등록</p>
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table class="centered">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:180px">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>첨부파일 (신규/수정)</th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 input-text file">
                                                            <attachfile:fileuploader
																objectId="attachFileUpload"
																ctx=""
																wrapperId="attachFileUploadWrap"
																fileId="proposal_attach_${PROP_INFO.propSeq }"
																fileGrp="proposal"
																autoUpload="false"
																maxFileSize="${15*1000000}"
																maxNumberOfFiles="3"/>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>첨부파일 (조회)</th>
                                                <td>
                                                    <div class="file-link">
                                                        <ul>
                                                            <!-- <li><a href="#" title="다운받기">UI표준정의서.pptx</a><a href="#" title="다운받기" class="btn color gray mg-l15">다운받기</a></li> -->
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <p class="content_title">승인/반려_결재이력</p>
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table class="centered">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:160px">
                                            <col style="width:80px">
                                            <col style="width:60px">
                                            <col style="width:120px">
                                            <col style="width:130px">
                                            <col>
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>결재상태 및 결재일</th>
                                                <th>결재자</th>
                                                <th>직책</th>
                                                <th>결재종류</th>
                                                <th>평가점수(등급)</th>
                                                <th>결재의견</th>                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>준비중</td>
                                                <td>준비중</td>
                                                <td>준비중</td>
                                                <td>준비중</td>
                                                <td>준비중</td>
                                                <td>준비중</td>                                                
                                            </tr>
                                        </tbody>                                        
                                    </table>
                                </div>
                            </div>
                        </div>                        
                        
                        <div class="list-footer">
                            <div class="list-btns">               
                                <a href="/proposal/judge/list.do?menuKey=50" class="btn">목록</a>
                            </div>
                        </div>
</form:form> 
<script type="text/javascript">
	var proposalInfo = {};
	$(document).ready(function(){
	});
</script>
</body>
</html>