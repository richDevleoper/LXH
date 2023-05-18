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
                            	<form:form commandName="proposalSearchVO" id="defaultForm" method="get" action="classlist.do" >
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
	                                    <div class="form-inline form-input col s4 ">
	                                        <div class="col s3 align-right">
	                                            <label>조직</label>
	                                        </div>
	                                        <div class="pd-l10 col s9 input-text search">
                                      			<form:input path="searchGroupCode" type="hidden" id="input-proposal-group-code" name="input-proposal-group-code"/>
                                      			<form:input type="text" id="input-proposal-group" name="input-proposal-group" readonly="readonly" style="background-color: #FFF;" path="searchGroupName"/>
                                      			<button type="button" class="btn-proposal-group-search-modal">검색</button> 
	                                        </div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>사업장</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                            <form:select name="select-bizplace-code" id="select-bizplace-code" path="searchBizPlaceCode">
                                                    <option value="">선택</option>
                                                    <c:forEach var="item" items="${BIZ_PLACE_LIST }">
                                                    	<option value="${item.codeId }">${item.codeNm }</option>
                                                    </c:forEach>
	                                            </form:select>
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
                                      			<form:input type="text" id="input-proposal-member" name="input-proposal-member" readonly="readonly" style="background-color: #FFF;" path="searchPropUserName"/>
                                      			<button type="button" class="btn-proposal-member-search-modal">검색</button> 
	                                        </div>	                                        
	                                    </div>
	                                    <div class="form-inline form-input col s4 ">
	                                        <div class="col s3 align-right">
	                                            <label>분임조</label>
	                                        </div>
	                                        <div class="pd-l10 col s9">
	                                            <form:select name="select-circle-code" id="select-circle-code" path="searchCircleCode">
	                                                <option value="">전체</option>
	                                            </form:select>
	                                        </div>
	                                    </div>
	                                    <div class="form-inline form-input col s4">
	                                        <div class="col s3 align-right">
	                                            <label>최종심사자</label>
	                                        </div>
	                                        <div class="pd-l10 col s9 input-text search">
                                      			<form:input path="searchFinalEvalUser" type="hidden" id="input-proposal-final-eval-member-code" name="input-proposal-final-eval-member-code"/>
                                      			<form:input type="text" id="input-proposal-final-eval-member" name="input-proposal-final-eval-member" readonly="readonly" style="background-color: #FFF;" path="searchFinalUserName"/>
	                                            <button type="button" class="btn-proposal-final-eval-member-search-modal">검색</button>
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
	                                            <label>등급</label>
	                                        </div>	
	                                        <div class="pd-l10 col s9">
	                                            <form:select name="select-class-code" id="select-class-code" path="searchPropClassCode">
	                                                <option value="">전체</option>
	                                                <c:forEach var="item" items="${CLASS_LIST }">
														<option value="${item.codeId }">${item.codeNm }</option>                                                  	
                                                    </c:forEach>
	                                            </form:select>
	                                        </div>	                                    
	                                    </div>
	                                    <div class="form-inline form-input col s4">
		                                    <div class="col s3 align-right">
		                                        <label>제안일</label>
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
	                                </div>
	                                <div class="search-form row">
	                                    <div class="col s12 align-right">
	                                        <button type="button" class="btn-submit" id="button-search">조회</button>
	                                    </div>	                                
	                                </div>                           	
                            	</form:form>
                            </div>
                            <div class="list-header">
                                <p class="title">심사 완료 제안목록</p>
                                <span class="bar"></span>
                                <p class="total">총 ${PROP_TOTAL }</p>
                                <select name="limit" class="limit" onchange="onchange_recordCountPerPage(this.value)">
                                    <option value="10" <c:if test="${proposalSearchVO.recordCountPerPage eq '10' }">selected="selected"</c:if>>10개</option>
                                    <option value="50" <c:if test="${proposalSearchVO.recordCountPerPage eq '50' }">selected="selected"</c:if>>50개</option>
                                    <option value="100" <c:if test="${proposalSearchVO.recordCountPerPage eq '100' }">selected="selected"</c:if>>100개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="even">
                                        <thead>
                                            <colgroup>
                                                <col style="width:30px">
                                                <col>
                                                <col style="width:60px">
                                                <col style="width:80px">
                                                <col style="width:80px">
                                                <col style="width:170px">
                                                <col style="width:80px">
                                                <col style="width:80px">
                                                <col style="width:80px">
                                                <col style="width:80px">
                                                <col style="width:80px">
                                            </colgroup>
                                            <tr>
                                                <th class="bg-gray font-weight-bold"><input type="checkbox" name="checkbox-proposal" id="checkbox-proposal" value=""><label for="checkbox-proposal"></label></th>
                                                <th class="bg-gray font-weight-bold">제안명</th>
                                                <th class="bg-gray font-weight-bold">제안자</th>
                                                <th class="bg-gray font-weight-bold">분임조</th>
                                                <th class="bg-gray font-weight-bold">제안유형</th>
                                                <th class="bg-gray font-weight-bold">조직명</th>
                                                <th class="bg-gray font-weight-bold">심사자</th>
                                                <th class="bg-gray font-weight-bold">등급</th>
                                                <th class="bg-gray font-weight-bold">제안일</th>
                                                <th class="bg-gray font-weight-bold">평가점수</th>
                                                <th class="bg-gray font-weight-bold">효과금액</th>
                                            </tr>                                            
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="item" items="${PROP_LIST }" varStatus="status">
	                                            <tr>
                                                	<c:choose>
                                                		<c:when test="${item.propPropStatCode eq 'PRG_6' }">
                                                			<td></td>
                                                		</c:when>
                                                		<c:otherwise>
                                                			<td><input type="checkbox" name="checkbox-proposal-info" id="checkbox-proposal-${item.propSeq }" value="${item.propSeq }"><label for="checkbox-proposal-${item.propSeq }"></label></td>
                                                		</c:otherwise>
                                                	</c:choose>
                                                	<td class="align-left"><a href="javascript: onclick_poposalInfo('${item.propSeq}', '${item.propTypeCode }');">${item.propName }</a></td>
	                                                <td>${item.propUserName }</td>
	                                                <td>${item.propCircleCode }</td>
	                                                <td>${item.propCategoryCodeName }</td>
	                                                <td>${item.propGroupName }</td>
	                                                <td>${item.propApproverName }</td>
 	                                                <c:choose>
	                                                	<c:when test="${item.propPropStatCode eq 'PRG_6' }">
	                                                		<td>${item.propEvalLvCodeName }</td>
	                                                	</c:when>
	                                                	<c:otherwise>
	                                                		<td>
			                                                    <div class="col s12">
			                                                    	<select name="select-proposal-class" id="select-proposal-class-${item.propSeq }">
			                                                        	<option value="">전체</option>
			                                                        	<c:forEach var="lv" items="${CLASS_LIST }">
			                                                        		<c:choose>
			                                                        			<c:when test="${item.propEvalLvCode eq lv.codeId }">
			                                                        				<option value="${lv.codeId }" selected="selected">${lv.codeNm }</option>
			                                                        			</c:when>
			                                                        			<c:otherwise>
			                                                        				<option value="${lv.codeId }">${lv.codeNm }</option>
			                                                        			</c:otherwise>
			                                                        		</c:choose>			                                                        		
			                                                        	</c:forEach>
			                                                    	</select>
		                                                    	</div>
		                                                    </td>
	                                                	</c:otherwise>
	                                                </c:choose>
	                                                <td>${item.propDate }</td>
