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
                                                <td colspan="3">분임조명1 </td>
                                            </tr>
                                            <tr>
                                                <th>등록번호</th>
                                                <td>1231112</td>
                                                <th>조직명</th>
                                                <td>조직명1</td>
                                            </tr>
                                            <tr>
                                                <th>지도사원</th>
                                                <td>홍길동1</td>
                                                <th>사무국</th>
                                                <td>사무국1</td>
                                            </tr>
                                            <tr>
                                                <th>팀장</th>
                                                <td colspan="3">홍길동2</td>                                                
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
                                                                        <tr>
                                                                            <td>분임조장</td>
                                                                            <td class="align-left">소속정보</td>
                                                                            <td>홍길동</td>
                                                                            <td>책임</td>
                                                                            <td>팀장</td>
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
                                                        <div class="col s8">상세내용<br><br><br><br><br><br><br><br><br><br><br></div>                                                        
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="list-footer">
                                    <div class="list-btns">
                                        <button type="button" class="btn light-gray">수정</button>                                        
                                        <a href="#" class="btn">목록</a>
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