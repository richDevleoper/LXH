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
<title>메뉴사용설정</title>
<meta name="keywords" content="" />
<meta name="description" content="" />


<style type="text/css">
#tree-panel { width:405px; float:left; margin-top: 10px}
#form-panel { float:left; width:665px;  margin:27px 0 0 10px; overflow: visible; padding: 0; }

#tabmenu_top { float:left; width:405px; margin-left: 0px; margin-bottom:4px}
#tabmenu_top ul li { float:left; list-style-type:none;}
#tabmenu_bottom { float:left; width:400px; margin-left: 0px; margin-top:4px}
#tabmenu_bottom ul li { float:left; list-style-type:none;}
.tree {
	width:400px; height:680px; *height:510px; padding:5px 0; overflow: auto; border:1px solid silver;
	scrollbar-base-color: #FFFFFF; /* 아래의 6가지 스타일을 하나로 통합 한것 */
	scrollbar-face-color: #DDDDDD; /* bar 의 표면색 */
	scrollbar-track-color: #ffffff; /* 스크롤 트랙의 색 */
	scrollbar-highlight-color: #FFFFFF; /* 밝게 빛나는 좌상단 모서리 */
	scrollbar-3dlight-color: #FFFFFF; /* 좌상단 모서리 아래부분 */
	scrollbar-shadow-color: #FFFFFF; /* 그림자 지는 우하단 */
	scrollbar-darkshadow-color: #FFFFFF; /* 그림자 우하단 */
	scrollbar-arrow-color: #222222; /* 삼각형부분 */
}
/*.tree > ul > li:nth-child(even){background-color:#fff0ef;}*/
</style>

<script type="text/javascript" src="<c:url value='/csl/jquery/jstree-1.0-rc3/lib/jquery.hotkeys.js'/>"></script>
<script type="text/javascript" src="<c:url value='/csl/jquery/jstree-1.0-rc3/jquery.jstree.js'/>"></script>
<script type="text/javaScript" language="javascript">
<!--
(function($){

	$.makeTree = function(selector, menu) {
		var _selector = selector;
		if($(_selector).children('ul').length==0) {
			$("<ul></ul>").appendTo(_selector);
		}

		_selector = $("ul:first",_selector);

		var rel;
		//아이콘 구분
		if(menu.linkTyp == 'EMPTY') {
			rel = 'folder';
		} else {
			rel = 'menu';
		}
		
		//주메뉴 구분
		var naviFlg_style = "";
		if(menu.pkey == 0 && menu.naviFlg == 'Y'){
			naviFlg_style = "★";
		}
		
		//활성,비활성 메뉴 구분
		var actFlg_style = "";
		if(menu.actFlg != 'Y'){
			actFlg_style = "style=\"color:red;\"";
		}
		
		_selector = $("<li rel='"+rel+"'><a href='#' title='"+menu.menuKey+"' " + actFlg_style + ">"+ naviFlg_style+menu.menuNm+"</a></li>").attr('id',"menu_"+menu.menuKey).appendTo(_selector);
		
		var childList = menu.childList;
		if(childList!=null && childList.length > 0) {
			$(_selector).attr('class','jstree-open');
			for(var j=0; j< childList.length; j++) {
				if(childList[j]) {
					$.makeTree(_selector, childList[j]);
				}
			}
		}
	};
	
	var _INITID;
	var _menuList;
	$.getMenuList = function() {

		$('#menu_tree ul').remove();
		$("<ul></ul>").appendTo('#menu_tree');

		$.ajax({
			url : '/csl/menu/list.do'
	        ,method : "post"
			,dataType : 'json'
			,async:true
			,data : { 
				menuTyp:'${menuTyp}'
			}
			,beforeSend : function(){
				$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
			}
			,complete : function(){
				$.unblockUI();
			}
			,success : function(menuList, stat, xhr) {
				_menuList = menuList;
				for(var i=0; i< _menuList.length; i++) {
					if(_menuList[i].gkey == '0'){
						if(i==0) {
							_INITID = _menuList[i].menuKey;
						}
						if (_menuList[i]) {
							$.makeTree($('#menu_tree'), _menuList[i]);
						}
					}
				}
	
				$('#menu_tree').jstree({
					"core": {
						"strings":{new_node:"새메뉴"}
					},
					"themes":{"theme":"apple","dots":true, "icons":true},
					"ui" : {
						"select_limit" : 1,
						"select_multiple_modifier" : false,
						"initially_select" : [""]
					},
					"types":{
						"types" : {
							"menu_disabled" : {
								"icon" : {
									"position" : "-20px -57px"
								},
								"max_depth" : 2
							},
							"menu" : {
								"icon" : {
									"position" : "-40px -57px"
								},
								"max_depth" : 2
							},
							"folder_disabled" : {
								"icon" : {
									"position" : "-20px -57px"
								},
								"max_depth" : 2
							},
							"folder" : {
								"max_depth" : 2
							}
	
						}
					},
					"plugins" : ["themes", "html_data", "ui", "search", "types", "checkbox"]
	
				}).bind("loaded.jstree", function(event, data) {
		
					$(this).jstree("open_all");
					
					//사용가능메뉴 세팅
					var menuKeys = $("#menuKeys").val();
					
					var menuKeyArr = menuKeys.split(",");
					//for ( var i = 0; i < menuKeyArr.length; i++) {
					//	$(this).jstree("check_node", "#menu_"+menuKeyArr[i]);	
					//}
					
					$(this).jstree('get_json').find('li').each(function(i, item){
						mnKey = $(item).attr('id').substr(5);
						if(menuKeyArr.indexOf(mnKey) != -1){
							$("#menu_tree").jstree("check_node", "#menu_"+mnKey);	
						}else{
							$("#menu_tree").jstree("uncheck_node", "#menu_"+mnKey);
						}
					});
				});
			}
		    ,error : function(xhr, stat, err) {
		    	console.log(err);
		    }
		});
	};
})($);


