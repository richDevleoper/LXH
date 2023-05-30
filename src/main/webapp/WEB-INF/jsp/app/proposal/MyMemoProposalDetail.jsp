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
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <form:input type="text" id="input-proposal-name" name="input-proposal-name" value="" title="제안명을 입력해주세요." path="propName"/>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="input-proposal"><span class="asterisk">*</span>제안자</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s037 input-text search">
                                                        	<%-- <form:input type="hidden" id="input-proposal-hidden" name="input-proposal-hidden" value="" path="propRegUser"/> --%>
                                                        	<form:input type="hidden" id="input-proposal-user" name="input-proposal-user" value="" path="propUser"/>
                                                        	<form:input type="hidden" id="input-proposal-belt-hidden" name="input-proposal-belt-hidden" value="" path="propBeltCode"/>
                                                        	<form:input type="hidden" id="input-proposal-bizplace-hidden" name="input-proposal-bizplacecode-hidden" value="" path="propBizPlaceCode"/>
                                                            <input type="text" id="input-proposal" name="input-proposal" value="${PROP_INFO.propUserName }" readonly="readonly" style="background-color: #FFF;"/>                                                            
                                                            <button type="button" class="btn-proposal-member-search-modal">검색</button>
                                                        </div>
                                                    </div>
                                                </td>                                               
                                            </tr>
                                            <tr>
                                                <th><label for="input-proposal-memo"><span class="asterisk">*</span>관련 쪽지 제안</label></th>
                                                <td id="text-proposal-group">${PROP_INFO.propGroupName }</td>
                                                <form:input type="hidden" id="input-proposal-group" name="input-proposal-group" value="" path="propGroupName"/>
                                                <th><span class="asterisk">*</span>분임조</th>
                                                <td id="text-proposal-circle">${PROP_INFO.propCircleName }</td>
                                                <form:input type="hidden" id="input-proposal-circle" name="input-proposal-circle" value="" path="propCircleCode"/>
                                            </tr>
                                            <tr>
                                                <th><label for="select-category-code"><span class="asterisk">*</span>제안유형</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select name="" id="select-category-code" title="제안유형 선택" path="propCategoryCode">
                                                                <option value="">선택</option>
                                                                <c:forEach var="item" items="${PP_CT_LIST }">
                                                                	<c:choose>
                                                                		<c:when test="${item.codeId eq PROP_INFO.propCategoryCode }">
                                                                			<option value="${item.codeId }" selected="selected">${item.codeNm }</option>
                                                                		</c:when>
                                                                		<c:otherwise>
                                                                			<option value="${item.codeId }">${item.codeNm }</option>
                                                                		</c:otherwise>
                                                                	</c:choose>                                                                	
                                                                </c:forEach>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><label for="input-proposal-date"><span class="asterisk">*</span>제안일</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col input-text input-date" style="padding-right: 0px; cursor: pointer;">
                                                            <form:input type="text" id="input-proposal-date" name="input-proposal-date" value="" class="datepicker" path="propDate" style="background-color: #FFF; cursor: inherit;" readonly="readonly"/>
                                                            <i class="ico calendar" style="background-size: 28px 29px; background-position: center; width: 28px; height: 29px;"></i>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <th colspan="4" class="align-center"><span class="asterisk">*</span>제안내용</th>
                                            </tr>
                                            <tr>
                                                <th><label for="textarea-proposal-problem">현상 및 문제점</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <form:textarea name="textarea-proposal-problem" id="textarea-proposal-problem" rows="4" path="propProblem"></form:textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="textarea-proposal-enhance">개선내용</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <form:textarea name="textarea-proposal-enhance" id="textarea-proposal-enhance" rows="4" path="propImprovementCont"></form:textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="textarea-proposal-effect">기대효과</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <form:textarea name="textarea-proposal-effect" id="textarea-proposal-effect" rows="4" path="propBenefit"></form:textarea>
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
	                                                                        <td class="pd3">
	                                                                            <div class="row">
	                                                                                <div class="col s12 input-text search">
	                                                                                	<form:input type="hidden" id="input-approval-code" name="input-approval-code" path="propApproverCode"/>
	                                                                                	<form:input type="hidden" id="input-approval-name" name="input-approval-name" path="propApprovalName"/>
	                                                                                	<form:input type="hidden" id="input-approval-user" name="input-approval-user" path="propApprovalUser"/>
	                                                                                    <form:input type="hidden" id="input-approval-level" name="input-approval-level" path="propApprovalLevelCode"/>
	                                                                                    <form:input type="hidden" id="input-approval-duty" name="input-approval-duty" path="propApprovalDutyCode"/>
	                                                                                    <form:input type="hidden" id="input-approval-belt" name="input-approval-belt" path="propApprovalBeltCode"/>
	                                                                                    <form:input type="hidden" id="input-approval-group-code" name="input-approval-group-code" path="propApprovalGroupCode"/>
	                                                                                    <form:input type="text" id="input-approval-group" name="input-approval-group" value="" readonly="readonly" style="background-color: #FFF;" path="propApprovalGroup"/>
	                                                                                    <button type="button" class="btn-approval-member-search-modal">검색</button>
	                                                                                </div>
	                                                                            </div>
	                                                                        </td>
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
																fileId="proposal_memo_attach_${PROP_INFO.propSeq }"
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
                        <div class="list-footer">
                            <div class="list-btns">
                                <button type="button" class="btn light-gray" id="btn-temp-save">저장</button>
                                <button type="button" class="btn bg-gray" id="btn-req-approval">결제의뢰</button>                                
                                <a href="/proposal/memolist.do?menuKey=49" class="btn">목록</a>
                            </div>
                        </div>
