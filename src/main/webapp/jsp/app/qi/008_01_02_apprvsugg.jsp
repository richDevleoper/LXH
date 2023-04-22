<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string-taglib.tld"%>

<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<title>${fn:split(boardVO.boardNm,'>')[fn:length(fn:split(boardVO.boardNm,'>'))-1]}</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>



                        <!-- breadcrumb -->
                        <div class="breadcrumb">
                            <ul>
                                <li>실시 제안정보</li>
                            </ul>
							<div class="header-btns">
								<button type="button" class="btn bg-gray">승인</button>
								<button type="button" class="btn bg-gray">반려</button>        
								<a href="#" class="btn">목록</a>
							</div>
                        </div>
                        <p class="content_title">1. 실시 제안정보</p>
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:180px">
                                            <col>
											<col>
											<col>
											<col>
                                            <col style="width:180px">
                                            <col>
											<col>
											<col>
											<col>
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th><label for="text1">제안명</label></th>
                                                <td colspan="9">제안내용</td>
                                            </tr>
                                            <tr>
                                                <th>제안자</th>
                                                <td colspan="4">제안자</td>
                                                <th>관련 쪽지 제안</th>
                                                <td colspan="4">관련 쪽지</td>
                                            </tr>
                                            <tr>
                                                <th>조직명</th>
                                                <td colspan="4">조직명</td>
                                                <th>분임조</th>
                                                <td colspan="4">분임조</td>
                                            </tr>
                                            <tr>
                                                <th>제안유형</th>
                                                <td colspan="4">제안유형</td>
                                                <th>제안일</th>
                                                <td colspan="4">2023.06.30</td>
                                            </tr>
                                            <tr>
                                                <th>실행 완료일</th>
                                                <td colspan="4">2023.06.30</td>
                                                <th>년간 효과 금액</th>
                                                <td colspan="4">년간 20억</td>
                                            </tr>
											<tr><th colspan="10" class="align-center">제안내용</th></tr>
                                            <tr>
                                                <th><label for="text6">현상 및 문제점</label></th>
                                                <td colspan="9">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text6" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
											<tr>
                                                <th><label for="text7">개선내용</label></th>
                                                <td colspan="9">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text7" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
											<tr>
                                                <th><label for="text8">기해효과</label></th>
                                                <td colspan="9">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text8" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
											<tr>
                                                <th>활동결과</th>
                                                <td colspan="9" class="pd0">
                                                    <div class="list-wrap" style="margin:-1px">
                                                        <div class="list-content">
                                                            <div class="list-table list">
                                                                <table class="centered">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col style="width:50%">
                                                                        <col>
                                                                    </colgroup>
                                                                    <thead>
                                                                        <tr>
                                                                            <th>개선 전</th>
                                                                            <th>개선 후</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="themb-box">
                                                                                    <figure>
                                                                                        <img src="../assets/images/@sample.jpg" alt="" class="btn-org">
                                                                                    </figure>
                                                                                    <button type="button" class="themb_del"><i class="ico file_del"><em>파일삭제</em></i></button>
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="themb-box">
                                                                                    <figure>
                                                                                        <img src="../assets/images/@sample.jpg" alt="" class="btn-org">
                                                                                    </figure>
                                                                                    <button type="button" class="themb_del"><i class="ico file_del"><em>파일삭제</em></i></button>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="themb-box">
                                                                                    <figure>
                                                                                        <img src="../assets/images/@sample.jpg" alt="" class="btn-org">
                                                                                    </figure>
                                                                                    <button type="button" class="themb_del"><i class="ico file_del"><em>파일삭제</em></i></button>
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="themb-box">
                                                                                    <figure>
                                                                                        <img src="../assets/images/@sample.jpg" alt="" class="btn-org">
                                                                                    </figure>
                                                                                    <button type="button" class="themb_del"><i class="ico file_del"><em>파일삭제</em></i></button>
                                                                                </div>
                                                                            </td>
                                                                        </tr>                                                                       
                                                                        
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
											<tr>
												<th rowspan="2">결재자</th>
												<th colspan="5" class="align-center">소속</th>
												<th class="align-center">이름</th>
												<th class="align-center">직위</th>
												<th class="align-center">직책</th>
												<th class="align-center">Belt</th>
											</tr>
											<tr>
												<td colspan="5">소속정보</td>
												<td class="align-center">홍길동</td>
												<td class="align-center">책임</td>
												<td class="align-center">팀장</td>
												<td class="align-center">MBB</td>
											</tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
						<p class="content_title">2. 첨부파일</p>
						<div class="list-wrap">
							<div class="list-content">
								<div class="list-table list">
									<table class="centered">
										<caption></caption>
										<colgroup>
											<col style="width:180px">
											<col>
										</colgroup>
										<tbody>                                            
											<tr>
												<th>첨부파일 (조회)</th>
												<td>
													<div class="file-link">
														<ul>
															<li><a href="#" title="다운받기">UI표준정의서.pptx</a><a href="#" title="다운받기" class="btn color gray mg-l15">다운받기</a></li>
														</ul>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>						
                        <div class="list-footer">
                            <div class="list-btns">
								<button type="button" class="btn bg-gray">승인</button>
                                <button type="button" class="btn bg-gray">반려</button>        
                                <a href="#" class="btn">목록</a>
                            </div>
                        </div>
						<div class="line_bar mg-t20"></div>
						<p class="content_title">승인/반려_결재이력</p>
						<div class="list-wrap">
							<div class="list-content">
								<div class="list-table list">
									<table class="centered">
										<caption></caption>
										<colgroup>
											<col>
											<col style="width:80px">
											<col style="width:80px">
											<col>
											<col>
											<col style="width:calc(45% / 5)">
											<col style="width:calc(45% / 5)">
											<col style="width:calc(45% / 5)">
											<col style="width:calc(45% / 5)">
											<col style="width:calc(45% / 5)">
										</colgroup>
										<thead>
											<tr>
												<th>결재상태 및 결재일</th>
												<th>결재자</th>
												<th>직책</th>
												<th>결재종류</th>
												<th>평가점수(등급)</th>
												<th colspan="5">결재의견</th>
											</tr>
										</thead>
										<tbody>                                            
											<tr>
												<td>승인(2023.06.30)</td>
												<td>홍길동</td>
												<td>실장</td>
												<td>제안 > 실시제안</td>
												<td>70점(C)</td>
												<td colspan="5"><div class="comment-btn"><div>수고하셧습니다.</div><button type="button" class="btn bg-gray">결재의뢰</button></div></td>
												
											</tr>
											<tr>
												<th rowspan="2"><span class="asterisk">*</span>결재자 지정</th>
												<th colspan="5" class="align-center">소속</th>
												<th class="align-center">이름</th>
												<th class="align-center">직위</th>
												<th class="align-center">직책</th>
												<th class="align-center">Belt</th>
											</tr>
											<tr>
												<td colspan="5" class="pd3">
                                                    <div class="row">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" id="text3" name="" value="">
                                                            <button type="button">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
												<td>홍길동</td>
												<td>책임</td>
												<td>팀장</td>
												<td>MBB</td>
											</tr>
										</tbody>
									</table>									
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