<%-- 		                                                <c:choose>
		                                                	<c:when test="${item.propPropStatCode eq 'PRG_6' }">
		                                                		<td>${item.propEvalScore }</td>
		                                                	</c:when>
		                                                	<c:otherwise>
		                                                		<td>
		                                                			<div class="row">
		                                                				<div class="col s12 input-text">
		                                                					<input type="text" name="evalProposalList[${status.index }].propEvalScore" id="input-proposal-eval-score-${item.propSeq }"/>
		                                                				</div>
		                                                			</div>
		                                                		</td>
		                                                	</c:otherwise>	                                                
		                                                </c:choose> --%>
	                                                <td>${item.propEvalScore }</td>
	                                                <td><fmt:formatNumber var="propYearEffect" value="${item.propYearEffect}" type="currency" currencySymbol="₩"/>${propYearEffect }</td>
	                                            </tr>                                        	
                                        	</c:forEach>            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">
								<ui:pagination paginationInfo="${proposalSearchVO}" type="defDefault" jsFunction="cfnPageLink" />
                                <div class="list-btns">
                                    <button type="button" class="btn bg-gray" id="btn-eval-class">                                        
                                        <span>마감</span>
                                    </button>
                                    <button type="button" class="btn-excel">
                                        <img src="/assets/images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>
                                </div>

                            </div>
                        </div>
        <!-- //footer -->
        
        
