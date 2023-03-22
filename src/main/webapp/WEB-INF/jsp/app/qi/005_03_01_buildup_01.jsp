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
                                <li></li>
                            </ul>
                        </div>
                        <p class="content_title">교육과정 등록</p>
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
                                                <th><label for="text1"><span class="asterisk">*</span>교육과정명</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text1" name="" value="" title="제안명을 입력해주세요.">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text2"><span class="asterisk">*</span>교육연도</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" id="text2" name="" value="">
                                                            <button type="button">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><label for="text3"><span class="asterisk">*</span>벨트</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 input-text search">
                                                            <input type="text" id="text3" name="" value="">
                                                            <button type="button">검색</button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><span class="asterisk">*</span>교육유형</th>
                                                <td>조직명</td>
                                                <th><span class="asterisk">*</span>상세유형</th>
                                                <td>분임조명</td>
                                            </tr>
                                            <tr>
                                                <th><label for="select1"><span class="asterisk">*</span>교육차수</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s12 select-group">
                                                            <select name="" id="select1" title="제안유형 선택">
                                                                <option value="">선택</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th><label for="text4"><span class="asterisk">*</span>교육일정</label></th>
                                                <td>
                                                    <div class="row">
                                                        <div class="col s6 input-text input-date">
                                                            <input type="text" id="text4" name="" value="">
                                                            <i class="ico calendar"></i>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text1"><span class="asterisk">*</span>교육정원</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s037 input-text">                                                            
                                                            <input type="text" id="text1" name="" value="" title="">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <th colspan="4" class="align-center"><span class="asterisk">*</span>교육내용</th>
                                            </tr>
                                            <tr>
                                                <th><label for="text6"><span class="asterisk">*</span>교육방식</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text6" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text7"><span class="asterisk">*</span>대상자</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text7" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="text8"><span class="asterisk">*</span>이수기준</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text8" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>   
                                            <tr>
                                                <th><label for="text8"><span class="asterisk">*</span>준비사항</label></th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <textarea name="" id="text8" rows="4"></textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>                                                               
                                            <tr>
                                                <th>첨부파일 (신규/수정)</th>
                                                <td colspan="3">
                                                    <div class="row">
                                                        <div class="col s12 input-text file">
                                                            <span class="file-path">
                                                                <input type="text" id="file5_text" readonly name="" value="">
                                                                <button type="button"><i class="ico file_del"><em>삭제</em></i></button>
                                                            </span>
                                                            <input type="file" id="file5" name="" value="">
                                                            <label for="file5" class="align-center">파일추가</label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>첨부파일 (조회)</th>
                                                <td colspan="3">
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
                                <button type="button" class="btn bg-gray">교육등록</button>                                
                                <a href="#" class="btn">목록</a>
                            </div>
                        </div>

        <!-- 조직도 -->
        <div class="modal-dimmed"></div>
        <div class="org-modal">
            <div class="modal-header">
                <h4>이미지 크게보기</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <figure>
                    <img src="/assets/images/@sample.jpg" width="100%" alt="">
                </figure>
            </div>
        </div>
</body>
</html>