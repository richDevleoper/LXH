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

                        <!-- breadcrumb -->
                        <div class="breadcrumb">
                            <ul>
                                <li>실시 제안정보</li>
                            </ul>
                        </div>
                        <p class="content_title">1. 실시 제안 정보</p>
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
                                                <th><label for="text1"><span class="asterisk">*</span>제안명</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text1" name="" value="" title="제안명을 입력해주세요.">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text2"><span class="asterisk">*</span>제안자</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" id="text2" name="" value="">
                                                            <button type="button" class="btn-member-search-modal">검색</button>                                                           
                                                              
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><label for="text3"><span class="asterisk">*</span>관련 쪽지 제안</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" id="text3" name="" value="">
                                                            <button type="button" class="btn-psmg-search-modal">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><span class="asterisk">*</span>조직명</th>
                                                <td>조직명</td>
                                                <th><span class="asterisk">*</span>분임조</th>
                                                <td>분임조명</td>
                                            </tr>
                                            <tr>
                                                <th><label for="select1"><span class="asterisk">*</span>제안유형</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <select name="" id="select1" title="제안유형 선택">
                                                                <option value="">선택</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><label for="text4"><span class="asterisk">*</span>제안일</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s6 input-text input-date">
                                                            <input type="text" id="text4" name="" value="" class="datepicker">
                                                            <i class="ico calendar"></i>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text5"><span class="asterisk">*</span>실행 완료일</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s6 input-text input-date">
                                                            <input type="text" id="text5" name="" value="" class="datepicker">
                                                            <i class="ico calendar"></i>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><label for="select1"><span class="asterisk">*</span>년간 효과금액</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s6 select-group">
                                                            <select name="" id="select2" title="년간 효과금액 선택">
                                                                <option value="">선택</option>
                                                            </select>
                                                        </div>
                                                        <div class="col s6 input-text pd-l10">
                                                            <input type="text" id="text4" name="" value="">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th colspan="4" class="align-center"><span class="asterisk">*</span>제안내용</th>
                                            </tr>
                                            <tr>
                                                <th><label for="text6">현상 및 문제점</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text6" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text7">개선내용</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text7" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text8">기대효과</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text8" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>활동결과</th>
                                                <td colspan="3" class="pd0">
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
                                                                            <th></th>
                                                                            <th></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="row">
                                                                                    <div class="col s12 input-text file">
                                                                                        <span class="file-path">
                                                                                            <input type="text" id="file5_text" readonly name="" value="개선전이미지.jpg">
                                                                                            <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                                                        </span>
                                                                                        <input type="file" id="file5" name="" value="">
                                                                                        <label for="file5">파일추가</label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col s12 input-text file">
                                                                                        <span class="file-path">
                                                                                            <input type="text" id="file5_text" readonly name="" value="개선전이미지.jpg">
                                                                                            <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                                                        </span>
                                                                                        <input type="file" id="file5" name="" value="">
                                                                                        <label for="file5">파일추가</label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col s12 input-text file">
                                                                                        <span class="file-path">
                                                                                            <input type="text" id="file5_text" readonly name="" value="개선전이미지.jpg">
                                                                                            <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                                                        </span>
                                                                                        <input type="file" id="file5" name="" value="">
                                                                                        <label for="file5">파일추가</label>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="row">
                                                                                    <div class="col s12 input-text file">
                                                                                        <span class="file-path">
                                                                                            <input type="text" id="file5_text" readonly name="" value="개선전이미지.jpg">
                                                                                            <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                                                        </span>
                                                                                        <input type="file" id="file5" name="" value="">
                                                                                        <label for="file5">파일추가</label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col s12 input-text file">
                                                                                        <span class="file-path">
                                                                                            <input type="text" id="file5_text" readonly name="" value="개선전이미지.jpg">
                                                                                            <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                                                        </span>
                                                                                        <input type="file" id="file5" name="" value="">
                                                                                        <label for="file5">파일추가</label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col s12 input-text file">
                                                                                        <span class="file-path">
                                                                                            <input type="text" id="file5_text" readonly name="" value="개선전이미지.jpg">
                                                                                            <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                                                        </span>
                                                                                        <input type="file" id="file5" name="" value="">
                                                                                        <label for="file5">파일추가</label>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                        <tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><span class="asterisk">*</span>결재자 지정</th>
                                                <td colspan="3" class="pd0">
                                                    <div class="list-wrap" style="margin:-1px">
                                                        <div class="list-content">
                                                            <div class="list-table list">
                                                                <table class="centered">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col>
                                                                        <col style="width:70px">
                                                                        <col style="width:70px">
                                                                        <col style="width:70px">
                                                                        <col style="width:70px">
                                                                    </colgroup>
                                                                    <thead>
                                                                        <tr>
                                                                            <th>소속</th>
                                                                            <th>이름</th>
                                                                            <th>직위</th>
                                                                            <th>직책</th>
                                                                            <th>Belt</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr></tr>
                                                                        <td class="pd3">
                                                                            <div class="row">
                                                                                <div class="col s12 input-text search">
                                                                                    <input type="text" id="text3" name="" value="">
                                                                                    <button type="button" class="btn-member-search-modal">검색</button>
                                                                                </div>
                                                                                
                                                                              
                                                        
                                                                            </div>
                                                                        </td>
                                                                        <td>홍길동</td>
                                                                        <td>책임</td>
                                                                        <td>팀장</td>
                                                                        <td>MBB</td>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <p class="content_title">2. 첨부파일 등록</p>
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
                                                <th>첨부파일 (신규/수정)</th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 input-text file">
                                                            <span class="file-path">
                                                                <input type="text" id="file5_text" readonly name="" value="">
                                                                <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                            </span>
                                                            <input type="file" id="file5" name="" value="">
                                                            <label for="file5">파일추가</label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
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
                                <button type="button" class="btn light-gray">저장</button>
                                <button type="button" class="btn bg-gray">결제의뢰</button>                                
                                <a href="/proposal/list.do?menuKey=48" class="btn">목록</a>
                            </div>
                        </div>


</body>
</html>