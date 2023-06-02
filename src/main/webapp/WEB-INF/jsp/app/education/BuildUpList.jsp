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
</head>
<body>

                        <div class="list-wrap">
                            <div class="list-search">
                            <form:form commandName="EducationSearchVO" id="defaultForm" method="get" action="buildup.do" >
                            ${EducationSearchVO.superHiddenTag}
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>교육과정명</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                             <form:input type="text" path="searchEduName" />
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4 ">
                                        <div class="col s4 align-right">
                                            <label>교육연도</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <form:select path="searchEduYear">
                                                <option value="">전체</option>
                                                <c:forEach var="i"  begin="2023" end="2025">
											        <option value="${i}" <c:if test="${i eq EducationSearchVO.searchEduYear }">selected</c:if> >${i}년</option>
											    </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>인증벨트</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <form:select path="searchbeltCode">
                                                <option value="">전체</option>
                                            </form:select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>교육유형</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <form:select path="searchEduType">
                                                <option value="">전체</option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4 ">
                                        <div class="col s4 align-right">
                                            <label>상세유형</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <form:select path="searchEduDivision">
                                                <option value="">전체</option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>교육차수</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <form:select path="searchEduNumber">
                                                <option value="">전체</option>
                                                <c:forEach var="i"  begin="1" end="4">
											        <option value="${i}" <c:if test="${i eq EducationSearchVO.searchEduNumber }">selected</c:if> >${i}차</option>
											    </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s8">
                                        <div class="col s2 align-right">
                                            <label>교육기간</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <div class="col s5 input-date">
                                                <form:input type="text" path="searchEduFromDt" cssClass="datepicker"/> 
                                                <i class="ico calendar"></i>
                                            </div>
                                            <span class="col s1 text-bul align-center">~</span>
                                            <div class="col s5 input-date">
                                                <form:input type="text" path="searchEduToDt" cssClass="datepicker"/>
                                                <i class="ico calendar"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col s4 align-right">
                                        <button type="button" class="btn-submit" onclick="onclick_search()">조회</button>
                                    </div>
                                </div>
                            </form:form>
                            </div>

                            <div class="list-header">
                                <p class="title">교육과정</p>
                                <span class="bar"></span>
                                <p class="total">전체 ${totalCount}</p>
                                <select name="limit" class="limit"  onchange="onchange_recordCountPerPage(this.value)">
                                    <option value="10" <c:if test="${EducationSearchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
                                	<option value="50" <c:if test="${EducationSearchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
                                	<option value="100" <c:if test="${EducationSearchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
                                </select>
                            </div>
                            <!--                               
                            -->
                            <!---->

                            <!---->
                            <!---->
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="even" id="tb1">
                                        <caption></caption>
                                            <colgroup>
                                                <col style="width:60px">
                                                <col style="width:80px">
                                                <col style="width:60px">
                                                <col style="width:80px">
                                                <col style="width:120px">
                                                <col style="width:80px">
                                                <col>
                                                <col style="width:100px">
                                                <col style="width:60px">
                                            </colgroup>

                                        <thead>
                                            <tr>
                                                <th class="bg-gray font-weight-bold">No</th>
                                                <th class="bg-gray font-weight-bold">교육연도</th>
                                                <th class="bg-gray font-weight-bold">벨트</th>
                                                <th class="bg-gray font-weight-bold">교육유형</th>
                                                <th class="bg-gray font-weight-bold">상세유형</th>
                                                <th class="bg-gray font-weight-bold">교육차수</th>
                                                <th class="bg-gray font-weight-bold">교육과정명</th>
                                                <th class="bg-gray font-weight-bold">교육일정</th>
                                                <th class="bg-gray font-weight-bold">정원</th>
                                            </tr>                                            
                                        </thead>
                                        <tbody>
                                            <c:choose>
											    <c:when test="${fn:length(selectEducationList) == 0}">
											        <tr>
		                                                <td colspan="9"><span>조회결과가 없습니다.</span></td>
		                                            </tr>
											    </c:when>
											    <c:otherwise>
											        <c:forEach var="educationResult" items="${selectEducationList}" varStatus="status">
											            <tr>
			                                                <td>${educationResult.idx} </td>
			                                                <td>${educationResult.eduYear} </td>
			                                                <td>${educationResult.eduBeltCodeName}</td>
			                                                <td>${educationResult.eduClassTypeName}</td>
			                                                <td>${educationResult.eduClassDivisionName}</td>
			                                                <td>${educationResult.eduNumber}차</td>
			                                                <td>
				                                                <a href="javascript: onclick_educationInfo('${educationResult.eduCode}');">
				                                                	${educationResult.eduName} 
				                                                </a>
			                                                </td>
			                                                <td>${educationResult.eduDate}</td>
			                                                <td>${educationResult.eduFixed}</td>
			                                            </tr>
											        </c:forEach>
											    </c:otherwise> 
											</c:choose>
                                           
                                                        
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">
                                <ui:pagination paginationInfo="${EducationSearchVO}" type="defDefault" jsFunction="cfnPageLink" />
                                <div class="list-btns">
                                    <button type="button" class="btn bg-gray" id="btnRegEdu">                                        
                                        <span>교육등록</span>
                                    </button>
                                    
                                    <button type="button" class="btn-excel">
                                        <img src="/assets/images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>
                                    
                                </div>

                            </div>
                        </div>
        
<script type="text/javascript">
	$(document).ready(function(){
		init();
		initCode();
		
	 	$("#btnRegEdu").on("click", function(){
			location.href="./buildupinsert.do?menuKey=67";
		});
	 	
	 	
	});
		
	function init(){	
		$("#defaultForm input").off("keyup").on("keyup", function(e){
		    if(e.keyCode===13 && this.value.trim().length>0){
		    	onclick_search();
		    }
		});
	}
	
	function initCode(){
		let codes = [
			<c:forEach var="item" items="${allCodes}">{index:"${item.codeGrpId}",key:"${item.codeId}",value:"${item.codeNm}"},
			</c:forEach>
		];
		
		cdEduType1 = codes.filter(function(code){ return code.index==="ED_TY1";});
		cdEduType2 = codes.filter(function(code){ return code.index==="ED_TY2";});
		cdEduType3 = codes.filter(function(code){ return code.index==="ED_TY3";});
		
		setDropDown("searchbeltCode", cdEduType2, true, "전체");			//인증벨트
		$("#searchbeltCode").val("${EducationSearchVO.searchbeltCode}");
		
		setDropDown("searchEduType", cdEduType1, true, "전체");				//교육유형
		$("#searchEduType").val("${EducationSearchVO.searchEduType}")
		
		setDropDown("searchEduDivision", cdEduType3, true, "전체");			//상세유형
		$("#searchEduDivision").val("${EducationSearchVO.searchEduDivision}");
	}
	
	function onclick_search(){
		$("#defaultForm")[0].submit();
	}
	
	function onchange_recordCountPerPage(vCount){
		$("#recordCountPerPage").val(vCount);
		onclick_search();// 검색 '조회'버튼 클릭
	}
	
	function onclick_educationInfo(eduCode){
		location.href="./buildupinsert.do?menuKey=67&eduCode="+eduCode;		
	}
	
</script>   
            
</body>
</html>