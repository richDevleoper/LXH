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
   

                        <div class="tab-group">
                            <div class="tab-btn">
                                <!-- [D] 현재 활성화된 메뉴에 on클래스 추가해주세요. -->
                                <button type="button" class="on">6σ 인재 관리 대상</button>
                                <button type="button">팀장MBB 관리 대상</button>
                            </div>
                            <div class="tab-inr">
                                <div class="tab-box on">
                                    <div class="tab-group underline-type">
                                        <div class="list-wrap">
                                        <div class="list-search">
                                        <form>
                                            <div class="search-form">
                                                <div class="form-inline form-input">
                                                    <label>연도</label>
                                                    <select name="">
                                                        <option value="">2023년</option>
                                                    </select>
                                                </div>
                                                <div class="form-inline form-select">
                                                    <label>조직</label>                                            
                                                    <input type="text" name="">
                                                    <button type="button" class="btn-org">검색</button>
                                                </div>
                                                <div class="form-inline form-select">
                                                    <label>인증현황</label>
                                                    <select name="">
                                                        <option value="">전체</option>
                                                    </select>
                                                </div>
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
                                                <button type="button" class="btn-submit">조회</button>
                                            </div>
                                        </form>
                                        </div>

                                        <div class="list-header">
                                        <p class="title">2023년 6σ 인재 관리 대상</p>
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
                                                <table class="even">
                                                    <caption></caption>
                                                    <colgroup>
                                                        <col style="width:40px">
                                                        <col style="width:70px">
                                                        <col style="width:70px">                                                        
                                                        <col style="width:70px">
                                                        <col>
                                                        <col>
                                                        <col>
                                                        <col>
                                                        <col style="width:50px">
                                                        <col style="width:50px">
                                                        <col style="width:50px">
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th class="bg-gray font-weight-bold">NO</th>
                                                            <th class="bg-gray font-weight-bold">사번</th>
                                                            <th class="bg-gray font-weight-bold">이름</th>
                                                            <th class="bg-gray font-weight-bold">근무지명</th>
                                                            <th class="bg-gray font-weight-bold">부문</th>
                                                            <th class="bg-gray font-weight-bold">소속명</th>
                                                            <th class="bg-gray font-weight-bold">팀명</th>
                                                            <th class="bg-gray font-weight-bold">직무명</th>
                                                            <th class="bg-gray font-weight-bold">직위</th>
                                                            <th class="bg-gray font-weight-bold">직책</th>
                                                            <th class="bg-gray font-weight-bold">인증현황</th>
                                                        </tr>                                            
                                                    </thead>
                                                    <tbody>
                                                        <tr>                                                            
                                                            <td>305</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="#" title="바로가기" class="btn-org">FB0000</a></li>                                                                
                                                                    </ul>
                                                                </div>                                                                   
                                                            <td>홍길동</td>
                                                            <td>청주공장</td>
                                                            <td>자동차소재부품</td>
                                                            <td>창호생산담당</td>
                                                            <td>창호프로파일생산팀</td>
                                                            <td>창호프로파일생산팀</td>
                                                            <td>책임</td>
                                                            <td>팀장</td>
                                                            <td>MBB</td>
                                                        </tr>
                                                        <tr>
                                                            <td>304</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="#" class="btn-org" title="바로가기">FB0000</a></li>
                                                                    </ul>
                                                                </div>                                                            
                                                            </td>
                                                            <td>홍길동</td>
                                                            <td>울산공장</td>
                                                            <td>인테리어</td>
                                                            <td>유리생산담당</td>
                                                            <td>창호기술팀</td>
                                                            <td>창호기술팀</td>
                                                            <td>책임</td>
                                                            <td>팀장</td>
                                                            <td>BB</td>
                                                        </tr>
                                                        <tr>
                                                            <td>303</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="#" title="바로가기">FB0000</a></li>
                                                                    </ul>
                                                                </div>                                                            
                                                            </td>
                                                            <td>홍길동</td>
                                                            <td>청주공장</td>
                                                            <td>자동차소재부품</td>
                                                            <td>창호생산담당</td>
                                                            <td>창호프로파일생산팀</td>
                                                            <td>창호프로파일생산팀</td>
                                                            <td>책임</td>
                                                            <td>팀장</td>
                                                            <td>MBB</td>
                                                        </tr>
                                                        <tr>
                                                            <td>302</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="#" title="바로가기">FB0000</a></li>
                                                                    </ul>
                                                                </div>                                                            
                                                            </td>
                                                            <td>홍길동</td>
                                                            <td>울산공장</td>
                                                            <td>인테리어</td>
                                                            <td>유리생산담당</td>
                                                            <td>창호기술팀</td>
                                                            <td>창호기술팀</td>
                                                            <td>책임</td>
                                                            <td>팀장</td>
                                                            <td>BB</td>
                                                        </tr>
                                                        <tr>
                                                            <td>301</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="#" title="바로가기">FB0000</a></li>
                                                                    </ul>
                                                                </div>                                                            
                                                            </td>
                                                            <td>홍길동</td>
                                                            <td>청주공장</td>
                                                            <td>자동차소재부품</td>
                                                            <td>창호생산담당</td>
                                                            <td>창호프로파일생산팀</td>
                                                            <td>창호프로파일생산팀</td>
                                                            <td>책임</td>
                                                            <td>팀장</td>
                                                            <td>MBB</td>
                                                        </tr>
                                                        <tr>
                                                            <td>300</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="#" title="바로가기">FB0000</a></li>
                                                                    </ul>
                                                                </div>                                                            
                                                            </td>
                                                            <td>홍길동</td>
                                                            <td>울산공장</td>
                                                            <td>인테리어</td>
                                                            <td>유리생산담당</td>
                                                            <td>창호기술팀</td>
                                                            <td>창호기술팀</td>
                                                            <td>책임</td>
                                                            <td>팀장</td>
                                                            <td>BB</td>
                                                        </tr>
                                                        <tr>
                                                            <td>299</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="#" title="바로가기">FB0000</a></li>
                                                                    </ul>
                                                                </div>                                                            
                                                            </td>
                                                            <td>홍길동</td>
                                                            <td>청주공장</td>
                                                            <td>자동차소재부품</td>
                                                            <td>창호생산담당</td>
                                                            <td>창호프로파일생산팀</td>
                                                            <td>창호프로파일생산팀</td>
                                                            <td>책임</td>
                                                            <td>팀장</td>
                                                            <td>MBB</td>
                                                        </tr>
                                                        <tr>
                                                            <td>298</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="#" title="바로가기">FB0000</a></li>
                                                                    </ul>
                                                                </div>                                                            
                                                            </td>
                                                            <td>홍길동</td>
                                                            <td>울산공장</td>
                                                            <td>인테리어</td>
                                                            <td>유리생산담당</td>
                                                            <td>창호기술팀</td>
                                                            <td>창호기술팀</td>
                                                            <td>책임</td>
                                                            <td>팀장</td>
                                                            <td>BB</td>
                                                        </tr>
                                                        <tr>
                                                            <td>297</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="#" title="바로가기">FB0000</a></li>
                                                                    </ul>
                                                                </div>                                                            
                                                            </td>
                                                            <td>홍길동</td>
                                                            <td>청주공장</td>
                                                            <td>자동차소재부품</td>
                                                            <td>창호생산담당</td>
                                                            <td>창호프로파일생산팀</td>
                                                            <td>창호프로파일생산팀</td>
                                                            <td>책임</td>
                                                            <td>팀장</td>
                                                            <td>MBB</td>
                                                        </tr>
                                                        <tr>
                                                            <td>296</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="#" title="바로가기">FB0000</a></li>
                                                                    </ul>
                                                                </div>                                                            
                                                            </td>
                                                            <td>홍길동</td>
                                                            <td>울산공장</td>
                                                            <td>인테리어</td>
                                                            <td>유리생산담당</td>
                                                            <td>창호기술팀</td>
                                                            <td>창호기술팀</td>
                                                            <td>책임</td>
                                                            <td>팀장</td>
                                                            <td>BB</td>
                                                        </tr>
                                                        <tr>
                                                            <td>295</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="#" title="바로가기">FB0000</a></li>
                                                                    </ul>
                                                                </div>                                                            
                                                            </td>
                                                            <td>홍길동</td>
                                                            <td>청주공장</td>
                                                            <td>자동차소재부품</td>
                                                            <td>창호생산담당</td>
                                                            <td>창호프로파일생산팀</td>
                                                            <td>창호프로파일생산팀</td>
                                                            <td>책임</td>
                                                            <td>팀장</td>
                                                            <td>MBB</td>
                                                        </tr>
                                                        <tr>
                                                            <td>294</td>
                                                            <td>
                                                                <div class="link-group center">
                                                                    <ul>
                                                                        <li><a href="#" title="바로가기">FB0000</a></li>
                                                                    </ul>
                                                                </div>                                                            
                                                            </td>
                                                            <td>홍길동</td>
                                                            <td>울산공장</td>
                                                            <td>인테리어</td>
                                                            <td>유리생산담당</td>
                                                            <td>창호기술팀</td>
                                                            <td>창호기술팀</td>
                                                            <td>책임</td>
                                                            <td>팀장</td>
                                                            <td>BB</td>
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
                                                <button type="button" class="btn bg-gray">                                        
                                                    <span>과제등록</span>
                                                </button>     
                                                <button type="button" class="btn-excel">
                                                    <img src="/assets/images/icon_excel.png" alt="">
                                                    <span>다운로드</span>
                                                </button>                               
                                            </div>

                                        </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-box on"></div>
                                <div class="tab-box on"></div>
                            </div>
                        </div>
                    
        <!-- 상세정보 팝업 -->
        <div class="modal-dimmed"></div>
        <div class="org-modal">
            <div class="modal-header">
                <h4>상세정보</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="list-wrap">
                    <div class="list-content">
                        <div class="list-table list">
                            <table class="centered">
                                
                                <caption></caption>
                                <colgroup>
                                    <col style="width:100px">
                                    <col>
                                    <col style="width:100px">
                                    <col>                                    
                                </colgroup>
                                
                                <tbody>
                                    <tr>
                                        <th>사번</th>
                                        <td>사번1</td>
                                        <th>이름</th>
                                        <td>이름1</td>                                        
                                    </tr>
                                
                                    <tr>
                                        <th>근무지명</th>
                                        <td>근무지명1</td>
                                        <th>부문</th>
                                        <td>부문1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>소속명</th>
                                        <td>소속명1</td>
                                        <th>팀명</th>
                                        <td>팀명1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>직위</th>
                                        <td>직위1</td>
                                        <th>직책</th>
                                        <td>직책1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>신분유형</th>
                                        <td>신분유형1</td>
                                        <th>입사일</th>
                                        <td>입사일1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>직무명</th>
                                        <td>직무명1</td>
                                        <th>최종학력</th>
                                        <td>최종학력1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>인증형황</th>
                                        <td colspan="3">GB(2020.02.10) MGB(비대상), BB(2021.02.10)</td>                                        
                                    </tr>                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>                
            </div>
        </div> 
    </div>
</body>
</html>