</form:form> 
<script type="text/javascript">
	var proposalInfo = {};
	$(document).ready(function(){
 		if($('#propPropStatCode').val() != 'PRG_1' && $('#crud').val() == 'U'){ // 결재진행중 상태
			$('input').attr('disabled', true);
			$('textarea').attr('disabled', true);
			$('button').prop('disabled', true);
			$('select').attr('disabled', true);
			$('i').prop('disabled', true);
		}else{
			$('input').attr('disabled', false);
			$('input').attr('disabled', false);
			$('textarea').attr('disabled', false);
			$('button').prop('disabled', false);
			$('select').attr('disabled', false);
			$('i').prop('disabled', false);
		}
 		
		//제안자 조회
		$('.btn-proposal-member-search-modal').off('click').on('click', function(){
			popEmp.init();
			
			popEmp.returnObjId = $('#input-proposal');
			popEmp.returnFunc = setProposalMemberInfo;
			
			popEmp.open();
		});
		
		//결재자 조회
		$('.btn-approval-member-search-modal').off('click').on('click', function(){
			popEmp.init();
			
			popEmp.returnObjId = $('#input-approval');
			popEmp.returnFunc = setApprovalMemberInfo;
			
			popEmp.open();			
		});
		
		//제안활동 내용 저장 (임시) - PRG_1
		$('#btn-temp-save').off('click').on('click', function(){
			setProposalInfoTempSave();
		});
		
		//제안활동 내용 결재 상신 - PRG_2
		$('#btn-req-approval').off('click').on('click', function(){
			setProposalInfoApprove();
		});
	});
	
	function setProposalMemberInfo(el, d){
		$('#input-proposal').val(d.userName);
		$('#input-proposal-user').val(d.comNo);
		$('#text-proposal-group').html(d.deptFullName);
		$('#input-proposal-group').val(d.deptFullName);
		$('#input-proposal-belt-hidden').val(d.comCertBelt);
		//$('#input-proposal-bizplace-hidden').val(d.comNo);
		
		$.post( "/proposal/selectCircleInfo.do", { comNo: d.comNo, deptCode: d.comDepartCode }, function(data){
			if(data != null && data.length > 0){
				var circleInfo = data[0];
				$('#input-proposal-circle').val(circleInfo.cirCode);
				$('#text-proposal-circle').html(circleInfo.cirName);
			}
		}, "json" );
	}
	
	function setApprovalMemberInfo(el, d){
		if(d.comPosition == null || d.comPosition == ''){
			alert('결재권한이 없는 사용자 입니다.\n다시 선택해 주세요.');
			$('#text-approval-name').html('');
			$('#text-approval-level').html('');
			$('#text-approval-duty').html('');
			$('#text-approval-belt').html('');
			
			$('#input-approval-name').val('');
			$('#input-approval-user').val('');
			$('#input-approval-level').val('');
			$('#input-approval-duty').val('');
			$('#input-approval-belt').val('');
			$('#input-approval-group-code').val('');
			$('#input-approval-group').val('');
			return false;
		}
		
		$('#text-approval-name').html(d.userName);
		$('#text-approval-level').html(d.comPositionNm);
		$('#text-approval-duty').html(d.comJobxNm);
		$('#text-approval-belt').html(d.comCertBeltNm);
		
		$('#input-approval-name').val(d.userName);
		$('#input-approval-user').val(d.comNo);
		$('#input-approval-level').val(d.comPosition);
		$('#input-approval-duty').val(d.comJobx);
		$('#input-approval-belt').val(d.comCertBelt);
		$('#input-approval-group-code').val(d.comDepartCode);
		$('#input-approval-group').val(d.deptFullName);
	}
	
	function setProposalInfoTempSave(){
		if(checkValidationInfo()){
			$('#propTypeCode').val('PPS_TYP_2'); // 구분코드
			if($('#propPropStatCode').val() == '' && $('#crud').val() == 'I'){
				$('#propPropStatCode').val('PRG_1'); // 제안상태코드
			}
			
			if(confirm('저장하시겠습니까?')){
				$('#defaultForm')[0].submit();
			}			
		}
	}
	
	function setProposalInfoApprove(){
		if(checkValidationInfo()){
			if($('#input-approval-name').val() == null || $('#input-approval-name').val() == ''){
				alert('결재자를 선택해 주세요.');
				return false;
			}
			
			if($('#input-approval-user').val() == null || $('#input-approval-user').val() == ''){
				alert('결재자를 선택해 주세요.');
				return false;
			}
			
			if($('#input-approval-level').val() == null || $('#input-approval-level').val() == ''){
				alert('결재자를 선택해 주세요.');
				return false;
			}
			
			if($('#input-approval-duty').val() == null || $('#input-approval-duty').val() == ''){
				alert('결재자를 선택해 주세요.');
				return false;
			}
			
			if($('#input-approval-group-code').val() == null || $('#input-approval-group-code').val() == ''){
				alert('결재자를 선택해 주세요.');
				return false;
			}
			
			if($('#input-approval-group').val() == null || $('#input-approval-group').val() == ''){
				alert('결재자를 선택해 주세요.');
				return false;
			}
			
			$('#propTypeCode').val('PPS_TYP_2'); // 구분코드
			$('#propPropStatCode').val('PRG_2'); // 결재의뢰		
			
			if(confirm('결재를 진행 하시겠습니까?')){
				$('#defaultForm')[0].submit();
			}					
		}		
	}
	
	function checkValidationInfo(){
		if($('#input-proposal-name').val().trim() == ''){
			alert('제안명을 입력해 주세요.'); $('#input-proposal-name').focus();
			return false;
		}
		
		if($('#input-proposal-user').val().trim() == '' || $('#input-proposal').val().trim() == ''){
			alert('제안자를 선택해 주세요.'); $('#input-proposal-user').focus();
			return false;
		}
		
		if($('#select-category-code').val() == ''){
			alert('제안 유형을 선택해 주세요.'); $('#select-category-code').focus();
			return false;
		}
		
		if($('#input-proposal-date').val().trim() == ''){
			alert('제안일을 선택해 주세요.'); $('#input-proposal-date').focus();
			return false;
		}
		
		if($('#textarea-proposal-problem').val().trim() == ''){
			alert('현상 및 문제점을 입력해 주세요.'); $('#textarea-proposal-problem').focus();
			return false;			
		}
		
		if($('#textarea-proposal-enhance').val().trim() == ''){
			alert('개선내용을 입력해 주세요.'); $('#textarea-proposal-enhance').focus();
			return false;
		}
		
		if($('#textarea-proposal-effect').val().trim() == ''){
			alert('기대효과를 입력해 주세요.'); $('#textarea-proposal-effect').focus();
			return false;
		}
		
		return true;
	}
</script>
</body>
</html>