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

                        <p class="content_title">분임조 상세정보</p>
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:180px">
                                            <col>
                                            <col style="width:180px">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>분임조명</th>
                                                <td colspan="3">${makeVO.cirName} </td>
                                            </tr>
                                            <tr>
                                                <th>등록번호</th>
                                                <td>${makeVO.cirRegNum}</td>
                                                <th>조직명</th>
                                                <td>${makeVO.deptName}</td>
                                            </tr>
                                            <tr>
                                                <th>지도사원</th>
                                                <td>${makeVO.cirTchComName}</td>
                                                <th>사무국</th>
                                                <td>${makeVO.cirWorkMemName}</td>
                                            </tr>
                                            <tr>
                                                <th>팀장</th>
                                                <td colspan="3">${makeVO.cirTeamLeaderName}</td>                                                
                                            </tr>                                            
                                            <tr>
                                                <th>분임조원</th>
                                                <td colspan="3">
                                                    <div class="list-wrap">
                                                        <div class="list-content">
                                                            <div class="list-table list">
                                                                <table class="centered">
                                                                    <caption>분임조원</caption>
                                                                    <colgroup>
                                                                        <col style="width:80px">
                                                                        <col>
                                                                        <col style="width:80px">
                                                                        <col style="width:80px">
                                                                        <col style="width:80px">
                                                                        <col style="width:80px">
                                                                    </colgroup>
                                                                    <thead>
                                                                        <tr>
                                                                            <th>구분</th>
                                                                            <th>소속</th>
                                                                            <th>이름</th>
                                                                            <th>직위</th>
                                                                            <th>직책</th>
                                                                            <th>Belt</th>                                                                            
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <c:forEach items="${makeVO.teamMemList}" var="item" varStatus="i">
                                                                        <tr>
                                                                            <td class="align-center">${item.repTeamMemRoleNm}</td>
                                                                            <td class="align-left">${item.deptName}</td>
                                                                            <td class="align-center">${item.repTeamMemName}</td>
                                                                            <td class="align-center">${item.comJobxNm}</td>
                                                                            <td class="align-center">${item.comPositionNm}</td>
                                                                            <td class="align-center">${item.beltNm}</td>          
                                                                        </tr>
                                                                    </c:forEach>
                                                                        <!-- <tr>
                                                                            <td>팀원</td>
                                                                            <td class="align-left">소속정보</td>
                                                                            <td>홍길동</td>
                                                                            <td>선임</td>
                                                                            <td>사원</td>
                                                                            <td>GB</td>          
                                                                        </tr>
                                                                        <tr>
                                                                            <td>팀원</td>
                                                                            <td class="align-left">소속정보</td>
                                                                            <td>홍길동</td>
                                                                            <td>책임</td>
                                                                            <td>침장</td>
                                                                            <td>BB</td>          
                                                                        </tr>
                                                                        <tr>
                                                                            <td>팀원</td>
                                                                            <td class="align-left">소속정보</td>
                                                                            <td>홍길동</td>
                                                                            <td>선임</td>
                                                                            <td>사원</td>
                                                                            <td>GB</td>          
                                                                        </tr>
                                                                        <tr>
                                                                            <td>팀원</td>
                                                                            <td class="align-left">소속정보</td>
                                                                            <td>홍길동</td>
                                                                            <td>책임</td>
                                                                            <td>침장</td>
                                                                            <td>BB</td>          
                                                                        </tr>
                                                                        <tr>
                                                                            <td>팀원</td>
                                                                            <td class="align-left">소속정보</td>
                                                                            <td>홍길동</td>
                                                                            <td>선임</td>
                                                                            <td>사원</td>
                                                                            <td>GB</td>          
                                                                        </tr>
                                                                        <tr>
                                                                            <td>팀원</td>
                                                                            <td class="align-left">소속정보</td>
                                                                            <td>홍길동</td>
                                                                            <td>책임</td>
                                                                            <td>침장</td>
                                                                            <td>BB</td>          
                                                                        </tr> -->
                                                                    </tbody>                                                                   
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="select6"><span class="asterisk">*</span>이력내용</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s8" style="min-height: 35px;">${makeVO.cirRecordCont}</div>                                                        
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="list-footer">
                                    <div class="list-btns">
                                        <button type="button" class="btn light-gray" onclick="location.href='/team/makeUpdate.do?menuKey=${menuKey}&cirCode=${makeVO.cirCode}';">수정</button>                                        
                                        <a href="/team/makelist.do?menuKey=${menuKey}" class="btn">목록</a>
                                    </div>
                            </div>
                        </div>
                 

</body>
</html>