<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
			
    <!-- footer -->
    <footer>
        <div class="inner">
            <div class="footer-logo">
                <img src="/assets/images/footer_logo.png" alt="LX 하우시스">
                <span>품질혁신지원시스템</span>
            </div>
            <p class="copyright">COPYRIGHT © 2021 LX HAUSYS. ALL RIGHTS RESERVED.</p>
        </div>
    </footer>
    <!-- //footer -->
</div>
<iframe title="다운로드 프레임" id="downloadFrame" name="downloadFrame" width="0" height="0"></iframe>

<div class="modal-dimmed"></div>
<!-- 12 조직조회 -->
<div class="org-modal" id="comPopup_orgSearch">
    <div class="modal-header">
        <h4>조직조회</h4>
        <button type="button" class="btn-close">닫기</button>
    </div>
    <div class="modal-content">
        <div class="list-wrap">
            <div class="list-search">
                <!-- <form id="org-form" onsubmit="org_search();return false;"> -->
                    <div class="search-form">
                        <div class="form-inline form-input">
                            <label>조직명</label>
                            <input type="text" name="dept_name" id="txtSearchDeptName">
                        </div>
                        <button type="submit" class="btn-submit" onclick="return popDept.callData()">조회</button>
                    </div>
                <!-- </form> -->
            </div>
        </div>
        
       	<div class="list-wrap">
	        <div class="list-content" style="max-height: 300px; overflow: auto;">
	            <div class="list-table list">
                <table class="centered tb-popup-table">
                    <caption></caption>
                    <colgroup>
                        <col style="width:50px">
                        <col>
                    </colgroup>
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th>조직명</th>
                        </tr>
                    </thead>
                    
                     <tbody id="tbodyDeptSearch" class="tbody-search-result">
                        <tr class="tr-empty">
                        	<td colspan="2" style="text-align: center; height:30px;">검색어를 입력하세요.</td>
                        </tr>
                    </tbody>
                    
                </table>
                </div>
            </div>
	        <div class="btns">
	            <button type="button" class="btn-submit" onclick="popDept.onSubmit()">확인</button>
	            <button type="button" class="btn-cancel" onclick="popDept.close()">취소</button>
	        </div>
       </div>
   </div>
</div>
	            <script>
	            
	            	
	            
	            	let popDept = {
	            			returnObjId : null,  //팝업에서 선택한 사람을 리턴할 객체
	            			returnFunc : null,
	            			searchObjId : "txtSearchDeptName",
	            			modalPopId : "comPopup_orgSearch",
	            			dataAppendId : "tbodyDeptSearch",
	            			radioObjClass : "radio-selected",
	            			open : function(){
	            				$(".modal-dimmed").show();
	            				$("#"+this.modalPopId).show();
	            			},
	            			close: function(flag){
	            				$(".modal-dimmed").hide();
	            		 		$("#"+this.modalPopId).hide();
	            		 		
	    	            		if(!flag && this.returnFunc){
	    	            			this.returnFunc(popDept.returnObjId, null); //리턴함수 호출, 초기화 전 객체명 넘기기
	    	            		}	    	            		
	            		 		this.init();
	            			},
	            			init : function(){
	            				$(".tr-empty").show();
	            				$(".tr-data").remove();
	            				$("#"+popDept.searchObjId).val("");
	            				$("#"+popDept.searchObjId).off("keyup").on("keyup", function(e){
	            					if(e.keyCode==13){
	            						popDept.callData();
	            					}	
	            				});
	            				
	            				this.returnObjId = null;
	            				this.returnFunc = null;
	            			},
	            			callData : function(){
	            				
	            				if($("#"+this.searchObjId).val().trim().length<1){
	            					return false;
	            				}
	            				
	            				var searchText = $("#"+this.searchObjId).val();
	            				var posting = $.post( "/qpopup/getDeptSearch.do", { deptName: searchText }, this.setData, "json" );
	            				
	            				return false; // submit 방지용
	            			},
	            			setData : function(data){
	            				
	            				const selectObjId = "org_search_selected";//select 객체명
	            				//{"userId":"parksoomin","userName":"박수민"
	            				//,"deptFullName":"울산설비팀(전기PM／변전실)"
	            				//,"comJobx":"FE0","comPosition":"생산파트장","comCertBelt":null}
	            				$(".tr-empty").hide();
	            				$(".tr-data").remove();
	            				if(data.length===0){
	            					// 데이터가 없습니다. 
	            					
	            					let htm = "<tr class='tr-data'> \n"+
		                                "<td colspan='2' style='text-align: center; height: 30px;'>조회된 사원이 없습니다.</td> \n"+ 
		                            "</tr>";
		    	            		$("#"+this.dataAppendId).append(htm);
	            				}
	            				for ( var i in data) {
	            					let item = data[i];
	            					let htm = "<tr class='tr-data' onclick='popDept.onclickTr(this)' data='"+JSON.stringify(item)+"' > \n"+
		                                "<td><input type='radio' name='"+ selectObjId +"' class='"+ popDept.radioObjClass +"' value='"+item.deptCode+"'/></td> \n"+
		                                "<td>"+strChk(item.deptName)+"</td> \n"+ 
		                            "</tr>";
		    	            		$("#"+popDept.dataAppendId).append(htm);
								}
	            				
	    	            		$("input[name="+ selectObjId +"]:eq(0)").prop("checked", true);
	    	            	}, 
	    	            	
	    	            	onclickTr : function(obj){
	    	            		$(obj).find("."+this.radioObjClass).prop("checked", true);
	    	            	},
	    	            	onSubmit: function(){
	    	            		
	    	            		let checkedItem = $("."+ popDept.radioObjClass +":checked").closest("tr");
	    	            		let retData = checkedItem.attr("data");
	    	            		retData = JSON.parse(retData);
	    	            		
	    	            		if(this.returnFunc){
	    	            			this.returnFunc(popDept.returnObjId, retData); //리턴함수 호출, 초기화 전 객체명 넘기기
	    	            			this.close(true);	// 팝업 Close, 각 파라메터 초기화
	    	            		} else {
	    	            			alert("반환 함수가 정의되지 않았습니다.");
	    	            		}
	    	            	}
	            			
	            	};

	            </script>


<div class="org-modal" id="comPopup_deptSearchMulti">
    <div class="modal-header">
        <h4>조직조회</h4>
        <button type="button" class="btn-close">닫기</button>
    </div>
    <div class="modal-content">
        <div class="list-wrap">
            <div class="list-search">
                <!-- <form id="org-form" onsubmit="org_search();return false;"> -->
                    <div class="search-form">
                        <div class="form-inline form-input">
                            <label>조직명</label>
                            <input type="text" name="dept_name2" id="txtSearchMDeptName">
                        </div>
                        <button type="submit" class="btn-submit" id="btnSearchMDept">조회</button>
                    </div>
                <!-- </form> -->
            </div>
        </div>
        <div class="tree-header">
            <div>
                <input type="checkbox" id="orgSelAll">
                <label for="orgSelAll"></label>
            </div>
            <div>
                6σ 인재육성대상 조직명
            </div>
        </div>
        <div id="objDeptTree" class="jstree jstree-1 jstree-default jstree-checkbox-selection" role="tree" aria-multiselectable="true" tabindex="0" aria-activedescendant="j1_1" aria-busy="false">
        <ul class="jstree-container-ul jstree-children" role="group">
        </ul></div>
        <div class="btns">
            <button type="button" class="btn-submit" onclick="return popMDept.callData()">확인</button>
            <button type="button" class="btn-cancel">취소</button>
        </div>
    </div>
