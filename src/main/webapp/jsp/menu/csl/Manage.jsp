<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>추가/수정/삭제</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<style type="text/css">
#tree-panel { width:405px; float:left; margin-top: 10px;}
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
/*.tree button {margin-left:2px;font-size:8px;height:17px;border:1px solid #99defd;background-color:#beebff;color:#fff;border-radius:4px;}*/
.tree button {vertical-align:middle;margin:0 0 0 2px;font-size:10px;height:17px;border:1px solid #99defd;background-color:#fff;color:#99defd;border-radius:4px;}
.tree button.disable {vertical-align:middle;margin:0 0 0 2px;font-size:10px;height:17px;border:1px solid #ddd;background-color:#fff;color:#eee;border-radius:4px;}
/*.tree > ul > li:nth-child(odd){background-color:#fff0ef;}*/
</style>

<script type="text/javascript" src="<c:url value='/csl/jquery/jstree-1.0-rc3/lib/jquery.hotkeys.js'/>"></script>
<script type="text/javascript" src="<c:url value='/csl/jquery/jstree-1.0-rc3/jquery.jstree.js'/>"></script>

<script type="text/javaScript" language="javascript">

(function($){

	$.makeTree = function(selector, menu, menunListSize, currentIndex) {
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
		
		//_selector = $("<li rel='"+rel+"'><a href='#' title='"+menu.menuKey+"' " + actFlg_style + ">"+ naviFlg_style+menu.menuNm+"</a></li>").attr('id',"menu_"+menu.menuKey).attr('fkey','fkey_'+menu.fkey).attr('pkey','pkey_'+menu.pkey).attr('okey','okey_'+menu.okey).appendTo(_selector);
		
		var li = "";
		li = "<li rel='"+rel+"'><a href='#' title='"+menu.menuKey+"' " + actFlg_style + ">"+ naviFlg_style+menu.menuNm+"</a>";
		li += "<button id=\"menu_test\""; 
		if(currentIndex == 0){
			li += " class=\"disable\" disabled=\"disabled\"";			
		}else{
			li += " style=\"cursor:pointer;\"";
		}
		if(menu.pkey == 0){
			li += " onclick=\"moveMenu('topMenu', 'up', '"+menu.menuKey+"'); return false;\">▲</button>";	
		}else{
			li += " onclick=\"moveMenu('childMenu', 'up', '"+menu.menuKey+"'); return false;\">▲</button>";
		}
		
		li += "<button id=\"menu_test\"";
		if(currentIndex == menunListSize-1){
			li += " class=\"disable\" disabled=\"disabled\"";	
		}else{
			li += " style=\"cursor:pointer;\"";
		}
		if(menu.pkey == 0){
			li += " onclick=\"moveMenu('topMenu', 'down', '"+menu.menuKey+"'); return false;\">▼</button>";	
		}else{
			li += " onclick=\"moveMenu('childMenu', 'down', '"+menu.menuKey+"'); return false;\">▼</button>";
		}
		
		_selector =  $(li).attr('id',"menu_"+menu.menuKey).attr('fkey','fkey_'+menu.fkey).attr('pkey','pkey_'+menu.pkey).attr('okey','okey_'+menu.okey).appendTo(_selector);

		var childList = menu.childList;
		if(childList!=null && childList.length > 0) {
			$(_selector).attr('class','jstree-open');
			for(var j=0; j< childList.length; j++) {
				if(childList[j]) {
					$.makeTree(_selector, childList[j], childList.length, j);
				}
			}
		}
		
	};
		
	$.treeClick = function () {
		
		if(!$("#menu_tree").jstree("is_selected")) {
			return false;
		}

		var nodeKey = $("#menu_tree").jstree("get_selected").attr("id").split("_")[1];
		
		$.ajax({
			url : '/csl/menu/select.do'
	        ,method : "post"
			,dataType : 'json'
			,async:true
			,data : { 
				menuKey:nodeKey
			}
			,success : function(menu, stat, xhr) {
				//console.log(menu);
				if(menu != null){
					$("#menuKey").val(menu.menuKey);
					$("#menuNm").val(menu.menuNm);
					if(menu.pkey == 0){
						$(".topMenuAttr").css('display', '');
					}else{
						$(".topMenuAttr").css('display', 'none');
					}
					$("input:radio[name='naviFlg'][value='"+menu.naviFlg+"']").prop('checked', true);
					$("input:radio[name='actFlg'][value='"+menu.actFlg+"']").prop('checked', true);
					$("input:radio[name='linkTyp'][value='"+menu.linkTyp+"']").prop('checked', true);
					$("#url").val(menu.url);
					$("#boardKey").val(menu.boardKey);
					$("#contentKey").val(menu.contentKey);
					setLinkTyp(menu.linkTyp);

					$("#mainTopImgOnFile").val('');
					$("#mainTopImgOffFile").val('');
					$("#topImgOnFile").val('');
					$("#topImgOffFile").val('');
					$("#leftTopImgFile").val('');
					$("#leftImgOnFile").val('');
					$("#leftImgOffFile").val('');
					$("#titleImgFile").val('');
					
					$("#mainTopImgOnFile").nextAll().remove();
					$("#mainTopImgOffFile").nextAll().remove();
					$("#topImgOnFile").nextAll().remove();
					$("#topImgOffFile").nextAll().remove();
					$("#leftTopImgFile").nextAll().remove();
					$("#leftImgOnFile").nextAll().remove();
					$("#leftImgOffFile").nextAll().remove();
					$("#titleImgFile").nextAll().remove();

					
					if(menu.mainTopImgOn){
						$("#mainTopImgOnFile").parent().append(" <img src='<c:url value='/upload/menu/'/>"+menu.mainTopImgOn+"' width='120' height='24'/>");
						$("#mainTopImgOnFile").parent().append(" <button class=\"jButton\" onclick=\"return removeFile('mainTopImgOn');\">삭제</button>");
					}
					if(menu.mainTopImgOff){
						$("#mainTopImgOffFile").parent().append(" <img src='<c:url value='/upload/menu/'/>"+menu.mainTopImgOff+"' width='120' height='24'/>");
						$("#mainTopImgOffFile").parent().append(" <button class=\"jButton\" onclick=\"return removeFile('mainTopImgOff');\">삭제</button>");
					}		
					
					if(menu.topImgOn) {
						$("#topImgOnFile").parent().append(" <img src='<c:url value='/upload/menu/'/>"+menu.topImgOn+"' width='120' height='24'/>");
						$("#topImgOnFile").parent().append(" <button class=\"jButton\" onclick=\"return removeFile('topImgOn');\">삭제</button>");
					}
					if(menu.topImgOff) {
						$("#topImgOffFile").parent().append(" <img src='<c:url value='/upload/menu/'/>"+menu.topImgOff+"' width='120' height='24'/> ");				
						$("#topImgOffFile").parent().append(" <button class=\"jButton\" onclick=\"return removeFile('topImgOff');\">삭제</button>");
					}
					
					if(menu.leftTopImg) {
						$("#leftTopImgFile").parent().append(" <img src='<c:url value='/upload/menu/'/>"+menu.leftTopImg+"' width='120' height='24'/> ");				
						$("#leftTopImgFile").parent().append(" <button class=\"jButton\" onclick=\"return removeFile('leftTopImg');\">삭제</button>");
					}
					
					if(menu.leftImgOn) {
						$("#leftImgOnFile").parent().append(" <img src='<c:url value='/upload/menu/'/>"+menu.leftImgOn+"' width='120' height='24'/> ");				
						$("#leftImgOnFile").parent().append(" <button class=\"jButton\" onclick=\"return removeFile('leftImgOn');\">삭제</button>");
					}
					if(menu.leftImgOff) {
						$("#leftImgOffFile").parent().append(" <img src='<c:url value='/upload/menu/'/>"+menu.leftImageOff+"' width='120' height='24'/> ");				
						$("#leftImgOffFile").parent().append(" <button class=\"jButton\" onclick=\"return removeFile('leftImageOff');\">삭제</button>");
					}
					
					if(menu.titleImg) {
						$("#titleImgFile").parent().append(" <img src='<c:url value='/upload/menu/'/>"+menu.titleImg+"' width='120' height='24'/> ");				
						$("#titleImgFile").parent().append(" <button class=\"jButton\" onclick=\"return removeFile('titleImg');\">삭제</button>");
					}
					
					$("input:radio[name='subViewTyp'][value='"+menu.subViewTyp+"']").prop('checked', true);
					
					$(".jLockRadio").buttonset('refresh');
					$(".jButtonSet").buttonset('refresh');
				}
			}
		    ,error : function(xhr, stat, err) {
		    	console.log(err);
		    }
		});
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
				menuTyp:'${param.menuTyp}'
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
					if(i==0) {
						_INITID = _menuList[i].menuKey;
					}
					if (_menuList[i]) {
						$.makeTree($('#menu_tree'), _menuList[i], _menuList.length, i);
					}
				}

				$('#menu_tree').jstree({
					"core": {
						"strings":{new_node:"새메뉴"}
					},
					"themes":{"theme":"apple","dots":true, "icons":true},
					"contextmenu":{
						items:{
							"create" : {
								"label" : "메뉴추가",
								"action" : function(obj) {this.create(obj);},
								"_disabled" : false,
								"separator_after" : false
							},
							"rename" : {
								"label" : "메뉴명수정",
								"action" : function(obj) {this.rename(obj);},
								"_disabled" : false
							},
							"remove" : {
								"label" : "메뉴삭제",
								"action" : function(obj) {this.remove(obj);}
							},
							"ccp" : ""
						}
					},
					"ui" : {
						"select_limit" : 1,
						"select_multiple_modifier" : false,
						"initially_select" : ["menu_"+_INITID]
					},
					"hotkeys" : {
						"insert" : function() {
							$("#menu_tree").jstree("create");
						}
					},
					"types":{
						//"max_children" : 12,
						//"max_depth" : 2,
						"types" : {
							"menu_disabled" : {
								"icon" : {
									//"image" : "${pageContext.request.contextPath}/jquery/jstree_pre1.0_fix_1/themes/menu_disabled.gif"
									"position" : "-20px -57px"
								},
								"max_depth" : 4,
								"create_node" : false
							},
							"menu" : {
								"icon" : {
									//"image" : "${pageContext.request.contextPath}/jquery/jstree_pre1.0_fix_1/themes/menu.gif"
									"position" : "-40px -57px"
								},
								"max_depth" : 4,
								"create_node" : false
							},
							"folder_disabled" : {
								"icon" : {
									"position" : "-20px -57px"
								},
								"max_depth" : 4,
								"move_node" : true
							},
							"folder" : {
								"max_depth" : 4,
								"move_node" : true
								//,"delete_node" : false
							}
						}
					},
					//"plugins" : ["themes", "html_data", "ui", "crrm", "dnd", "search", "types", "hotkeys", "contextmenu"]
					"plugins" : ["themes", "html_data", "ui", "crrm", "search", "types", "hotkeys", "contextmenu"]
					//"plugins" : ["themes", "html_data", "ui", "crrm", "search", "types", "hotkeys"]

				}).bind("create.jstree", function (e, data) {

					var targetKey = 0;
					if(data.rslt.parent != -1) {
						console.log("pid=" + data.rslt.parent.attr("id"));
						targetKey = data.rslt.parent.attr("id").replace(/\D/g, "");
						console.log("targetKey=" + targetKey);
					}

					if(!targetKey || targetKey == "" || (data.rslt.parent && data.rslt.parent.attr("id") == "jstree_1")) {
						console.log("not a parent");
						targetKey = 0;
					}
					
					//return false;
					
					$.ajax({
						url : '/csl/menu/create.do'
				        ,method : "post"
				        ,dataType:'json'
						,async:true
						,data : { 
							targetKey:targetKey
							,menuNm:data.rslt.name
							,menuTyp:'${param.menuTyp}'
						}
						,beforeSend : function(){
							$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
						}
						,complete : function(){
							$.unblockUI();
						}
						,success : function(newMenu, stat, xhr) {
							console.log(newMenu);
							data.rslt.obj.attr("id", "menu_" + newMenu.menuKey);
							data.rslt.obj.attr("fkey", "fkey_" + newMenu.fkey);
							data.rslt.obj.attr("pkey", "pkey_" + newMenu.pkey);
							data.rslt.obj.attr("okey", "okey_" + newMenu.okey);
							data.rslt.obj.attr("rel", "folder");
							$("#menu_tree").jstree("select_node",data.rslt.obj, true, e);
							$.treeClick();
							alert("메뉴가 추가되었습니다.");
						}
					    ,error : function(xhr, stat, err) {
					    	console.log(err);
					    }
					});
				}).bind("before.jstree", function (e, data) {
				}).bind("remove.jstree", function (e, data) {

					if(confirm("하위메뉴가 있는경우 모두 삭제됩니다. 삭제하시겠습니까?")) {
						if(data.rslt.obj.attr("id")) {
							var nodeKey = data.rslt.obj.attr("id").replace(/\D/g, "");
							
							$.ajax({
								url : '/csl/menu/delete.do'
						        ,method : "post"
								,dataType : 'json'
								,async:true
								,data : { 
									menuKey:nodeKey
								}
								,beforeSend : function(){
									$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
								}
								,complete : function(){
									$.unblockUI();
								}
								,success : function(menu, stat, xhr) {
									//$("#menu_tree").jstree("deselect_all");
									reloadMenuList();
								}
							    ,error : function(xhr, stat, err) {
							    	console.log(err);
							    }
							});
						}else{
							alert("삭제할 메뉴를 선택하세요.");
							$.jstree.rollback(data.rlbk);
						}						
					}else{
						$.jstree.rollback(data.rlbk);
					};

				}).bind("rename.jstree", function (e, data) {

					var nodeKey = data.rslt.obj.attr("id").replace(/\D/g,"");
					var nodeText = data.rslt.new_name;
					
					$.ajax({
						url : '/csl/menu/updateMenuNm.do'
				        ,method : "post"
						,dataType : 'json'
						,async:true
						,data : { 
							menuKey:nodeKey
							,menuNm:nodeText
						}
						,beforeSend : function(){
							$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
						}
						,complete : function(){
							$.unblockUI();
						}
						,success : function(menu, stat, xhr) {
							$.treeClick();
						}
					    ,error : function(xhr, stat, err) {
					    	console.log(err);
					    }
					});

				}).bind("move_node.jstree", function (e, data) {
					/***********
					var nodeKey = data.rslt.o.attr("id").replace(/\D/g,"");
					var targetKey = data.rslt.r.attr("id").replace(/\D/g,"");

					var nodeFkey = data.rslt.o.attr("fkey").replace(/\D/g,"");
					var targetFkey = data.rslt.r.attr("fkey").replace(/\D/g,"");
					
					var nodePkey = data.rslt.o.attr("pkey").replace(/\D/g,"");
					var targetPkey = data.rslt.r.attr("pkey").replace(/\D/g,"");
					
					if(nodePkey != '0'){
						alert("최상위 메뉴만 이동이 가능합니다.");
						$.jstree.rollback(data.rlbk);
						return;	
					}
					
					if(nodePkey != targetPkey){
						alert("같은 레벨끼리의 이동만 가능합니다.");
						$.jstree.rollback(data.rlbk);
						return;
					}
					
					if(data.inst._get_move().p == 'last'){
						alert("같은 레벨끼리의 이동만 가능합니다..");
						$.jstree.rollback(data.rlbk);
						return;
					}

					//console.log("nodePkey" + nodePkey);
					if(nodePkey == '0'){
						//console.log(nodeFkey + '/' + targetFkey + '/' + data.inst._get_move().p);
						//menuDWR.resortFkeys(nodeFkey, targetFkey, data.inst._get_move().p);
					}else {
						//var stObj = data.inst._get_parent(data.rslt.obj);
						//var stPkey = stObj.attr("pkey").replace(/\D/g,"");
						//var stOkey = stObj.attr("okey").replace(/\D/g,"");
						//var children = [];
						//stObj.find("li").each(function(){
						//	children.push($(this).attr("id").replace(/\D/g,""));
						//});
						$.jstree.rollback(data.rlbk);
						return;
					}
					************/

				}).bind("click.jstree", function (e) {
					//$.treeClick();
				}).bind("select_node.jstree", function(event, data) {
					$.treeClick();
				}).bind("loaded.jstree", function(){
					$("#menu_tree").jstree("open_all");
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
	$("#tabmenu_top button").click(function () {

		switch(this.id) {
			case "menu_create":
				$("#menu_tree").jstree("create");
				break;
				
			case "menu_rename" :
				if(!$("#menu_tree").jstree("get_selected").attr("id")) {
					alert("메뉴를 선택하세요.");
				} else {
					$("#menu_tree").jstree("rename");
				}
				break;
				
			case "menu_open" :
				$("#menu_open> img").attr("src","<c:url value='/image/btns/btns_03.gif' />");
				$("#menu_tree").jstree("open_all");
				$(this).attr('id','menu_close');
				
				$("#menu_close").button({
					icons: {
						primary: "ui-icon-folder-collapsed"
					}						
				});
				
				$("#menu_close .ui-button-text").text("메뉴닫침");
				
				break;
				
			case "menu_close" :
				$("#menu_close> img").attr("src","<c:url value='/image/btns/btns_02.gif' />");
				$("#menu_tree").jstree("close_all");
				$(this).attr('id','menu_open');
				
				$("#menu_open").button({
					icons: {
						primary: "ui-icon-folder-open"
					}						
				});
				
				$("#menu_open .ui-button-text").text("메뉴펼침");
				
				break;
				
			case "menu_remove" :
				if(!$("#menu_tree").jstree("get_selected").attr("id")) {
					alert("메뉴를 선택하세요.");
				} else {
					$("#menu_tree").jstree("remove");
				}

				break;
				
			case "menu_deselect":
				$("#menu_tree").jstree("deselect_all");
				break;
				
			case "text": 
				break;	
				
			default:
				$("#menu_tree").jstree(this.id);
				break;
		}
	});
	// button end
	
	
	$("#menuForm").validationEngine('attach', {
		unbindEngine:false,
		onValidationComplete: function(form, status){
			if(status == true) {
				if(confirm("수정하시겠습니까?")) {	
					var $linkTyp = $('input:radio[name=linkTyp]:checked').val()
					if($linkTyp == 'EMPTY'){
						$('#boardKey').val('');
						$('#contentKey').val('');
						$('#url').val('');
					}else if($linkTyp == 'BOARD'){
						$('#contentKey').val('');
						$('#url').val('');						
					}else if($linkTyp == 'CONTENT'){
						$('#boardKey').val('');
						$('#url').val('');
					}else if($linkTyp == 'URL'){
						$('#boardKey').val('');
						$('#contentKey').val('');
					}
					
					return true;									
				}
				return false;
			}
		}
	});
	
	//update
	$('#menuForm').ajaxForm({
			url: '/csl/menu/update.do'
		    ,type:'post'
		    ,dataType:'json'
		    ,async:true
			,beforeSend : function(){
				$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
			}
			,complete : function(){
				$.unblockUI();
			}
		    ,success: function(r, statusText, xhr, $form){
				if(r.result > 0) {
					console.log($($form).find('input:radio[name=naviFlg]').is(':visible'));
					var menuKey = $($form).find('[name=menuKey]').val();
					var menuNm = $($form).find('[name=menuNm]').val();
					var naviFlg = $($form).find('input:radio[name=naviFlg]').is(':visible') == true ? $($form).find('input:radio[name=naviFlg]:checked').val() : '';
					var actFlg = $($form).find('input:radio[name=actFlg]:checked').val();
					
					var nvaiFlg_style = "";
					if(naviFlg == 'Y'){
						nvaiFlg_style = "★";	
					}
					$("#menu_"+menuKey+" > a").html("<ins class=\"jstree-icon\">&nbsp;</ins>"+nvaiFlg_style+menuNm);

					if(actFlg == "Y"){
						$("#menu_"+menuKey+" a").css('color', '');								
					}else{
						$("#menu_"+menuKey+" a").css('color', 'red');
					}
					
					$.treeClick();
					alert("수정되었습니다.");
				}
		    }
	});
	
	//menu.linkTyp click event
	$("input[name='linkTyp']").click(function() {
		setLinkTyp($(this).val());
	});

});

//저장
function insert(){
	$("#menuForm").submit();
	return false;
}

//파일삭제
function removeFile(columnName){
	if(confirm("파일을 삭제하시겠습니까?")){
		
		$.ajax({
			url : '/csl/menu/deleteFile.do'
	        ,method : "post"
			,dataType : 'json'
			,async:true
			,data : { 
				menuKey:$('#menuKey').val()
				,columnName:columnName
			}
			,beforeSend : function(){
				$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
			}
			,complete : function(){
				$.unblockUI();
			}
			,success : function(menu, stat, xhr) {
				$.treeClick();
			}
		    ,error : function(xhr, stat, err) {
		    	console.log(err);
		    }
		});
	}
	return false;
}

function setLinkTyp(v) {
	switch(v) {
		case 'EMPTY' : 
			$("input[name='url']").parents("tr:last").hide();
			$("select[name='contentKey']").parents("tr:last").hide();
			$("select[name='boardKey']").parents("tr:last").hide();
			break;
			
		case 'URL' : 
			$("input[name='url']").parents("tr:last").show();
			$("select[name='contentKey']").parents("tr:last").hide();			
			$("select[name='boardKey']").parents("tr:last").hide();
			break;
			
		case 'BOARD' : 
			$("input[name='url']").parents("tr:last").hide();
			$("select[name='contentKey']").parents("tr:last").hide();			
			$("select[name='boardKey']").parents("tr:last").show();
			break;
			
		case 'CONTENT' : 
			$("input[name='url']").parents("tr:last").hide();
			$("select[name='contentKey']").parents("tr:last").show();
			$("select[name='boardKey']").parents("tr:last").hide();
			break;
	}
}

function moveMenu(moveTyp, moveWay, menuKey){
	//console.log('menuTyp=' + '${param.menuTyp}' + ', moveTyp=' + moveTyp + ', moveWay=' + moveWay + ', menuKey=' + menuKey);
	$.ajax({
		url : '/csl/menu/moveMenu.do'
        ,method : "post"
		,dataType : 'json'
		,async:true
		,data : { 
			menuTyp:'${param.menuTyp}'
			,moveTyp:moveTyp
			,moveWay:moveWay
			,menuKey:menuKey
		}
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,complete : function(){
			$.unblockUI();
		}
		,success : function(r, stat, xhr) {
			//console.log(r)
			reloadMenuList();
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

function reloadMenuList(){
	$.getMenuList();
}

</script>
</head>

<body>

<!-- 트리영역 -->
<div id="tree-panel">
	<div id="tabmenu_top">
		<ul>
			<li><button title="추가" id="menu_create" class="jCreateButton">추가</button></li>
			<li class="btn_blank">&nbsp;</li>
			<li><button title="메뉴명변경" id="menu_rename" class="jEditButton">수정</button></li>
			<li class="btn_blank">&nbsp;</li>				
			<li><button id="menu_remove" title="삭제" class="jDeleteButton">삭제</button></li>
			<li class="btn_blank">&nbsp;</li>
			<li><button title="펼침/닫힘" id="menu_close" class="jCloseButton">접기/펼침</button></li>
			<li class="btn_blank">&nbsp;</li>
			<li><button id="menu_deselect" title="메뉴선택해제" class="jCancelButton">선택해제</button></li>
		</ul>
	</div>	
	<div id="menu_tree" class="tree" style="clear: both;">&nbsp;</div>
	<div id="tabmenu_bottom">
		<!--
		<ul>
			<li><a href="#" title="펼침/닫힘" id="menu_close" class="jCloseButton">메뉴닫침</a></li>
			<li class="btn_blank">&nbsp;</li>
			<li><a href="javascript://" id="menu_deselect" title="메뉴선택해제" class="jCancelButton">메뉴선택해제</a></li>			
		</ul>
		-->
	</div>
</div>

<!-- 설정영역 -->
<div id="form-panel">
	
	<form id="menuForm" name="menuForm" method="post" enctype="multipart/form-data">
	<input type="hidden" id="menuKey" name="menuKey"/>
	<input type="hidden" id="mainTopImgOn" name="mainTopImgOn" />
	<input type="hidden" id="mainTopImgOff" name="mainTopImgOff" />
	<input type="hidden" id="topImgOn" name="topImgOn" />
	<input type="hidden" id="topImgOff" name="topImgOff" />
	<input type="hidden" id="leftTopImg" name="leftTopImg" />
	<input type="hidden" id="leftImgOn" name="leftImgOn" />
	<input type="hidden" id="leftImgOff" name="leftImgOff" />
	<input type="hidden" id="titleImg" name="titleImg" />

	
	<table cellpadding="0" class="tb_base" summary="메뉴를 관리하는 테이블입니다.">
		<caption>
			<span>메뉴관리</span>
		</caption>
		<colgroup>
			<col style="width:20%" />
			<col style="width:80%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col" colspan="2">메뉴정보</th>
			</tr>
		</thead>
		<tbody class="write">
			<tr>
				<th><label for="name">메뉴명</label></th>
				<td>
					<input type="text" id="menuNm" name="menuNm" maxlength="100" class="validate[required, length[1,100]] tb_ipty"/>
				</td>
			</tr>
			<c:if test="${param.menuTyp ne 'CONSOLE' }">
				<tr class="topMenuAttr">
					<th><label for="naviFlg">주메뉴여부</label></th>
					<td class="jLockRadio">
						<input type="radio" id="naviFlg_y" name="naviFlg" value="Y"/><label for="naviFlg_y">주메뉴</label>
						<input type="radio" id="naviFlg_n" name="naviFlg" value="N"/><label for="naviFlg_n">부메뉴</label>
					</td>
				</tr>
			</c:if>
			<tr>
				<th><label for="actFlg">활성여부</label></th>
				<td class="jLockRadio">
					<input type="radio" id="actFlg_y" name="actFlg" value="Y"/><label for="actFlg_y">활성</label>
					<input type="radio" id="actFlg_n" name="actFlg" value="N"/><label for="actFlg_n">비활성</label>
				</td>
			</tr>
			<tr>
				<th><label for="kind">메뉴종류</label></th>
				<td class="jButtonSet">
					<input type="radio" id="linkTyp_empty" name="linkTyp" value="EMPTY"/><label for="linkTyp_empty">빈메뉴</label>
					<input type="radio" id="linkTyp_board" name="linkTyp" value="BOARD"/><label for="linkTyp_board">게시판</label>
					<input type="radio" id="linkTyp_content" name="linkTyp" value="CONTENT"/><label for="linkTyp_content">컨텐츠</label>
					<input type="radio" id="linkTyp_url" name="linkTyp" value="URL"/><label for="linkTyp_url">URL</label>
					<!-- 
					<input type="radio" id="linkTyp_script" name="linkTyp" value="SCRIPT"/><label for="linkTyp_script">SCRIPT</label>
					<input type="radio" id="linkTyp_frame" name="linkTyp" value="FRAME"/><label for="linkTyp_frame">프레임</label>
					-->
				</td>
			</tr>				
			<tr style="display:none">
				<th><label for="url">URL</label></th>
				<td><input type="text" id="url" name="url" maxlength="255"  class='tb_ipty'/></td>
			</tr>
			<tr style="display:none">
				<th><label for="boardKey">게시판</label></th>
				<td>
					<select id="boardKey" name="boardKey" style="border:1px solid #ccc; height:24px; width:500px;">
						<option value="">선택하세요</option>
						<c:forEach items="${boardList }" var="item">
							<option value="${item.boardKey }">${item.boardNm }</option>
						</c:forEach>
					</select>					
				</td>
			</tr>
			<tr style="display:none">
				<th><label for="contentKey">컨텐츠</label></th>
				<td>
					<select id="contentKey" name="contentKey" style="border:1px solid #ccc; height:24px; width:500px;">
						<option value="">선택하세요</option>
						<c:forEach items="${contentList }" var="item">
							<option value="${item.contentKey }">${item.title }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		
			<c:if test="${param.menuTyp ne 'CONSOLE' }">
				<tr class="topMenuAttr">
					<th><label for="mainTopImgOnFile">MainOn 이미지</label></th>
					<td><input type="file" id="mainTopImgOnFile" name="mainTopImgOnFile"/></td>
				</tr>
				<tr class="topMenuAttr">
					<th><label for="mainTopImgOffFile">MainOff 이미지</label></th>
					<td><input type="file" id="mainTopImgOffFile" name="mainTopImgOffFile"/></td>
				</tr>
				<tr>
					<th><label for="topImgOnFile">TopOn 이미지</label></th>
					<td><input type="file" id="topImgOnFile" name="topImgOnFile"/></td>
				</tr>
				<tr>
					<th><label for="topImgOffFile">TopOff 이미지</label></th>
					<td><input type="file" id="topImgOffFile" name="topImgOffFile"/></td>
				</tr>

				<tr>
					<th><label for="leftTopImgFile">LeftTop 이미지</label></th>
					<td><input type="file" id="leftTopImgFile" name="leftTopImgFile"/></td>
				</tr>
				<tr>
					<!-- <th><label for="titleImgFile">타이틀 이미지</label></th> -->
					<th><label for="titleImgFile">서브 비주얼 이미지</label></th>
					<td><input type="file" id="titleImgFile" name="titleImgFile"/></td>
				</tr>		
										
 				<tr>
 					<th><label for="subViewTyp">서브메뉴타입</label></th>
					<td class="jButtonSet">
						<input type="radio" id="subViewTyp_l" name="subViewTyp" value="LIST"/><label for="subViewTyp_l">목록형</label>
						<input type="radio" id="subViewTyp_t" name="subViewTyp" value="TAB"/><label for="subViewTyp_t">탭형</label>
					</td>
 				</tr>
			</c:if>
			
		</tbody>
	</table>
	<p class="btn_list">
		<button class="jSaveButton" onclick="return insert();" title="저장">저장</button>
	</p> 
	
	<!-- 
	<div style="float: right; font-size: 11px;">* 표시항목은 필수입력항목입니다.</div>
	-->
	</form>
			
</div>
	
	
</body>
</html>