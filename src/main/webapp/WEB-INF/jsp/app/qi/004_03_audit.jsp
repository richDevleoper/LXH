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
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>제안명</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                            <input type="text" name="">
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>조직</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>사업장</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>제안자</label>
                                        </div>
                                        <div class="pd-l10 col s4">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                        <div class="pd-l10 col s5">
                                            <input type="text" name="">
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>실시/쪽지</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>등급</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>진행구분</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>진행단계</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s3 align-right">
                                            <label>제안일</label>
                                        </div>
                                        <div class="pd-l10 col s9">
                                            <div class="col s5 input-date">
                                                <input type="text">
                                                <i class="ico calendar"></i>
                                            </div>
                                            <span class="col s1 text-bul align-center">~</span>
                                            <div class="col s5 input-date">
                                                <input type="text">
                                                <i class="ico calendar"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="col s12 align-right">
                                        <button type="button" class="btn-submit">조회</button>
                                    </div>
                                </div>
                            </div>

                            <div class="list-header">
                                <p class="title">제안목록</p>
                                <span class="bar"></span>
                                <p class="total">총 100(실시제안 50, 쪽지제안 50)</p>
                                <select name="limit" class="limit">
                                    <option value="10">10개</option>
                                    <option value="50">50개</option>
                                    <option value="100">100개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="even">
                                        <colgroup>                                            
                                            <col style="width:60px">
                                            <col style="width:40px">
                                            <col>
                                            <col style="width:60px">
                                            <col style="width:80px">
                                            <col style="width:140px">
                                            <col style="width:60px">
                                            <col style="width:100px">
                                            <col style="width:100px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray font-weight-bold">NO</th>
                                                <th class="bg-gray font-weight-bold">구분</th>
                                                <th class="bg-gray font-weight-bold">제안명</th>
                                                <th class="bg-gray font-weight-bold">제안자</th>
                                                <th class="bg-gray font-weight-bold">제안유형</th>
                                                <th class="bg-gray font-weight-bold">조직명</th>
                                                <th class="bg-gray font-weight-bold">사업장</th>
                                                <th class="bg-gray font-weight-bold">진행단계</th>
                                                <th class="bg-gray font-weight-bold">제안일</th>
                                            </tr>                                            
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>10</td>                                                
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>생산성향상</td>
                                                <td>조직명</td>
                                                <td>청주</td>
                                                <td>심사진행중</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>9</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>생산성향상</td>
                                                <td>조직명</td>
                                                <td>청주</td>
                                                <td>심사진행중</td>
                                                <td>2023.06.30</td>                                                                                            
                                            </tr>
                                            <tr>
                                                <td>8</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>생산성향상</td>
                                                <td>조직명</td>
                                                <td>청주</td>
                                                <td>심사진행중</td>
                                                <td>2023.06.30</td>                                                                                            
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>원가개선</td>
                                                <td>조직명</td>
                                                <td>울산</td>
                                                <td>심사완료(S급)</td>
                                                <td>2023.06.30</td>                                                                                            
                                            </tr>   
                                            <tr>
                                                <td>6</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>에너지</td>
                                                <td>조직명</td>
                                                <td>청주</td>
                                                <td>심사완료(A급)</td>
                                                <td>2023.06.30</td>                                                                                            
                                            </tr>
                                            <tr>
                                                <td>5</td>                                                
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>생산성향상</td>
                                                <td>조직명</td>
                                                <td>청주</td>
                                                <td>심사완료(B급)</td>
                                                <td>2023.06.30</td>                                                
                                            
                                            </tr>     
                                            <tr>
                                                <td>4</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>생산성향상</td>
                                                <td>조직명</td>
                                                <td>울산</td>
                                                <td>심사완료(C급)</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>원가개선</td>
                                                <td>조직명</td>
                                                <td>청주</td>
                                                <td>심사완료(D급)</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>에너지</td>
                                                <td>조직명</td>
                                                <td>울산</td>
                                                <td>-</td>
                                                <td>2023.06.30</td>                                                
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>실시</td>
                                                <td>예시)23년 신제품 싸움닭 초기 유통관리를 통한 품질 안정화...</td>
                                                <td>홍길동</td>
                                                <td>기타</td>
                                                <td>조직명</td>
                                                <td>청주</td>
                                                <td>-</td>
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
                                    <button type="button" class="btn-excel">
                                        <img src="/assets/images/icon_excel.png" alt="">
                                        <span>다운로드</span>
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