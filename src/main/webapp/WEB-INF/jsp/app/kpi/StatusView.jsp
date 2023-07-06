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
                            <%-- <div class="list-search">
                                <form>
                                    <div class="search-form">
                                        <div class="form-inline form-input">
                                            <label>이름</label>
                                            <input type="text" name="">
                                        </div>
                                        <div class="form-inline form-input">
                                            <label>조직</label>
                                            <input type="text" name="">
                                            <button type="button" class="btn-org comPopup_orgSearch">검색</button>
                                        </div>
                                        <div class="form-inline form-input">
                                            <label>직책</label>
                                            <input type="text" name="">
                                            <button type="button" class="btn-org comPopup_posSearch">검색</button>
                                        </div>
                                        
                                        <button type="button" class="btn-submit">조회</button>
                                    </div>
                                </form>
                            </div> --%>
                            <div class="list-header">
                                <p class="title">‘${eduYear}년, ${deptName}, <!-- GB,  -->인재육성인원</p>
                                <span class="bar"></span>
                                <!-- <p class="total">총 305</p>
                                <select name="limit" class="limit">
                                    <option value="10">10개</option>
                                    <option value="50">50개</option>
                                    <option value="100">100개</option>
                                </select> -->
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
                                                <th class="bg-gray" colspan="2">GB</th>
                                                <th class="bg-gray" colspan="4">MGB</th>
                                                <th class="bg-gray" colspan="4">BB</th>
                                                <th class="bg-gray" colspan="6">MBB</th>
                                            </tr>
                                            <tr>
                                                <th>교육<br/>이수</th>
                                                <!-- <th>필기<br/>Test</th> -->
                                                <th>인증</th>
                                                
                                                <th>교육<br/>이수</th>
                                                <!-- <th>필기<br/>Test</th> -->
                                                <th>과제<br/>수행</th>
                                                <th>과제<br/>Test</th>
                                                <th>인증</th>
                                                
                                                <th>교육<br/>이수</th>
                                                <!-- <th>Paper<br/>Test</th> -->
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
                                                <td>${item.DEPT_NM}</td>
                                                <td>${item.USER_NAME }</td>
                                                <td>${item.COM_JOBX }</td>
                                                <td>${item.COM_POSIGION}</td>
                                                
                                                <td>${item.GB_EDU_YN}</td>
                                                <!-- <td>O</td> -->
                                                <td>${item.GB_CERT_YN}</td>
                                                
                                                <td>${item.MGB_EDU_YN}</td>
                                                <!-- <td>O</td> -->
                                                <td>${item.MGB_REP_YN}</td>
                                                <td>${item.MGB_REP_TEST_YN}</td>
                                                <td>${item.MGB_CERT_YN}</td>
                                                
                                                <td>${item.BB_EDU_YN}</td>
                                                <!-- <td>O</td> -->
                                                <td>${item.BB_REP_YN}</td>
                                                <td>${item.BB_REP_TEST_YN}</td>
                                                <td>${item.BB_CERT_YN}</td>
                                                
                                                <td>${item.MBB_EDU_YN}</td>
                                                <td>${item.MBB_STATIS_TEST_YN}</td>
                                                <td>${item.MBB_REP_YN}</td>
                                                <td>${item.MBB_REP_TEST_YN}</td>
                                                <td>${item.MBB_ENDOW_TEST_YN}</td>
                                                <td>${item.MBB_CERT_YN}</td>
                                            </tr>
                                        </c:forEach>
                                          <!--   <tr>
                                                <td>304</td>
                                                <td>창호사업부</td>
                                                <td>홍길동</td>
                                                <td>직위</td>
                                                <td>직책</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>-</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>해당<br/>없음</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>2건</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>진행</td>
                                            </tr>
                                            <tr>
                                                <td>303</td>
                                                <td>창호사업부</td>
                                                <td>홍길동</td>
                                                <td>직위</td>
                                                <td>직책</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>-</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>해당<br/>없음</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>2건</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>진행</td>
                                            </tr>
                                            <tr>
                                                <td>302</td>
                                                <td>창호사업부</td>
                                                <td>홍길동</td>
                                                <td>직위</td>
                                                <td>직책</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>-</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>해당<br/>없음</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>2건</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>진행</td>
                                            </tr>
                                            <tr>
                                                <td>301</td>
                                                <td>창호사업부</td>
                                                <td>홍길동</td>
                                                <td>직위</td>
                                                <td>직책</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>-</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>해당<br/>없음</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>O</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>2건</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>진행</td>
                                            </tr> -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">
                                <!-- <div class="pagination">
                                    <a href="" class="first">처음</a>
                                    <a href="" class="prev">이전</a>
                                    <a href="" class="cur num">1</a>
                                    <a href="" class="num">2</a>
                                    <a href="" class="num">3</a>
                                    <a href="" class="num">4</a>
                                    <a href="" class="num">5</a>
                                    <a href="" class="next">다음</a>
                                    <a href="" class="last">끝</a>
                                </div> -->
                                <div class="list-btns">
                                    <!-- <button type="button" class="btn-excel">
                                        <img src="/assets/images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button> -->
                                    <a href="">목록</a>
                                </div>
                            </div>
                        </div>
                    


</body>
</html>