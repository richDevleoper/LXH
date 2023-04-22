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
                                        <div class="form-inline form-select">
                                            <label>구분</label>
                                            <select name="">
                                                <option value="">전체</option>
                                                <option value="">사번</option>
                                                <option value="">이름</option>
                                                <option value="">부문</option>
                                                <option value="">소속명</option>
                                                <option value="">팀명</option>
                                                <option value="">직무명</option>
                                            </select>                                                    
                                        </div>
                                        <div class="form-inline form-select">
                                            <input type="text" name="">
                                        </div>
                                        <div class="form-inline form-select">
                                            <label>사업장</label>                                            
                                            <select name="">
                                                <option value="">전체</option>
                                            </select>                                            
                                        </div>
                                        <div class="form-inline form-select">
                                            <label>조직</label>
                                            <input type="text" name="">
                                            <button type="button" class="btn-org">검색</button>
                                        </div>                                        
                                        <button type="button" class="btn-submit">조회</button>
                                    </div>
                                </form>
                            </div>

                            <div class="list-header">
                                <p class="title">분임조 편성 현황</p>
                                <span class="bar"></span>
                                <p class="total">총 10</p>
                                <select name="limit" class="limit">
                                    <option value="10">10개</option>
                                    <option value="50">50개</option>
                                    <option value="100">100개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="even">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:60px">
                                            <col style="width:110px">
                                            <col>
                                            <col style="width:120px">
                                            <col>
                                            <col>                                            
                                            <col style="width:100px">
                                            <col style="width:100px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray font-weight-bold">NO</th>
                                                <th class="bg-gray font-weight-bold">분임조명</th>
                                                <th class="bg-gray font-weight-bold">소속</th>
                                                <th class="bg-gray font-weight-bold">사업장</th>
                                                <th class="bg-gray font-weight-bold">분임조장</th>
                                                <th class="bg-gray font-weight-bold">부문</th>
                                                <th class="bg-gray font-weight-bold">분임조원수</th>
                                                <th class="bg-gray font-weight-bold">등록일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>                                                            
                                                <td>10</td>
                                                <td>
                                                    <div class="link-group center">
                                                        <ul>
                                                            <li><a href="/app/003_03_mkteam_01.do?menuKey=70" title="바로가기" >분임조명</a></li>                                                                
                                                        </ul>
                                                    </div>                                                                   
                                                <td>창호 프로파일생산팀</td>
                                                <td>청주공장</td>
                                                <td>홍길동</td>
                                                <td>창호</td>
                                                <td>5</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>                                                            
                                                <td>9</td>
                                                <td>
                                                    <div class="link-group center">
                                                        <ul>
                                                            <li><a href="/app/003_03_mkteam_01.do?menuKey=70" title="바로가기" >분임조명</a></li>
                                                        </ul>
                                                    </div>                                                                   
                                                <td>창호 프로파일생산팀</td>
                                                <td>울산공장</td>
                                                <td>홍길동</td>
                                                <td>바닥재</td>
                                                <td>6</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>                                                            
                                                <td>8</td>
                                                <td>
                                                    <div class="link-group center">
                                                        <ul>
                                                            <li><a href="/app/003_03_mkteam_01.do?menuKey=70" title="바로가기" >분임조명</a></li>                                                                
                                                        </ul>
                                                    </div>                                                                   
                                                <td>창호 프로파일생산팀</td>
                                                <td>청주공장</td>
                                                <td>홍길동</td>
                                                <td>단열재</td>
                                                <td>7</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>                                                            
                                                <td>7</td>
                                                <td>
                                                    <div class="link-group center">
                                                        <ul>
                                                            <li><a href="/app/003_03_mkteam_01.do?menuKey=70" title="바로가기" >분임조명</a></li>                                                                
                                                        </ul>
                                                    </div>                                                                   
                                                <td>창호 프로파일생산팀</td>
                                                <td>울산공장</td>
                                                <td>홍길동</td>
                                                <td>벽지</td>
                                                <td>5</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>


                                            <tr>                                                            
                                                <td>6</td>
                                                <td>
                                                    <div class="link-group center">
                                                        <ul>
                                                            <li><a href="/app/003_03_mkteam_01.do?menuKey=70" title="바로가기" >분임조명</a></li>                                                                
                                                        </ul>
                                                    </div>                                                                   
                                                <td>창호 프로파일생산팀</td>
                                                <td>청주공장</td>
                                                <td>홍길동</td>
                                                <td>창호</td>
                                                <td>5</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>                                                            
                                                <td>5</td>
                                                <td>
                                                    <div class="link-group center">
                                                        <ul>
                                                            <li><a href="/app/003_03_mkteam_01.do?menuKey=70" title="바로가기" >분임조명</a></li>                                                                
                                                        </ul>
                                                    </div>                                                                   
                                                <td>창호 프로파일생산팀</td>
                                                <td>울산공장</td>
                                                <td>홍길동</td>
                                                <td>바닥재</td>
                                                <td>6</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>                                                            
                                                <td>4</td>
                                                <td>
                                                    <div class="link-group center">
                                                        <ul>
                                                            <li><a href="/app/003_03_mkteam_01.do?menuKey=70" title="바로가기" >분임조명</a></li>                                                                
                                                        </ul>
                                                    </div>                                                                   
                                                <td>창호 프로파일생산팀</td>
                                                <td>청주공장</td>
                                                <td>홍길동</td>
                                                <td>단열재</td>
                                                <td>7</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>                                                            
                                                <td>3</td>
                                                <td>
                                                    <div class="link-group center">
                                                        <ul>
                                                            <li><a href="/app/003_03_mkteam_01.do?menuKey=70" title="바로가기" >분임조명</a></li>                                                                
                                                        </ul>
                                                    </div>                                                                   
                                                <td>창호 프로파일생산팀</td>
                                                <td>울산공장</td>
                                                <td>홍길동</td>
                                                <td>벽지</td>
                                                <td>5</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>                                                            
                                                <td>2</td>
                                                <td>
                                                    <div class="link-group center">
                                                        <ul>
                                                            <li><a href="/app/003_03_mkteam_01.do?menuKey=70" title="바로가기" >분임조명</a></li>                                                                
                                                        </ul>
                                                    </div>                                                                   
                                                <td>창호 프로파일생산팀</td>
                                                <td>울산공장</td>
                                                <td>홍길동</td>
                                                <td>바닥재</td>
                                                <td>6</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>                                                            
                                                <td>1</td>
                                                <td>
                                                    <div class="link-group center">
                                                        <ul>
                                                            <li><a href="/app/003_03_mkteam_01.do?menuKey=70" title="바로가기" >분임조명</a></li>
                                                        </ul>
                                                    </div>                                                                   
                                                <td>창호 프로파일생산팀</td>
                                                <td>청주공장</td>
                                                <td>홍길동</td>
                                                <td>단열재</td>
                                                <td>7</td>
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
                                    <button type="button" class="btn bg-gray" onclick="location.href='./003_03_mkteam_02.do?menuKey=70';">                                        
                                        <span>분임조등록</span>
                                    </button>                                    
                                </div>

                            </div>
                        </div>
                    
        <!-- 조직도 -->
        <div class="modal-dimmed"></div>
        <div class="org-modal">
            <div class="modal-header">
                <h4>조직조회</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="list-wrap">
                    <div class="list-search">
                        <form id="org-form" onsubmit="org_search();return false;">
                            <div class="search-form">
                                <div class="form-inline form-input">
                                    <label>조직명</label>
                                    <input type="text" name="">
                                </div>
                                <button type="submit" class="btn-submit">조회</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="tree-header">
                    <div>
                        <input type="checkbox" id="orgSelAll">
                        <label for="orgSelAll"></label>
                    </div>
                    <div>
                        6σ 인재육성대상 조직명
                    </div>
                </div>
                <div id="org-tree">
                    <ul>
                        <li>창호 사업부
                            <ul>
                                <li>창호.생산담당
                                    <ul>
                                        <li>· 창호.프로파일생산팀</li>
                                        <li>· 창호.기술팀</li>
                                        <li>· 창호.공정혁신팀</li>
                                        <li>· 창호.완성창공정기술팀</li>
                                    </ul>
                                </li>
                                <li>유리</li>
                                <li>연구소 근무</li>
                                <li>창호.시스템창사업담당</li>
                                <li>창호.중문팀</li>
                                <li>바닥재 사업담당	</li>
                            </ul>
                        </li>
                        <li>단열재 사업담당
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>벽지 사업담당	
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>표면소재 사업담당
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>산업용필름 사업담당
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>자동차소재부품 사업부
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>인테리어 사업부
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>연구소
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>품질 담당
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                        <li>생산/기술/R&D/품질 外
                            <ul>
                                <li>창호.프로파일생산팀</li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="btns">
                    <button type="button" class="btn-submit">확인</button>
                    <button type="button" class="btn-cancel">취소</button>
                </div>
            </div>
        </div>
</body>
</html>