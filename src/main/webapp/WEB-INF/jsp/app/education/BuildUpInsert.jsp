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
	
	<style>
		.td-user-nm, .td-com-jobx, .td-com-pos, .td-belt-nm  { text-align: center !important;}
	</style>
</head>
<body>

                        <!-- breadcrumb -->
                        <div class="breadcrumb">
                            <ul>
                                <li>교육과정 등록</li>
                            </ul>
                        </div>
                        
                        <form:form commandName="frmEducation" id="defaultForm" name="defaultForm"  action="${action}" onsubmit="return false" method="post" modelAttribute="educationVO">
                        <form:hidden path="eduCode" />
                        <form:hidden path="eduFileCode" />
                        <form:hidden path="eduQuater" />
                        <form:hidden path="eduDate" />
						<form:hidden path="mode" />
                        
                        <div class="list-wrap  mg-t20">
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
                                                <th><label for="text1"><span class="asterisk">*</span>교육과정명</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <form:input type="text" id="eduName" path="eduName" value="" title="교육과정명을 입력해주세요." cssClass="validate[required]"/>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text2"><span class="asterisk">*</span>교육연도</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select path="eduYear">
				                                                <option value="">전체</option>
				                                                <c:forEach var="i"  begin="2023" end="2025">
															        <option value="${i}" <c:if test="${i eq educationVO.eduYear }">selected</c:if> >${i}년</option>
															    </c:forEach>
				                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><label for="text3"><span class="asterisk">*</span>벨트</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select path="eduBeltCode">
				                                                <option value="">전체</option>
				                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><span class="asterisk">*</span>교육유형</th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select path="eduClassType">
				                                                <option value="">전체</option>
				                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><span class="asterisk">*</span>상세유형</th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select path="eduClassDivision">
				                                                <option value="">전체</option>
				                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="select1"><span class="asterisk">*</span>교육차수</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <form:select path="eduNumber">
				                                                <option value="">전체</option>
				                                                <c:forEach var="i"  begin="1" end="4">
															        <option value="${i}" <c:if test="${i eq educationVO.eduNumber }">selected</c:if> >${i}차</option>
															    </c:forEach>
				                                            </form:select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><label for="text4"><span class="asterisk">*</span>교육정원</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 input-text">                                                            
                                                            <form:input type="text" id="eduFixed" path="eduFixed" value="" title="교육정원을 입력해주세요." cssClass="validate[required]" />
                                                        </div>
                                                    </div>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text1"><span class="asterisk">*</span>교육일정</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                    	<div class="col s2 select-group">
                                                    		<form:select path="eduDateDiv">
				                                                <option value="">전체</option>
				                                    			<option value="01" <c:if test="${'01' eq educationVO.eduDateDiv }">selected</c:if> >단일</option>
				                                    			<option value="02" <c:if test="${'02' eq educationVO.eduDateDiv }">selected</c:if> >격일</option>
				                                    			<option value="03" <c:if test="${'03' eq educationVO.eduDateDiv }">selected</c:if> >범위</option>
				                                            </form:select>
                                                    	</div>
                                                        
                                                        <div id="d1" class="col s3 input-text input-date" style="padding-left: 5px; display:none;">
                                                            <%-- <form:input type="text" path="eDate01" cssClass="datepicker"/>  --%>
                                                            <form:input type="text" id="eDate01" name="eDate01" value="" path="eDate01" style="background-color: #FFF; cursor: inherit;" readonly="readonly"/>
				                                            <i class="ico calendar"></i>
                                                        </div>
                                                        
                                                        
                                                        <div id="d2" class="col s5 input-text input-date" style="padding-left: 5px; display:none;">
                                                        	<form:input type="text" id="eDate02" name="eDate02" value="" path="eDate02" style="background-color: #FFF; cursor: inherit;" readonly="readonly"/>    
                                                            <form:hidden path="eduDate2" id="eduDate2"/>
                                                            <i class="ico calendar" style="background-size: 28px 29px; background-position: center; width: 28px; height: 29px;"></i>
                                                        </div>
                                                        
                                                        <div id="d3" class="col s10 input-text input-date" style="padding-left: 5px; display:none;">
				                                            <div class="col s5 input-date">
				                                                <%-- <form:input type="text" path="eduFromDt" cssClass="datepicker"/> --%> 
				                                                <form:input type="text" id="eduFromDt" name="eduFromDt" value="" path="eduFromDt" style="background-color: #FFF; cursor: inherit;" readonly="readonly"/>
				                                                <i class="ico calendar"></i>
				                                            </div>
				                                            <span class="col s1 text-bul align-center">~</span>
				                                            <div class="col s5 input-date">
				                                                <%-- <form:input type="text" path="eduToDt" cssClass="datepicker"/> --%>
				                                                <form:input type="text" id="eduToDt" name="eduToDt" value="" path="eduToDt" style="background-color: #FFF; cursor: inherit;" readonly="readonly"/>
				                                                <i class="ico calendar"></i>
				                                            </div>
				                                        </div>
                                                    </div>
                                                    
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <th colspan="4" class="align-center"><span class="asterisk">*</span>교육내용</th>
                                            </tr>
                                            <tr>
                                                <th><label for="text6"><span class="asterisk">*</span>교육방식</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                    <%-- <pre><c:out value="${educationVO.eduClassIntro}" /></pre> --%>
                                                         <div class="col s12 input-text">
                                                            <form:textarea name="eduClassIntro" id="eduClassIntro" rows="4" path="eduClassIntro" value="${educationVO.eduClassIntro}"></form:textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text7"><span class="asterisk">*</span>대상자</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <form:textarea name="eduClassTarget" id="eduClassTarget" rows="4" path="eduClassTarget"></form:textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text8"><span class="asterisk">*</span>이수기준</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <form:textarea name="eduClassSummary" id="eduClassSummary" rows="4" path="eduClassSummary"></form:textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>   
                                            <tr>
                                                <th><label for="text8"><span class="asterisk">*</span>준비사항</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <form:textarea name="eduItem" id="eduItem" rows="4" path="eduItem"></form:textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>                                                               
                                            <tr>
                                                <th>첨부파일 (신규/수정)</th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text file">
                                                            <attachfile:fileuploader
															objectId="fileUploadObj_01"
															ctx=""
															wrapperId="fileUploadWrap"
															fileId="education_${educationVO.eduFileCode}"
															fileGrp="education"
															autoUpload="false"
															maxFileSize="${15*1000000}"
															maxNumberOfFiles="10"/>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>첨부파일 (조회)</th>
                                                <td colspan="3">
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
                                <button type="button" class="btn bg-gray" id="btnSave">교육등록</button>                                
                                <a href="/education/buildup.do?menuKey=67" class="btn">목록</a>
                            </div>
                        </div>
						</form:form>
						
        <!-- 조직도 -->
        <div class="modal-dimmed"></div>
        <div class="org-modal">
            <div class="modal-header">
                <h4>이미지 크게보기</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <figure>
                    <img src="/assets/images/@sample.jpg" width="100%" alt="">
                </figure>
            </div>
        </div>
        
        
