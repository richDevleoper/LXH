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
                            	<form:form commandName="proposalSearchVO" id="defaultForm" method="get" action="list.do" >
                            		${proposalSearchVO.superHiddenTag}
									<div class="search-form row">
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>제안명</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                            <form:input type="text" name="input-proposal-name" id="input-proposal-name" style="width: 130px;" path="searchPropName"/>
	                                        </div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>조직</label>
	                                        </div>
	                                        <div class="pd-l10 col s9 input-text search">
                                      			<form:input path="searchGroupCode" type="hidden" id="input-proposal-group-code" name="input-proposal-group-code"/>
                                      			<form:input type="text" id="input-proposal-group" name="input-proposal-group" readonly="true" style="background-color: #FFF;" path="searchGroupName"/>
                                      			<button type="button" class="btn-proposal-group-search-modal">검색</button> 
	                                        </div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s5 align-right">
	                                            <label>등급 평가마감</label>
	                                        </div>
	                                        <div class="pd-l10 col s7">
	                                            <select name="" id="">
	                                                <option value="">전체</option>
	                                            </select>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="search-form row">
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>제안자</label>
	                                        </div>
	                                        <div class="pd-l10 col s9 input-text search">
                                      			<form:input path="searchPropUser" type="hidden" id="input-proposal-member-code" name="input-proposal-member-code"/>
                                      			<form:input type="text" id="input-proposal-member" name="input-proposal-member" path="searchPropUserName" readonly="true" style="background-color:#FFF;"/>
                                      			<button type="button" class="btn-proposal-member-search-modal">검색</button> 
	                                        </div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>실시/쪽지</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                            <form:select name="select-type-code" id="select-type-code" path="searchPropTypeCode">
	                                                <option value="">전체</option>
                                                    <c:forEach var="item" items="${TYPE_LIST }">
                                                    	<c:choose>
                                                    		<c:when test="${PROP_TYPE_CODE eq item.codeId }">
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
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>등급</label>
	                                        </div>	
	                                        <div class="pd-l10 col s9">
	                                            <form:select name="select-class-code" id="select-class-code" path="searchPropClassCode">
	                                                <option value="">전체</option>
	                                                <c:forEach var="item" items="${CLASS_LIST }">
	                                                	<c:choose>
	                                                		<c:when test="${PROP_CLASS_CODE eq item.codeId }">
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
	                                </div>
	                                <div class="search-form row">
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>제안유형</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                            <form:select name="select-category-code" id="select-category-code" path="searchPropCategoryCode">
	                                                <option value="">전체</option>
	                                                <c:forEach var="item" items="${CATEGORY_LIST }">
                                                    	<option value="${item.codeId }">${item.codeNm }</option>
                                                    </c:forEach>	                                                
	                                            </form:select>
	                                        </div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>조회기간</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                        	<div class="col s5 input-date input-date" style="padding-right: 0px; cursor: pointer; width: calc(50% - 10px);">
		                                            <form:input type="text" id="input-from-date" name="input-from-date" class="datepicker" readonly="readonly" style="background-color: #FFF; cursor: inherit; width: 100px;" path="searchPropFromDate"/>
		                                            <i class="ico calendar"></i>                                        	
	                                        	</div>                                 
	                                            <span class="col s1 text-bul align-center">~</span>
	                                            <div class="col s5 input-date input-date" style="padding-right: 0px; cursor: pointer; width: calc(50% - 10px);">
		                                            <form:input type="text" id="input-to-date" name="input-to-date" class="datepicker" readonly="readonly" style="background-color: #FFF; cursor: inherit; width: 100px;" path="searchPropToDate"/>
		                                            <i class="ico calendar"></i>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
		                                    <div class="col s12 align-right">
		                                        <button type="button" class="btn-submit" id="button-search">조회</button>
		                                    </div>	                                    
	                                    </div>
	                                </div>                             
                            	</form:form>
                            </div>
                            <div class="list-header">
                                <p class="title">전체</p>
                                <span class="bar"></span>
                                <P>총 ${SUMMARY.tt } (실시제안 ${SUMMARY.ppsTyp1 }, 쪽지제안 ${SUMMARY.ppsTyp2 })</P>
                            </div>
                            <div class="list-content">
                                <div class="row">
                                    <div class="list-table list col s8 pd-r10">
                                        <table class="centered odd">
                                            <caption></caption>
                                            <colgroup>
                                                <col style="width:70px">
                                                <col style="width:70px">
                                                <col>
                                                <col>
                                                <col>
                                                <col>
                                                <col>
                                                <col>
                                                <col>
                                                <col>
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th class="bg-gray" colspan="2" rowspan="2">구분</th>
                                                    <th class="bg-gray" colspan="8">실시제안</th>
                                                </tr>
                                                <tr>
                                                    <th class="bg-gray">계</th>
                                                    <th class="bg-gray">S급</th>
                                                    <th class="bg-gray">A급</th>
                                                    <th class="bg-gray">B급</th>
                                                    <th class="bg-gray">C급</th>
                                                    <th class="bg-gray">D급</th>
                                                    <th class="bg-gray">불채택</th>
                                                    <th class="bg-gray">심사중</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="bg-gray" colspan="2">건수</td>
                                                    <td>${SUMMARY.ppsTyp1 }</td>
                                                    <td>${SUMMARY.s }</td>
                                                    <td>${SUMMARY.a }</td>
                                                    <td>${SUMMARY.b }</td>
                                                    <td>${SUMMARY.c }</td>
                                                    <td>${SUMMARY.d }</td>
                                                    <td>${SUMMARY.na }</td>
                                                    <td>${SUMMARY.prg }</td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-gray" rowspan="2">포상액</td>
                                                    <td class="bg-gray">지급완료</td>
                                                    <td>${SUMMARY.pymtY }</td>
                                                    <td>${SUMMARY.pys }</td>
                                                    <td>${SUMMARY.pya }</td>
                                                    <td>${SUMMARY.pyb }</td>
                                                    <td>${SUMMARY.pyc }</td>
                                                    <td>${SUMMARY.pyd }</td>
                                                    <td>${SUMMARY.pyna }</td>
                                                    <td>${SUMMARY.pyprg }</td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-gray">미지급</td>
                                                    <td>${SUMMARY.pymtN }</td>
                                                    <td>${SUMMARY.pns }</td>
                                                    <td>${SUMMARY.pna }</td>
                                                    <td>${SUMMARY.pnb }</td>
                                                    <td>${SUMMARY.pnc }</td>
                                                    <td>${SUMMARY.pnd }</td>
                                                    <td>${SUMMARY.pnna }</td>
                                                    <td>${SUMMARY.pnprg }</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="list-table list col s4">
                                        <table class="centered mg-l10">
                                            <caption></caption>
                                            <colgroup>
                                                <col style="width:70px">
                                                <col style="width:70px">
                                                <col>
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th class="bg-gray" colspan="2">구분</th>
                                                    <th class="bg-gray">쪽지제안</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="bg-gray" colspan="2">건수</td>
                                                    <td>${SUMMARY.ppsTyp2 }</td>
                                                </tr>
