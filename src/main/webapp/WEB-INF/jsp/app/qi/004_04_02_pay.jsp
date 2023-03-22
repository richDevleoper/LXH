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
                                        <div class="col s4 align-right">
                                            <label>제안명</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <input type="text" name="">
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4 ">
                                        <div class="col s4 align-right">
                                            <label>조직</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <input type="text" name="">
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>사업장</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>제안자/심사자</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                        <div class="col s037 input-text search">
                                            <input type="text" id="text3" name="" value="">
                                            <button type="button">검색</button>
                                        </div>
                                        
                                    </div>
                                    <div class="form-inline form-input col s4 ">
                                        <div class="col s4 align-right">
                                            <label>분임조</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>지급여부</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s8">
                                        <div class="col s2 align-right">
                                            <label>제안유형</label>
                                        </div>

                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>

                                        <div class="col s2 align-right">
                                            <label>제안일</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <div class="col s5 input-date">
                                                <input type="text" class="datepicker">
                                                <i class="ico calendar"></i>
                                            </div>
                                            <span class="col s1 text-bul align-center">~</span>
                                            <div class="col s5 input-date">
                                                <input type="text" class="datepicker">
                                                <i class="ico calendar"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col s4 align-right">
                                        <button type="button" class="btn-submit">조회</button>
                                    </div>
                                </div>
                            </div>

                            <div class="list-header">
                                <p class="title">심사 완료 제안목록</p>
                                <span class="bar"></span>
                                <p class="total">총 100</p>
                                <select name="limit" class="limit">
                                    <option value="10">10개</option>
                                    <option value="50">50개</option>
                                    <option value="100">100개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="even">
                                        <thead>
                                            <colgroup>
                                                <col style="width:30px">
                                                <col>
                                                <col style="width:70px">
                                                <col style="width:80px">
                                                <col style="width:100px">
                                                <col style="width:100px">
                                                <col style="width:80px">
                                                <col style="width:50px">
                                                <col style="width:100px">
                                                <col style="width:80px">
                                                <col style="width:80px">
                                            </colgroup>

                                            <tr>
                                                <th class="bg-gray font-weight-bold"><input type="checkbox" name="" id="SelAll" value=""><label for="SelAll"></label></th>
                                                <th class="bg-gray font-weight-bold">제안명</th>
                                                <th class="bg-gray font-weight-bold">제안자</th>
                                                <th class="bg-gray font-weight-bold">분임조</th>
                                                <th class="bg-gray font-weight-bold">제안유형</th>
                                                <th class="bg-gray font-weight-bold">조직명</th>
                                                <th class="bg-gray font-weight-bold">심사자</th>
                                                <th class="bg-gray font-weight-bold">등급</th>
                                                <th class="bg-gray font-weight-bold">제안일</th>
                                                <th class="bg-gray font-weight-bold">지급금액</th>
                                                <th class="bg-gray font-weight-bold">지급여부</th>
                                            </tr>                                            
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><input type="checkbox" name="" id="10" value=""><label for="10"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>분임조</td>
                                                <td>생산성향상</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                        <div class="row">
                                                            <div class="col s12 input-text">
                                                                <input type="text" id="text15" name="" value="" title="항목 입력">
                                                            </div>
                                                        </div>
                                                    
                                                </td>
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="9" value=""><label for="9"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>원가개선</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                
                                                <div class="pd-l10 col s12">
                                                    <select name="" id="">
                                                        <option value="">전체</option>
                                                    </select>
                                                </div>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="8" value=""><label for="8"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>에너지</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="7" value=""><label for="7"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>기타</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><input type="checkbox" name="" id="6" value=""><label for="6"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>분임조</td>
                                                <td>생산성향상</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="5" value=""><label for="5"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>원가개선</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="4" value=""><label for="4"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>에너지</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="3" value=""><label for="3"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>기타</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><input type="checkbox" name="" id="2" value=""><label for="2"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>에너지</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="1" value=""><label for="1"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>기타</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
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
                                        <span>마감</span>
                                    </button>
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