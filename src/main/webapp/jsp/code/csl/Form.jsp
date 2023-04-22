<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>추가/수정</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<script type="text/javascript">
<!--
$(function() {
	
	/* codeGrp insert & update *********************************************************/
	$("#defaultForm").validationEngine({
		unbindEngine:false,
		validationEventTrigger: "submit",
		promptPosition : "topLeft",
		showOneMessage : true,
		customFunctions: {
			'cfCheckCodeGrpId' : function(){
				if(!checkCodeGrpId()){
					return "* 사용할 수 없는 그룹 아이디입니다";
				}
			}
		},
		onValidationComplete: function(form, status){
			if(status == true) {
				if(confirm("저장하시겠습니까?")) {
					return true;
				} 
				return false;
			}
		}
	});
	
	function checkCodeGrpId(){
		var _result = false;
		$.ajax({
			url : '/csl/codegrp/checkCodeGrpId.do'
	        ,method : "post"
			,dataType : 'json'
			,async:false
			,data : { codeGrpId:$('#codeGrpId').val() }
			,success : function(data, stat, xhr) {
				if(data.isAvail == 'true'){
					_result = true;
				}else{
					_result = false;
				}
			}
		    ,error : function(xhr, stat, err) {
		    	console.log(err);
		    }
		});
		return _result;
	}
	
	//코드목록
	getCodeList();
	
	
	/* code insert *********************************************************/
	$("#codeInsertForm").validationEngine({
		unbindEngine:false,
		validationEventTrigger: "submit",
		promptPosition : "topLeft",
		showOneMessage : true,
		customFunctions: {
			'cfCheckCodeId' : function(){
				if(!checkCodeId()){
					return "* 사용할 수 없는 코드 아이디입니다";
				}
			}
		},
		onValidationComplete: function(form, status){
			if(status == true) {
				if(confirm("저장하시겠습니까?")) {
					$.ajax({
						url : '/csl/code/insert.do'
					    ,method : "post"
						,dataType : 'json'
						,data : { 
								codeGrpId:$('#codeGrpId').val()
								,codeId:$('#codeId').val()
								,codeNm:$('#codeNm').val()
								,attr1:$('#attr1').val()
								,attr2:$('#attr2').val()
								,attr3:$('#attr3').val()
								,viewOrd:$('#viewOrd').val()
								,actFlg:$('#actFlg').is(':checked') ? 'Y' : 'N'
							}
					    ,success : function(data, stat, xhr) {
					    	console.log(data);
					    	if(data.isInsert == 'true'){
					    		$("#codeInsertForm input").each(function(){$(this).val($(this).prop('defaultValue'));});
					    		getCodeList();
					    	}
					    }
					    ,error : function(xhr, stat, err) {
					    	console.log(err);
					    }
					});
					return false;
				} 
				return false;
			}
		}
	});
	
	function checkCodeId(){
		var _result = false;
		$.ajax({
			url : '/csl/code/checkCodeId.do'
	        ,method : "post"
			,dataType : 'json'
			,async:false
			,data : { 
				codeGrpId:$('#codeGrpId').val()
				,codeId:$('#codeId').val()
			}
			,success : function(data, stat, xhr) {
				if(data.isAvail == 'true'){
					_result = true;
				}else{
					_result = false;
				}
			}
		    ,error : function(xhr, stat, err) {
		    	console.log(err);
		    }
		});		
		return _result;
	}
	
	/* code update *********************************************************/
	$("#codeUpdateForm").validationEngine({
		unbindEngine:false,
		validationEventTrigger: "submit",
		promptPosition : "topLeft",
		showOneMessage : true,
		customFunctions: {},
		onValidationComplete: function(form, status){
			if(status == true) {
				var selectedCodeKey = $("#selectedCodeKey").val();
				if(confirm("수정하시겠습니까?")) {
					$.ajax({
						url : '/csl/code/update.do'
					    ,method : "post"
						,dataType : 'json'
						,data : { 
								codeGrpId:$('#codeGrpId').val()
								,codeId:$('#codeId_' + selectedCodeKey).val()
								,codeNm:$('#codeNm_' + selectedCodeKey).val()
								,attr1:$('#attr1_' + selectedCodeKey).val()
								,attr2:$('#attr2_' + selectedCodeKey).val()
								,attr3:$('#attr3_' + selectedCodeKey).val()
								,viewOrd:$('#viewOrd_' + selectedCodeKey).val()
								,actFlg:$('#actFlg_' + selectedCodeKey).is(':checked') ? 'Y' : 'N'
							}
					    ,success : function(data, stat, xhr) {
					    	console.log(data);
					    	if(data.isUpdate == 'true'){
					    		getCodeList();
					    	}
					    }
					    ,error : function(xhr, stat, err) {
					    	console.log(err);
					    }
					});
					return false;
				}
				return false;
			}
			return false;
		}
	});
	
});