<script type="text/javascript">
$(document).ready(function(){
	initCode();
	
	$("#eDate02").off("keyup").on("keyup", function(e){
		$("#eduDate2").val("");
		let eduDate = $("#eDate02").val();
		$("#eduDate2").val(eduDate);
	});
	
	$("#eduFixed").off("keyup").on("keyup", function(e){
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	
	$("#eDate01").datepicker({
        dateFormat:"yy/mm/dd",
        dayNamesMin:["일","월","화","수","목","금","토"],
        monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
        onSelect:function(d){
            var arr=d.split("/");
            var year=arr[0];
            var month=arr[1];
            var day=arr[2];
            let target = month + "/" + day;
            $("#eDate01").val(target);
        }
    });
	 
	$("#eDate02").datepicker({
        dateFormat:"yy/mm/dd",
        dayNamesMin:["일","월","화","수","목","금","토"],
        monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
        onSelect:function(d){
            var arr=d.split("/");
            var year=arr[0];
            var month=arr[1];
            var day=arr[2];
          
            console.log(year + " / " + month + " / " + day);
            let target = month + "/" + day;
            let eduDate2 = $("#eduDate2").val();
            
            let setDate = "";
            if($.trim(eduDate2).length > 0){
            	setDate = eduDate2 + "," + target;
            }else{
            	setDate = target;
            }
            
            $("#eduDate2").val(setDate);
            $("#eDate02").val( $("#eduDate2").val());
        }
    });
	
	$("#eduFromDt").datepicker({
        dateFormat:"yy/mm/dd",
        dayNamesMin:["일","월","화","수","목","금","토"],
        monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
        onSelect:function(d){
            var arr=d.split("/");
            var year=arr[0];
            var month=arr[1];
            var day=arr[2];
            let target = month + "/" + day;
            $("#eduFromDt").val(target);
        }
    });
	
	$("#eduToDt").datepicker({
        dateFormat:"yy/mm/dd",
        dayNamesMin:["일","월","화","수","목","금","토"],
        monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
        onSelect:function(d){
            var arr=d.split("/");
            var year=arr[0];
            var month=arr[1];
            var day=arr[2];
            let target = month + "/" + day;
            $("#eduToDt").val(target);
        }
    });
	
	$('#btnSave').off('click').on('click', function(){
		if(checkValidation()){			
			if(confirm('저장하시겠습니까?')){
				$('#defaultForm')[0].submit();
			}			
		}
	}); 
	
	$("#eduDateDiv").on("change", function(){
		let val = $(this).val();
		console.log(val);
		if(val == "01"){
			$("#d1").show();
			$("#d2").hide();
			$("#d3").hide();
		}else if(val == "02"){
			$("#d1").hide();
			$("#d2").show();
			$("#d3").hide();
		}else if(val == "03"){
			$("#d1").hide();
			$("#d2").hide();
			$("#d3").show();
		}
	});
	
	$("#eduBeltCode").on("change", function(){
		selectBeltCode();
	}); 
	
	$("#eduClassType").on("change", function(){
		selectBeltCode();
	});
 	
	$("#defaultForm").validationEngine('attach', {
		unbindEngine:false,
		validationEventTrigger: "submit",
		promptPosition : "topLeft",
		showOneMessage : true,
		customFunctions: {
			//
		},
		onValidationComplete: function(form, status){
			if(status == true) {
				if(confirm("저장하시겠습니까?")) {
					//contentsEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
					//$("#defaultForm").submit();
					return true;
				} 
				return false;
			}
		}
	});
});

function selectBeltCode(){
	let eduBeltCode = $("#eduBeltCode").val();
	let eduClassType = $("#eduClassType").val();
	
	var vHtml = [];
	// GB
	if(eduBeltCode == "D000"){
		if(eduClassType == "01"){
			vHtml.push("<option value=''>전체</option>");
			vHtml.push("<option value='01'>온라인 동영상 교육</option>");
			vHtml.push("<option value='02'>온라인 실시간 교육</option>");
		}else if(eduClassType == "02"){
			vHtml.push("<option value=''>전체</option>");
			vHtml.push("<option value='07'>통계Test</option>");
		}
	// BB
	}else if(eduBeltCode == "D001"){
		if(eduClassType == "01"){
			vHtml.push("<option value=''>전체</option>");
			vHtml.push("<option value='01'>온라인 동영상 교육</option>");
			vHtml.push("<option value='02'>온라인 실시간 교육</option>");
		}else if(eduClassType == "02"){
			vHtml.push("<option value=''>전체</option>");
			vHtml.push("<option value='07'>통계Test</option>");
			vHtml.push("<option value='08'>과제Test</option>");
		}
	// MBB	
	}else if(eduBeltCode == "D002"){
		if(eduClassType == "01"){
			vHtml.push("<option value=''>전체</option>");
			vHtml.push("<option value='01'>온라인 동영상 교육</option>");
			vHtml.push("<option value='02'>온라인 실시간 교육</option>");
			vHtml.push("<option value='03'>6σ Process 과정</option>");
			vHtml.push("<option value='04'>통계적 사고 과정</option>");
			vHtml.push("<option value='05'>고급 통계 과정</option>");
			vHtml.push("<option value='06'>Summary</option>");
		}else if(eduClassType == "02"){
			vHtml.push("<option value=''>전체</option>");
			vHtml.push("<option value='07'>통계Test</option>");
			vHtml.push("<option value='08'>과제Test</option>");
			vHtml.push("<option value='09'>자질Test</option>");
		}
	// MGB
	}else if(eduBeltCode == "D003"){
		if(eduClassType == "01"){
			vHtml.push("<option value=''>전체</option>");
			vHtml.push("<option value='01'>온라인 동영상 교육</option>");
			vHtml.push("<option value='02'>온라인 실시간 교육</option>");
		}else if(eduClassType == "02"){
			vHtml.push("<option value=''>전체</option>");
			vHtml.push("<option value='07'>통계Test</option>");
			vHtml.push("<option value='08'>과제Test</option>");
		}
	}
	$("#eduClassDivision").html(vHtml.join(''));
}

function initCode(){
	let codes = [
		<c:forEach var="item" items="${allCodes}">{index:"${item.codeGrpId}",key:"${item.codeId}",value:"${item.codeNm}"},
		</c:forEach>
	];
	
	cdEduType1 = codes.filter(function(code){ return code.index==="ED_TY1";});
	cdEduType2 = codes.filter(function(code){ return code.index==="ED_TY2";});
	cdEduType3 = codes.filter(function(code){ return code.index==="ED_TY3";});
	
	setDropDown("eduBeltCode", cdEduType2, true, "전체");			//인증벨트
	$("#eduBeltCode").val("${educationVO.eduBeltCode}");
	
	setDropDown("eduClassType", cdEduType1, true, "전체");				//교육유형
	$("#eduClassType").val("${educationVO.eduClassType}")
	
	//setDropDown("eduClassDivision", cdEduType3, true, "전체");			//상세유형
	//$("#eduClassDivision").val("${educationVO.eduClassDivision}");
	
	let mode = $("#mode").val();

	if(mode=="U"){
		let eduBeltCode = $("#eduBeltCode").val();
		let eduClassType = $("#eduClassType").val();
		let eduDateDiv = $("#eduDateDiv").val();
		let eduDate = $("#eduDate").val();
		console.log(eduDateDiv + " / " + eduDate);
		
		
		var vHtml = [];
		// GB
		if(eduBeltCode == "D000"){
			if(eduClassType == "01"){
				vHtml.push("<option value=''>전체</option>");
				vHtml.push("<option value='01'>온라인 동영상 교육</option>");
				vHtml.push("<option value='02'>온라인 실시간 교육</option>");
			}else if(eduClassType == "02"){
				vHtml.push("<option value=''>전체</option>");
				vHtml.push("<option value='07'>통계Test</option>");
			}
		// BB
		}else if(eduBeltCode == "D001"){
			if(eduClassType == "01"){
				vHtml.push("<option value=''>전체</option>");
				vHtml.push("<option value='01'>온라인 동영상 교육</option>");
				vHtml.push("<option value='02'>온라인 실시간 교육</option>");
			}else if(eduClassType == "02"){
				vHtml.push("<option value=''>전체</option>");
				vHtml.push("<option value='07'>통계Test</option>");
				vHtml.push("<option value='08'>과제Test</option>");
			}
		// MBB	
		}else if(eduBeltCode == "D002"){
			if(eduClassType == "01"){
				vHtml.push("<option value=''>전체</option>");
				vHtml.push("<option value='01'>온라인 동영상 교육</option>");
				vHtml.push("<option value='02'>온라인 실시간 교육</option>");
				vHtml.push("<option value='03'>6σ Process 과정</option>");
				vHtml.push("<option value='04'>통계적 사고 과정</option>");
				vHtml.push("<option value='05'>고급 통계 과정</option>");
				vHtml.push("<option value='06'>Summary</option>");
			}else if(eduClassType == "02"){
				vHtml.push("<option value=''>전체</option>");
				vHtml.push("<option value='07'>통계Test</option>");
				vHtml.push("<option value='08'>과제Test</option>");
				vHtml.push("<option value='09'>자질Test</option>");
			}
		// MGB
		}else if(eduBeltCode == "D003"){
			if(eduClassType == "01"){
				vHtml.push("<option value=''>전체</option>");
				vHtml.push("<option value='01'>온라인 동영상 교육</option>");
				vHtml.push("<option value='02'>온라인 실시간 교육</option>");
			}else if(eduClassType == "02"){
				vHtml.push("<option value=''>전체</option>");
				vHtml.push("<option value='07'>통계Test</option>");
				vHtml.push("<option value='08'>과제Test</option>");
			}
		}
		$("#eduClassDivision").html(vHtml.join(''));
		$("#eduClassDivision").val("${educationVO.eduClassDivision}");
		
		const arrDate = eduDate.split(',');
		let sDate = arrDate[0];
		let eDate = arrDate.reverse()[0];
		console.log(sDate);
		console.log(eDate);
		
		if(eduDateDiv == "01"){
			$("#d1").show();
			$("#d2").hide();
			$("#d3").hide();
			
			$('#eDate01').val(eduDate);
		}else if(eduDateDiv == "02"){
			$("#d1").hide();
			$("#d2").show();
			$("#d3").hide();
			$('#eDate02').val(eduDate);
		}else if(eduDateDiv == "03"){
			$("#d1").hide();
			$("#d2").hide();
			$("#d3").show();
			$('#eduFromDt').val(sDate);
			$('#eduToDt').val(eDate);
		}
		
		
		
		
		
		
		
		
		
	}
	 
}


function checkValidation(){

	if($('#eduName').val().trim() == ''){
		alert('교육과정명을 입력해 주세요.'); $('#eduName').focus();
		return false;
	}
	if($('#eduYear').val().trim() == ''){
		alert('교육연도를 선택해 주세요.'); $('#eduYear').focus();
		return false;
	}
	if($('#eduBeltCode').val().trim() == ''){
		alert('벨트를 선택해 주세요.'); $('#eduBeltCode').focus();
		return false;
	}
	if($('#eduClassType').val().trim() == ''){
		alert('교육유형을 선택해 주세요.'); $('#eduClassType').focus();
		return false;
	}
	if($('#eduClassDivision').val().trim() == ''){
		alert('상세유형을 선택해 주세요.'); $('#eduClassDivision').focus();
		return false;
	}
	if($('#eduClassDivision').val().trim() == ''){
		alert('교육차수를 선택해 주세요.'); $('#eduClassDivision').focus();
		return false;
	}
	if($('#eduFixed').val().trim() == ''){
		alert('교육정원을 입력해 주세요.'); $('#eduDate').focus();
		return false;
	}
	if($('#eduClassIntro').val().trim() == ''){
		alert('교육방식을 입력해 주세요.'); $('#eduClassIntro').focus();
		return false;
	}
	if($('#eduClassTarget').val().trim() == ''){
		alert('대상자를 입력해 주세요.'); $('#eduClassTarget').focus();
		return false;
	}
	if($('#eduClassSummary').val().trim() == ''){
		alert('이수기준을 입력해 주세요.'); $('#eduClassSummary').focus();
		return false;
	}
	if($('#eduItem').val().trim() == ''){
		alert('준비사항을 입력해 주세요.'); $('#eduItem').focus();
		return false;
	}
 	 
	if($('#eduDateDiv').val().trim() == ''){
		alert('교육일정을 선택해 주세요.'); $('#eduDateDiv').focus();
		return false;
	}else{
		let eduDateDiv = $('#eduDateDiv').val();
		if(eduDateDiv == "01"){
			if($('#eDate01').val().trim() == ''){
				alert('교육일정을 입력해 주세요.'); $('#eDate01').focus();
				return false;
			}
		}else if(eduDateDiv == "02"){
			if($('#eDate02').val().trim() == ''){
				alert('교육일정을 입력해 주세요.'); $('#eDate02').focus();
				return false;
			}
		}else if(eduDateDiv == "03"){
			if($('#eduFromDt').val().trim() == ''){
				alert('교육일정을 입력해 주세요.'); $('#eduFromDt').focus();
				return false;
			}
			if($('#eduToDt').val().trim() == ''){
				alert('교육일정을 입력해 주세요.'); $('#eduToDt').focus();
				return false;
			}
		}
	}
 	 
	setDate();
	
	return true;
}

function setDate(){
	let eduDateDiv = $('#eduDateDiv').val();
	let tDate = "";
	
	if(eduDateDiv == "01"){
		tDate = $('#eDate01').val();
		setQuater($('#eDate01').val());
	}else if(eduDateDiv == "02"){
		tDate = $('#eDate02').val();
		setQuater($('#eDate02').val());
	}else if(eduDateDiv == "03"){
		let eduFromDt = $('#eduFromDt').val();
		let eduToDt = $('#eduToDt').val();
		tDate = eduFromDt + "," + eduToDt;
		setQuater($('#eduFromDt').val());
	}
	$("#eduDate").val(tDate);
}

//분기계산
function setQuater(eduDate){
	// 교육일정의 첫째날짜 기준으로 분기계산
	const arrDate = eduDate.split(',');
	let qDate = arrDate[0];
	console.log(qDate);
	
	const arrMonth = qDate.split('/');
	let qMonth = arrMonth[0];
	console.log(qMonth);
	
	let quater = Math.ceil( qMonth / 3 );
	console.log(quater);
	$("#eduQuater").val(quater);
}







</script>
 