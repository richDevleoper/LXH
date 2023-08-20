<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
    
<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${popupVO.popupTitle }</title>

<script type="text/javascript" src="/js/popup_resize.js"></script>
<script type="text/javascript">


function setCookie( name, value, expiredays ) { 
        var todayDate = new Date(); 
        todayDate.setDate( todayDate.getDate() + expiredays ); 
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
}
function closeWin() 
{ 
        setCookie( "POPUP_${popupVO.popupKey}", "done" , 1); 
        self.close(); 
}


$(function() {
	
	var	moveWidth = 0;

<c:if test="${popupVO.autoSizeFlag eq 'Y' }">
	popup_resize(${param.position});
</c:if>
<c:if test="${popupVO.autoSizeFlag ne 'Y' }">
	for(i = 0; i < ${param.position}; i++) {
		if(opener.popupList[i]) {
			moveWidth += opener.popupList[i].document.body.scrollWidth+4;
			moveTo(moveWidth,10);
		}
	}
</c:if>

	if(document.documentElement.scrollHeight > screen.height) {
		window.document.body.scroll = "yes";
	}
	
	 window.focus();
	 
});
</script>
</head>

<body style="margin:0px;padding: 0px;">
<div style="width: 100%;vertical-align: top;">
	<c:out value="${popupVO.popupContent }" escapeXml="false"></c:out>
</div>
<c:if test="${popupVO.popupType ne 'Z' }">
<div style="width: 100%;height: 25px;padding-top:10px; background-color: #474747;border-top: 1px solid #D5D5D5;">
	<c:if test="${popupVO.popupKey > 1}">
	<div style="float: left;padding-left: 10px;">
		<input type="checkbox" id="ccheck" name="ccheck"  onclick="closeWin()" style="border: 0px;" />
		<a href="javascript:closeWin();" style="color: #D5D5D5;">오늘하루 이창을 열지않습니다.</a>
	</div>
	</c:if>
	<div style="float: right;padding-right: 10px;">
		<a href="javascript:self.close();" style="color: white; font-weight: bold;">창닫기</a>
	</div>
</div>
</c:if>
</body>
</html>
