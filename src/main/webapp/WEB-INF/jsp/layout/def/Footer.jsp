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
<!-- 12 조직조회 -->
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

<!-- 13 직책조회 -->
<div class="org-modal" id="comPopup_posSearch">
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
                <div id="org-tree" class="jstree jstree-1 jstree-default jstree-checkbox-selection" role="tree" aria-multiselectable="true" tabindex="0" aria-activedescendant="j1_1" aria-busy="false"><ul class="jstree-container-ul jstree-children" role="group"><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_1_anchor" id="j1_1" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_1_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사업부장</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_2_anchor" id="j1_2" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_2_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>담당</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_3_anchor" id="j1_3" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_3_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>팀장</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_4_anchor" id="j1_4" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_4_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>책임</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_5_anchor" id="j1_5" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_5_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>선임</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_6_anchor" id="j1_6" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_6_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원1</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_7_anchor" id="j1_7" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_7_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원2</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_8_anchor" id="j1_8" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_8_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원3</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_9_anchor" id="j1_9" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_9_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원4</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_10_anchor" id="j1_10" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_10_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원5</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_11_anchor" id="j1_11" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_11_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원6</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_12_anchor" id="j1_12" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_12_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원7</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_13_anchor" id="j1_13" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_13_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원8</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_14_anchor" id="j1_14" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_14_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원9</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_15_anchor" id="j1_15" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_15_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원10</a></li><li role="treeitem" aria-selected="false" aria-level="1" aria-labelledby="j1_16_anchor" id="j1_16" class="jstree-node  jstree-leaf jstree-last"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="j1_16_anchor"><i class="jstree-icon jstree-checkbox" role="presentation"></i><i class="jstree-icon jstree-themeicon" role="presentation"></i>사원11</a></li></ul></div>
                <div class="btns">
                    <button type="button" class="btn-submit">확인</button>
                    <button type="button" class="btn-cancel">취소</button>
                </div>
            </div>
        </div>
</div>

<!-- 29 사원조회 -->
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
	                        <label>이 름</label>
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

<!-- 48 쪽지제안검색-->
<div class="org-modal" id="comPopup_pmsgSearch">
	<div class="modal-header">
	    <h4>쪽지 제안 검색</h4>
	    <button type="button" class="btn-close">닫기</button>
	</div>
	<div class="modal-content">
	    <div class="list-wrap">
	        <div class="list-search">
	             <form>
	                 <div class="search-form">
	                     <div class="form-inline form-select">
	                         <label>구분</label>
	                         <select name="">
	                             <option value="">전체</option>
	                             <option value="">사번</option>
	                             <option value="">이름</option>
	                             <option value="">부문</option>
	                             <option value="">소속명</option>
	                             <option value="">팀명</option>
	                             <option value="">직무명</option>
	                         </select>                                                    
	                     </div>
	                    
	                     <div class="form-inline form-select">
	                         <label>제안유형</label>                                            
	                         <select name="">
	                             <option value="">전체</option>
	                         </select>                                            
	                     </div>
	                      <div class="form-inline form-select">
	                         <input type="text" name="">
	                     </div>                                     
	                     <button type="button" class="btn-submit">조회</button>
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
	                        <col>
	                        <col style="width:120px">	                        
	                        <col style="width:80px">	                        
	                    </colgroup>
	                        <thead>
	                            <tr>
	                                <th>선택</th>
	                                <th>쪽지제안명</th>
	                                <th>제안유형</th>
	                                <th>제안자</th>	                                
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                                <td><input type="radio" /></td>	                                
	                                <td>젠체 쪽지 제안(신청, 심사완료 등 전체)명</td>
	                                <td>생산향상</td>
	                                <td>홍길동</td>	                                
	                            </tr>
	                            <tr>
	                                <td><input type="radio" /></td>	                                
	                                <td>젠체 쪽지 제안(신청, 심사완료 등 전체)명</td>
	                                <td>생산향상</td>
	                                <td>홍길동</td>	                                
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