$(function() {

	$.getMenuList();
	
	// button start
	$("#tabmenu_top a").click(function () {

		switch(this.id) {
			case "allSelect":
				
				$("#menu_tree").jstree('check_all');
				$(this).attr('id','allDeselect');				
				$("#allDeselect").button({icons: {primary: "ui-icon-cancel"}});
				$("#allDeselect .ui-button-text").text("메뉴선택해제");
				break;
				
			case "allDeselect" :
				$("#menu_tree").jstree('uncheck_all');
				$(this).attr('id','allSelect');								
				$("#allSelect").button({icons: {primary: "ui-icon-check"}});
				$("#allSelect .ui-button-text").text("메뉴전체선택");
				break;
				
			case "menu_open" :
				$("#menu_tree").jstree("open_all");
				$(this).attr('id','menu_close');				
				$("#menu_close").button({icons: {primary: "ui-icon-folder-collapsed"}});
				$("#menu_close .ui-button-text").text("메뉴닫침");
				break;
				
			case "menu_close" :
				$("#menu_tree").jstree("close_all");
				$(this).attr('id','menu_open');				
				$("#menu_open").button({icons: {primary: "ui-icon-folder-open"}});
				$("#menu_open .ui-button-text").text("메뉴펼침");
				break;
				
			default:
				$("#menu_tree").jstree(this.id);
				break;
		}
	});
	// button end

	
	$("#defaultForm").validationEngine('attach', {
		unbindEngine:false,
		customFunctions: {
			//
		},
		onValidationComplete: function(form, status){
			if(status == true) {
				if(confirm("저장하시겠습니까?")) {
					
					var checked = $("#menu_tree").jstree("get_all_checked", null, true);
					var menuKeys = "";
					for ( var i = 0; i < checked.length; i++) {
						menuKeys += (checked[i].id).substr(5)+",";
					}
					
					console.log(menuKeys);
					
					$("#menuKeys").val(menuKeys);
					
					return true;
				} 
				return false;
			}
		}
	});
	
	//ajaxForm
	$('#defaultForm').ajaxForm({
			url: "<c:url value='/csl/user/auth/insertMenuUse.do' />"
		    ,type:"post"
		    ,dataType : 'json'
		    ,success: function(result, statusText, xhr, $form){
		    	alert("메뉴사용설정이 저장되었습니다");
				//console.log(result);
		    }
	});
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

<form:form commandName="userAuthVO" name="defaultForm" id="defaultForm" action="${action }" method="post">
<input type="hidden" name="menuKeys" id="menuKeys" value="<c:forEach var="item" items="${menuKeys }">${item},</c:forEach>" />
<form:hidden path="authId"/>
${userAuthSearchVO.hiddenTag }

<input type="hidden" id="useTyp" name="useTyp" value="${useTyp }" />
<input type="hidden" id="menuTyp" name="menuTyp" value="${menuTyp }" />

<!-- 트리영역 -->
<div id="tree-panel">
	<div id="tabmenu_top">
		<ul>
			<li><a href="#none" id="menu_close" title="펼침/닫힘" class="jCloseButton">메뉴닫침</a></li>
			<li class="btn_blank">&nbsp;</li>
			<li><a href="#none" id="allSelect" title="메뉴전체선택" class="jAllCheckButton">메뉴전체선택</a></li>
		</ul>
	</div>
	<div id="menu_tree" class="tree" style="clear: both;">&nbsp;</div>
</div>

<!-- 설정영역 -->
<div id="form-panel">
	
	<table cellpadding="0" class="tb_base" summary="권한관리 테이블입니다.">
		<caption>
			<span>메뉴사용설정</span>
		</caption>
		<colgroup>
			<col style="width:20%" />
			<col style="width:80%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col" colspan="2">메뉴사용설정</th>
			</tr>
		</thead>
		<tbody class="write">
			<tr>
				<th><label for="userGrp">사용그룹</label></th>
				<td>
					<c:choose>
						<c:when test="${userAuthVO.userGrp eq 'MNGR_USER' }">관리자</c:when>
						<c:when test="${userAuthVO.userGrp eq 'GENR_USER' }">개인회원</c:when>
						<c:when test="${userAuthVO.userGrp eq 'CORP_USER' }">기업회원</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th><label for="authId">권한ID</label></th>
				<td>${userAuthVO.authId}</td>
			</tr>
			<tr>
				<th><label for="authNm">권한명</label></th>
				<td>${userAuthVO.authNm}</td>
			</tr>
			<tr>
				<th><label for="actFlg">활성여부</label></th>
				<td>
					<c:choose>
						<c:when test="${userAuthVO.actFlg eq 'Y' }">
							<span class="clr_default">활성</span>
						</c:when>
						<c:when test="${userAuthVO.actFlg eq 'N' }">
							<span class="clr_warning">비활성</span>
						</c:when>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>

	<p class="btn_list">
		<button class="jSaveButton" onclick="return insert();" title="저장">저장</button>
		<button class="jListButton" onclick="list();" title="목록">목록</button>
	</p>
	</p>
	
</div>


</form:form>
	
	
</body>
</html>