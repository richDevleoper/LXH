<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
			
    <!-- footer -->
    <footer>
        <div class="inner">
            <div class="footer-logo">
                <img src="/assets/images/footer_logo.png" alt="LX 하우시스">
                <span>품질혁신지원시스템</span>
            </div>
            <p class="copyright">COPYRIGHT © 2021 LX HAUSYS. ALL RIGHTS RESERVED.</p>
        </div>
    </footer>
    <!-- //footer -->
</div>
<iframe title="다운로드 프레임" id="downloadFrame" name="downloadFrame" width="0" height="0"></iframe>

<div class="modal-dimmed"></div>
<div class="org-modal" id="comPopup_orgSearch">
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

<div class="org-modal"  id="comPopup_posSearch">
    <div class="modal-header">
        <h4>직책조회</h4>
        <button type="button" class="btn-close">닫기</button>
    </div>
    <div class="modal-content">
        <div class="list-wrap">
            <div class="list-search">
                <form id="org-form" onsubmit="org_search();return false;">
                    <div class="search-form">
                        <div class="form-inline form-input">
                            <label>직책명</label>
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
                직책선택
            </div>
        </div>
        <div id="org-tree">
            <ul>
                <li>사업부장</li>
                <li>담당</li>
                <li>팀장</li>
                <li>책임</li>
                <li>선임</li>
                <li>사원1</li>
                <li>사원2</li>
                <li>사원3</li>
                <li>사원4</li>
                <li>사원5</li>
                <li>사원6</li>
                <li>사원7</li>
                <li>사원8</li>
                <li>사원9</li>
                <li>사원10</li>
                <li>사원11</li>
            </ul>
        </div>
        <div class="btns">
            <button type="button" class="btn-submit">확인</button>
            <button type="button" class="btn-cancel">취소</button>
        </div>
    </div>
</div>

<div class="org-modal" id="comPopup_memberSearch">
    <div class="modal-header">
        <h4>사원조회</h4>
        <button type="button" class="btn-close">닫기</button>
    </div>
    <div class="modal-content">
        <div class="list-wrap">
            <div class="list-search">
                <form id="org-form" onsubmit="org_search();return false;">
                    <div class="search-form">
                        <div class="form-inline form-input">
                            <label>사원명</label>
                            <input type="text" name="">
                        </div>
                        <button type="submit" class="btn-submit">조회</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="list-wrap">
            <div class="list-content">
                <div class="list-table list">
                    <table class="centered">
                        <caption></caption>
                        <colgroup>
                            <col style="width:50px">
                            <col style="width:60px">
                            <col>
                            <col style="width:60px">
                            <col style="width:60px">
                            <col style="width:70px">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>선택</th>
                                <th>이름</th>
                                <th>소속</th>
                                <th>직위</th>
                                <th>직책</th>
                                <th>Belt</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="radio" /></td>
                                <td>홍길동</td>
                                <td>소속소속소속소속소속소속소속</td>
                                <td>직위</td>
                                <td>직책</td>
                                <td>MBB</td>
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
                <div class="btns">
                    <button type="button" class="btn-submit">확인</button>
                    <button type="button" class="btn-cancel">취소</button>
                </div>
            </div>
        </div>
    </div>
</div>