//코드그룹 저장
function insert(){
	$("#defaultForm").submit();
	return false;
}
//코드그룹 목록
function list(){
	$("#defaultForm").validationEngine('detach');
	$("#defaultForm").attr('method', 'post');
	$("#defaultForm").attr('action', 'list.do');
	$("#defaultForm").submit();
}

//코드 목록
function getCodeList(){
	$.ajax({
		url : '/csl/code/selectFullListByCodeGrpId.do' 
        ,method : "post"
		,dataType : 'json'
		,data : {
			codeGrpId:$("#codeGrpId").val()
			}
		,success : function(data, stat, xhr) {
			console.log(data);
			if(data.codeList != null && data.codeList.length > 0) {
				$('#cl_body').empty();
				for(var i=0; i<data.codeList.length; i++){
					
					if(data.codeList[i].actFlg == 'Y'){actCheck = "checked=\"checked\"";}
					else{actCheck = "";}
					
					html = "";
					html += "<tr id=\"cl_" + (i+1)+ "\">";
					html += "	<td scope=\"row\">" + (i+1)+ "</td>";
					html += "	<td style=\"text-align: center;\">${codeGrpVO.codeGrpId}</td>";
					html += "	<td style=\"text-align: left;\">";
					html += "		<input id=\"codeId_" + (i+1)+ "\" name=\"codeId_" + (i+1)+ "\" value=\"" + data.codeList[i].codeId + "\" readonly=\"readonly\" class=\"validate[required,maxSize[20]] tb_ipty\" style=\"padding-left:1px;\" maxlength=\"20\" title=\"코드아이디\"/>";
					html += "	</td>";
					html += "	<td style=\"text-align: left;\">";
					html += "		<input id=\"codeNm_" + (i+1)+ "\" name=\"codeNm_" + (i+1)+ "\" value=\"" + data.codeList[i].codeNm + "\" class=\"validate[required,maxSize[50]] tb_ipty\" style=\"padding-left:1px;\" maxlength=\"255\" title=\"설명\"/>";
					html += "	</td>";
					html += "	<td style=\"text-align: left;\">";
					html += "		<input id=\"attr1_" + (i+1)+ "\" name=\"attr1_" + (i+1)+ "\" value=\"" + data.codeList[i].attr1 + "\" class=\"tb_ipty\" style=\"padding-left:1px;\" maxlength=\"250\" title=\"속성1\"/>";
					html += "	</td>";
					html += "	<td style=\"text-align: left;\">";
					html += "		<input id=\"attr2_" + (i+1)+ "\" name=\"attr2_" + (i+1)+ "\" value=\"" + data.codeList[i].attr2 + "\" class=\"tb_ipty\" style=\"padding-left:1px;\" maxlength=\"250\" title=\"속성2\"/>";
					html += "	</td>";
					html += "	<td style=\"text-align: left;\">";
					html += "		<input id=\"attr3_" + (i+1)+ "\" name=\"attr3_" + (i+1)+ "\" value=\"" + data.codeList[i].attr3 + "\" class=\"tb_ipty\" style=\"padding-left:1px;\" maxlength=\"250\" title=\"속성3\"/>";
					html += "	</td>";
					html += "	<td style=\"text-align: left;\">";
					html += "		<input id=\"viewOrd_" + (i+1)+ "\" name=\"viewOrd_" + (i+1)+ "\" value=\"" + data.codeList[i].viewOrd + "\" class=\"validate[required,maxSize[20],custom[integer]] tb_ipty\" style=\"padding-left:1px;\" maxlength=\"20\" title=\"정렬\"/>";
					html += "	</td>";
					html += "	<td style=\"text-align: center;\">";
					html += "		<input type=\"checkbox\" id=\"actFlg_" + (i+1)+ "\" name=\"actFlg_" + (i+1)+ "\" value=\"Y\" " + actCheck + " title=\"활성여부\" />";
					html += "	</td>";
					html += "	<td>";
					html += "		<button class=\"jButton\" onclick=\"return codeUpdate('" + (i+1) + "');\" title=\"수정\">수정</button> ";
					html += "		<button class=\"jButton\" onclick=\"return codeRemove('" + (i+1) + "');\" title=\"삭제\">삭제</button> ";
					html += "	</td>";
					html += "</tr>";
					
					$('#cl_body').append(html);
				}
				$('#cl_body .jButton').button();
			}
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

//코드 저장
function codeInsert(){
	$("#codeInsertForm").submit();
	return false;
}

//코드 수정
function codeUpdate(key){
	$("#selectedCodeKey").attr('value', key);
	$("#codeUpdateForm").submit();
	return false;
}

//코드 삭제
function codeRemove(key){
	$("#selectedCodeKey").val(key);
	var selectedCodeKey = $("#selectedCodeKey").val(); 
	if(confirm('삭제하시겠습니까?')){
		$.ajax({
			url : '/csl/code/delete.do'
		    ,method : "post"
			,dataType : 'json'
			,data : { 
					codeGrpId:$('#codeGrpId').val()
					,codeId:$('#codeId_' + selectedCodeKey).val()
				}
		    ,success : function(data, stat, xhr) {
		    	console.log(data);
		    	if(data.isDelete == 'true'){
		    		getCodeList();
		    	}
		    }
		    ,error : function(xhr, stat, err) {
		    	console.log(err);
		    }
		});
	}
	return false;
}

//-->
</script>
</head>
<body>

<form:form commandName="codeGrpVO" name="defaultForm" id="defaultForm" method="post" action="${action }">
${codeGrpSearchVO.hiddenTag }

<table cellpadding="0" class="tb_base" summary="배너를 관리하는 테이블입니다.">
<caption><span>코드그룹</span></caption>
<colgroup>
	<col style="width:20%"/>
	<col style="width:80%"/>
</colgroup>
<thead>
	<tr>
		<th scope="col" colspan="2">코드그룹정보</th>
	</tr>
</thead>
<tbody class="write">
	<tr>
		<th><label for="codeGrpId">그룹아이디</label></th>
		<td>
			<c:choose>
				<c:when test="${not empty codeGrpVO.codeGrpId }">
					<form:input path="codeGrpId" cssClass="validate[required,minSize[4]] tb_ipty" cssStyle="width:100px;" maxlength="8" readonly="true" title="그룹아이디"/>
				</c:when>
				<c:otherwise>
					<form:input path="codeGrpId" cssClass="validate[required,minSize[4],funcCall[cfCheckCodeGrpId]] tb_ipty" cssStyle="width:100px;" maxlength="8" title="그룹아이디"/>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<th><label for="title">그룹명</label></th>
		<td><form:input path="codeGrpNm" cssClass="validate[required,maxSize[100]] tb_ipty" cssStyle="" maxlength="100" title="그룹명"/></td>
	</tr>
	<tr>
		<th><label for="attr">속성</label></th>
		<td>
			<form:input path="attr" cssClass="validate[maxSize[20]] tb_ipty" cssStyle="width:200px;" maxlength="20" title="속성"/>
		</td>
	</tr>
	<tr>
		<th>활성여부</th>
		<td class="jLockRadio">
			<form:radiobutton path="actFlg" id="actFlg_y" value="Y" cssClass="validate[required] va_m" title="활성여부" /> <label for="actFlg_y" class="va_m">활성</label> 
			<form:radiobutton path="actFlg" id="actFlg_n" value="N" cssClass="validate[required] va_m" title="활성여부" /> <label for="actFlg_n" class="va_m">비활성</label>
		</td>
	</tr>
</tbody>
</table>

<p class="btn_list">
	<button class="jSaveButton" onclick="return insert();" title="저장">저장</button>
	<button class="jListButton" onclick="list();" title="목록">목록</button>
</p>

</form:form>


<c:if test="${not empty codeGrpVO.codeGrpId }">
<br/>
<form id="codeInsertForm" name="codeInsertForm" method="post" action="">
<table cellpadding="0" class="tb_base" summary="코드 등록 테이블입니다.">
	<caption><span>코드</span></caption>
	<colgroup>
	<col style="width:6%" />
	<col style="width:8%" />
	<col style="width:8%" />
	<col style="width:24%" />
	<col style="width:10%"/>
	<col style="width:10%" />
	<col style="width:10%" />
	<col style="width:6%" />
	<col style="width:6%" />
	<col style="width:12%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col" colspan="10">코드정보</th>
		</tr>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">코드그룹</th>
			<th scope="col">코드</th>
			<th scope="col">설명</th>
			<th scope="col">속성1</th>
			<th scope="col">속성2</th>
			<th scope="col">속성3</th>
			<th scope="col">정렬</th>
			<th scope="col">활성여부</th>
			<th scope="col">관리</th>
		</tr>
	</thead>
	<tbody>
		<tr id="ci_0">
			<td>-</td>
			<td style="text-align: center;">${codeGrpVO.codeGrpId}</td>
			<td style="text-align: left;">
				<input type="text" id="codeId" name="codeId" class="validate[required,maxSize[20],funcCall[cfCheckCodeId]] tb_ipty" style="padding-left:1px;" maxlength="20" title="코드아이디"/>
			</td>
			<td style="text-align: left;">
				<input type="text" id="codeNm" name="codeNm" class="validate[required,maxSize[50]] tb_ipty" style="padding-left:1px;" maxlength="50" title="설명"/>
			</td>
			<td style="text-align: left;">
				<input type="text" id="attr1" name="attr1" class="tb_ipty" style="padding-left:1px;" maxlength="250" title="속성1"/>
			</td>
			<td style="text-align: left;">
				<input type="text" id="attr2" name="attr2" class="tb_ipty" style="padding-left:1px;" maxlength="250" title="속성2"/>
			</td>
			<td style="text-align: left;">
				<input type="text" id="attr3" name="attr3" class="tb_ipty" style="padding-left:1px;" maxlength="250" title="속성3"/>
			</td>
			<td style="text-align: left;">
				<input type="text" id="viewOrd" name="viewOrd" value="0" class="validate[required,custom[integer],maxSize[4]] tb_ipty" style="padding-left:1px;" maxlength="4" title="정렬"/>
			</td>
			<td style="text-align: center;">
				<input type="checkbox" id="actFlg" name="actFlg" value="Y" checked="checked" title="활성여부" />
			</td>
			<td>
				<button class="jButton" onclick="return codeInsert();" title="추가">추가</button>
			</td>
		</tr>
	</tbody>
</table>
</form>

<br/>
<form id="codeUpdateForm" name="codeUpdateForm" method="post" action="">
<input type="hidden" id="selectedCodeKey" name="selectedCodeKey" value="" />
<table cellpadding="0" class="tb_base" summary="목록 테이블입니다.">
	<caption><span>목록</span></caption>
	<colgroup>
	<col style="width:6%" />
	<col style="width:8%" />
	<col style="width:8%" />
	<col style="width:24%" />
	<col style="width:10%"/>
	<col style="width:10%" />
	<col style="width:10%" />
	<col style="width:6%" />
	<col style="width:6%" />
	<col style="width:12%" />
	</colgroup>
	<tbody id="cl_body">
	
	</tbody>
</table>
</form>
</c:if>

</body>
</html>