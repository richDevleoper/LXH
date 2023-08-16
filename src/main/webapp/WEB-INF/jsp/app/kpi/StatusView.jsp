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

                            <div class="list-header">
                                <p class="title">‘${eduYear}년, ${deptName}, <!-- GB,  -->인재육성인원</p>
                                <span class="bar"></span>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray" rowspan="2">NO</th>
                                                <th class="bg-gray" rowspan="2">소속</th>
                                                <th class="bg-gray" rowspan="2">이름</th>
                                                <th class="bg-gray" rowspan="2">직위</th>
                                                <th class="bg-gray" rowspan="2">직책</th>
                                                <th class="bg-gray" colspan="3">GB</th>
                                                <th class="bg-gray" colspan="5">MGB</th>
                                                <th class="bg-gray" colspan="5">BB</th>
                                                <th class="bg-gray" colspan="6">MBB</th>
                                            </tr>
                                            <tr>
                                                <th>교육<br/>이수</th>
                                                <th>통계<br/>Test</th>
                                                <th>인증</th>
                                                
                                                <th>교육<br/>이수</th>
                                                <th>통계<br/>Test</th>
                                                <th>과제<br/>수행</th>
                                                <th>과제<br/>Test</th>
                                                <th>인증</th>
                                                
                                                <th>교육<br/>이수</th>
                                                <th>통계<br/>Test</th>
                                                <th>과제<br/>수행</th>
                                                <th>과제<br/>Test</th>
                                                <th>인증</th>
                                                
                                                <th>교육<br/>이수</th>
                                                <th>통계<br/>Test</th>
                                                <th>과제<br/>수행</th>
                                                <th>과제<br/>Test</th>
                                                <th>자질<br/>평가</th>
                                                <th>인증</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${tableData}" var="item" varStatus="i">
                                            <tr>
                                                <td>${i.count}</td>
                                                <td>${item.STD_DEPART}</td>
                                                <td>${item.STD_NAME }</td>
                                                <td>${item.STD_JOBX }</td>
                                                <td>${item.STD_POSITION}</td>
                                                
                                                <td>${item.GB_EDU_TXT}</td>
                                                <td>${item.GB_TEST_TXT}</td>
                                                <td>${item.GB_CERT_TXT}</td>
                                                
                                                <td>${item.MGB_EDU_TXT}</td>
                                                <td>${item.MGB_TEST07_TXT}</td>
                                                <td>${item.MGB_REP_TXT}</td>
                                                <td>${item.MGB_TEST08_TXT}</td>
                                                <td>${item.MGB_CERT_TXT}</td>
                                                
                                                <td>${item.BB_EDU_TXT}</td>
                                                <td>${item.BB_TEST07_TXT}</td>
                                                <td>${item.BB_REP_TXT}</td>
                                                <td>${item.BB_TEST08_TXT}</td>
                                                <td>${item.BB_CERT_TXT}</td>
                                                
                                                <td>${item.MBB_EDU_TXT}</td>
                                                <td>${item.MBB_TEST07_TXT}</td>
                                                <td>${item.MBB_TEST08_TXT}</td>
                                                <td>${item.MBB_REP_TXT}</td>
                                                <td>${item.MBB_TEST09_TXT}</td>
                                                <td>${item.MBB_CERT_TXT}</td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${fn:length(tableData) eq 0}">
                                        	<tr>
                                                <td colspan="24" style="height: 50px; background-color: white;">지정된 구성원이 없습니다.</td>
                                            </tr>
                                        </c:if>
                                          
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">
                             
                                <div class="list-btns">
                                    <a href="./${listAddr}?menuKey=${menuKey}">목록</a>
                                </div>
                            </div>
                        </div>
</body>
</html>