</div>

	            <script>
	            
	            	
	            
	            	let popMDept = {
	            			returnObjId : null,  //팝업에서 선택한 사람을 리턴할 객체
	            			returnFunc : null,
	            			searchObjId : "txtSearchMDeptName",
	            			modalPopId : "comPopup_deptSearchMulti",
	            			//dataAppendId : "tbodyDeptSearch",
	            			//radioObjClass : "radio-selected",
	            			open : function(){
	            				$(".modal-dimmed").show();
	            				$("#"+this.modalPopId).show();
	            			},
	            			close: function(flag){
	            				$(".modal-dimmed").hide();
	            		 		$("#"+this.modalPopId).hide();
	            		 		
	    	            		if(!flag && this.returnFunc){
	    	            			this.returnFunc(popDept.returnObjId, null); //리턴함수 호출, 초기화 전 객체명 넘기기
	    	            		}	    	            		
	            		 		this.init();
	            			},
	            			init : function(){
	            				
	            				if(!objDeptTreeData){
	            					alert("데이터가 로딩되지 않았습니다.");
	            					return;
	            				}
	            				
	            			    $('#objDeptTree').jstree({
	            			    	"core": {
	            			    	      "data": objDeptTreeData
	            			    	    },
		            		        "plugins" : ['checkbox','search'],
		            		        "search" : {
		            		            "show_only_matches" : true,
	            		            	"show_only_matches_children" : true,
            		        		},
		            		    })
		            		    .on("check_node.jstree uncheck_node.jstree", function (e, data) {
		            		    	debugger;
		            		        if (e.type == "uncheck_node") {
		            		            $("#orgSelAll").prop( "checked", false );                
		            		        }
			            		        else if (e.type == "check_node") {					
		            		            if ($(this).jstree().get_json('#', {flat:true}).length === $(this).jstree().get_checked(true).length)
		            		                $("#orgSelAll").prop( "checked", true ); 					
		            		        }
		            		    });
	            			    
	            			    $("#btnSearchMDept").off("click").on("click", function(){
	            			        var text = $('#txtSearchMDeptName').val();
	            			        $('#objDeptTree').jstree(true).search(text);
	            			    });
	            			    
	            			    
	            				$(".tr-empty").show();
	            				$(".tr-data").remove();
	            				$("#"+popDept.searchObjId).val("");
	            				$("#"+popDept.searchObjId).off("keyup").on("keyup", function(e){
	            					if(e.keyCode==13){
	            						popDept.callData();
	            					}	
	            				});
	            				
	            				this.returnObjId = null;
	            				this.returnFunc = null;
	            			},
	            			callData : function(){
	            				
	            				if($("#"+this.searchObjId).val().trim().length<1){
	            					return false;
	            				}
	            				debugger;
	            				$(".jstree-node").each(function(i, o){

	            				    if($(this).attr("aria-selected")==="true"){
	            				        console.log($(this).attr("id"), $(this).text());
	            				    }
	            				})
	            				
	            				var searchText = $("#"+this.searchObjId).val();
	            				var posting = $.post( "/qpopup/getDeptSearch.do", { deptName: searchText }, this.setData, "json" );
	            				
	            				return false; // submit 방지용
	            			},
	            			setData : function(data){
	            				
	            				const selectObjId = "org_search_selected";//select 객체명
	            				//{"userId":"parksoomin","userName":"박수민"
	            				//,"deptFullName":"울산설비팀(전기PM／변전실)"
	            				//,"comJobx":"FE0","comPosition":"생산파트장","comCertBelt":null}
	            				$(".tr-empty").hide();
	            				$(".tr-data").remove();
	            				if(data.length===0){
	            					// 데이터가 없습니다. 
	            					
	            					let htm = "<tr class='tr-data'> \n"+
		                                "<td colspan='2' style='text-align: center; height: 30px;'>조회된 사원이 없습니다.</td> \n"+ 
		                            "</tr>";
		    	            		$("#"+this.dataAppendId).append(htm);
	            				}
	            				for ( var i in data) {
	            					let item = data[i];
	            					let htm = "<tr class='tr-data' onclick='popDept.onclickTr(this)' data='"+JSON.stringify(item)+"' > \n"+
		                                "<td><input type='radio' name='"+ selectObjId +"' class='"+ popDept.radioObjClass +"' value='"+item.deptCode+"'/></td> \n"+
		                                "<td>"+strChk(item.deptName)+"</td> \n"+ 
		                            "</tr>";
		    	            		$("#"+popDept.dataAppendId).append(htm);
								}
	            				
	    	            		$("input[name="+ selectObjId +"]:eq(0)").prop("checked", true);
	    	            	}, 
	    	            	
	    	            	onclickTr : function(obj){
	    	            		$(obj).find("."+this.radioObjClass).prop("checked", true);
	    	            	},
	    	            	onSubmit: function(){
	    	            		
	    	            		let checkedItem = $("."+ popDept.radioObjClass +":checked").closest("tr");
	    	            		let retData = checkedItem.attr("data");
	    	            		retData = JSON.parse(retData);
	    	            		
	    	            		if(this.returnFunc){
	    	            			this.returnFunc(popDept.returnObjId, retData); //리턴함수 호출, 초기화 전 객체명 넘기기
	    	            			this.close(true);	// 팝업 Close, 각 파라메터 초기화
	    	            		} else {
	    	            			alert("반환 함수가 정의되지 않았습니다.");
	    	            		}
	    	            	}
	            			
	            	};

	            </script>

