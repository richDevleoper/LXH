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
                                            <label>교육과정명</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <input type="text" name="">
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4 ">
                                        <div class="col s4 align-right">
                                            <label>교육연도</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <input type="text" name="">
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>인증벨트</label>
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
                                            <label>교육유형</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4 ">
                                        <div class="col s4 align-right">
                                            <label>상세유형</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>교육차시</label>
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
                                            <label>교육기간</label>
                                        </div>
                                        <div class="pd-l10 col s8">
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
                                    <div class="col s4 align-right">
                                        <button type="button" class="btn-submit">조회</button>
                                    </div>
                                </div>
                            </div>
                            <div class="list-header">
                                <p class="title">교육과정 전체 10</p>
                                <span class="bar"></span>
                                <select name="limit" class="limit">
                                    <option value="10">10개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="centered even">
                                        <colgroup>
                                            <col style="width:50px">
                                            <col style="width:50px">
                                            <col style="width:50px">
                                            <col style="width:50px">
                                            <col style="width:120px">
                                            <col style="width:80px">
                                            <col>
                                            <col style="width:100px">
                                            <col style="width:60px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="bg-gray">NO</th>
                                                <th class="bg-gray">교육연도</th>
                                                <th class="bg-gray">벨트</th>
                                                <th class="bg-gray">교육유형</th>
                                                <th class="bg-gray">상세유형</th>
                                                <th class="bg-gray">교육차수</th>
                                                <th class="bg-gray">교육과정명</th>
                                                <th class="bg-gray">교육일정</th>
                                                <th class="bg-gray">정원/신청</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>10</td>
                                                <td>2023</td>
                                                <td>GB</td>
                                                <td>교육</td>
                                                <td>온라인 동영상 교육</td>
                                                <td>1차</td>
                                                <td class="align-left">6o Process(5/24~25,2일), 고급통계6o Process(5/24~25,2일), 고급통계6o Pro....</td>
                                                <td>5/25, 5/26, 5/28</td>
                                                <td>40/40</td>
                                            </tr>
                                            <tr>
                                                <td>9</td>
                                                <td>2023</td>
                                                <td>GB</td>
                                                <td>교육</td>
                                                <td>온라인 동영상 교육</td>
                                                <td>1차</td>
                                                <td class="align-left">6o Process(5/24~25,2일), 고급통계6o Process(5/24~25,2일), 고급통계6o Pro....</td>
                                                <td>5/25, 5/26, 5/28</td>
                                                <td>40/40</td>
                                            </tr>
                                            <tr>
                                                <td>8</td>
                                                <td>2023</td>
                                                <td>GB</td>
                                                <td>교육</td>
                                                <td>온라인 동영상 교육</td>
                                                <td>1차</td>
                                                <td class="align-left">6o Process(5/24~25,2일), 고급통계6o Process(5/24~25,2일), 고급통계6o Pro....</td>
                                                <td>5/25, 5/26, 5/28</td>
                                                <td>40/40</td>
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td>2023</td>
                                                <td>GB</td>
                                                <td>교육</td>
                                                <td>온라인 동영상 교육</td>
                                                <td>1차</td>
                                                <td class="align-left">6o Process(5/24~25,2일), 고급통계6o Process(5/24~25,2일), 고급통계6o Pro....</td>
                                                <td>5/25, 5/26, 5/28</td>
                                                <td>40/40</td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>2023</td>
                                                <td>GB</td>
                                                <td>교육</td>
                                                <td>온라인 동영상 교육</td>
                                                <td>1차</td>
                                                <td class="align-left">6o Process(5/24~25,2일), 고급통계6o Process(5/24~25,2일), 고급통계6o Pro....</td>
                                                <td>5/25, 5/26, 5/28</td>
                                                <td>40/40</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>2023</td>
                                                <td>GB</td>
                                                <td>교육</td>
                                                <td>온라인 동영상 교육</td>
                                                <td>1차</td>
                                                <td class="align-left">6o Process(5/24~25,2일), 고급통계6o Process(5/24~25,2일), 고급통계6o Pro....</td>
                                                <td>5/25, 5/26, 5/28</td>
                                                <td>40/40</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>2023</td>
                                                <td>GB</td>
                                                <td>교육</td>
                                                <td>온라인 동영상 교육</td>
                                                <td>1차</td>
                                                <td class="align-left">6o Process(5/24~25,2일), 고급통계6o Process(5/24~25,2일), 고급통계6o Pro....</td>
                                                <td>5/25, 5/26, 5/28</td>
                                                <td>40/40</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>2023</td>
                                                <td>GB</td>
                                                <td>교육</td>
                                                <td>온라인 동영상 교육</td>
                                                <td>1차</td>
                                                <td class="align-left">6o Process(5/24~25,2일), 고급통계6o Process(5/24~25,2일), 고급통계6o Pro....</td>
                                                <td>5/25, 5/26, 5/28</td>
                                                <td>40/40</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>2023</td>
                                                <td>GB</td>
                                                <td>교육</td>
                                                <td>온라인 동영상 교육</td>
                                                <td>1차</td>
                                                <td class="align-left">6o Process(5/24~25,2일), 고급통계6o Process(5/24~25,2일), 고급통계6o Pro....</td>
                                                <td>5/25, 5/26, 5/28</td>
                                                <td>40/40</td>
                                            </tr>
                                            <tr>
                                                <td>10</td>
                                                <td>2023</td>
                                                <td>GB</td>
                                                <td>교육</td>
                                                <td>온라인 동영상 교육</td>
                                                <td>1차</td>
                                                <td class="align-left">6o Process(5/24~25,2일), 고급통계6o Process(5/24~25,2일), 고급통계6o Pro....</td>
                                                <td>5/25, 5/26, 5/28</td>
                                                <td>40/40</td>
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
                   
</body>
</html>