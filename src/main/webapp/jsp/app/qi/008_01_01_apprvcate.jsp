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

                        <div id="page-container">
                <div class="inner">
                    
                    <section id="page-content">
                        <!-- breadcrumb -->
                        <div class="breadcrumb">
                            <ul>
                                <li>결제종류 : 과제 > 6σ Full Process > DMAIC > Define</li>
                            </ul>
							<div class="header-btns">
								<button type="button" class="btn bg-gray">승인</button>
								<button type="button" class="btn bg-gray">반려</button>        
								<a href="#" class="btn">목록</a>
							</div>
                        </div>
                        <p class="content_title">1. 과제정보/수행</p>
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
                                                <th><label for="text1">과제명</label></th>
                                                <td colspan="3">예시) 진행중인 과제명</td>
                                            </tr>
                                            <tr>
                                                <th>6σ Full Process여부</th>
                                                <td>6σ Full Process</td>
                                                <th>과제유형</th>
                                                <td>DMAIC</td>
                                            </tr>
                                            <tr>
                                                <th><label for="text4" class="color primary">부문</label></th>
                                                <td>바닥재</td>
                                                <th>제품군</th>
                                                <td>직접입력</td>
                                            </tr>
                                            <tr>
                                                <th><label for="text4" class="color primary">과제리어벨트</label></th>
                                                <td>MBB</td>
                                                <th><label for="text4" class="color primary">활동분야</label></th>
                                                <td>품질개선</td>
                                            </tr>
                                            <tr>
                                                <th>MBB활용율</th>
                                                <td>선택</td>
                                                <th>활용율 반영년도</th>
                                                <td>2023년</td>
                                            </tr>
                                            <tr>
												<th>일정계획 및 수행</th>
												<td colspan="3">
                                                    <div class="list-wrap toggle">
                                                        <!-- [D] 상태에따라 열기/닫기 텍스트 구분해주세요. -->
                                                        <span class="blind">열기/닫기</span>
                                                        <ul>
                                                            <!-- [D] 열린상태일 경우 active 클래스를 추가해주세요. -->
                                                            <!--<li class="active">-->
                                                                <li>
                                                                <div class="list-content">
                                                                    <div class="list-table list">
                                                                        <table>
                                                                            <caption>일정계획 및 수행 테이블</caption>
                                                                            <colgroup>
                                                                                <col style="width:60px">
                                                                                <col style="width:80px">
																				<col style="width:80px">
                                                                                <col>
                                                                                <col style="width:70px">
                                                                                <col style="width:70px">
																				<col style="width:70px">
                                                                                <col style="width:70px">
                                                                            </colgroup>
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>구분</th>
                                                                                    <th colspan="2">착수(예정)일</th>
                                                                                    <th colspan="5">완료(예정)일</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td>계획</td>
                                                                                    <td colspan="2">2023.01.01</td>
                                                                                    <td colspan="5" rowspan="2">
                                                                                        <div class="input-text">
																							<textarea name="" id=""></textarea>
																						</div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>실시</td>
                                                                                    <td colspan="2">2023.01.01</td>
                                                                                </tr>
																				<tr>
                                                                                    <th rowspan="2">승인자</th>
                                                                                    <th>참여형태</th>
																					<th colspan="2">소속</th>
																					<th>이름</th>
																					<th>직위</th>
																					<th>직책</th>
																					<th>Belt</th>
                                                                                </tr>
                                                                                <tr>
																					<td>지도사원</td>
																					<td colspan="2" class="align-left">자동차소재부품 사업부 > 경량화사업담당 > 자동차소재부품 투명과학플라스틱연구 PJT</td>
																					<td>홍길동</td>
																					<td>책임</td>
																					<td>팀장</td>
																					<td>BB</td>
																				</tr>
																				<tr>
                                                                                    <th colspan="2" class="pd-r10 align-right">
                                                                                        첨부파일<br>
                                                                                        (Up to 10)
                                                                                    </th>
                                                                                    <td colspan="6">
                                                                                        <div class="file-list">
                                                                                            <ul>
                                                                                                <li>
                                                                                                    <div class="row">
                                                                                                        <div class="col s12 input-text file">
                                                                                                            <span class="file-path">
                                                                                                                <input type="text" id="" readonly="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]">
                                                                                                                <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </li>
                                                                                                <li>
                                                                                                    <div class="row">
                                                                                                        <div class="col s12 input-text file">
                                                                                                            <span class="file-path">
                                                                                                                <input type="text" id="" readonly="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]">
                                                                                                                <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </li>
                                                                                                <li>
                                                                                                    <div class="row">
                                                                                                        <div class="col s12 input-text file">
                                                                                                            <span class="file-path">
                                                                                                                <input type="text" id="" readonly="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]">
                                                                                                                <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </li>
                                                                                                <li>
                                                                                                    <div class="row">
                                                                                                        <div class="col s12 input-text file">
                                                                                                            <span class="file-path">
                                                                                                                <input type="text" id="" readonly="" name="" value="LG_Hausys_UI_Design_Guide.pptx [1.27MB]">
                                                                                                                <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </li>

                                                        </ul>
                                                    </div>
                                                </td>
											</tr>
											<tr>
												<th>키워드</th>
												<td colspan="3">키워드1, 키워드2, 키워드3, 키워드4, 키워드5</td>
											</tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
						<p class="content_title">2. 팀구성 및 승인자</p>
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table class="centered">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:180px">
                                            <col style="">
											<col style="width:70px">
                                            <col style="width:70px">
											<col style="width:70px">
                                            <col style="width:70px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>참여형태</th>
												<th>소속</th>
												<th>이름</th>
												<th>직위</th>
												<th>직책</th>
												<th>Belt</th>
                                            </tr>
                                        <tbody>
                                            <tr>
                                                <th>과제리더</th>
                                                <td class="align-left">자동차소재부품 사업부 > 경량화사업담당 > 자동차소재부품 투명과학플라스틱연구 PJT</td>
												<td>홍길동</td>
                                                <td>책임</td>
												<td>팀장</td>
                                                <td>BB</td>
                                            </tr>
											<tr>
                                                <th>팀멤버</th>
                                                <td class="align-left">자동차소재부품 사업부 > 경량화사업담당 > 자동차소재부품 투명과학플라스틱연구 PJT</td>
												<td>홍길동</td>
                                                <td>선임</td>
												<td>팀장</td>
                                                <td>GB</td>
                                            </tr>
											<tr>
                                                <th>팀멤버</th>
                                                <td class="align-left">자동차소재부품 사업부 > 경량화사업담당 > 자동차소재부품 투명과학플라스틱연구 PJT</td>
												<td>홍길동</td>
                                                <td>책임</td>
												<td>팀장</td>
                                                <td>BB</td>
                                            </tr>
											<tr>
                                                <th>팀멤버</th>
                                                <td class="align-left">자동차소재부품 사업부 > 경량화사업담당 > 자동차소재부품 투명과학플라스틱연구 PJT</td>
												<td>홍길동</td>
                                                <td>책임</td>
												<td>팀장</td>
                                                <td>GB</td>
                                            </tr>
											<tr>
                                                <th>과제지도/사원</th>
                                                <td class="align-left">자동차소재부품 사업부 > 경량화사업담당 > 자동차소재부품 투명과학플라스틱연구 PJT</td>
												<td>홍길동</td>
                                                <td>책임</td>
												<td>팀장</td>
                                                <td>BB</td>
                                            </tr>
											<tr>
                                                <th>Process Owner</th>
                                                <td class="align-left">자동차소재부품 사업부 > 경량화사업담당 > 자동차소재부품 투명과학플라스틱연구 PJT</td>
												<td>홍길동</td>
                                                <td>책임</td>
												<td>팀장</td>
                                                <td>MBB</td>
                                            </tr>
											<tr>
                                                <th>챔피언</th>
                                                <td class="align-left">자동차소재부품 사업부 > 경량화사업담당 > 자동차소재부품 투명과학플라스틱연구 PJT</td>
												<td>홍길동</td>
                                                <td>책임</td>
												<td>팀장</td>
                                                <td>MBB</td>
                                            </tr>
                                        </tbody>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>                  
                        <p class="content_title">3. 성과 및 주요지표</p>
                        <div class="list-wrap">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table class="centered">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:100px">
                                            <col style="">
                                            <col style="width:100px">
                                            <col style="">
											<col style="width:100px">
                                            <col style="">
											<col style="width:100px">
                                            <col style="width:210px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th colspan="8">예상결과</th>                                           
                                            </tr>
                                        <tbody>
                                            <tr>
                                                <th class="pd-r10">성과항목</th>
                                                <td>성과항목1</td>
												<th class="pd-r10">년내(당해년)</th>
                                                <td>10억</td>
												<th class="pd-r10">년간(12개월)</th>
                                                <td>10억</td>
												<th class="pd-r10">산출 Logic</th>
                                                <td>산출로직정보</td>
                                            </tr>
                                            <tr>
                                                <th class="pd-r10">성과항목</th>
                                                <td>성과항목1</td>
												<th class="pd-r10">년내(당해년)</th>
                                                <td>10억</td>
												<th class="pd-r10">년간(12개월)</th>
                                                <td>10억</td>
												<th class="pd-r10">산출 Logic</th>
                                                <td>산출로직정보</td>
                                            </tr>
                                        </tbody>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>  
                        <div class="list-wrap mg-t10">
                            <div class="list-content">
                                <div class="list-table list">
                                    <table class="centered">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:12.5%">
											<col style="width:12.5%">
											<col style="width:12.5%">
											<col style="width:12.5%">
											<col style="width:12.5%">
											<col style="width:12.5%">
											<col style="width:12.5%">
											<col style="width:12.5%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th colspan="4">Project Y (CTQ / CTP)</th>
												<th colspan="4">KPI</th>
                                            </tr>
											<tr>
                                                <th>항목</th>
												<th>단위</th>
												<th>개선전</th>
												<th>개선목표</th>
												<th>항목</th>
												<th>단위</th>
												<th>개선전</th>
												<th>개선목표</th>
                                            </tr>
                                        <tbody>                                            
                                            <tr>
                                                <td>항목</td>
												<td>단위1</td>
												<td>10</td>
												<td>12</td>
												<td>항목</td>
												<td>단위1</td>
												<td>10</td>
												<td>12</td>
                                            </tr>
											<tr>
                                                <td>항목</td>
												<td>단위1</td>
												<td>10</td>
												<td>12</td>
												<td>항목</td>
												<td>단위1</td>
												<td>10</td>
												<td>12</td>
                                            </tr>
                                        </tbody>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>    
						<p class="content_title">4. 과제등록서</p>
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
											<col style="width:180px">
											<col style="width:80px">
											<col>
											<col>
										</colgroup>
										<thead>
											<tr>
												<th>결재상태 및 결재일</th>
												<th>결재자</th>
												<th>결재종류</th>
												<th>결재의견</th>
											</tr>
										</thead>
										<tbody>                                            
											<tr>
												<td>승인(2023.06.30)</td>
												<td>홍길동</td>
												<td class="align-left">과제 > 6σ Full Process > DMAIC > Define</td>
												<td class="align-left">수고하셧습니다.</td>
											</tr>
											<tr>
												<td>반려(2023.06.30)</td>
												<td>홍길동</td>
												<td class="align-left">과제 > 6σ Full Process > DMAIC > Measure</td>
												<td class="align-left">첨부파일 수정 필요.</td>
											</tr>
											<tr>
												<td>반려(2023.06.30)</td>
												<td>홍길동</td>
												<td class="align-left">과제 > 6σ Full Process > DMAIC > Measure</td>
												<td class="align-left">첨부파일 수정 필요.</td>
											</tr>
											<tr>
												<td>승인(2023.06.30)</td>
												<td>홍길동</td>
												<td class="align-left">과제 > 6σ Full Process > DMAIC > Measure</td>
												<td class="align-left">수고하셧습니다.</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
                    </section>
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