<!--                                                 <tr>
                                                    <td class="bg-gray" rowspan="2">포상액</td>
                                                    <td class="bg-gray">지급완료</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-gray">미지급</td>
                                                    <td></td>
                                                </tr> -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="list-footer mg-t10">
                                <div class="list-btns">
                                    <button type="button" class="btn-excel">
                                        <img src="/assets/images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="list-wrap mg-t20">
                            <div class="list-header mg-t20">
                                <p class="title">목록</p>
                                <span class="bar"></span>
                                <select name="limit" class="limit" onchange="onchange_recordCountPerPage(this.value)">
                                    <option value="10" <c:if test="${proposalSearchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
                                    <option value="50" <c:if test="${proposalSearchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
                                    <option value="100" <c:if test="${proposalSearchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="even" id="tb1">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:50px">
                                            <col style="width:50px">
                                            <col>
                                            <col style="width:80px">
                                            <col style="width:80px">
                                            <col style="width:150px">
                                            <col>
                                            <col style="width:80px">
                                            <col style="width:80px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray font-weight-bold">NO</th>
                                                <th class="bg-gray font-weight-bold">구분</th>
                                                <th class="bg-gray font-weight-bold">제안명</th>
                                                <th class="bg-gray font-weight-bold">제안자</th>
                                                <th class="bg-gray font-weight-bold">제안유형</th>
                                                <th class="bg-gray font-weight-bold">조직명</th>
                                                <th class="bg-gray font-weight-bold">등급</th>
                                                <th class="bg-gray font-weight-bold">포상액</th>
                                                <th class="bg-gray font-weight-bold">마감(제안)일</th>
                                            </tr>                                            
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="item" items="${PROP_LIST }" varStatus="status">
                                        		<tr>
                                        			<td>${item.idx }</td>
                                        			<td>${item.propTypeCodeName }</td>
                                        			<td class="align-left"><a href="javascript: onclick_poposalInfo('${item.propSeq}', '${item.propTypeCode }');">${item.propName }</a></td>
                                        			<td>${item.propUserName }</td>
                                        			<td>${item.propCategoryCodeName }</td>
                                        			<td>${item.propGroupName }</td>
                                        			<td>
                                            			<c:choose>
                                            				<c:when test="${item.propPropStatCode ne 'PRG_5' && item.propPropStatCode ne 'PRG_6' }">
                                            					${item.propPropStatCodeName }
                                            				</c:when>
                                            				<c:otherwise>
                                            					${item.propEvalLvCodeName }
                                            				</c:otherwise>
                                            			</c:choose>                                        			
                                        			</td>
                                        			<td>
                                        				<fmt:formatNumber var="propYearEffect" value="${item.propYearEffect}" type="currency" currencySymbol="₩"/>${propYearEffect }
                                        			</td>
                                        			<td>
                                        				<c:choose>
                                        					<c:when test="${item.propPropStatCode eq 'PRG_6'}">
                                        						${item.propPaymentDate }
                                        					</c:when>
                                        					<c:otherwise>
                                        						${item.propDate }
                                        					</c:otherwise>
                                        				</c:choose>
                                        			</td>
                                        		</tr>
                                        	</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">
								<ui:pagination paginationInfo="${proposalSearchVO}" type="defDefault" jsFunction="cfnPageLink" />
                                <div class="list-btns">
                                    <button type="button" class="btn-excel">
                                        <img src="/assets/images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        