<!-- 13 직책조회 -->
<div class="org-modal" id="comPopup_posSearch">
            <div class="modal-header">
                <h4>직책조회</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="list-wrap">
                    <div class="list-search">
                        <form id="org-form" onsubmit="org_search();return false;">
                            <div class="search-form">
                                <div class="form-inline form-input">
                                    <label>직책명</label>
                                    <input type="text" name="">
                                </div>
                                <button type="submit" class="btn-submit">조회</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="tree-header">
                    <div>
                        <input type="checkbox" id="orgSelAll">
                        <label for="orgSelAll"></label>
                    </div>
                    <div>
                        직책선택
                    </div>
                </div>
                <div id="org-tree" class="jstree jstree-1 jstree-default jstree-checkbox-selection" role="tree" aria-multiselectable="true" tabindex="0" aria-activedescendant="j1_1" aria-busy="false"><ul class="jstree-container-ul jstree-children" role="group"><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_1_anchor" id="j1_1" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_1_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사업부장</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_2_anchor" id="j1_2" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_2_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>담당</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_3_anchor" id="j1_3" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_3_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>팀장</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_4_anchor" id="j1_4" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_4_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>책임</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_5_anchor" id="j1_5" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_5_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>선임</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_6_anchor" id="j1_6" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_6_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원1</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_7_anchor" id="j1_7" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_7_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원2</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_8_anchor" id="j1_8" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_8_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원3</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_9_anchor" id="j1_9" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_9_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원4</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_10_anchor" id="j1_10" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_10_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원5</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_11_anchor" id="j1_11" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_11_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원6</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_12_anchor" id="j1_12" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_12_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원7</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_13_anchor" id="j1_13" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_13_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원8</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_14_anchor" id="j1_14" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_14_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원9</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_15_anchor" id="j1_15" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_15_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원10</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_16_anchor" id="j1_16" class="jstree-node  jstree-leaf jstree-last"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_16_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원11</a></li></ul></div>
                <div class="btns">
                    <button type="button" class="btn-submit">확인</button>
                    <button type="button" class="btn-cancel">취소</button>
                </div>
            </div>
        </div>
</div>




<style>
.tb-popup-table td { text-align: center !important; }
</style>
<!-- 29 사원조회 -->
<div class="org-modal" id="comPopup_memberSearch">
	<div class="modal-header">
	    <h4>사원조회</h4>
	    <button type="button" class="btn-close">닫기</button>
	</div>
	<div class="modal-content">
	    <div class="list-wrap">
	        <div class="list-search">
	            <!-- <form id="org-form" onsubmit="org_search();return false;"> -->
	                <div class="search-form">
	                    <div class="form-inline form-input">
	                        <label>이 름</label>
	                        <input type="text" name="search_name" id="txtSearchName">
	                    </div>
	                    <button type="button" class="btn-submit" onclick="return popEmp.callData()">조회</button>
	                </div>
	            <!-- </form> -->
	        </div>
	    </div>
	    <div class="list-wrap">
	        <div class="list-content" style="max-height: 300px; overflow: auto;">
	            <div class="list-table list">
                <table class="centered tb-popup-table">
                    <caption></caption>
                    <colgroup>
                        <col style="width:50px">
                        <col style="width:60px">
                        <col>
                        <col style="width:60px">
                        <col style="width:80px">
                        <col style="width:70px">
                    </colgroup>
                        <thead>
                            <tr>
                                <th>선택</th>
                                <th>이름</th>
                                <th>소속</th>
                                <th>직위</th>
                                <th>직책</th>
                                <th>Belt</th>
                            </tr>
                        </thead>
                        
	                        <tbody id="tbodyMemberSearch" class="tbody-search-result">
                            <tr class="tr-empty">
                            	<td colspan="6" style="text-align: center; height:30px;">검색어를 입력하세요.</td>
                            </tr>
                        </tbody>
                        
                    </table>
                </div>
            </div>
	            <script>
	            	
	            	let popEmp = {
	            			returnObjId : null,  //팝업에서 선택한 사람을 리턴할 객체
	            			returnFunc : null,
	            			open : function(){
	            				
	            				$(".modal-dimmed").show();
	            				$("#comPopup_memberSearch").show();
	            			},
	            			close: function(flag){
	            				$(".modal-dimmed").hide();
	            		 		$("#comPopup_memberSearch").hide();
	            		 		
	    	            		if(!flag && this.returnFunc){
	    	            			this.returnFunc(popDept.returnObjId, null); //리턴함수 호출, 초기화 전 객체명 넘기기
	    	            		}
	            		 		
	            		 		this.init();
	            			},
	            			init : function(){
	            				$(".tr-empty").show();
	            				$(".tr-data").remove();
	            				$("#txtSearchName").val("");
	            				$("#txtSearchName").off("keyup").on("keyup", function(e){
	            					if(e.keyCode==13){
	            						popEmp.callData();
	            					}	
	            				});
	            				
	            				this.returnObjId = null;
	            				this.returnFunc = null;
	            			},
	            			callData : function(){
	            				
	            				if($("#txtSearchName").val().trim().length<1){
	            					return false;
	            				}
	            				
	            				var searchText = $("#txtSearchName").val();
	            				var posting = $.post( "/qpopup/getEmpSearch.do", { userName: searchText }, this.setData, "json" );
	            				
	            				return false; // submit 방지
	            			},
	            			setData : function(data){
	            				
	            				//{"userId":"parksoomin","userName":"박수민"
	            				//,"deptFullName":"울산설비팀(전기PM／변전실)"
	            				//,"comJobx":"FE0","comPosition":"생산파트장","comCertBelt":null}
	            				$(".tr-empty").hide();
	            				$(".tr-data").remove();
	            				if(data.length===0){
	            					// 데이터가 없습니다. 
	            					
	            					let htm = "<tr class='tr-data'> \n"+
		                                "<td colspan='6' style='text-align: center; height: 30px;'>조회된 사원이 없습니다.</td> \n"+ 
		                            "</tr>";

		    	            		$("#tbodyMemberSearch").append(htm);
	            				}
	            				for ( var i in data) {
	            					let item = data[i];
	            					let htm = "<tr class='tr-data' onclick='popEmp.onclickTr(this)' data='"+JSON.stringify(item)+"' > \n"+
		                                "<td><input type='radio' name='member_search_selected' class='radio-selected-smember' value='"+item.com_no+"'/></td> \n"+
		                                "<td>"+strChk(item.userName)+"</td> \n"+
		                                "<td style='text-align: left !important;'>"+strChk(item.deptFullName)+"</td> \n"+
		                                "<td>"+strChk(item.comJobxNm)+"</td> \n"+
		                                "<td>"+strChk(item.comPositionNm)+"</td> \n"+
		                                "<td>"+strChk(item.comCertBeltNm)+"</td> \n"+ 
		                            "</tr>";
		    	            		$("#tbodyMemberSearch").append(htm);
								}
	            				
	    	            		$("input[name=member_search_selected]:eq(0)").prop("checked", true);
	    	            	}, 
	    	            	searchMember : function(){
	    	            		// 검색버튼
	    	            		$(".tr-empty").hide();
	    	            		popEmp.setData({});
	    	            	},
	    	            	onclickTr : function(obj){
	    	            		$(obj).find(".radio-selected-smember").prop("checked", true);
	    	            	},
	    	            	onSubmit: function(){
	    	            		let checkedItem = $(".radio-selected-smember:checked").closest("tr");
	    	            		let retData = checkedItem.attr("data");
	    	            		retData = JSON.parse(retData);
	    	            		
	    	            		if(this.returnFunc){
	    	            			this.returnFunc(this.returnObjId, retData); //리턴함수 호출, 초기화 전 객체명 넘기기
	    	            			this.close(true);	// 팝업 Close, 각 파라메터 초기화
	    	            		} else {
	    	            			alert("반환 함수가 정의되지 않았습니다.");
	    	            		}
	    	            		
	    	            		
	    	            		
	    	            		
	    	            	}
	            	};

	            </script>
	            
	            <div class="list-footer">
	                <div class="pagination" style="display: none;">
	                    <a href="" class="first">처음</a>
	                    <a href="" class="prev">이전</a>
	                    <a href="" class="cur num">1</a>
	                    <a href="" class="num">2</a>
	                    <a href="" class="num">3</a>
	                    <a href="" class="num">4</a>
	                    <a href="" class="num">5</a>
	                    <a href="" class="next">다음</a>
	                    <a href="" class="last">끝</a>
	                </div>
	                <div class="btns">
	                    <button class="btn-submit" onclick="popEmp.onSubmit()">확인</button>
	                    <button class="btn-cancel" onclick="popEmp.close()">취소</button>
	                </div>
	            </div>
	        </div>
	    </div>
