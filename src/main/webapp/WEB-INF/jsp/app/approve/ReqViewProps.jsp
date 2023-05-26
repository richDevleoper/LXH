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
                                         
						<p class="content_title">승인/반려_결재이력</p>
						<div class="list-wrap">
							<div class="list-content">
								<div class="list-table list">
									<table class="centered">
										<caption></caption>
										<colgroup>
											<col style="width:160px">
											<col style="width:70px">
											<col style="width:70px">
											<col style="width:120px">
											<col style="width:100px">
											<col>
										</colgroup>
										<thead>
											<tr>
												<th>결재상태 및 결재일</th>
												<th>결재자</th>
												<th>직책</th>
												<th>결재종류</th>
												<th>평가점수(등급)</th>
												<th>결재의견</th>
											</tr>
										</thead>
										<tbody>  
										    <c:forEach var="item" items="${approveVO.detailHistory}">
												<tr>
												<td>
													${item.aprovalStat}
													<c:if test="${not empty item.aprovalCompltDate}">
														(<fmt:formatDate pattern="yyyy.MM.dd" value="${item.aprovalCompltDate}" />)
													</c:if>
												</td>
												<td>${item.userName}</td>
												<td>${item.comPosition}</td>
												<td class="align-left">${item.aprovalType}</td>
												<td><!-- 70점(C) --></td>
												<td class="align-left">${item.aprovalComment}</td>
											</tr>
											</c:forEach>
<!-- 											<tr>
												<td>1차 승인(2023.06.30)</td>
												<td>홍길동</td>
												<td>실장</td>
												<td>제안 > 실시제안</td>
												<td>70점(C)</td>
												<td class="align-left">수고하셧습니다. 2차 팀장님 결재 의뢰</td>
											</tr> -->
											
										</tbody>
									</table>									
								</div>
							</div>
						</div>
						<div class="line_bar mg-t20"></div>
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
                                                <td colspan="9">${proposalVO.propName}</td>
                                            </tr>
                                            <tr>
                                                <th>제안자</th>
                                                <td colspan="4">${proposalVO.propUserName}</td>
                                                <th>관련 쪽지 제안</th>
                                                <td colspan="4">${proposalVO.propRelMemoCodeName}</td>
                                            </tr>
                                            <tr>
                                                <th>조직명</th>
                                                <td colspan="4">${proposalVO.propGroupName}</td>
                                                <th>분임조</th>
                                                <td colspan="4">${proposalVO.propCircleCode}</td>
                                            </tr>
                                            <tr>
                                                <th>제안유형</th>
                                                <td colspan="4">${proposalVO.propTypeCodeName}</td>
                                                <th>제안일</th>
                                                <td colspan="4">${proposalVO.propDate}</td>
                                            </tr>
                                            <tr>
                                                <th>실행 완료일</th>
                                                <td colspan="4">${proposalVO.propPracticeCompDate}</td>
                                                <th>년간 효과 금액</th>
                                                <td colspan="4">${proposalVO.propYearEffect}</td>
                                            </tr>
											<tr><th colspan="10" class="align-center">제안내용</th></tr>
                                            <tr>
                                                <th><label for="text6">현상 및 문제점</label></th>
                                                <td colspan="9">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text6" rows="4">${proposalVO.propProblem}</textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
											<tr>
                                                <th><label for="text7">개선내용</label></th>
                                                <td colspan="9">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text6" rows="4">${proposalVO.propImprovementCont}</textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
											<tr>
                                                <th><label for="text8">기해효과</label></th>
                                                <td colspan="9">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text6" rows="4">${proposalVO.propBenefit}</textarea>
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
																				<div class="file-link">
																					<ul>
										<c:forEach var="item_sub" items="${proposalVO.beforeAttachFileList}" varStatus="status">
																																			<li><a href="/attachfile/downloadFile.do?fileId=${item_sub.fileId}&fileSeq=${item_sub.fileSeq}" title="다운받기">${item_sub.fileNm}</a><a href="/attachfile/downloadFile.do?fileId=${item_sub.fileId}&fileSeq=${item_sub.fileSeq}" title="다운받기" class="btn color gray mg-l15">다운받기</a></li>
										</c:forEach>  															
																					</ul>
																				</div>                                                                                
                                                                                
                                                                                <!-- <div class="themb-box">
                                                                                    <figure>
                                                                                        <img src="../assets/images/@sample.jpg" alt="" class="btn-org">
                                                                                    </figure>
                                                                                    <button type="button" class="themb_del"><i class="ico file_del"><em>파일삭제</em></i></button>
                                                                                </div> -->
                                                                            </td>
                                                                            <td>
																				<div class="file-link">
																					<ul>
										<c:forEach var="item_sub" items="${proposalVO.afterAttachFileList}" varStatus="status">
																																			<li><a href="/attachfile/downloadFile.do?fileId=${item_sub.fileId}&fileSeq=${item_sub.fileSeq}" title="다운받기">${item_sub.fileNm}</a><a href="/attachfile/downloadFile.do?fileId=${item_sub.fileId}&fileSeq=${item_sub.fileSeq}" title="다운받기" class="btn color gray mg-l15">다운받기</a></li>
										</c:forEach>  															
																					</ul>
																				</div>
                                                                                <!-- <div class="themb-box">
                                                                                    <figure>
                                                                                        <img src="../assets/images/@sample.jpg" alt="" class="btn-org">
                                                                                    </figure>
                                                                                    <button type="button" class="themb_del"><i class="ico file_del"><em>파일삭제</em></i></button>
                                                                                </div> -->
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="themb-box">
                                                                                    <!-- <figure>
                                                                                        <img src="../assets/images/@sample.jpg" alt="" class="btn-org">
                                                                                    </figure>
                                                                                    <button type="button" class="themb_del"><i class="ico file_del"><em>파일삭제</em></i></button> -->
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="themb-box">
                                                                                    <!-- <figure>
                                                                                        <img src="../assets/images/@sample.jpg" alt="" class="btn-org">
                                                                                    </figure>
                                                                                    <button type="button" class="themb_del"><i class="ico file_del"><em>파일삭제</em></i></button> -->
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
												<td colspan="5">${proposalVO.propApprovalGroup}</td>
												<td class="align-center">${proposalVO.propApproverName}</td>
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
<c:forEach var="item" items="${proposalVO.attachFileList}" varStatus="status">														
															<li><a href="/attachfile/downloadFile.do?fileId=${item.fileId}&fileSeq=${item.fileSeq}" title="다운받기">${item.fileNm}</a><a href="/attachfile/downloadFile.do?fileId=${item.fileId}&fileSeq=${item.fileSeq}" title="다운받기" class="btn color gray mg-l15">다운받기</a></li>
</c:forEach>
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
                                <a href="/sub.do?menuKey=${menuKey}" class="btn">목록</a>
                            </div>
                        </div>

</body>
</html>