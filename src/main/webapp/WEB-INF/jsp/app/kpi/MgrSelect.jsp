<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld"%>


<%-- 분임조 등록을 커스텀하여 만든 페이지이므로 변수 등이 분임조 등록과 동일하게 사용되고 있음. --%>


<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<title>${fn:split(boardVO.boardNm,'>')[fn:length(fn:split(boardVO.boardNm,'>'))-1]}</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
	<style>
	li a.active { font-weight: 700; color: #a72b2a !important; }
	</style>
</head>
<body>

	<div class="tab-group">
		<div class="tab-btn">
			<button type="button" <c:if test="${makeVO.kudIdx eq '6SIG'}">class="on"</c:if> onclick="onclick_tab('6SIG')">6σ 인재 관리 대상</button>
			<button type="button" <c:if test="${makeVO.kudIdx eq 'MBB'}">class="on"</c:if> onclick="onclick_tab('MBB')">팀장MBB 관리 대상</button>
		</div>
		<form:form commandName="frmMake" id="defaultForm" name="defaultForm"
			action="${action}" onsubmit="return false" method="post"
			modelAttribute="makeVO">
			
			<form:hidden path="kudIdx"/> <!-- 6sigma / MBB 구분 -->
			
         	<form:hidden path="leader1"/> <!-- 저장용 -->
            <form:hidden path="leader2"/>
            <form:hidden path="leader3"/>
            <form:hidden path="leader4"/>
            <form:hidden path="leader5"/>
            <form:hidden path="leader6"/>
            <form:hidden path="leader7"/>
            <form:hidden path="leader8"/>
            
            <form:hidden path="team1"/>
            <form:hidden path="team2"/>
            <form:hidden path="team3"/>
            <form:hidden path="team4"/>
            <form:hidden path="team5"/>
            <form:hidden path="team6"/>
            <form:hidden path="team7"/>
            <form:hidden path="team8"/>
            
            <form:hidden path="removeMemberIds"/>
			
			<div class="tab-inr">
				<div class="tab-box on">
					<div class="list-wrap">
						<div class="list-header mg-t20">
							<p class="title">대상연도 선택</p>
						
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy" var="yearStart"/>
							<form:select path="kudYear" class="limit">
							<c:forEach begin="0" end="3" var="result" step="1">
								<option value="<c:out value="${yearStart - result}" />" <c:if test="${(yearStart - result) == searchVO.bsnsYear}"> selected="selected"</c:if>><c:out value="${yearStart - result}" /></option>
							</c:forEach>
							</form:select>
							
						</div>
						<div class="list-content">
							<div class="list-group">
								<div class="inr">
									<p>6σ 인재 관리 대상 선정</p>
									<div class="tree-list"></div>
								</div>
								<div class="inr" style="overflow: auto">
									<p>사원목록<span id="empTit"></span></p>
									                                                                                <div class="list-wrap">
                                                                                    <div class="list-table list">
                                                                                        <table id="emptab">
                                                                                            <colgroup>
                                                                                                <col style="width:20%">
                                                                                                <col style="width:30%">
                                                                                                <col style="width:25%">
                                                                                                <col style="width:25%">
                                                                                                <%-- <col style="width:20%"> --%>
                                                                                            </colgroup>
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <th>
																									 	<div>
																					                        <input type="checkbox" id="empSelAll">
																					                        <label for="empSelAll"></label>
																					                    </div>
																									</th>
                                                                                                    <th><span>이름</span></th>
                                                                                                    <th><span>직위</span></th>
                                                                                                    <!-- <th><span>학력</span></th> -->
                                                                                                    <th><span>직책</span></th>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                            	
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                </div>
								</div>
								<div class="inr border0">
									<div class="box">
										<p>
											생산/기술/R&D/품질 인재<span id="leaderTit"></span>
										</p>
										<div style="overflow: auto; height: 326px;">
                                                                         <div class="list-wrap">
                                                                                    <div class="list-table list">
                                                                                        <table id="leadertab">
                                                                                            <colgroup>
                                                                                                <col style="width:20%">
                                                                                                <col style="width:30%">
                                                                                                <col style="width:25%">
                                                                                                <col style="width:25%">
                                                                                                <%-- <col style="width:20%"> --%>
                                                                                            </colgroup>
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <th>
																									 	<div>
																					                        <input type="checkbox" id="leaderDelAll">
																					                        <label for="leaderDelAll"></label>
																					                    </div>
																									</th>
                                                                                                    <th><span>이름</span></th>
                                                                                                    <th><span>직위</span></th>
                                                                                                    <!-- <th><span>학력</span></th> -->
                                                                                                    <th><span>직책</span></th>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                            <c:forEach var="item" items="${kpiMgrList}" varStatus="status">
                                                                                            	<c:if test="${item.kudChkTypeCode eq 'KUD001'}">
																									<tr comno="${item.comNo}" 
																									    username="${item.kudUserName}" 
																									    comdepartcode="${item.comDepartCode}" 
																									    deptfullname="${item.kudDepart}" 
																										comjobx="${item.kudJobx}" 
																										composition="${item.kudPosition}" 
																										kudPlace="${item.kudPlace}" 
																										comCertBelt="${item.kudCertBelt}"
																										cirMemCode="${item.stdSeq}"
																										>
																										<td class="text-align-center"><div><input type="checkbox" id="chkleader_${status.index}" name="chkleader">
																										<label for="chkleader_${status.index}"></label></div></td>
																										<td class="text-align-center"><span>${item.kudUserName}</span></td>
																										<td class="text-align-center"><span>${item.kudJobx}</span></td>
																										<td class="text-align-center"><span>${item.kudPosition}</span></td>
																									</tr>
																								</c:if>
																							</c:forEach>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                </div>
                                                                        
                                                                                <!-- </li>
                                                                            </ul> -->
                                                                        </div>
										<div class="btn-group">
                                                <button type="button" id="AppLeader"><i class="ico add"><em>추가</em></i></button>
                                                <button type="button" id="delLeader"><i class="ico del"><em>삭제</em></i></button>
                                            </div>
									</div>
									<div class="box">
										<p>
											생산/기술/R&D/품질 외 인재<span id="teamTit"></span>
										</p>
                                                                        <div style="overflow: auto; height: 326px;">
                                                                        			<div class="list-wrap">
                                                                                        <div class="list-table list">
                                                                                            <table id="teamtab">
	                                                                                            <colgroup>
	                                                                                                <col style="width:20%">
	                                                                                                <col style="width:30%">
	                                                                                                <col style="width:25%">
	                                                                                                <col style="width:25%">
	                                                                                                <%-- <col style="width:20%"> --%>
	                                                                                            </colgroup>
	                                                                                            <thead>
	                                                                                                <tr>
	                                                                                                    <th>
																										 	<div>
																						                        <input type="checkbox" id="teamDelAll">
																						                        <label for="teamDelAll"></label>
																						                    </div>
																										</th>
	                                                                                                    <th><span>이름</span></th>
	                                                                                                    <th><span>직위</span></th>
	                                                                                                    <!-- <th><span>학력</span></th> -->
	                                                                                                    <th><span>직첵</span></th>
	                                                                                                </tr>
	                                                                                            </thead>
	                                                                                            <tbody>
	                                                                                            <c:forEach var="item" items="${kpiMgrList}" varStatus="status">
                                                                                            	<c:if test="${item.kudChkTypeCode eq 'KUD002'}">
																									<tr comno="${item.comNo}" 
																									    username="${item.kudUserName}" 
																									    comdepartcode="${item.comDepartCode}" 
																									    deptfullname="${item.kudDepart}" 
																										comjobx="${item.kudJobx}" 
																										composition="${item.kudPosition}" 
																										kudPlace="${item.kudPlace}" 
																										comCertBelt="${item.kudCertBelt}"
																										cirMemCode="${item.stdSeq}"
																										>
																										<td class="text-align-center"><div><input type="checkbox" id="chkteam_${status.index}" name="chkteam">
																										<label for="chkteam_${status.index}"></label></div></td>
																										<td class="text-align-center"><span>${item.kudUserName}</span></td>
																										<td class="text-align-center"><span>${item.kudJobx}</span></td>
																										<td class="text-align-center"><span>${item.kudPosition}</span></td>
																									</tr>
																								</c:if>
																								</c:forEach>
	                                                                                            </tbody>
	                                                                                        </table>
                                                                                        </div>
                                                                                    </div>            
                                                                               <!--  </li>
                                                                               
                                                                            </ul> -->
                                                                        </div>
                                                                        <div class="btn-group">
                                                                            <button type="button" id="AppTeam"><i class="ico add"><em>추가</em></i></button>
                                                                            <button type="button" id="delTeam"><i class="ico del"><em>삭제</em></i></button>
                                                                        </div>
									</div>
								</div>
							</div>
						</div>
						<div class="list-footer">
							<div class="list-btns center">
								<button type="button" class="btn bg-gray" id="btnSave">
									<span>저장</span>
								</button>
								 <a href="/sub.do?menuKey=${menuKey}" class="btn">목록</a>
							</div>
						</div>
					</div>
				</div>

				<div class="tab-box"></div>
			</div>
		</form:form>
	</div>

	<script type="text/javascript">
		

	$(document).ready(function(){
		
		// 부서 Tree 초기화
		$('.tree-list').jstree({
	        "plugins" : ['search'],
	        "search" : {
	            "show_only_matches" : true,
	            "show_only_matches_children" : true,
	        },
	        "core":{
	        	"data": deptList
	        }
	    }).on('select_node.jstree', function(event, data) {
	        var selectedNodeId = data.node.id;
	        /* var selectedNodeText = data.node.text;
	        console.log('Selected Node ID:', selectedNodeId);
	        console.log('Selected Node Text:', selectedNodeText); */
	        $(".jstree-anchor").removeClass("active")
	        $("#"+data.node.a_attr.id).addClass("active")
	        getEmpSearch(selectedNodeId);
	      });
		
	 	$("#btnRegMake").on("click", function(){
			location.href="./makeinsert.do?menuKey=70";
		});
	 	
	 	// 검색 이벤트
		$(".btn-search-emp").off("click").on("click", function(){
			callPopup_searchEmployee(this);
		});
	 	
	 	// 부서 검색
		$(".btn-search-dept").off("click").on("click", function(){
			callPopup_searchDepartment(this);
		});

	 	
		$("#AppLeader").on("click", function(){
			let vhtml = [];	
			
			/* let chkCnt = $("#leadertab").children("tbody:first").children("tr[comNo]").length;
			if(chkCnt==1){
				alert("분임조장은 한명만 지정가능합니다.");
				return false;
			} */
			
			
			$("#emptab").children("tbody:first").children("tr[comNo]").each(function(i){
				var comNo = $(this).attr("comNo");
				var userName   = $(this).attr("userName");
				var comDepartCode   = $(this).attr("comDepartCode");
				var deptFullName   = $(this).attr("deptFullName");
				var comJobx   = $(this).attr("comJobx");
				var comJobxNm   = $(this).attr("comJobxNm");
				var comPosition   = $(this).attr("comPosition");
				var comPositionNm   = $(this).attr("comPositionNm");
				var comCertBelt   = $(this).attr("comCertBelt");
				var comCertBeltNm   = $(this).attr("comCertBeltNm");
				var cirMemCode = $(this).attr("cirMemCode");
				
				let res = true;
				
				$("#leadertab").children("tbody:first").children("tr[comNo]").each(function(i){
					var leadercomNo = $(this).attr("comNo");
					if(comNo==leadercomNo){
						//alert("중복된 데이터입니다.");
						res=false;
					}
				});
				
				if(res){
					if($(this).find("input:checkbox[name='chkNo']").is(":checked")){
						//console.log(comNo);
						//console.log(comDepartCode);
						
						vhtml.push("<tr comNo='"+comNo+"' userName='"+userName+"' comDepartCode='"+comDepartCode+"' deptFullName='"+deptFullName+"' comJobx='"+comJobx+"' comPosition='"+comPosition+"' comPositionNm='"+strChk(comPositionNm)+"' comCertBelt='"+comCertBelt+"' comCertBeltNm='"+comCertBeltNm+"' cirMemCode=''>");
		        		vhtml.push("<td class='text-align-center'>"); 
		        		vhtml.push("<div>");
		        		vhtml.push("<input type='checkbox' id='chkleader_"+i+"' name='chkleader'>");
		        		vhtml.push("<label for='chkleader_"+i+"'></label>");
		        		vhtml.push("</div>");
		        		vhtml.push("</td>");
		        		 
						vhtml.push("<td class='text-align-center'><span>" + strChk(userName) + "</span></td>");
						vhtml.push("<td class='text-align-center'><span>" + strChk(comJobxNm) + "</span></td>");
						vhtml.push("<td class='text-align-center'><span>" + strChk(comPositionNm)+ "</span></td>");
						//vhtml.push("<td><span>" + strChk(comCertBeltNm) + "</span></td>");
						vhtml.push("</tr>");
					}
				}
				
			});
			$("#leadertab").find("tbody").append(vhtml.join(''));
			
			let lCnt = $("#leadertab").children("tbody:first").children("tr[comNo]").length;
			$("#leaderTit").text("총 "+lCnt+"명");
			
			/* $('#dept-tree-list').jstree();
			$('#dept-tree-list').jstree(true).settings.core.data = deptList;
			$('#dept-tree-list').jstree(true).refresh(); */
			
		});	
		
		
		$("#delLeader").on("click", function(){
			$("#leadertab").children("tbody:first").children("tr[comNo]").each(function(i){
				if($(this).find("input:checkbox[name='chkleader']").is(":checked")){

					var $check_idx = $(this).closest("tr").index();
					var removeId = $("#leadertab tbody tr").eq($check_idx).attr("cirmemcode");
					let removeList = $("#removeMemberIds").val();
					if(removeList)
						removeList += ",";
					removeList += removeId;
					$("#removeMemberIds").val(removeList)
					$("#leadertab tbody tr").eq($check_idx).remove();
					$(this).closest("tr").remove();
				}
			});
		});
		
		$("#AppTeam").on("click", function(){

			let vhtml = [];	
			$("#emptab").children("tbody:first").children("tr[comNo]").each(function(i){
				var comNo = $(this).attr("comNo");
				var userName   = $(this).attr("userName");
				var deptFullName   = $(this).attr("deptFullName");
				var comDepartCode   = $(this).attr("comDepartCode");
				var comJobx   = $(this).attr("comJobx");
				var comJobxNm   = $(this).attr("comJobxNm");
				var comPosition   = $(this).attr("comPosition");
				var comPositionNm   = $(this).attr("comPositionNm");
				var comCertBelt   = $(this).attr("comCertBelt");
				var comCertBeltNm   = $(this).attr("comCertBeltNm");
				var cirMemCode = $(this).attr("cirMemCode");
				
				let res = true;
				$("#teamtab").children("tbody:first").children("tr[comNo]").each(function(i){
					var teamcomNo = $(this).attr("comNo");
					if(comNo==teamcomNo){
						//alert("중복된 데이터입니다.");
						res=false;
					}
				});
				
				if(res){
					if($(this).find("input:checkbox[name='chkNo']").is(":checked")){
						console.log(comNo);
						console.log(comDepartCode);
						
						vhtml.push("<tr comNo='"+comNo+"' userName='"+userName+"' comDepartCode='"+comDepartCode+"' deptFullName='"+deptFullName+"' comJobx='"+comJobx+"' comPosition='"+comPosition+"' comPositionNm='"+strChk(comPositionNm)+"' comCertBelt='"+comCertBelt+"' comCertBeltNm='"+comCertBeltNm+"' cirMemCode=''>");
		        		vhtml.push("<td class='text-align-center'>"); 
		        		vhtml.push("<div>");
		        		vhtml.push("<input type='checkbox' id='chkteam_"+i+"' name='chkteam'>");
		        		vhtml.push("<label for='chkteam_"+i+"'></label>");
		        		vhtml.push("</div>");
		        		vhtml.push("</td>");
		        		 
						vhtml.push("<td class='text-align-center'><span>" + strChk(userName) + "</span></td>");
						vhtml.push("<td class='text-align-center'><span>" + strChk(comJobxNm) + "</span></td>");
						vhtml.push("<td class='text-align-center'><span>" + strChk(comPositionNm)+ "</span></td>");
						//vhtml.push("<td><span>" + strChk(comCertBeltNm) + "</span></td>");
						vhtml.push("</tr>");
					}
				}
				
			});
			$("#teamtab").find("tbody").append(vhtml.join(''));
			
			let tCnt = $("#teamtab").children("tbody:first").children("tr[comNo]").length;
			$("#teamTit").text("총 "+tCnt+"명");
			
		
		});
		
		$("#delTeam").on("click", function(){
			$("#teamtab").children("tbody:first").children("tr[comNo]").each(function(i){
				if($(this).find("input:checkbox[name='chkteam']").is(":checked")){
					var $check_idx = $(this).closest("tr").index();
					var removeId = $("#teamtab tbody tr").eq($check_idx).attr("cirmemcode");
					let removeList = $("#removeMemberIds").val();
					if(removeList)
						removeList += ",";
					removeList += removeId;
					$("#removeMemberIds").val(removeList)
					$("#teamtab tbody tr").eq($check_idx).remove();
					$(this).closest("tr").remove();
				}
			});
		});
		
		$("#empSelAll").click(function() {
			if($("#empSelAll").is(":checked")) $("input[name=chkNo]").prop("checked", true);
			else $("input[name=chkNo]").prop("checked", false);
		});
		
		$("#leaderDelAll").click(function() {
		
			if($("#leaderDelAll").is(":checked")) $("input[name=chkleader]").prop("checked", true);
			else $("input[name=chkleader]").prop("checked", false);
		});
		
		$("#teamDelAll").click(function() {
		
			if($("#teamDelAll").is(":checked")) $("input[name=chkteam]").prop("checked", true);
			else $("input[name=chkteam]").prop("checked", false);
		});
		
		$('#btnSave').off('click').on('click', function(){
			if(checkValidation()){			
				if(confirm('저장하시겠습니까?')){
					$('#defaultForm')[0].submit();
				}			
			}
		});
		
		$(".tab-group > .tab-btn > button").on('click',function() {
	        var $idx = $(this).index();

	        $(this).addClass("on").siblings().removeClass("on");
	        $(this).closest(".tab-group").children(".tab-inr").find(" > .tab-box:eq("+ $idx +")").addClass("on").siblings().removeClass("on");
	    });
	 	
	 	
	});

		function getEmpSearch(par){
			let params = {};
			params.comDepartCode = par;		
			
			$.ajax({
				url:'/team/searchemp.do',
				type: 'POST',
				data: params,
				dataType : 'json',
				success:function(data){
					debugger;
					console.log(data);
					let vhtml = [];	
					let cntNum = 0;
					$("#emptab").find("tbody").html("");
					
					if(data.length===0){
						// 데이터가 없습니다. 
		                vhtml.push("<tr><td colspan='4' style='text-align: center; height: 30px;'>조회된 사원이 없습니다.</td></tr>");
					}else{
						
						for ( var i in data) {
							let item = data[i];
						
		            		vhtml.push("<tr comNo='"+strChk(item.comNo)+"' userName='"+strChk(item.userName)+"' comDepartCode='"+strChk(item.comDepartCode)+"' deptFullName='"+strChk(item.deptFullName)+"' comJobx='"+strChk(item.comJobx)+"' comJobxNm='"+item.comJobxNm+"' comPosition='"+strChk(item.comPosition)+"' comPositionNm='"+strChk(item.comPositionNm)+"' comCertBelt='"+strChk(item.comCertBelt)+"' comCertBeltNm='"+strChk(item.comCertBeltNm)+"' >");
		            		vhtml.push("<td class='text-align-center'>"); 
		            		vhtml.push("<div>");
		            		vhtml.push("<input type='checkbox' id='chkNo_"+i+"' name='chkNo'>");
		            		vhtml.push("<label for='chkNo_"+i+"'></label>");
		            		vhtml.push("</div>");
		            		vhtml.push("</td>");
		            		 
							vhtml.push("<td class='text-align-center'><span>" + strChk(item.userName) + "</span></td>");
							vhtml.push("<td class='text-align-center'><span>" + strChk(item.comJobxNm) + "</span></td>");
							vhtml.push("<td class='text-align-center'><span>" + strChk(item.comPositionNm)+ "</span></td>");
							//vhtml.push("<td><span>" + strChk(item.comCertBeltNm) + "</span></td>");
							vhtml.push("</tr>");
							
							cntNum = cntNum+1;
						}
						
					}
					console.log(cntNum);
					$("#emptab").find("tbody").append(vhtml.join(''));
					$("#empTit").text("총 "+cntNum+"명");
					

				}
			});
			
		}
		
		function checkValidation(){

		    var leader1 = "";
		    var leader2 = "";
		    var leader3 = "";
		    var leader4 = "";
		    var leader5 = "";
		    var leader6 = "";
		    var leader7 = "";
		    var leader8 = "";
		    
		    $("#leadertab").children("tbody:first").children("tr[comNo]").each(function(i){
		    	
		    	var comNo = $(this).attr("comNo");
				var userName   = $(this).attr("userName");
				var comDepartCode   = $(this).attr("comDepartCode");
				var comJobx   = $(this).attr("comJobx");
				var comJobxNm   = $(this).attr("comJobxNm");
				var comPosition   = $(this).attr("comPosition");
				var comPositionNm   = $(this).attr("comPositionNm");
				var comCertBelt   = $(this).attr("comCertBelt");
				var comCertBeltNm   = $(this).attr("comCertBeltNm");
				var deptFullName   = $(this).attr("deptFullName");
				var cirMemCode = $(this).attr("cirMemCode");
				
				leader1 += comNo + ",";
				leader2 += userName + ",";
				leader3 += comDepartCode + ",";
				leader4 += comJobx + ",";
				leader5 += comPosition + ",";
				leader6 += comCertBelt + ",";
				leader7 += deptFullName + ",";
				leader8 += cirMemCode + ",";
				
			});

		    leader1 = leader1.substring(0, leader1.length-1);
		    leader2 = leader2.substring(0, leader2.length-1);
		    leader3 = leader3.substring(0, leader3.length-1);
		    leader4 = leader4.substring(0, leader4.length-1);
		    leader5 = leader5.substring(0, leader5.length-1);
		    leader6 = leader6.substring(0, leader6.length-1);
		    leader7 = leader7.substring(0, leader7.length-1);
		    leader8 = leader8.substring(0, leader8.length-1);
		    
		    $("#leader1").val(leader1);
		    $("#leader2").val(leader2);
		    $("#leader3").val(leader3);
		    $("#leader4").val(leader4);
		    $("#leader5").val(leader5);
		    $("#leader6").val(leader6);
		    $("#leader7").val(leader7);
		    $("#leader8").val(leader8);
		    
		    var team1 = "";
		    var team2 = "";
		    var team3 = "";
		    var team4 = "";
		    var team5 = "";
		    var team6 = "";
		    var team7 = "";
		    var team8 = "";
		    
		    $("#teamtab").children("tbody:first").children("tr[comNo]").each(function(i){
		    	var comNo = $(this).attr("comNo");
				var userName   = $(this).attr("userName");
				var comDepartCode   = $(this).attr("comDepartCode");
				var comJobx   = $(this).attr("comJobx");
				var comJobxNm   = $(this).attr("comJobxNm");
				var comPosition   = $(this).attr("comPosition");
				var comPositionNm   = $(this).attr("comPositionNm");
				var comCertBelt   = $(this).attr("comCertBelt");
				var comCertBeltNm   = $(this).attr("comCertBeltNm");
				var deptFullName   = $(this).attr("deptFullName");
				var cirMemCode = $(this).attr("cirMemCode");
				
				team1 += comNo + ",";
				team2 += userName + ",";
				team3 += comDepartCode + ",";
				team4 += comJobx + ",";
				team5 += comPosition + ",";
				team6 += comCertBelt + ",";
				team7 += deptFullName + ",";
				team8 += cirMemCode + ",";
			});
		    
		    team1 = team1.substring(0, team1.length-1);
		    team2 = team2.substring(0, team2.length-1);
		    team3 = team3.substring(0, team3.length-1);
		    team4 = team4.substring(0, team4.length-1);
		    team5 = team5.substring(0, team5.length-1);
		    team6 = team6.substring(0, team6.length-1);
		    team7 = team7.substring(0, team7.length-1);
		    team8 = team8.substring(0, team8.length-1);
		    
		    $("#team1").val(team1);
		    $("#team2").val(team2);
		    $("#team3").val(team3);
		    $("#team4").val(team4);
		    $("#team5").val(team5);
		    $("#team6").val(team6);
		    $("#team7").val(team7);
		    $("#team8").val(team8);
			
			return true;
		}
		
		function onclick_tab(idx){
			location.href="/kpi/MgrSelect.do?menuKey=${menuKey}&kudIdx="+idx;
		}
		
		var deptList = ${deptList};
	</script>
</body>
</html>