</div>

<!-- 48 쪽지제안검색-->
<div class="org-modal" id="comPopup_pmsgSearch">
	<div class="modal-header">
	    <h4>쪽지 제안 검색</h4>
	    <button type="button" class="btn-close">닫기</button>
	</div>
	<div class="modal-content">
	    <div class="list-wrap">
	        <div class="list-search">
	             <!-- <form> -->
	                 <div class="search-form">
<!-- 	                     <div class="form-inline form-select">
	                         <label>구분</label>
	                         <select name="select-proposal-type-code" id="select-proposal-type-code"></select>                                                    
	                     </div> -->	                    
	                     <div class="form-inline form-select">
	                         <label>제안유형</label>                                            
	                         <select name="select-proposal-category-code" id="select-proposal-category-code">
	                             	<option value="">선택</option>
                                    <c:forEach var="item" items="${CATEGORY_LIST }">
                                   		<option value="${item.codeId }">${item.codeNm }</option>                	
                                    </c:forEach>
	                         </select>                                            
	                     </div>
	                      <div class="form-inline form-input">
	                         <input type="text" name="input-memo-proposal-name" id="input-memo-proposal-name">
	                     </div>                                     
	                     <button type="button" class="btn-submit" onclick="popRelMemo.callData(1)">조회</button>
	                 </div>
	             <!-- </form> -->
	        </div>
	    </div>
	    <div class="list-wrap">
	        <div class="list-content">
	            <div class="list-table list">
	                <table class="centered">
	                    <caption></caption>
	                    <colgroup>
	                        <col style="width:50px">
	                        <col>
	                        <col style="width:120px">	                        
	                        <col style="width:80px">	                        
	                    </colgroup>
	                        <thead>
	                            <tr>
	                                <th>선택</th>
	                                <th>쪽지제안명</th>
	                                <th>제안유형</th>
	                                <th>제안자</th>	                                
	                            </tr>
	                        </thead>
	                        <tbody id="tbodyProposalSearch" class="tbody-search-result">
<!-- 	                            <tr>
	                                <td><input type="radio" /></td>	                                
	                                <td>젠체 쪽지 제안(신청, 심사완료 등 전체)명</td>
	                                <td>생산향상</td>
	                                <td>홍길동</td>	                                
	                            </tr>
	                            <tr>
	                                <td><input type="radio" /></td>	                                
	                                <td>젠체 쪽지 제안(신청, 심사완료 등 전체)명</td>
	                                <td>생산향상</td>
	                                <td>홍길동</td>	                                
	                            </tr> -->
	                            <tr class="tr-empty">
	                            	<td colspan="4" style="text-align: center; height: 30px;">쪽지제안을 검색해 주세요.</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	            <div class="list-footer">
                    <div class="pagination" id="proposal-rel-memo-pagination">
