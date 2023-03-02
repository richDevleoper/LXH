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
                                            <label>이름</label>
                                            <input type="text" name="">
                                        </div>
                                        <div class="form-inline form-input">
                                            <label>조직</label>
                                            <input type="text" name="">
                                            <button type="button" class="btn-org">검색</button>
                                        </div>
                                        <div class="form-inline form-input">
                                            <label>직책</label>
                                            <input type="text" name="">
                                            <button type="button" class="btn-org">검색</button>
                                        </div>
                                        
                                        <button type="button" class="btn-submit">조회</button>
                                    </div>
                                </form>
                            </div>
                            <div class="list-header">
                                <p class="title">‘22년, 창호사업부, GB, 인재육성인원</p>
                                <span class="bar"></span>
                                <p class="total">총 305</p>
                                <select name="limit" class="limit">
                                    <option value="10">10개</option>
                                    <option value="50">50개</option>
                                    <option value="100">100개</option>
                                </select>
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
                                                <th>필기<br/>Test</th>
                                                <th>인증</th>
                                                <th>교육<br/>이수</th>
                                                <th>필기<br/>Test</th>
                                                <th>과제<br/>수행</th>
                                                <th>과제<br/>Test</th>
                                                <th>인증</th>
                                                <th>교육<br/>이수</th>
                                                <th>Paper<br/>Test</th>
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
                                            <tr>
                                                <td>305</td>
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
                                    <button type="button" class="btn-excel">
                                        <img src="../images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>
                                    <a href="">목록</a>
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
    </div>
</body>
</html>