<!-- 78 승인정보 등록 -->
<div class="org-modal" id="comPopup_apprInfoRegi">
	<div class="modal-header">
	    <h4>승인정보 등록</h4>
	    <button type="button" class="btn-close">닫기</button>
	</div>
	<div class="modal-content">
	    <div class="list-wrap">
										
			<div class="list-table">
				<table class="even">
                   <colgroup>                                            
                       <col style="width:50px">
                       <col>
                       <col style="width:100px">
                       <col style="width:100px">
                       <col style="width:100px">
                       <col style="width:100px">
                       <col style="width:100px">
                       <col style="width:100px">                                            
                   </colgroup>
                   <thead>
                   	<tr>
                           <th class="bg-gray font-weight-bold" rowspan="2">번호</th>
                           <th class="bg-gray font-weight-bold" colspan="6">평가내용</th>
                           <th class="bg-gray font-weight-bold" rowspan="2">배점</th>                                                                                                                                                                                    
                       </tr>
                       <tr>                                                
                           <th class="bg-gray font-weight-bold">구분</th>
                           <th class="bg-gray font-weight-bold">5</th>
                           <th class="bg-gray font-weight-bold">4</th>
                           <th class="bg-gray font-weight-bold">3</th>
                           <th class="bg-gray font-weight-bold">2</th>
                           <th class="bg-gray font-weight-bold">1</th>                                                                                               
                       </tr>                                            
                   </thead>
                   <tbody>
                       <tr>
                           <td>1</td>                                                
                           <td>개선금액 효과</td>
                           <td>년 5천만원이산(4천 이상 45점)</td>
                           <td>년 3천만원이상(2천 이상 36점)</td>
                           <td>년 1천만원이상(8백 이상 25점)</td>
                           <td>년 6백만원이상(4백 이상 15점)</td>
                           <td>년 2백만원이상(2백 미만 56점)</td>
                           <td rowspan=3">
                           	<select name="">
				              <option value="">선택</option>		
				              <option value="">5</option>
				              <option value="">4</option>
				              <option value="">3</option>
				              <option value="">2</option>
				              <option value="">1</option>				                             
                           	</select> 
     					</td>                                                                                                                                                
                       </tr>
                       <tr>
                       	<td>2</td>
                           <td>[비금액 효과]</td>                                                
                           <td>개선효과가 획기적임</td>
                           <td>개선효과가 상당함</td>
                           <td>개선효과가 양호함</td>
                           <td>개선효과가 단순함</td>
                           <td>개선효과가 미흡함</td>                                                                                                                                                                                                
                       </tr>
                       <tr>
                       	<td>3</td>
                           <td>[환경/안전효과]</td>                                                
                           <td>매우 치명적임</td>
                           <td>상당히 치명적임</td>
                           <td>치명적임</td>
                           <td>조금 치명적임</td>
                           <td>치명적이지 않음</td>                                                                                                                                                                                                
                       </tr>
                       <tr>
                       	<td>4</td>
                           <td>창의성</td>                                                
                           <td>독창적이고 착안점이 우수함</td>
                           <td>매우 독창적임</td>
                           <td>모방적이나 착안점이 우수함</td>
                           <td>모방적이나 약간의 노력이 있음</td>
                           <td>단순 모방임</td>    
                           <td>
                           	<select name="">
				              <option value="">선택</option>	
				              <option value="">5</option>
				              <option value="">4</option>
				              <option value="">3</option>
				              <option value="">2</option>
				              <option value="">1</option>					                             
                           	</select> 
     					</td>                                                                                                                                                                                               
                       </tr>
                       <tr>
                       	<td>5</td>
                           <td>파급성</td>                                                
                           <td>전사적 적용가능</td>
                           <td>공장 내 적용가능</td>
                           <td>팀내(전 라인)적용 가능</td>
                           <td>라인 일부 가능</td>
                           <td>개인차원의 효과</td>    
                           <td>
                           	<select name="">
				              <option value="">선택</option>	
				              <option value="">5</option>
				              <option value="">4</option>
				              <option value="">3</option>
				              <option value="">2</option>
				              <option value="">1</option>					                             
                           	</select> 
     					</td>                                                                                                                                                                                               
                       </tr>
                       <tr>
                       	<td>6</td>
                           <td>지속성</td>                                                
                           <td>영구적</td>
                           <td>반영구적(10년이상)</td>
                           <td>장기간(5년이상)</td>
                           <td>단기적(1년이상)</td>
                           <td>일시적(1년미만)</td>    
                           <td>
                           	<select name="">
				              <option value="">선택</option>		
				              <option value="">5</option>
				              <option value="">4</option>
				              <option value="">3</option>
				              <option value="">2</option>
				              <option value="">1</option>				                             
                           	</select> 
     					</td>                                                                                                                                                                                               
                       </tr>
                       <tr>
                       	<td>7</td>
                           <td>노력도</td>                                                
                           <td>탁월한 노력이 엿보임</td>
                           <td>상당한 노력이 엿보임</td>
                           <td>-</td>
                           <td>어느 정도의 노력이 엿보임</td>
                           <td>거의 노력이 엿보이지 않음</td>    
                           <td>
                           	<select name="">
				              <option value="">선택</option>						                             
				              <option value="">5</option>
				              <option value="">4</option>
				              <option value="">3</option>
				              <option value="">2</option>
				              <option value="">1</option>
                           	</select> 
     					</td>                                                                                                                                                                                               
                       </tr>
                       <tr>
                       
                       	<th class="font-weight-bold" colspan="7">배점합계</th>
                           <td>
                           	<div class="col s12 input-text">
                           		<input type="text" id="" name="" value="" title="">
                               </div>
                          	</td>                                                                                                                                                                                                                                               
                       </tr>
                       <tr>
                       	<td colspan="8">
                               <div class="row">
                                   <div class="col s12 input-text">
                                       <textarea name="" id="" rows="4"></textarea>
                                   </div>
                               </div>
                           </td>
                       </tr>
                  </tbody>
                  </table>
              </div>
              <div class="list-footer">
     				<div class="list-btns center">
           		<button type="button" class="btn bg-gray">                                        
               		<span>결재승인</span>
           		</button>
           			<a href="" class="btn">취소</a>                               
      				</div>
              </div>	    
  				
	    </div>
	</div>
