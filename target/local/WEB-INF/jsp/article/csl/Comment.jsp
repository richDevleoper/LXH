<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
//<!--
$(document).ready(function(){
	<c:if test="${boardVO.commentFlg eq 'Y'}">
		cmntList();
	</c:if>
});

var isMngr = ${isMngr};
var isUseGrpForComment = ${isUseGrpForComment};
var userId = '${userSession.userId}';

function cmntList(clearFlag){
	if(clearFlag){
		$('#cmntList > li:not(:first)').remove();
	}
	
	$.ajax({
		url:'/csl/articlecomment/fullList.do'
	    ,method:"post"
		,dataType:'json'
		,async:true
		,data:{
			boardKey:$('#boardKey').val()
			,articleKey:$('#articleKey').val()
		}
	    ,success:function(result, stat, xhr) {
	    	//console.log(result);
	    	if(result != null && result.articleCommentList != null && result.articleCommentList.length > 0){
	    		$('#cmntCnt').text(result.articleCommentList.length);
	    		var li = $('#cmntList > li:first').clone().removeAttr('style');
	    		
	    		for(i=0; i<result.articleCommentList.length; i++){
	    			var data = result.articleCommentList[i];
	    			var item = li.clone();
	    			
					var articleCommentKey = data.articleCommentKey;
					var frstOperId = data.frstOperId == null ? '' : data.frstOperId;
					var fkey = data.fkey;
					var pkey = data.pkey;
					var okey = data.okey;
					var gkey = data.gkey;
	    			var writer = data.writer;
	    			var content = data.content;
	    			var deleteFlg = data.deleteFlg;
	    			var tmpDt = new Date(data.frstOperDt);
	    			var frstOperDt = tmpDt.getFullYear() + '-' + leftPad((tmpDt.getMonth() + 1),2,'0') + '-' + leftPad(tmpDt.getDay(),2,'0') + ' ' + leftPad(tmpDt.getHours(),2,'0') + ':' + leftPad(tmpDt.getMinutes(),2,'0') + ':' + leftPad(tmpDt.getSeconds(),2,'0');
	    			var frstOperIp = data.frstOperIp;
	    			var liId = 'cmnt_' + articleCommentKey + '_' + fkey + '_' + pkey + '_' + okey + '_' + gkey;
	    			
	    			$(item).attr('id',liId);
	    			if(i==0){$(item).addClass('first');}
	    			if(data.pkey != 0){
	    				$(item).addClass('reply');
	    				$(item).find('.answer').css('display','none');
	    			}
	    			$(item).find('.viewWriter').text(frstOperId == '' ? writer : (writer + '(' + frstOperId.substring(0,2) + '·····' + ')'));
	    			$(item).find('.viewFrstOperDt').text(frstOperDt + ', ' + frstOperIp);
	    			$(item).find('.viewContent').html(content.replace(/\n/gi, '<br />'));
	    			$(item).find('.btnUpdateForm').attr('onclick','cmntUpdateForm('+articleCommentKey+')');
	    			if(isMngr || frstOperId != null && frstOperId != ''){
	    				$(item).find('.btnDisableForm').attr('onclick','cmntDisableForm('+articleCommentKey+',false)');
	    			}else{
	    				$(item).find('.btnDisableForm').attr('onclick','cmntDisableForm('+articleCommentKey+',true)');
	    			}
	    			$(item).find('.btnRemove').attr('onclick','cmntRemove('+articleCommentKey+')');
	    			$(item).find('.btnReplyForm').attr('onclick','cmntReplyForm('+articleCommentKey+')');
	    			if(deleteFlg == 'Y'){
	    				$(item).find('.btnDisableForm').css('display','none');
	    				$(item).find('.btnRecovery').attr('onclick','cmntRecovery('+articleCommentKey+','+pkey+')').css('display','');
	    				$(item).find('.viewContent').addClass('disable');
	    				if(!isMngr){
	    					$(item).find('.btnRecovery').css('display','none');
	    				}
	    			}
	    			
	    			//수정폼
	    			$(item).children('.cmntUpdate').find('[id^=cmnt]').each(function(){
	    				if($(this).attr('id') == 'cmntUpdateWriter') {$(this).val(writer);}
	    				if($(this).attr('id') == 'cmntUpdateContent') {$(this).val(content).bind('keyup blur',function(){checkContent($(this));});}
	    				$(this).attr('id', $(this).attr('id') + '_' + articleCommentKey).attr('name', $(this).attr('name') + '_' + articleCommentKey)
	    			});
	    			$(item).find('.btnUpdate').attr('onclick','cmntUpdate('+articleCommentKey+')');
	    			$(item).children('.cmnt_write').find('.text_num b').text(getByteSize(content));
	    			//로그인해서 쓴 댓글의 경우, 수정폼에서 비밀번호 입력폼 제거
	    			//게시판관리자는 무조건 제거
	    			if(isMngr || frstOperId != null && frstOperId != ''){
	    				$(item).find('[id^=cmntUpdateWriterPwd]').remove();
	    			}
	    			
	    			//삭제폼
					$(item).children('.cmntDisable').find('[id^=cmnt]').each(function(){
	    				if($(this).attr('id') == 'cmntDisableWriter') {$(this).val(writer);}
	    				$(this).attr('id', $(this).attr('id') + '_' + articleCommentKey).attr('name', $(this).attr('name') + '_' + articleCommentKey)
	    			});
					$(item).find('.btnDisable').attr('onclick','cmntDisable('+articleCommentKey+')');						
					$(item).find('.disableContent').html(content.replace(/\n/gi, '<br />'));
	    			if(frstOperId != null && frstOperId != ''){
	    				$(item).find('[id^=cmntDisableWriterPwd]').remove();
	    			}
	    			
	    			//권한에 따른 버튼 설정
	    			if(!isMngr){
	    				if(isUseGrpForComment){
	    					if(frstOperId != null && frstOperId != ''){
	    						if(userId != frstOperId){
	    							$(item).find('.btnUpdateForm').remove();
	    							$(item).find('.btnDisable').remove();
	    						}
	    					}
	    				}else{
	    					$(item).find('.btnUpdateForm').remove();
	    					$(item).find('.btnDisable').remove();
	    				}
	    			}
	    			
	    			$('#cmntList').append(item);
	    		}
	    	}
	    }
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

function cmntInsert(){
	
	//var info = substrInfo($('#cmntContent').val(), contentLimitByte);
	//console.log(info);
	//return;
	
	if($('#cmntWriter').val() == ''){
		alert('댓글 작성자를 입력하세요')
		$('#cmntWriter').focus();
		return;
	}
	
	if($('#cmntWriterPwd').is(':visible') && ($('#cmntWriterPwd').val() == '' || $('#cmntWriterPwd').val().length < 4)){
		alert('댓글 비밀번호를 입력하세요')
		$('#cmntWriterPwd').focus();
		return;
	}
	
	if($('#cmntContent').val() == ''){
		alert('댓글 내용을 입력하세요')
		$('#cmntContent').focus();
		return;
	}
	
	if(!confirm('댓글을 등록하시겠습니까?')){
		return;
	}
	
	$.ajax({
		url:'/csl/articlecomment/insert.do'
	    ,method:"post"
		,dataType:'json'
		,async:true
		,data:{
			boardKey:$('#boardKey').val()
			,articleKey:$('#articleKey').val()
			,writer:$('#cmntWriter').val()
			,writerPwd:$('#cmntWriterPwd').val()
			,content:$('#cmntContent').val()
		}
	    ,success:function(result, stat, xhr) {
	    	//console.log(result);
	    	if(result != null && result.isAvail){
	    		alert('댓글이 등록되었습니다');
	    		cmntReset();
	    		cmntList(true);
	    	}else{
	    		showResult(result.rsCode)
	    	}
	    }
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

function cmntUpdateForm(articleCommentKey){
	$('[id^=cmnt_'+articleCommentKey+'_]').find('.cmntView').hide();
	$('[id^=cmnt_'+articleCommentKey+'_]').find('.cmntUpdate').show();
}

function cmntUpdate(articleCommentKey){
	
	if($('#cmntUpdateWriter_'+articleCommentKey).val() == ''){
		alert('댓글 작성자를 입력하세요')
		$('#cmntUpdateWriter_'+articleCommentKey).focus();
		return;
	}
	
	if($('#cmntUpdateWriterPwd_'+articleCommentKey).is(':visible') && ($('#cmntUpdateWriterPwd_'+articleCommentKey).val() == '' || $('#cmntUpdateWriterPwd_'+articleCommentKey).val().length < 4)){
		alert('댓글 비밀번호를 입력하세요')
		$('#cmntUpdateWriterPwd_'+articleCommentKey).focus();
		return;
	}
	
	if($('#cmntUpdateContent_'+articleCommentKey).val() == ''){
		alert('댓글 내용을 입력하세요')
		$('#cmntUpdateContent_'+articleCommentKey).focus();
		return;
	}
	
	if(!confirm('댓글을 수정하시겠습니까?')){
		return;
	}
	
	$.ajax({
		url:'/csl/articlecomment/update.do'
	    ,method:"post"
		,dataType:'json'
		,async:true
		,data:{
			boardKey:$('#boardKey').val()
			,articleKey:$('#articleKey').val()
			,articleCommentKey:articleCommentKey
			,writer:$('#cmntUpdateWriter_'+articleCommentKey).val()
			,writerPwd:$('#cmntUpdateWriterPwd_'+articleCommentKey).val()
			,content:$('#cmntUpdateContent_'+articleCommentKey).val()
		}
	    ,success:function(result, stat, xhr) {
	    	//console.log(result);
	    	if(result != null && result.isAvail){
	    		alert('댓글이 수정되었습니다');
	    		cmntReset();
	    		cmntList(true);
	    	}else{
	    		showResult(result.rsCode)
	    	}
	    }
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

function cmntUpdateCancel(o){
	$(o).parent().parent().parent().children('.cmntView').show();
	$(o).parent().parent().parent().children('.cmntUpdate').hide();
}

function cmntReplyForm(parentKey){
	//console.log(parentKey);
	if($('[id^=cmnt_' + parentKey + '_]').find('[id^=cmntReply]').length > 0){
		return;
	}

	var div = $('#cmntReply').clone().css('display','');
	$(div).attr('id',$(div).attr('id')+'_'+parentKey);
	
	$('[id^=cmnt_' + parentKey + '_]').append(div);
	
	$('[id^=cmnt_' + parentKey + '_]').children('[id^=cmntReply_]').find('[id^=cmnt]').each(function(){
		$(this).attr('id',$(this).attr('id')+'_'+parentKey);
		$(this).attr('name',$(this).attr('name')+'_'+parentKey);
	});
	$('[id^=cmnt_' + parentKey + '_]').children('[id^=cmntReply_]').find('#btnReply').attr('onclick','cmntReply('+parentKey+')');
	
	//console.log($('[id^=cmnt_' + parentKey + '_]').html());
}

function cmntReplyCancel(o){
	$(o).parent().parent().parent().children('[id^=cmntReply]').remove();
}

function cmntReply(parentKey){
	//console.log(parentKey);
	//console.log($('#cmntReplyWriter_'+parentKey).val());
	//console.log($('#cmntReplyWriterPwd_'+parentKey).val());
	//console.log($('#cmntReplyContent_'+parentKey).val());
	
	if($('#cmntReplyWriter_'+parentKey).val() == ''){
		alert('댓글 작성자를 입력하세요')
		$('#cmntReplyWriter_'+parentKey).focus();
		return;
	}
	
	if($('#cmntReplyWriterPwd_'+parentKey).is(':visible') && ($('#cmntReplyWriterPwd_'+parentKey).val() == '' || $('#cmntReplyWriterPwd_'+parentKey).val().length < 4)){
		alert('댓글 비밀번호를 입력하세요')
		$('#cmntReplyWriterPwd_'+parentKey).focus();
		return;
	}
	
	if($('#cmntReplyContent_'+parentKey).val() == ''){
		alert('댓글 내용을 입력하세요')
		$('#cmntReplyContent_'+parentKey).focus();
		return;
	}
	
	if(!confirm('답글을 등록하시겠습니까?')){
		return;
	}
	
	$.ajax({
		url:'/csl/articlecomment/reply.do'
	    ,method:"post"
		,dataType:'json'
		,async:true
		,data:{
			boardKey:$('#boardKey').val()
			,articleKey:$('#articleKey').val()
			,pkey:parentKey
			,writer:$('#cmntReplyWriter_'+parentKey).val()
			,writerPwd:$('#cmntReplyWriterPwd_'+parentKey).val()
			,content:$('#cmntReplyContent_'+parentKey).val()
		}
	    ,success:function(result, stat, xhr) {
	    	//console.log(result);
	    	if(result != null && result.isAvail){
	    		alert('댓글이 등록되었습니다');
	    		cmntReset();
	    		cmntList(true);
	    	}else{
	    		showResult(result.rsCode)
	    	}
	    }
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

function cmntDisableForm(articleCommentKey, checkPwd){
	console.log(articleCommentKey);
	console.log(checkPwd);
	if(checkPwd){
		$('[id^=cmnt_'+articleCommentKey+'_]').find('.cmntView').hide();
		$('[id^=cmnt_'+articleCommentKey+'_]').find('.cmntDisable').show();
	}else{
		cmntDisable(articleCommentKey);
	}
}

function cmntDisable(articleCommentKey){
	if($('#cmntDisableWriterPwd_'+articleCommentKey).is(':visible') && ($('#cmntDisableWriterPwd_'+articleCommentKey).val() == '' || $('#cmntDisableWriterPwd_'+articleCommentKey).val().length < 4)){
		alert('댓글 비밀번호를 4자리 이상 입력하세요')
		$('#cmntDisableWriterPwd_'+articleCommentKey).focus();
		return;
	}
	
	if(!confirm('비활성으로 변경하시겠습니까?')){
		return;
	}
	
	$.ajax({
		url:'/csl/articlecomment/disable.do'
	    ,method:"post"
		,dataType:'json'
		,async:true
		,data:{
			boardKey:$('#boardKey').val()
			,articleKey:$('#articleKey').val()
			,articleCommentKey:articleCommentKey
			,writerPwd:$('#cmntDisableWriterPwd_'+articleCommentKey).val()
		}
	    ,success:function(result, stat, xhr) {
	    	//console.log(result);
	    	if(result != null && result.isAvail){
	    		alert('비활성으로 변경되었습니다');
	    		cmntReset();
	    		cmntList(true);
	    	}else{
	    		showResult(result.rsCode)
	    	}
	    }
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

function cmntDisableCancel(o){
	$(o).parent().parent().parent().children('.cmntView').show();
	$(o).parent().parent().parent().children('.cmntDisable').hide();
}

function cmntRecovery(articleCommentKey, pkey){
	if($('[id^=cmnt_'+pkey+'_]').find('.btnDisableForm').length > 0){
		alert('상위글이 비활성 상태에서는 하위글을 복원할 수 없습니다');
		return;
	}	
	
	if(!confirm('복원하시겠습니까?')){
		return;
	}
	
	$.ajax({
		url:'/csl/articlecomment/recovery.do'
	    ,method:"post"
		,dataType:'json'
		,async:true
		,data:{
			boardKey:$('#boardKey').val()
			,articleKey:$('#articleKey').val()
			,articleCommentKey:articleCommentKey
		}
	    ,success:function(result, stat, xhr) {
	    	//console.log(result);
	    	if(result != null && result.isAvail){
	    		alert('복원되었습니다');
	    		cmntReset();
	    		cmntList(true);
	    	}else{
	    		showResult(result.rsCode)
	    	}
	    }
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

function cmntRemove(articleCommentKey){
	if(!confirm('답글이 있는경우 답글도 삭제됩니다. 삭제하시겠습니까?')){
		return;
	}
	
	$.ajax({
		url:'/csl/articlecomment/delete.do'
	    ,method:"post"
		,dataType:'json'
		,async:true
		,data:{
			boardKey:$('#boardKey').val()
			,articleKey:$('#articleKey').val()
			,articleCommentKey:articleCommentKey
		}
	    ,success:function(result, stat, xhr) {
	    	//console.log(result);
	    	if(result != null && result.isAvail){
	    		alert('삭제되었습니다');
	    		cmntReset();
	    		cmntList(true);
	    	}else{
	    		showResult(result.rsCode)
	    	}
	    }
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

function cmntReset(){
	$('#cmntWriterPwd').val('');
	$('#cmntContent').val('');
}

function showResult(rsCode){
	if(rsCode == 'PERMISSION_DENIED'){
		alert('사용권한이 없습니다');
	}else if(rsCode == 'NOT_EXIST'){
		alert('존재하지 않거나 삭제된 댓글입니다');
	}else if(rsCode == 'NOT_MATCH_PWD'){
		alert('비밀번호가 일치하지 않습니다');
	}else if(rsCode == 'NOT_MATCH_LOGIN'){
		alert('로그인 정보가 일치하지 않습니다');
	}else if(rsCode == 'NOT_COMPLETE'){
		alert('오류가 발생하여 요청이 완료되지 않았습니다');
	}else{
		alert(rsCode);
	}
}

var contentLimitByte = 600;
function checkContent(o){
	var info = substrInfo($(o).val(), contentLimitByte);
	$(o).parent().find('.text_num b').text(info.rtnSize);
	if(info.isExceed){
		$(o).val(info.rtnText);
		alert('내용이 ' + contentLimitByte + 'Byte를 초과하였습니다');
	}
}
//-->
</script>

<!-- 댓글영역 -->
<div>
	<div class="cmnt_view">
		<p class="cmnt_count">
			<!-- <span>댓글</span> <span id="cmntCnt"></span> <span><a href="#none" onclick="$('.cmntListWrap').toggle();">펼치기/접기</a></span> -->
			<a style="display:block;width:100%;" href="#none" onclick="$('.cmntListWrap').toggle();"><span>댓글</span> <span id="cmntCnt"></span> <span>펼치기/접기</span></a>
		</p>
		<div class="cmntListWrap" style="display:;">
			<ul id="cmntList">
				<li style="display:none;">
					<div class="cmntView">
						<p>
							<span class="user viewWriter">작성자</span>
							<span class="date viewFrstOperDt">작성일시</span>
							<a class="btnUpdateForm" href="#none" onclick="cmntUpdateForm();">수정</a>
							<a class="btnDisableForm" style="display:;" href="#none" onclick="cmntDisableForm();">비활성</a>
							<a class="disable btnRecovery" style="display:none;" href="#none" onclick="cmntRecovery();">복원</a>
							<c:if test="${isMngr}">
								<a class="btnRemove" href="#none" onclick="cmntRemove();">완전삭제</a>
							</c:if>
						</p>
						<c:if test="${isMngr or isUseGrpForComment}">
							<p class="answer"><a class="btnReplyForm" href="#none" onclick="cmntReplyForm();" >답글</a></p>
						</c:if>
						<p class="cmnt_wt_cont viewContent">
							내용
						</p>
					</div>
					<div class="cmnt_write cmntUpdate" style="display:none;">
						<p class="cancel" style="display:;"><a id="btnCancel" href="#none" onclick="cmntUpdateCancel(this);">취소</a></p>
						<fieldset>
							<div style="padding-bottom:10px;">
								<label>작성자</label> <input type="text" id="cmntUpdateWriter" name="cmntUpdateWriter" readonly="readonly" value="" maxlength="20" style="width:120px;"/>
								<label id="cmntUpdateWriterPwdLabel">비밀번호</label> <input type="password" id="cmntUpdateWriterPwd" name="cmntUpdateWriterPwd" maxlength="20" style="width:120px;"/>
								<label>내용제한</label><span class="text_num"><b>0</b> / 600Byte</span>
							</div>
							<textarea id="cmntUpdateContent" name="cmntUpdateContent"></textarea>
							<p class="btn_signup"><a class="btnUpdate" href="#none" onclick="cmntUpdate(); return false;">수정</a></p>
						</fieldset>
					</div>
					<div class="cmnt_write cmntDisable" style="display:none;">
						<p class="cancel"><a id="btnCancel" href="#none" onclick="cmntDisableCancel(this);">취소</a></p>
						<fieldset>
							<legend class="hidden">댓글삭제</legend>
							<div style="padding-bottom:10px;">
								<label>작성자</label> <input type="text" id="cmntDisableWriter" name="cmntDisableWriter" readonly="readonly" value="" maxlength="20" style="width:120px;"/>
								<label id="cmntDisableWriterPwdLabel">비밀번호</label> <input type="password" id="cmntDisableWriterPwd" name="cmntDisableWriterPwd" maxlength="20" style="width:120px;"/>
								<a class="btnDisable" onclick="cmntDisable(); return false;" href="#none" style="padding:3px 6px;border:1px solid #ddd;">비활성</a>
							</div>
						</fieldset>
						<p class="cmnt_wt_cont disableContent">
							내용
						</p>
					</div>
				</li>
			</ul>
			<c:if test="${isMngr or isUseGrpForComment}">
				<div class="cmnt_write">
					<fieldset>
						<div style="padding-bottom:10px;">
							<label>작성자</label> <input type="text" id="cmntWriter" name="cmntWriter" value="${userSession.userNm}" maxlength="20" style="width:120px;"/>
							<c:if test="${!userSession.loginUser}">
								<label>비밀번호</label> <input type="password" id="cmntWriterPwd" name="cmntWriterPwd" maxlength="20" style="width:120px;"/>
							</c:if>
							<label>내용제한</label><span class="text_num"><b>0</b> / 600Byte</span>
						</div>
						<textarea id="cmntContent" name="cmntContent" onkeyup="checkContent(this);" onblur="checkContent(this);"></textarea>
						<p class="btn_signup"><a href="#none" onclick="cmntInsert(); return false;">등록</a></p>
					</fieldset>
				</div>
			</c:if>
			<div id="cmntReply" class="cmnt_write" style="margin-top:20px;display:none;">
				<p class="cancel"><a id="btnCancel" href="#none" onclick="cmntReplyCancel(this);">취소</a></p>
				<fieldset>
					<div style="padding-bottom:10px;">
						<input type="hidden" id="cmntPkey" name="cmntPkey" value="0" />
						<label>작성자</label> <input type="text" id="cmntReplyWriter" name="cmntWriter" value="${userSession.userNm}" maxlength="20" style="width:120px;"/>
						<c:if test="${!userSession.loginUser}">
							<label>비밀번호</label> <input type="password" id="cmntReplyWriterPwd" name="cmntWriterPwd" maxlength="20" style="width:120px;"/>
						</c:if>
						<label>내용제한</label><span class="text_num"><b>0</b> / 600Byte</span>
					</div>
					<textarea id="cmntReplyContent" name="cmntReplyContent" onkeyup="checkContent(this);" onblur="checkContent(this);"></textarea>
					<p class="btn_signup"><a id="btnReply" href="#none" onclick="cmntReply(); return false;">답글등록</a></p>
				</fieldset>
			</div>
		</div>
	</div>
</div>
<!-- //댓글영역 -->