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
                            <div class="list-content">
                                <div class="list-table list even">
                                    <table class="centered">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:50px">
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray">Belt</th>
                                                <th class="bg-gray" colspan="3">GB</th>
                                                <th class="bg-gray" colspan="5">MGB</th>
                                                <th class="bg-gray" colspan="5">BB</th>
                                                <th class="bg-gray" colspan="6">MBB</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>항목</td>
                                                <td>교육이수</td>
                                                <td>필기test</td>
                                                <td>인증</td>
                                                <td>교육이수</td>
                                                <td>필기test</td>
                                                <td>과제수행</td>
                                                <td>과제Test</td>
                                                <td>인증</td>
                                                <td>교육이수</td>
                                                <td>PaperTest</td>
                                                <td>과제수행</td>
                                                <td>과제Test</td>
                                                <td>인증</td>
                                                <td>교육이수</td>
                                                <td>통계Test</td>
                                                <td>과제수행</td>
                                                <td>과제Test</td>
                                                <td>자질평가</td>
                                                <td>인증</td>
                                            </tr>
                                            <tr>
                                                <td>현황</td>
                                                <td>이수완료</td>
                                                <td>합격</td>
                                                <td>인증완료</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>이수완료</td>
                                                <td>합격</td>
                                                <td>수행완료</td>
                                                <td>합격</td>
                                                <td>완료</td>
                                                <td>신청완료</td>
                                                <td>미신청</td>
                                                <td>2건필요</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>처리일</td>
                                                <td>20.01.101</td>
                                                <td>20.02.30</td>
                                                <td>20.01.01</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>비대상</td>
                                                <td>20.01.01</td>
                                                <td>20.02.30</td>
                                                <td>20.01.01</td>
                                                <td>20.02.30</td>
                                                <td>20.02.30</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                        <div class="tab-group">
                            <div class="tab-btn">
                                <!-- [D] 현재 활성화된 메뉴에 on클래스 추가해주세요. -->
                                <button type="button">GB</button>
                                <button type="button">MGB</button>
                                <button type="button">BB</button>
                                <button type="button">MBB</button>
                            </div>
                            <div class="tab-inr">
                                <div class="tab-box"></div>
                                <div class="tab-box"></div>
                                <div class="tab-box"></div>
                                <div class="tab-box on">
                                    <div class="list-header mg-t20">
                                        <p class="title">1.교육</p>
                                    </div>
                                    <div class="list-table list">
                                        <table class="centered">
                                            <caption></caption>
                                            <colgroup>
                                                <col>
                                                <col style="width:106px">
                                                <col style="width:230px">
                                                <col>
                                                <col style="width:160px">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>과정명</th>
                                                    <th>차수명</th>
                                                    <th>기간</th>
                                                    <th>이수여부</th>
                                                    <th>수강신청</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>MBB 교육과정명(ooooooooooooooooo)</td>
                                                    <td>22년 1차</td>
                                                    <td>2023년 1월 20일 ~ 2023년 2월 10일</td>
                                                    <td>미이수</td>
                                                    <td>신청완료</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="list-header">
                                        <p class="title">2. 과제활동 현황</p>
                                    </div>
                                    <div class="list-table list">
                                        <table class="centered">
                                            <caption></caption>
                                            <colgroup>
                                                <col>
                                                <col style="width:106px">
                                                <col style="width:230px">
                                                <col>
                                                <col>
                                                <col style="width:160px">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>과정명</th>
                                                    <th>과제유형</th>
                                                    <th>과제 수행기간</th>
                                                    <th>참여방식</th>
                                                    <th>진행상황</th>
                                                    <th>과제Test 응시자격</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>나의 과제의 과제명</td>
                                                    <td>생산성</td>
                                                    <td>2023년 1월 20일 ~ 2023년 2월 10일</td>
                                                    <td>팀 멤버</td>
                                                    <td>완료</td>
                                                    <td>총 2건 중 1건(미확보)</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="list-header">
                                        <p class="title">3. Test 응시 현황</p>
                                    </div>
                                    <div class="list-table list">
                                        <table class="centered">
                                            <caption></caption>
                                            <colgroup>
                                                <col>
                                                <col style="width:106px">
                                                <col style="width:230px">
                                                <col>
                                                <col style="width:160px">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>Test명</th>
                                                    <th>차수명</th>
                                                    <th>기간</th>
                                                    <th>합격여부</th>
                                                    <th>Test신청</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Test명(OOOOOOOOOOOOOOOOO)</td>
                                                    <td>00차</td>
                                                    <td>2023년 1월 20일 ~ 2023년 2월 10일</td>
                                                    <td>미응시</td>
                                                    <td>신청완료</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
               
<script type="text/javascript">
	$(document).ready(function(){
		init();   
	});
	
	function init(){
		$('.tab-btn > button').eq(0).addClass('on');
	}

</script>

</body>
</html>