</div>

<!-- 79 반려의견 등록 -->
<div class="org-modal" id="comPopup_rejectCommentsRegi">
	<div class="modal-header">
	    <h4>반려의견 등록</h4>
	    <button type="button" class="btn-close">닫기</button>
	</div>
	<div class="modal-content">
	    <div class="list-wrap">
		    <div class="list-table list">
		    	<table>
					<caption></caption>
						<colgroup>			
						<col>			
						</colgroup>
					<tbody>			
					<tr>			
						<td>
							<div class="row">
								<div class="col s12 input-text">
								<textarea name="" id="" rows="10"></textarea>
								</div>
							</div>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
	    </div>
	    <div class="list-footer">
			<div class="list-btns center">
  				<button type="button" class="btn bg-gray">                                        
      				<span>결재반려</span>
  				</button>
  					<a href="" class="btn">취소</a>                               
			</div>
     	</div>
   	</div>
</div>


<!-- 19 상세정보(사원정보) -->
<div class="org-modal" id="comPopup_detailMemberInfo">
            <div class="modal-header">
                <h4>상세정보</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="list-wrap">
                    <div class="list-content">
                        <div class="list-table list">
                            <table class="centered">
                                
                                <caption></caption>
                                <colgroup>
                                    <col style="width:100px">
                                    <col>
                                    <col style="width:100px">
                                    <col>                                    
                                </colgroup>
                                
                                <tbody>
                                    <tr>
                                        <th>사번</th>
                                        <td>사번1</td>
                                        <th>이름</th>
                                        <td>이름1</td>                                        
                                    </tr>
                                
                                    <tr>
                                        <th>근무지명</th>
                                        <td>근무지명1</td>
                                        <th>부문</th>
                                        <td>부문1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>소속명</th>
                                        <td>소속명1</td>
                                        <th>팀명</th>
                                        <td>팀명1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>직위</th>
                                        <td>직위1</td>
                                        <th>직책</th>
                                        <td>직책1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>신분유형</th>
                                        <td>신분유형1</td>
                                        <th>입사일</th>
                                        <td>입사일1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>직무명</th>
                                        <td>직무명1</td>
                                        <th>최종학력</th>
                                        <td>최종학력1</td>                                        
                                    </tr>
                                    <tr>
                                        <th>인증형황</th>
                                        <td colspan="3">GB(2020.02.10) MGB(비대상), BB(2021.02.10)</td>                                        
                                    </tr>                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>                
            </div>
        </div>

<!-- 50 이미지 크게 보기 -->
<div class="org-modal" id="comPopup_BiggerImage">
            <div class="modal-header">
                <h4>이미지 크게보기</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <figure>
                    <img src="../_html2023/assets/images/@sample.jpg" width="100%" alt="">                    
                </figure>
            </div>
</div>


<!-- 도움말 Full Process여부 -->
<div class="org-modal" id="advice-full-process-modal">
            <div class="modal-header">
                <h4>도움말</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="advide-content">
                    Full Process여부 온라인 도움말 영역 (내용 수령 후 확인)
                </div>
            </div>
</div>

<!-- 도움말 과제리더벨트 -->
<div class="org-modal" id="advice-modal advice-reader-belt-modal">
<div class="modal-header">
                <h4>도움말</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="advide-content">
                    과제리더벨트 온라인 도움말 영역 (내용 수령 후 확인)
                </div>
            </div>
</div>

<!-- 도움말 키워드 -->
<div class="org-modal" id="advice-keyword-modal">
<div class="modal-header">
                <h4>도움말</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="advide-content">
                    키워드 온라인 도움말 영역 (내용 수령 후 확인)
                </div>
            </div>
</div>

<!-- 도움말 산출 Logic -->
<div class="org-modal" id="advice-logic-modal">
<div class="modal-header">
                <h4>도움말</h4>
                <button type="button" class="btn-close">닫기</button>
            </div>
            <div class="modal-content">
                <div class="advide-content">
                    산출 Logic 온라인 도움말 영역 (내용 수령 후 확인)
                </div>
            </div>
</div>




