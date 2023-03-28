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
                            <div class="list-search">
                                <form>
                                    <div class="search-form">
                                        <div class="form-inline form-input">
                                            <label>과제명</label>
                                            <input type="text" name="">
                                        </div>
                                        <div class="form-inline form-select">
                                            <label>6σFull Process 여부</label>                                            
                                            <select name="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                        <div class="form-inline form-select">
                                            <label>과제유형</label>
                                            <select name="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                        <div class="form-inline form-select">
                                            <label>진행사항</label>
                                            <select name="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                        <button type="button" class="btn-submit">조회</button>
                                    </div>
                                </form>
                            </div>

                            <div class="list-header">
                                <p class="title">나의 과제</p>
                                <span class="bar"></span>
                                <p class="total">총 10(완료 2, 진행중 4, 선정중 2, Drop 2)</p>
                                <select name="limit" class="limit">
                                    <option value="10">10개</option>
                                    <option value="50">50개</option>
                                    <option value="100">100개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="centered even">
                                        <colgroup>
                                            <col style="width:50px">
                                            <col style="width:120px">
                                            <col style="width:150px">
                                            <col>
                                            <col style="width:100px">
                                            <col style="width:100px">
                                            <col style="width:100px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray font-weight-bold">NO</th>
                                                <th class="bg-gray font-weight-bold">6σFull Process 여부</th>
                                                <th class="bg-gray font-weight-bold">과제유형</th>
                                                <th class="bg-gray font-weight-bold">과제명</th>
                                                <th class="bg-gray font-weight-bold">진행현황</th>
                                                <th class="bg-gray font-weight-bold">착수(예정)일</th>
                                                <th class="bg-gray font-weight-bold">완료(예정)일</th>
                                            </tr>                                            
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>10</td>
                                                <td>6σFull Process</td>
                                                <td>DMAIC</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>선정중</td>
                                                <td>2023.01.30</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>9</td>
                                                <td>6σFull Process</td>
                                                <td>DMEDI</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>진행중(On)</td>
                                                <td>2023.01.30</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>     
                                            <tr>
                                                <td>8</td>
                                                <td>일반과제</td>
                                                <td>Quick 6σ</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>진행중(Off)</td>
                                                <td>2023.01.30</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td>일반과제</td>
                                                <td>빅데이터</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>Drop</td>
                                                <td>2023.01.30</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>   
                                            <tr>
                                                <td>6</td>
                                                <td>일반과제</td>
                                                <td>FMEA</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>선정중</td>
                                                <td>2023.01.30</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>일반과제</td>
                                                <td>CEO/CPO Task</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>진행중(On)</td>
                                                <td>2023.01.30</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>     
                                            <tr>
                                                <td>4</td>
                                                <td>일반과제</td>
                                                <td>MGB(현장개선)</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>진행중(Off)</td>
                                                <td>2023.01.30</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>일반과제</td>
                                                <td>Quick Win(현장개선)</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>Drop</td>
                                                <td>2023.01.30</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>    
                                            <tr>
                                                <td>2</td>
                                                <td>일반과제</td>
                                                <td>DMAIC</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>선정중</td>
                                                <td>2023.01.30</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>일반과제</td>
                                                <td>MGB(현장개선)</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>완료(2023.06.30)</td>
                                                <td>2023.01.30</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>                                   
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="list-footer">
                                <div class="pagination">
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
                                <div class="list-btns">
                                    <button type="button" class="btn bg-gray" onclick="location.href='/report/002_01_sub01.do?menuKey=${menuKey}'">                                        
                                        <span>과제등록</span>
                                    </button>                                    
                                </div>

                            </div>
                        </div>
                   
        

</body>
</html>