<script type="text/javascript">
	$(document).ready(function(){
		//제안자 조회
		$('.btn-proposal-member-search-modal').off('click').on('click', function(){
			popEmp.init();
			
			popEmp.returnObjId = $('#input-proposal');
			popEmp.returnFunc = setProposalMemberInfo;
			
			popEmp.open();
		});
		
		$('#button-search').off('click').on('click', function(){
			onclick_search();
		});
	});
	
	function setProposalMemberInfo(el, d){
		if(d != null){
			$('#input-proposal-member').val('');
			$('#input-proposal-member-code').val('');			
		}else{
			$('#input-proposal-member').val(d.userName);
			$('#input-proposal-member-code').val(d.comNo);			
		}
	}
	
	function onclick_search(){
		$("#defaultForm")[0].submit();				
	}
	
	function onchange_recordCountPerPage(vCount){
		$("#recordCountPerPage").val(vCount);
		onclick_search();// 검색 '조회'버튼 클릭
	}
	
	function onclick_poposalInfo(propSeq, propTypeCode){
		if(propTypeCode == 'PPS_TYP_1'){
			location.href="/proposal/judge/detail.do?menuKey=50&propSeq="+propSeq;
		}else{
			location.href="/proposal/judge/memodetail.do?menuKey=50&propSeq="+propSeq;
		}
	}
</script>
                    
</body>
</html>