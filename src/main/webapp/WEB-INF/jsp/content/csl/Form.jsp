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

<style type="text/css">
#hLayer {}
#hList {float:left;position:absolute;width:168px;height:95%;border:1px solid #ddd;overflow-y:scroll;}
#hList ul {padding-top:4px;}
#hList li {list-style-type:none;padding:8px; 0 0 4px;}
#hList li a {text-decoration:none;padding:4px 10px;background-color:#fff;border:1px solid #ddd;}
#hList li a:hover {background-color:#c8e4f8;}
#hList li a.on {background-color:#c8e4f8;}
#hView {margin-left:178px;border:0px solid #ddd;}
#hView textarea {}
</style>

<script type="text/javascript" src="<c:url value='/editor/smart-editor-2.2.1/js/HuskyEZCreator.js'/>"></script>

<script type="text/javascript">
<!--
var contentsEditors = [];
$(function() {
	
	$("#defaultForm").validationEngine({
		unbindEngine:false,
		validationEventTrigger: "submit",
		promptPosition : "topLeft",
		showOneMessage : true,
		onValidationComplete : function(form, status) {

			if (status == true) {
				if (confirm("저장하시겠습니까?")) {
					contentsEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
					return true;
				}
				return false;
			}
		}
	});
	
	//smart editor
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: contentsEditors,
		elPlaceHolder: "content",
		sSkinURI: "<c:url value='/editor/smart-editor-2.2.1/SmartEditor2Skin_csl.html'/>",	
		htParams : {bUseToolbar : true,
			fOnBeforeUnload : function(){
			}
		},
		fOnAppLoad : function(){
		},
		fCreator: "createSEditor2"
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


var hContentsEditors = [];
var isGetcontentHstryList = false;
var contentHstryList;

function viewHistory(){
	if(isGetcontentHstryList){
		console.log('1');
		viewHistoryDialog();
	}else{
		//smart editor
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: hContentsEditors,
			elPlaceHolder: "hContent",
			sSkinURI: "<c:url value='/editor/smart-editor-2.2.1/SmartEditor2Skin_csl_np.html'/>",	
			htParams : {bUseToolbar : true,
				fOnBeforeUnload : function(){
				}
			},
			fOnAppLoad : function(){
			},
			fCreator: "createSEditor2"
		});
		
		$.ajax({
			url:'/csl/contenthstry/selectFullList.do'
		    ,method:"post"
			,dataType:'json'
			,async:true
			,data:{
				contentKey:$('#contentKey').val()
			}
		    ,success:function(result, stat, xhr) {
		    	//console.log(result);
		    	if(result != null && result.contentHstryList != null){
		    		isGetcontentHstryList = true;
		    		contentHstryList = result.contentHstryList;
		    		var $ul = $('#hList').append('<ul></ul>');
		    		var operDt;
		    		
		    		for(i=0; i<contentHstryList.length; i++){
		    			operDt = new Date(contentHstryList[i].operDt);
		    			rsltDt = operDt.getFullYear() + '-' + leftPad((operDt.getMonth() + 1),2,'0') + '-' + leftPad(operDt.getDay(),2,'0') + ' ' + leftPad(operDt.getHours(),2,'0') + ':' + leftPad(operDt.getMinutes(),2,'0') + ':' + leftPad(operDt.getSeconds(),2,'0');
		    				
		    			li = "<li>";
		    			li += "<a id=\"list_" + i + "\" href=\"#none\" title=\"" + contentHstryList[i].operId + "\">" + rsltDt + "</a>";
		    			li += "</li>";
		    			
		    			$ul.append(li);
		    		}
		    		
		    		$($ul).find('a').each(function(){
		    			$(this).bind('click', function(){
		    				$(this).parent().parent().find('a').removeClass('on');
		    				$(this).addClass('on');
		    				index = $(this).attr('id').split('_')[1];
		    				//console.log(contentHstryList[index].content)
		    				hContentsEditors.getById["hContent"].exec("SET_IR", [""]);
		    				hContentsEditors.getById["hContent"].exec("PASTE_HTML", [contentHstryList[index].content]);
		    			});
		    		});
		    	}
		    }
		    ,error : function(xhr, stat, err) {
		    	console.log(err);
		    }
		}).done(viewHistoryDialog);
	}
}

function viewHistoryDialog(){
	insertDialog = $('#hLayer').dialog({
		css:{'background-color':'red'},
		autoOpen: false,
		height: 720,
		width: 1158,
		modal: true,
		buttons: {
			"닫기": function(){insertDialog.dialog( "close" );}
		},
		open: function(){
			$('.ui-dialog-titlebar > button').focus();
		},
		close: function() {
			//
		}
	}).dialog('open');
	$(".ui-widget-overlay").css("background-color", "#000");
}
//-->
</script>
</head>
<body>

<form:form commandName="contentVO" id="defaultForm" name="defaultForm" method="post" action="${action}">
<form:hidden path="contentKey" />
${contentSearchVO.hiddenTag }

<input type="hidden" id="editorUploadPath" name="editorUploadPath" value="file.content.path" />
<input type="hidden" id="editorUploadSize" name="editorUploadSize" value="file.content.size" />
<input type="hidden" id="editorUploadSubDir" name="editorUploadSubDir" value="" />

<table cellpadding="0" class="tb_base" summary="컨텐츠를 관리하는 테이블입니다.">
	<caption>
		<span>컨텐츠</span>
	</caption>
	<colgroup>
		<col style="width:10%" />
		<col style="width:90%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col" colspan="2">컨텐츠정보</th>
		</tr>
	</thead>
	<tbody class="write">
		<tr>
			<th><label for="title">제목</label></th>
			<td>
				<form:input path="title" cssClass="validate[required,maxSize[255]] tb_ipty" maxlength="255" title="제목" />
			</td>
		</tr>
		<tr>
			<th>활성</th>
			<td class="jLockRadio">
				<form:radiobutton path="actFlg" id="act_y" value="Y" cssClass="validate[required] va_m" /> <label for="act_y" class="va_m">활성</label> 
				<form:radiobutton path="actFlg" id="act_n" value="N" cssClass="validate[required] va_m" /> <label for="act_n" class="va_m">비활성</label>
			</td>
		</tr>
		<c:if test="${action eq 'update.do'}">
			<tr>
				<th><label for="">작업이력</label></th>
				<td>
					<button class="jCreateButton" onclick="viewHistory();return false;">작업이력 보기</button>
				</td>
			</tr>
		</c:if>
		<tr>
			<th><label for="content">내용</label></th>
			<td>
				<!-- 에디터 -->
				<div>
					<form:textarea path="content"  cssClass="wirte_edit" cssStyle="width:99%; height:400px" title="내용"/>
				</div>
				<!-- //에디터 -->
			</td>
		</tr>
	</tbody>
</table>

<p class="btn_list">
	<button class="jSaveButton" onclick="return insert();" title="저장">저장</button>
	<button class="jListButton" onclick="list();" title="목록">목록</button>
</p>

</form:form>

<div id="hLayer" title="작업이력 보기" style="display:none;">
	<div style="overflow:hidden;">
		<div id="hList"></div>
		<div id="hView">
			<textarea id="hContent" rows="10" style="border:0px solid #ddd;width:99%;height:554px;"></textarea>
		</div>
	</div>
</div>
</body>
</html>