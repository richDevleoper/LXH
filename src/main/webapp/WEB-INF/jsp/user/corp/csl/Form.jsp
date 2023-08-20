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
	$("#defaultForm").validationEngine('attach', {
		unbindEngine:false,
		validationEventTrigger: "submit",
		promptPosition : "topLeft",
		showOneMessage : true,
		customFunctions: {
			'cfCheckUserId' : function(){
				var regexp = /^[0-9a-zA-z]*$/;
				if(!regexp.test($("#userId").val())){
					return "* 영문과 숫자만 사용하세요";
				}
				if(!checkUserId()){
					return "* 사용할 수 없는 아이디입니다";
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
	
	function checkUserId(){
		var _result = false;
		$.ajax({
			url : '/csl/user/corp/checkUserId.do'
	        ,method : "post"
			,dataType : 'json'
			,async:false
			,data : { userId:$('#userId').val() }
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
});

//저장
function insert(){
	$("#defaultForm").submit();
	return false;
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
<form:form commandName="corpUserVO" id="defaultForm" name="defaultForm" method="post" action="${action}">
${corpUserSearchVO.hiddenTag }

<table cellpadding="0" class="tb_base" summary="">
	<caption><span>기업회원정보</span></caption>
	<colgroup>
		<col style="width:15%"/>
		<col style="width:85%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col" colspan="2">기업회원정보</th>
		</tr>
	</thead>
	<tbody class="write">
	
		<tr>
			<th><label for="authId">권한</label></th>
			<td>
				<select id="authId" name="authId" class="validate[required] sel_type" title="권한">
					<option value="">권한선택</option>
					<c:forEach var="item" items="${userAuthList}">
						<option value="${item.authId}" <c:if test="${corpUserVO.authId eq item.authId}">selected="selected"</c:if>>${item.authNm}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th><label for="regSt">회원상태</label></th>
			<td>
				<form:select path="regSt" cssClass="validate[required] sel_type" title="회원상태">
					<form:option value="">회원상태선택</form:option>
					<form:option value="A01" label="승인대기" />
					<form:option value="B01" label="정상사용" />
					<form:option value="C01" label="사용정지" />
					<form:option value="D01" label="회원탈퇴" />
				</form:select>
			</td>
		</tr>
		<tr>
			<th><label for="userId">아이디</label></th>
			<td>
				<c:choose>
					<c:when test="${not empty corpUserVO.userId}">
						<form:input path="userId" cssClass="validate[required,minSize[4],maxSize[20]] tb_ipty" maxlength="20" cssStyle="width:192px;" readonly="true" title="아이디"/>
					</c:when>
					<c:otherwise>
						<form:input path="userId" cssClass="validate[required,minSize[4],maxSize[20],funcCall[cfCheckUserId]] tb_ipty" maxlength="20" cssStyle="width:192px;" title="아이디"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th><label for="userPw">비밀번호</label></th>
			<td>
				<c:choose>
					<c:when test="${not empty corpUserVO.userId}">
						<form:password path="userPw" cssClass="validate[minSize[6],maxSize[20]] tb_ipty" maxlength="20" cssStyle="width:192px;" title="비밀번호"/>
					</c:when>
					<c:otherwise>
						<form:password path="userPw" cssClass="validate[required,minSize[6],maxSize[20]] tb_ipty" maxlength="20" cssStyle="width:192px;" title="비밀번호"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th><label for="userNm">이름</label></th>
			<td><form:input path="userNm" cssClass="validate[required,maxSize[20]] tb_ipty" maxlength="20" cssStyle="width:192px;" title="이름"/></td>
		</tr>
		<tr>
			<th><label for="chrTel1">담당자 전화번호</label></th>
			<td>
				<input id="chrTel1" name="chrTel1" value="${paramVO.chrTel1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="전화번호 앞자리"/>
				-
				<input id="chrTel2" name="chrTel2" value="${paramVO.chrTel2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="전화번호 중간자리"/>
				-
				<input id="chrTel3" name="chrTel3" value="${paramVO.chrTel3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="전화번호 끝자리"/>
			</td>
		</tr>
		<tr>
			<th><label for="chrMob1">담당자 휴대폰번호</label></th>
			<td>
				<input id="chrMob1" name="chrMob1" value="${paramVO.chrMob1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="휴대폰번호 앞자리"/>
				-
				<input id="chrMob2" name="chrMob2" value="${paramVO.chrMob2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="휴대폰번호 중간자리"/>
				-
				<input id="chrMob3" name="chrMob3" value="${paramVO.chrMob3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="휴대폰번호 끝자리"/>
			</td>
		</tr>
		<tr>
			<th><label for="chrFax1">담당자 FAX</label></th>
			<td>
				<input id="chrFax1" name="chrFax1" value="${paramVO.chrFax1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="담당자 FAX 앞자리"/>
				-
				<input id="chrFax2" name="chrFax2" value="${paramVO.chrFax2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="담당자 FAX 중간자리"/>
				-
				<input id="chrFax3" name="chrFax3" value="${paramVO.chrFax3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="담당자 FAX 끝자리"/>
			</td>
		</tr>
		<tr>
			<th><label for="chrEmail">담당자 이메일</label></th>
			<td>
				<form:input path="chrEmail" cssClass="validate[maxSize[50],custom[email]] tb_ipty" maxlength="50" style="width:240px;" title="담당자 이메일"/>
			</td>
		</tr>
		<tr>
			<th><label for="chrZip">담당자 우편번호</label></th>
			<td>
				<form:input path="chrZip" cssClass="validate[maxSize[6],custom[integer]] tb_ipty" maxlength="6" style="width:80px;" title="담당자 우편번호"/>
			</td>
		</tr>		
		<tr>
			<th><label for="chrAddr1">담당자 주소</label></th>
			<td>
				<form:input path="chrAddr1" cssClass="validate[maxSize[100]] tb_ipty" maxlength="100" style="width:400px;" title="담당자 주소"/>
			</td>
		</tr>
		<tr>
			<th><label for="chrAddr2">담당자 상세주소</label></th>
			<td>
				<form:input path="chrAddr2" cssClass="validate[maxSize[100]] tb_ipty" maxlength="100" style="width:400px;" title="담당자 상세주소"/>
			</td>
		</tr>
		
		<tr>
			<th><label for="corpId1">사업자번호</label></th>
			<td>
				<input id="corpId1" name="corpId1" value="${paramVO.corpId1 }" class="validate[required,minSize[3],maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:40px;" title="사업자번호 앞자리"/>
				-
				<input id="corpId2" name="corpId2" value="${paramVO.corpId2 }" class="validate[required,minSize[2],maxSize[2],custom[integer]] tb_ipty" maxlength="2" style="width:30px;" title="사업자번호 중간자리"/>
				-
				<input id="corpId3" name="corpId3" value="${paramVO.corpId3 }" class="validate[required,minSize[5],maxSize[5],custom[integer]] tb_ipty" maxlength="5" style="width:60px;" title="사업자번호 끝자리"/>
			</td>
		</tr>
		<tr>
			<th><label for="corpNm">회사명</label></th>
			<td><form:input path="corpNm" cssClass="validate[required,maxSize[20]] tb_ipty" maxlength="20" cssStyle="width:192px;" title="회사명"/></td>
		</tr>
		<tr>
			<th><label for="corpTel1">대표 전화번호</label></th>
			<td>
				<input id="corpTel1" name="corpTel1" value="${paramVO.corpTel1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="대표 전화번호 앞자리"/>
				-
				<input id="corpTel2" name="corpTel2" value="${paramVO.corpTel2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="대표 전화번호 중간자리"/>
				-
				<input id="corpTel3" name="corpTel3" value="${paramVO.corpTel3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="대표 전화번호 끝자리"/>
			</td>
		</tr>
		<tr>
			<th><label for="corpMob1">대표 휴대폰번호</label></th>
			<td>
				<input id="corpMob1" name="corpMob1" value="${paramVO.corpMob1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="대표 휴대폰번호 앞자리"/>
				-
				<input id="corpMob2" name="corpMob2" value="${paramVO.corpMob2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="대표 휴대폰번호 중간자리"/>
				-
				<input id="corpMob3" name="corpMob3" value="${paramVO.corpMob3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="대표 휴대폰번호 끝자리"/>
			</td>
		</tr>
		<tr>
			<th><label for="corpFax1">대표 FAX</label></th>
			<td>
				<input id="corpFax1" name="corpFax1" value="${paramVO.corpFax1 }" class="validate[maxSize[3],custom[integer]] tb_ipty" maxlength="3" style="width:50px;" title="대표 FAX 앞자리"/>
				-
				<input id="corpFax2" name="corpFax2" value="${paramVO.corpFax2 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="대표 FAX 중간자리"/>
				-
				<input id="corpFax3" name="corpFax3" value="${paramVO.corpFax3 }" class="validate[maxSize[4],custom[integer]] tb_ipty" maxlength="4" style="width:50px;" title="대표 FAX 끝자리"/>
			</td>
		</tr>
		<tr>
			<th><label for="corpEmail">대표 이메일</label></th>
			<td>
				<form:input path="corpEmail" cssClass="validate[maxSize[50],custom[email]] tb_ipty" maxlength="50" style="width:240px;" title="대표 이메일"/>
			</td>
		</tr>
		<tr>
			<th><label for="corpZip">대표 우편번호</label></th>
			<td>
				<form:input path="corpZip" cssClass="validate[maxSize[6],custom[integer]] tb_ipty" maxlength="6" style="width:80px;" title="대표 우편번호"/>
			</td>
		</tr>		
		<tr>
			<th><label for="corpAddr1">대표 주소</label></th>
			<td>
				<form:input path="corpAddr1" cssClass="validate[maxSize[100]] tb_ipty" maxlength="100" style="width:400px;" title="대표 주소"/>
			</td>
		</tr>
		<tr>
			<th><label for="corpAddr2">대표 상세주소</label></th>
			<td>
				<form:input path="corpAddr2" cssClass="validate[maxSize[100]] tb_ipty" maxlength="100" style="width:400px;" title="대표 상세주소"/>
			</td>
		</tr>
	</tbody>
</table>

<p class="btn_list">
	<button class="jSaveButton" onclick="return insert();" title="저장">저장</button>
	<button class="jListButton" onclick="list();" title="목록">목록</button>
</p>

</form:form>
</body>
</html>