<!--                         <a href="" class="first">처음</a>
                        <a href="" class="prev">이전</a>
                        <a href="" class="cur num">1</a>
                        <a href="" class="num">2</a>
                        <a href="" class="num">3</a>
                        <a href="" class="num">4</a>
                        <a href="" class="num">5</a>
                        <a href="" class="next">다음</a>
                        <a href="" class="last">끝</a> -->
                    </div>	            
	                <div class="btns">
	                    <button type="button" class="btn-submit" onclick="popRelMemo.onSubmit()">확인</button>
	                    <button type="button" class="btn-cancel">취소</button>
	                </div>
	            </div>
	            <script type="text/javascript">
	            	var popRelMemo = {
	            		pageSize:10,
	            		totalPages: 0,
	            		curPage: 1,
	            		returnObjId: null,
	            		returnFunc: null,
	            		open: function(){
	            			/*$.post( "/csl/code/selectFullListByCodeGrpId.do", { codeGrpId: 'PP_TY' }, function(response){
	            				console.log(response);
	            			}, "json" );*/
	            			$.post( "/csl/code/selectFullListByCodeGrpId.do", { codeGrpId: 'PPS_CTY' }, function(data){
	            				if(data != null && data.codeCnt > 0){
	            					var options = '<option value="">전체</option>';
	            					for(var index = 0; index < data.codeCnt; index++){
	            						var codeItem = data.codeList[index];
	            						options += '<option value="' + codeItem.codeId + '">' + codeItem.codeNm + '</option>';
	            					}
	            					$('#select-proposal-category-code').html(options);
	            				}
	            			}, "json" );
	            			popRelMemo.callData(1);
	            			$('.modal-dimmed').show();
	            			$('#comPopup_pmsgSearch').show();
	            		},
	            		close: function(){
	            			$('.modal-dimmed').hide();
	            			$('#comPopup_pmsgSearch').hide();
	            			
	            			this.init();
	            		},
	            		init: function(){
            				$(".tr-empty").show();
            				$(".tr-data").remove();
            				$("#input-memo-proposal-name").val("");
            				
            				this.returnObjId = null;
            				this.returnFunc = null;	            
            				
            				$("#input-memo-proposal-name").off("keyup").on("keyup", function(e){
            					if(e.keyCode==13){
            						popEmp.callData();
            					}	
            				});
	            		},
	            		callData: function(page){
	            			popRelMemo.curPage = page;
	            			$.post('/proposal/memoProposalSearch.do', { propCategoryCode: $('#select-proposal-category-code').val(), propName: $('#input-memo-proposal-name').val(), currentPageNo: page }, this.setData, 'json');
	            		},
	            		setData: function(data){
	            			if(data.list.length == 0){
	            				var html = '<td colspan="4" style="text-align: center; height: 30px;">조회된 쪽지제안이 없습니다.</td>';
	            				$('#tbodyProposalSearch').html(html);
	            			}else{
	            				var html = '';
	            				for(var index = 0; index < data.list.length; index++){
	            					var item = data.list[index];
	                            	html += '<tr class="tr-data" onclick="popRelMemo.onClickTr(this)" data="'+ encodeURIComponent(JSON.stringify(item)) +'">';
	                            	html += '<td><input type="radio" name="proposal_search_selected" class="radio-selected-proposal" value="' + item.propSeq + '"/></td>';
	                            	html += '<td>' + item.propName + '</td>';
	                            	html += '<td>' + item.propCategoryCodeName + '</td>';
	                            	html += '<td>' + item.propUserName + '</td>';
	                            	html += '</tr>';	                            	
	            				}
	            				
	            				$('#tbodyProposalSearch').html(html);
	            				$("input[name=proposal_search_selected]:eq(0)").prop("checked", true);
	            				
	            				html = '';
	            				var totalCount = data.count;
	            				popRelMemo.totalPages = Math.ceil(totalCount / popRelMemo.pageSize);
	            				html = popRelMemo.setPagenation(popRelMemo.curPage, popRelMemo.totalPages);
	            				$('#proposal-rel-memo-pagination').html(html);
	            			}
	            		},
	            		onClickTr: function(obj){
	            			$(obj).find('.radio-selected-proposal').prop('checked', true);
	            		},
	            		onSubmit: function(){
	            			var tr = $('.radio-selected-proposal:checked').closest('tr');
	            			var data = tr.attr('data');
	            			data = JSON.parse(decodeURIComponent(data));
	            			
    	            		if(this.returnFunc){
    	            			this.returnFunc(this.returnObjId, data); //리턴함수 호출, 초기화 전 객체명 넘기기
    	            			this.close();	// 팝업 Close, 각 파라메터 초기화
    	            		} else {
    	            			alert("반환 함수가 정의되지 않았습니다.");
    	            		}
	            		},
	            		setPagenation: function(curPage, totalPages){
	            			var html = '';
	            			var pageLimit = 10;
	            			var startPage = parseInt((curPage - 1) / pageLimit) * pageLimit + 1;
	            			var endPage = startPage + pageLimit - 1;
	            			
	            			if(totalPages < endPage){ endPage = popRelMemo.totalPages;}
	            			var nextPage = endPage + 1;
	            			
	            			//if(curPage > 1 && pageLimit < curPage) {
	            				html += '<a href="javascript:popRelMemo.callData(1);" class="first">처음</a>';
	            			//}
	            			
	            			//if(curPage > pageLimit){
	            				html += '<a href="javascript:popRelMemo.callData(' + (startPage == 1 ? 1 : startPage - 1) + ');" class="prev">이전</a>';
	            			//}
	            			
	            			for(var index = startPage; index <= endPage; index++){
	            				if(index == curPage){
	            					html += '<a href="javascript:popRelMemo.callData(' + index + ');" class="cur num">' + index + '</a>';
	            				}else{
	            					html += '<a href="javascript:popRelMemo.callData(' + index + ');" class="num">' + index + '</a>';
	            				}
	            			}
	            			
	            			//if(nextPage <= totalPages){
	            				html += '<a href="javascript:popRelMemo.callData(' + (nextPage < totalPages ? nextPage : totalPages) + ');" class="next">다음</a>';
	            			//}
	            			
	            			//if(curPage < totalPages && nextPage < totalPages){
	            				html += '<a href="javascript:popRelMemo.callData(' + totalPages + ');" class="last">끝</a>';
	            			//}
	            			
	            			return html;
	            		}
	            	}
	            </script>
	        </div>
	    </div>
</div>
<!-- 78 승인정보 등록 -->
<div class="org-modal" id="comPopup_apprInfoRegi">
	<div class="modal-header">
	    <h4>승인정보 등록</h4>
	    <button type="button" class="btn-close">닫기</button>
	</div>
	<div class="modal-content">
	    <div class="list-wrap">
										
			<div class="list-table">
				<table class="even">
                   <colgroup>                                            
                       <col style="width:50px">
                       <col style="width:150px">
                       <col style="width:150px">
                       <col style="width:150px">
                       <col style="width:100px">
                       <col style="width:100px">                                           
                   </colgroup>
                   <thead>
                   	   <tr class="tr-appr-eval">
                           <th class="bg-gray font-weight-bold">항목</th>
                           <th class="bg-gray font-weight-bold" colspan="3">평가등급기준</th>
                           <th class="bg-gray font-weight-bold">기준점수</th>
                           <th class="bg-gray font-weight-bold">가중치</th>                                                                                                                                                                                    
                       </tr>