<script type="text/javascript">
	$(document).ready(function(){
		//제안자 조회
		$('.btn-proposal-member-search-modal').off('click').on('click', function(){
			popEmp.init();
			
			popEmp.returnObjId = $('#input-proposal');
			popEmp.returnFunc = setProposalMemberInfo;
			
			popEmp.open();
		});
		//최종심사자
		$('.btn-proposal-final-eval-member-search-modal').off('click').on('click', function(){
			popEmp.init();
			
			popEmp.returnObjId = $('#input-proposal');
			popEmp.returnFunc = setProposalFinalEvalMemberInfo;
			
			popEmp.open();			
		});
		
		$('#button-search').off('click').on('click', function(){
			onclick_search();
		});
		
		$('#btn-eval-class').off('click').on('click', function(){
			//$("#evalForm")[0].submit();
			//선택된 로우만 submit			
			var list = $('input:checkbox[name="checkbox-proposal-info"]:checked');
			if(list.length > 0){
				if(confirm('선택된 항목을 마감처리 하시겠습니까?')){
					var evalForm = $('<form></form>');
					evalForm.attr('name', 'evalForm');
					evalForm.attr('method', 'post');
					evalForm.attr('action', 'procclass.do');
					evalForm.attr('target', 'evalFormFrame');
 					for(var index = 0; index < list.length; index++){
						var item = $(list[index]);
						var lvCode = $('#select-proposal-class-' + item.val() +'').val();
						if(lvCode == ''){
							alert('마감시 등급선택은 필수 입니다.');
							return false;
						}
						evalForm.append($('<input/>', {type: 'hidden', name:'evalProposalList['+ index + '].propSeq', value:item.val()}));
						evalForm.append($('<input/>', {type: 'hidden', name:'evalProposalList['+ index + '].propEvalLvCode', value:lvCode}));
					}
					evalForm.appendTo('body');
					evalForm.submit();
					
/* 					var propList = [];
 					for(var index = 0; index < list.length; index++){
						var item = $(list[index]);
						var lvCode = $('#select-proposal-class-' + item.val() +'').val();
						if(lvCode == ''){
							alert('마감시 등급선택은 필수 입니다.');
							return false;
						}						
						propList.push({propSeq: item.val(), propEvalLvCode: lvCode});
					}
 					if(propList.length > 0){
  	        			$.post( "/proposal/eval/procclass.do", { propList: propList }, function(data){
 	        				if(data != null && data.result == 'SUCCESS'){
 	        					console.log(data);
 	        				}
 	        			}, "json" );
 					} */
				}
			}else{
				alert('등급평가 항목을 선택해 주세요.');
			}
		});
		
		$('#checkbox-proposal').change(function(){
			$('input:checkbox[name="checkbox-proposal-info"]').prop('checked', $(this).prop('checked'));
		});
		
		$('input:checkbox[name="checkbox-proposal-info"]').change(function(){
			if($(this).prop('checked')){
				var size = $('input:checkbox[name="checkbox-proposal-info"]').length;
				var c = true;
				for(var index = 0; index < size; index++){
					var checked = $($('input:checkbox[name="checkbox-proposal-info"]')[index]).is(':checked');
					c = checked
				}
				$('#checkbox-proposal').prop('checked', c);
			}else{
				$('#checkbox-proposal').prop('checked', $(this).prop('checked'));
			}
		});
	});
	
	function setProposalMemberInfo(el, d){
		$('#input-proposal-member').val(d.userName);
		$('#input-proposal-member-code').val(d.comNo);
	}
	
	function setProposalFinalEvalMemberInfo(el, d){
		$('#input-proposal-final-eval-member').val(d.userName);
		$('#input-proposal-final-eval-member-code').val(d.comNo);		
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
			location.href="/proposal/judge/detail.do?menuKey=52&propSeq="+propSeq;
		}else{
			location.href="/proposal/judge/memodetail.do?menuKey=52&propSeq="+propSeq;
		}		
	}
</script>
<iframe id="evalFormFrame" name="evalFormFrame" width="0" height="0"></iframe>
</body>
</html>