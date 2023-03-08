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

	<div class="tab-group">
		<div class="tab-btn">
			<!-- [D] 현재 활성화된 메뉴에 on클래스 추가해주세요. -->
			<button type="button">GB</button>
			<button type="button">MGB</button>
			<button type="button">BB</button>
			<button type="button" class="on">MBB</button>
		</div>
		<div class="tab-inr">
			<!-- [D] 현재 활성화된 내용에 on클래스 추가해주세요. -->
			<div class="tab-box"></div>
			<div class="tab-box"></div>
			<div class="tab-box"></div>
			<div class="tab-box on">
				<div class="list-table list mg-t20">
					<table class="centered">
						<caption></caption>
						<colgroup>
							<col>
							<col style="width: 100px">
							<col style="width: 250px">
							<col style="width: 100px">
							<col style="width: 100px">
							<col style="width: 100px">
						</colgroup>
						<thead>
							<tr>
								<th>과정명</th>
								<th>차수명</th>
								<th>기간</th>
								<th>이수여부</th>
								<th>신청(취소)일</th>
								<th>내역</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="link-group center">
										<ul>
											<li><a href="#" title="바로가기">MBB
													교육과정명(ooooooooooooooooo)</a></li>
										</ul>
									</div>
								</td>
								<td>22년 1차</td>
								<td>2023년 1월 20일 ~ 2023년 2월 10일</td>
								<td>미이수</td>
								<td>2023.06.30</td>
								<td>수강신청완료</td>
							</tr>
							<tr>
								<td>
									<div class="link-group center">
										<ul>
											<li><a href="#" title="바로가기">MBB
													교육과정명(ooooooooooooooooo)</a></li>
										</ul>
									</div>
								</td>
								<td>22년 1차</td>
								<td>2023년 1월 20일 ~ 2023년 2월 10일</td>
								<td>미이수</td>
								<td>2023.06.30</td>
								<td>신청취소</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="tab-group">
		<div class="tab-btn">
			<!-- [D] 현재 활성화된 메뉴에 on클래스 추가해주세요. -->
			<button type="button" class="on">1차 교육 (1/20~26)</button>
			<span>정원 : <b>40</b>명, 신청 : <b>20</b>명
			</span>
		</div>
		<div class="tab-inr">
			<!-- [D] 현재 활성화된 내용에 on클래스 추가해주세요. -->
			<div class="tab-box on">
				<div class="list-wrap mg-t20">
					<div class="list-content">
						<div class="list-table list">
							<table>
								<caption></caption>
								<colgroup>
									<col style="width: 110px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>교육과정명</th>
										<td>
											<div class="link-group">
												<ul>
													<li><a href="#" title="바로가기">MBB
															교육과정명(ooooooooooooooooo)</a></li>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<th>교육방식</th>
										<td>M메신저를 활용한 온라인 실시간 교육 자택 또는 회의실에서 접속,'유첨1. Virtual
											Live 교육 참가 매뉴얼'참조</td>
									</tr>
									<tr>
										<th>대상자</th>
										<td>2차 교육희망자 및 1차때 교육이수했으나 통계Test 미합격자가 대상이며, + 5월 BB과제
											Test 응시자 포함</td>
									</tr>
									<tr>
										<th>이수기준</th>
										<td>출석율 80% 이상 (출석체크는 매일 오전/오후 2회 실시)</td>
									</tr>
									<tr>
										<th>준비사항</th>
										<td>MBB교재+BB동영상 교육자료는 T-Cloud에 있습니다 ('유첨0_Six Sigma 교육 자료
											접속 방법' 참조)</td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td>유첨0_Six Sigma 교육 자료 접속 방법' , '유첨1. Virtual Live 교육 참가
											매뉴얼' 참조</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="btn-group">
			<button type="button" class="btn bg-gray">재신청</button>
			<button type="button" class="btn bg-white">취소</button>
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
								<label>조직명</label> <input type="text" name="">
							</div>
							<button type="submit" class="btn-submit">조회</button>
						</div>
					</form>
				</div>
			</div>
			<div class="tree-header">
				<div>
					<input type="checkbox" id="orgSelAll"> <label
						for="orgSelAll"></label>
				</div>
				<div>6σ 인재육성대상 조직명</div>
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
							<li>바닥재 사업담당</li>
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