<!--                        <tr class="tr-appr-eval">
                       	   <th class="font-weight-bold"></th>
                           <th class="font-weight-bold">개선 효과금액</th>
                           <th class="font-weight-bold">비금액 효과</th>
                           <th class="font-weight-bold">환경/안전효과</th>
                           <th class="font-weight-bold" colspan="2"></th>                                                                                         
                       </tr> -->                                            
                   </thead>
                   <tbody>
                       <tr class="tr-appr-eval">
                       	<td rowspan="2">효과</td>
                       	<td>개선 효과금액</td>
                       	<td>비금액 효과</td>
                       	<td>환경/안전효과</td>
                       	<td colspan="2">-</td>
                       </tr>
                       <tr class="tr-appr-eval">
                       	<td style="text-align: left;">
                       		- 효과금액 1억원 이상<br>
                       		- 효과금액 5천만원 이상<br>
                       		- 효과금액 3천만원 이상<br>
                       		- 효과금액 1천만원 이상<br>
                       		- 효과금액 5백만원 이상
                       	</td>
                       	<td style="text-align: left;">
                       		- 개선효과가 획기적임<br>
                       		- 개선효과가 상당함<br>
                       		- 개선효과가 양호함<br>
                       		- 개선효과가 단순함<br>
                       		- 개선효과가 미흡함                       	
                       	</td>
                       	<td style="text-align: left;">
                       		- 매우 치명적임<br>
                       		- 상당히 치명적임<br>
                       		- 치명적임<br>
                       		- 조금 치명적임<br>
                       		- 치명적이지 않음                            		
                       	</td>
                       	<td>
                       		50<br>
                       		40<br>
                       		30<br>
                       		20<br>
                       		10                       	
                       	</td>
                       	<td>
                           	<div class="col s12 input-text">
                           		<input type="text" id="evalScore1" class="align-right eval-score" oninput="popApprove.inputScore(this);">
                            </div>                       	
                       	</td>
                       </tr>
                       <tr class="tr-appr-eval">
                       	<td>창의성</td>
                       	<td colspan="3" style="text-align: left;">
                       		- 독창적이고 착안점이 우수함<br>
                       		- 매우 독창적임<br>
                       		- 모방적이나 착안점이 우수함<br>
                       		- 모방적이나 약간의 노력이 있음<br>
                       		- 단순 모방임                       	
                       	</td>
                       	<td>
                       	    20<br>
                       		16<br>
                       		12<br>
                       		8<br>
                       		4  
                       	</td>
                       	<td>
                           	<div class="col s12 input-text">
                           		<input type="text" id="evalScore2" class="align-right eval-score" oninput="popApprove.inputScore(this);">
                            </div>                       	
                       	</td>
                       </tr>
                       <tr class="tr-appr-eval">
                       	<td>파급성</td>
                       	<td colspan="3" style="text-align: left;">
                       		- 전사적 적용가능<br>
                       		- 공장내 적용가능<br>
                       		- 팀내(전 라인) 적용가능<br>
                       		- 라인 일부 적용 가능<br>
                       		- 개인차원의 효과                       	
                       	</td>
                       	<td>
                       	    10<br>
                       		8<br>
                       		6<br>
                       		4<br>
                       		2  
                       	</td>
                       	<td>
                           	<div class="col s12 input-text">
                           		<input type="text" id="evalScore3" class="align-right eval-score" oninput="popApprove.inputScore(this);">
                            </div>                       	
                       	</td>
                       </tr> 
                       <tr class="tr-appr-eval">
                       	<td>지속성</td>
                       	<td colspan="3" style="text-align: left;">
                       		- 영구적으로 유지<br>
                       		- 반영구적 유지(10년이상)<br>
                       		- 장기적 유지(5년 이상)<br>
                       		- 단기적 유지(1년 이상)<br>
                       		- 일시적(1년 미만)                       	
                       	</td>
                       	<td>
                       	    10<br>
                       		8<br>
                       		6<br>
                       		4<br>
                       		2  
                       	</td>
                       	<td>
                           	<div class="col s12 input-text">
                           		<input type="text" id="evalScore4" class="align-right eval-score" oninput="popApprove.inputScore(this);">
                            </div>                       	
                       	</td>
                       </tr>      
                       <tr class="tr-appr-eval">
                       	<td>노력도</td>
                       	<td colspan="3" style="text-align: left;">
                       		- 탁월한 노력이 엿보임<br>
                       		- 상당한 노력이 엿보임<br>
                       		- 어느정도의 노력이 엿보임<br>
                       		- 거의노력이 엿보이지 않음<br>                      	
                       	</td>
                       	<td>
                       	    10<br>
                       		8<br>
                       		6<br>
                       		4<br>
                       		2  
                       	</td>
                       	<td>
                           	<div class="col s12 input-text">
                           		<input type="text" id="evalScore5" class="align-right eval-score" oninput="popApprove.inputScore(this);">
                            </div>                       	
                       	</td>
                       </tr>                                                              
                       <tr class="tr-appr-eval">
                       	<th class="font-weight-bold" colspan="5">배점합계</th>
                           <td>
                           	<div class="col s12 input-text">
                           		<input type="text" id="evalScoreTotal" class="align-right" readonly="readonly">
                               </div>
                          	</td>                                                                                                                                                                                                                                               
                       </tr>
                       <tr>
                       	<td colspan="6">
                               <div class="row">
                                   <div class="col s12 input-text">
                                       <textarea name="POP_APPR_COMMENT" id="popAppr_comment" rows="4"></textarea>
                                   </div>
                               </div>
                           </td>
                       </tr>
                  </tbody>
                  </table>
              </div>
              <div class="list-footer">
     				<div class="list-btns center">
           		<button type="button" class="btn bg-gray" onclick="popApprove.onSubmit()">                                        
               		<span>결재승인</span>
           		</button>
           			<a href="javascript:popApprove.close();" class="btn">취소</a>                               
      				</div>
              </div>	    
  				
	    </div>
	</div>
</div>
<script>

let popApprove = {
		returnObjId : null,  //팝업에서 선택한 사람을 리턴할 객체
		returnFunc : null,
		searchObjId : "popAppr_comment",
		modalPopId : "comPopup_apprInfoRegi",
		isProposeAppr : true,	// 제안 결재시 
		//dataAppendId : "tbodyDeptSearch",
		//radioObjClass : "radio-selected",
		open : function(){
			$(".modal-dimmed").show();
			$("#"+this.modalPopId).show();
		},
		close: function(){
			$(".modal-dimmed").hide();
	 		$("#"+this.modalPopId).hide();
	 		
	 		this.init();
		},
		init : function(){
			
			$("#"+popApprove.searchObjId).val("");
			
			
			$(".appr-item").val("").off("change").on("change", function(){
				let scoreTotal = 0;
				$(".appr-item").each(function(i,o){
					scoreTotal += Number($(o).val());
				});
				$("#apprItemSum").val(scoreTotal);
			});
			$("#apprItemSum").val("0");
			
			this.returnObjId = null;
			this.returnFunc = null;
		},
		inputScore: function(el){
			if($(el).val().trim() != '' && /^[0-9]+$/.test($(el).val().trim()) == false){
				$(el).val($(el).val().trim().replace(/[^0-9]/g, ''));
				return false;
			}
			if($(el).attr('id') == 'evalScore1'){
				if(parseInt($(el).val()) > 50){
					$(el).val('');
					alert('기준점수를 초과 입력 하였습니다');
				}
			}
			if($(el).attr('id') == 'evalScore2'){
				if(parseInt($(el).val()) > 20){
					$(el).val('');
					alert('기준점수를 초과 입력 하였습니다');
				}
			}
			if($(el).attr('id') == 'evalScore3'){
				if(parseInt($(el).val()) > 10){
					$(el).val('');
					alert('기준점수를 초과 입력 하였습니다');
				}
			}
			if($(el).attr('id') == 'evalScore4'){
				if(parseInt($(el).val()) > 10){
					$(el).val('');
					alert('기준점수를 초과 입력 하였습니다');
				}
			}
			if($(el).attr('id') == 'evalScore5'){
				if(parseInt($(el).val()) > 10){
					$(el).val('');
					alert('기준점수를 초과 입력 하였습니다');
				}
			}
			popApprove.calcTotalScore();
			
		},
		calcTotalScore: function(){
			var total = 0;
			if($('#evalScore1').val() != '') {
				total += parseInt($('#evalScore1').val());
			}
			if($('#evalScore2').val() != '') {
				total += parseInt($('#evalScore2').val());
			}
			if($('#evalScore3').val() != '') {
				total += parseInt($('#evalScore3').val());
			}
			if($('#evalScore4').val() != '') {
				total += parseInt($('#evalScore4').val());
			}
			if($('#evalScore5').val() != '') {
				total += parseInt($('#evalScore5').val());
			}
			$('#evalScoreTotal').val(total);
		},
		setGenAppr: function(){
			$(".tr-appr-eval").remove();
			this.isProposeAppr = false;
			$("#popAppr_comment").css("height", "150px");
		},
		onSubmit: function(){    		
			if($('#evalScore1').val() == '') {
				alert('배점을 입력해 주세요');
				$('#evalScore1').focus();
				return false;
			}
			if($('#evalScore2').val() == '') {
				alert('배점을 입력해 주세요');
				$('#evalScore2').focus();
				return false;
			}
			if($('#evalScore3').val() == '') {
				alert('배점을 입력해 주세요');
				$('#evalScore3').focus();
				return false;
			}
			if($('#evalScore4').val() == '') {
				alert('배점을 입력해 주세요');
				$('#evalScore4').focus();
				return false;
			}
			if($('#evalScore5').val() == '') {
				alert('배점을 입력해 주세요');
				$('#evalScore5').focus();
				return false;
			}
    		
    		let letData = {
   				txtComment:$("#"+popApprove.searchObjId).val(),
   				score1:$("#evalScore1").val(),
   				score4:$("#evalScore2").val(),
   				score5:$("#evalScore3").val(),
   				score6:$("#evalScore4").val(),
   				score7:$("#evalScore5").val(),
   				scoreTotal:$("#evalScoreTotal").val()
    		};
    		
    		if(this.returnFunc){
    			this.returnFunc(popDept.returnObjId, letData); //리턴함수 호출, 초기화 전 객체명 넘기기
    			this.close();	// 팝업 Close, 각 파라메터 초기화
    		} else {
    			alert("반환 함수가 정의되지 않았습니다.");
    		}
    	}
};

