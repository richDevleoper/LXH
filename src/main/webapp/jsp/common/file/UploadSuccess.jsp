<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>파일첨부성공</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:choose>
	<c:when test="${empty uploadFile}">
		<script language="javascript">
			alert("파일첨부를 실패하였습니다.");
			self.close();
		</script>
	</c:when>
	<c:otherwise>
		<script language="javascript">
			function UploadFile(fileName, serverFileName, relativePath, fileSize, fileExt, fileType) {
				this.fileName = fileName;
				this.serverFileName = serverFileName;
				this.relativePath = relativePath;
				this.fileSize = fileSize;
				this.fileExt = fileExt;
				this.fileType = fileType;
			}
			var uploadFile = new UploadFile("${uploadFile.fileName}", "${uploadFile.serverFileName}", "${uploadFile.relativePath}", "${uploadFile.fileSize}", "${uploadFile.fileExt}", "${uploadFile.fileType}");
			if (!opener.${handlerName}) {
				alert("파일을 처리할 핸들러(${handlerName})가 존재하지 않습니다.");
			} else {
				opener.${handlerName}(uploadFile);
			}
			self.close();
		</script>
	</c:otherwise>
</c:choose>
</head>
</html>