</script>


<!-- 79 반려의견 등록 -->
<div class="org-modal" id="comPopup_rejectCommentsRegi">
	<div class="modal-header">
	    <h4>반려의견 등록</h4>
	    <button type="button" class="btn-close">닫기</button>
	</div>
	<div class="modal-content">
	    <div class="list-wrap">
		    <div class="list-table list">
		    	<table>
					<caption></caption>
						<colgroup>			
						<col>			
						</colgroup>
					<tbody>			
					<tr>			
						<td>
							<div class="row">
								<div class="col s12 input-text">
								<textarea id="popReject_comment" rows="10"></textarea>
								</div>
							</div>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
	    </div>
	    <div class="list-footer">
			<div class="list-btns center">
  				<button type="button" class="btn bg-gray" onclick="popReject.onSubmit()">                                        
      				<span>결재반려</span>
  				</button>
  					<a href="javascript:popReject.close();" class="btn">취소</a>                               
			</div>
     	</div>
   	</div>
</div>
<script>

let popReject = {
		returnObjId : null,  //팝업에서 선택한 사람을 리턴할 객체
		returnFunc : null,
		searchObjId : "popReject_comment",
		modalPopId : "comPopup_rejectCommentsRegi",
		//dataAppendId : "tbodyDeptSearch",
		//radioObjClass : "radio-selected",
		open : function(){
			$(".modal-dimmed").show();
			$("#"+this.modalPopId).show();
		},
		close: function(){
			$(".modal-dimmed").hide();
	 		$("#"+this.modalPopId).hide();
	 		
	 		this.init();
		},
		init : function(){
			
			$("#"+popReject.searchObjId).val("");
			
			this.returnObjId = null;
			this.returnFunc = null;
		},
    	onSubmit: function(){
    		
    		let letData = {
    				txtComment:$("#"+popReject.searchObjId).val()
    				};
    		
    		if(this.returnFunc){
    			this.returnFunc(popReject.returnObjId, letData); //리턴함수 호출, 초기화 전 객체명 넘기기
    			this.close();	// 팝업 Close, 각 파라메터 초기화
    		} else {
    			alert("반환 함수가 정의되지 않았습니다.");
    		}
    	}
};

</script>

<!-- 19 상세정보(사원정보) -->
<div class="org-modal" id="comPopup_detailMemberInfo">
            <div class="modal-header">
                <h4>상세정보</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="list-wrap">
                    <div class="list-content">
                        <div class="list-table list">
                            <table class="centered">
                                
                                <caption></caption>
                                <colgroup>
                                    <col style="width:100px">
                                    <col>
                                    <col style="width:100px">
                                    <col>                                    
                                </colgroup>
                                
                                <tbody>
                                    <tr>
                                        <th>사번</th>
                                        <td>사번1</td>
                                        <th>이름</th>
                                        <td>이름1</td>                                        
                                    </tr>
                                
                                    <tr>
                                        <th>근무지명</th>
                                        <td>근무지명1</td>
                                        <th>부문</th>
                                        <td>부문1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>소속명</th>
                                        <td>소속명1</td>
                                        <th>팀명</th>
                                        <td>팀명1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>직위</th>
                                        <td>직위1</td>
                                        <th>직책</th>
                                        <td>직책1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>신분유형</th>
                                        <td>신분유형1</td>
                                        <th>입사일</th>
                                        <td>입사일1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>직무명</th>
                                        <td>직무명1</td>
                                        <th>최종학력</th>
                                        <td>최종학력1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>인증형황</th>
                                        <td colspan="3">GB(2020.02.10) MGB(비대상), BB(2021.02.10)</td>                                        
                                    </tr>                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>                
            </div>
        </div>

<!-- 50 이미지 크게 보기 -->
<div class="org-modal" id="comPopup_BiggerImage">
            <div class="modal-header">
                <h4>이미지 크게보기</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <figure>
                    <img src="../_html2023/assets/images/@sample.jpg" width="100%" alt="" id="popup-image-path">                    
                </figure>
            </div>
            
     <script type="text/javascript">
     	var popBiggerImage = {
     		open: function(imagePath){
     			$('.modal-dimmed').show();
     			$('#comPopup_BiggerImage').show();
     			if(imagePath != null){
     				$('#popup-image-path').attr('src', imagePath);
     			}
     		},
     		close: function(){
     			$('.modal-dimmed').hide();
     			$('#comPopup_BiggerImage').hide();    			
     			$('#popup-image-path').attr('src', '');
     		}
     	}
     </script>
</div>


<!-- 도움말 Full Process여부 -->
<div class="org-modal" id="adviceModal">
            <div class="modal-header">
                <h4>도움말</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="advide-content">
                    Full Process여부 온라인 도움말 영역 (내용 수령 후 확인)
                </div>
            </div>
</div>
<style>
 
    
    .w100p { width: 100%;}

	.table-border tr td {
	    line-height: 1.3em !important;
	}

</style>
<script>
	let popAdvice = {
		message : {
			"6sigma-yn":"  ㄱ. 6σ Full Process : 6σ Process인 DMAIC 또는 DMEDI에 맞춰 과제를 진행하는 경우 선택 <br> \r\n"+
				"  ㄱ. 일반과제 : 6σ Process 단계별 진행이 아닌 일부 통계Tool만 사용시(예로, 공정능력분석/관리도 등) 선택.  <br> \r\n"+
				"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Quick 6σ / Big Data / FMEA / Task / Quick Win 과제를 등록시 선택 <br>\r\n"+
				"  ㄱ. 10+ No Policy : 10+ No Policy 에 해당하는 과제 등록시 선택  <br>\r\n",
			"rep-reader":"등록하려는 과제가 벨트 인증용(과제Test)으로 사용되는 경우는 BB후보 또는 MBB후보를 선택",
			"keyword":"과제 내용에 부합하는 키워드를 등록하면, 과제 검색에 큰 도움이 됨",
			"cal-logic":getCalLogicHtml()
		},
		open : function(msgId){
			$(".advide-content").html(this.message[msgId]);
			$(".modal-dimmed, #adviceModal").show();
		},
		close: function(){
			$(".modal-dimmed, #adviceModal").hide();
	 		
		},
	}
	
	function getCalLogicHtml(){
		return '<h4 style="font-weight:700;">◆ 산출 Logic - 공통 적용사항</h4> '+
		'<h5>- 개선 활동에 따른 명백한 효과금액만 직접적인 효과로 인정, 따라서 환경적요인(환율,유가,원재료 단가변동 등)의 효과는 제외함.</h5> '+
		'<h5>- 동일한 개선내용에 대해 중복으로 성과금액을 산출할 수 없음.</h5> '+
		'<div class="list-table list" style="width: 700px;">'+
		'<table class="table-border w100p">'+
		'    <caption></caption>'+
		'    <colgroup>'+
		'        <col style="width: 65px">'+
		'        <col style="width: 65px">'+
		'        <col style="width: 120px">'+
		'        <col>'+
		'        <col style="width: 160px">'+
		'    </colgroup>    '+
		'    <thead>'+
		'      <tr>'+
		'        <th colspan="2">구분</th>'+
		'        <th>세부항목</th>'+
		'        <th>산출Logic</th>'+
		'        <th>비고</th>'+
		'      </tr>'+
		'    </thead>'+
		'    <tbody>'+
		'      <tr>'+
		'        <td colspan="2">외부실패비용</td>'+
		'        <td>외부실패비용</td>'+
		'        <td> = (개선전 평균 외부실패비용 - 개선후 외부실패비용)</td>'+
		'        <td></td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td colspan="2">상품원가</td>'+
		'        <td>Total 상품  매입단가</td>'+
		'        <td> = (개선전 평균 단가 - 개선후 단가) × 매입량</td>'+
		'        <td>환율, 원재료 단가 변동 검증 필요</td>'+
		'      </tr>      '+
		'      <tr>'+
		'        <td rowspan="14">변동비</td>'+
		'        <td rowspan="6">원재료</td>'+
		'        <td>원재료 사용량 개선</td>'+
		'        <td> = (단위당 개선전 평균 투입량 - 단위당 개선후 투입량) × 생산량 × 사용단가</td>'+
		'        <td></td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>대체 원재료 투입</td>'+
		'        <td> = (개선전 평균 단가 - 대체후 단가) × 대체후 사용량</td>'+
		'        <td>대체 원재료 사용 후 양품율 하락추이 검증 필요</td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>Loss 개선(재활용X)</td>'+
		'        <td> = (개선전  Loss율 - 개선후 Loss율) × 원재료비율 X 생산액</td>'+
		'        <td>설비투자時 해당기간 감가상각비 고려</td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>Loss 개선(재활용○)</td>'+
		'        <td> = (개선전  Loss율 - 개선후 Loss율) × 총 생산수량 x Scrap 처리비용</td>'+
		'        <td></td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>구매단가인하</td>'+
		'        <td> = (개선전 평균 단가 - 개선후 단가) ×사용량</td>'+
		'        <td>환율, 원재료 단가 변동 검증 필요</td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>Scrap 사용량 <br>증대</td>'+
		'        <td> = (원재료 단가 - Scrap 단가) × Scrap 사용 증가량</td>'+
		'        <td>'+
		'            1) Scrap 발생량 보다 사용량이 적을 경우 or <br>'+
		'            2) Scrap의 외부 구입이 가능할 경우 적용함'+
		'        </td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td rowspan="3">소모품비</td>'+
		'        <td>사용수량 절감</td>'+
		'        <td> = (개선전 평균 - 개선후) 소모품 원단위 × 생산량 </td>'+
		'        <td></td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>재질 변경</td>'+
		'        <td> = (개선전 평균 단가 - 대체후 단가) × 대체후 사용량</td>'+
		'        <td></td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>Pallet 회수</td>'+
		'        <td> = (개선전 평균 - 개선후) Pallet회수율 * 총Pallet수량 * 개당Pallet (제작비-회수비)</td>'+
		'        <td></td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>운반비</td>'+
		'        <td>운반 단가인하</td>'+
		'        <td>최저임금 / 유가 인상 등 외부요인 보정 필요</td>'+
		'        <td></td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>전력<br>/연료비</td>'+
		'        <td>원단위 절감</td>'+
		'        <td> = (개선전 평균 - 개선후) 에너지 원단위 × 생산량 × 에너지단가 </td>'+
		'        <td rowspan="3">'+
		'            - 설비투자時 해당기간 감가상각비 고려<br>'+
		'            - 최저임금 인상 / Util단가 인상 등 외부요인 보정 필요'+
		'        </td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td rowspan="3">외주<br>가공비</td>'+
		'        <td>생산액 기준 지급時</td>'+
		'        <td> =  (개선전 평균 외주단가 - 개선후 외주단가) × 외주 생산량</td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>시간 기준 지급時</td>'+
		'        <td> = (개선전 평균 인시당 외주비 - 개선후 인시당 외주비) × 총 작업 시간</td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>In-House<br>/Outsourcing</td>'+
		'        <td> = (자체생산원가 - OEM 생산단가) X 생산수량 - InHouse당시 부담한 공통비</td>'+
		'        <td>Outsourcing으로 인해 감소되지 않는 공통비 고려<br>'+
		'            (다른 In-House 부문 분담)</td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td rowspan="6">고정비</td>'+
		'        <td rowspan="3">노무비</td>'+
		'        <td>내부 인원절감(퇴직,전배)</td>'+
		'        <td> = 절감인원 × 개선전 평균 인당 노무비</td>'+
		'        <td></td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>외주 인원 대체</td>'+
		'        <td> = (개선전 평균 노무비 - 외주 인건비) x 인원수</td>'+
		'        <td></td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>공수관리</td>'+
		'        <td> = (개선후 인시당 생산액 - 개선전  인시당 생산액) × 인시 X 임금비율</td>'+
		'        <td></td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td rowspan="2">수선비</td>'+
		'        <td>외주공사<br>→PM실 활용</td>'+
		'        <td> = 외주공사료 - (임율 × 초과근무시간 × 투여인원 + 공사재료비)</td>'+
		'        <td></td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>외주 공사비 Down</td>'+
		'        <td> = 개선전 외주공사비 - 개선후 외주공사비</td>'+
		'        <td>동일 외주공사인 경우 적용 가능</td>'+
		'      </tr>'+
		'      <tr>'+
		'        <td>생산성</td>'+
		'        <td>생산 속도 향상</td>'+
		'        <td>① Capa 여유시: (개선전 평균 - 개선후) 단위당 생산시간 X 생산량 × 시간당 Utility비용<br>'+
		'            ② Capa 부족시: (개선전 평균 - 개선후) 단위당 생산시간 X 생산량 × (임율 + 시간당 Utility비용)</td>'+
		'        <td>설비투자時 해당기간 감가상각비 고려</td>'+
		'      </tr>      '+
		'    </tbody>'+
		'</table>'+
		'</div>';
	}
</script>




