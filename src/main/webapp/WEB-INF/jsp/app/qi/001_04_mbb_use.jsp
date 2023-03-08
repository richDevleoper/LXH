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
                                <form>
                                    <div class="search-form">
                                        <div class="form-inline form-input">
                                            <label>조회연도</label>
                                            <select name="">
                                                <option value="">2023년</option>
                                            </select>
                                        </div>
                                        <div class="form-inline form-input">
                                            <label>조회월</label>
                                            <select name="">
                                                <option value="">2023년</option>
                                            </select>
                                        </div>
                                        <div class="form-inline form-input">
                                            <label>조직</label>
                                            <input type="text" name="">
                                            <button type="button" class="btn-org">검색</button>
                                        </div>
                                        <div class="form-inline form-input">
                                            <label>사업장</label>
                                            <select name="" style="width:120px">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                        <button type="button" class="btn-submit">조회</button>
                                    </div>
                                </form>
                            </div>
                            <!-- tabulator-->
                            <div class="list-wrap">
                                <div class="list-content">
                                    <div id="example-table" class="list-table list tabulator point-type"></div>
                                </div>
                            </div>
                            <!-- //tabulator-->
                            <div class="list-footer">
                                <div class="list-btns">
                                    <button type="button" class="btn-excel">
                                        <img src="/assets/images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    
        <!-- 조직도 -->
        <div class="modal-dimmed"></div>
        <div class="org-modal">
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
    </div>
    <script>
		var tableDataNested = [
            {name:"생산/기술/R&D/품질",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"},
			{name:"창호 사업부",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55",
                _children:[
                    {name:"창호 사업부",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55",
                    _children:[
                        {name:"창호 사업부",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"}
                    ]}
                ]
            },
            {name:"창호.생산담당",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55",
                _children:[
                    {name:"창호.프로파일생산팀",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"},
                    {name:"창호.기술팀",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"},
                    {name:"창호.공정혁신팀",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"},
                    {name:"창호.완성창공정기술팀",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"},
                ]
            },
            {name:"창호 사업부",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55",
                _children:[
                    {name:"창호 사업부",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55",
                    _children:[
                        {name:"창호 사업부",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"}
                    ]}
                ]
            },
            {name:"생산/기술/R&D/품질 外",name2:"47",data3_1:"26",data3_2:"15",data4_1:"11",data4_2:"-",data4_3:"26",data4_4:"-",data4_5:"26",data4_6:"-",data5_1:"26",data5_2:"55",data6_1:"26",data6_2:"+55"},
		];

		var table = new Tabulator("#example-table", {
			data:tableDataNested,
			dataTree:true,
			dataTreeStartExpanded:true,
            columnHeaderVertAlign:"middle", //align header contents to bottom of cell
			columns:[
                {title:"대상구분", field:"name",headerSort:false, width:160},
                {title:"‘23MBB 인원", field:"name2",headerSort:false},
                {//create column group
                    title:"‘23년 육성",field:"name3",
                    columns:[
                        {title:"인원", field:"data3_1",headerSort:false, width:40},
                        {title:"율(%)", field:"data3_2",headerSort:false, width:40},
                    ],
                },
                {//create column group
                    title:"활동 현황",field:"name4",
                    columns:[
                        {title:"직접 수행",field:"data4_1",headerSort:false, width:80},
                        {title:"비고(직접수행)",field:"data4_2",headerSort:false, width:100},
                        {title:"지원MBB",field:"data4_3",headerSort:false, width:80},
                        {title:"비고(지원MBB활동)",field:"data4_4",headerSort:false, width:130},
                        {title:"팀장MBB",field:"data4_5",headerSort:false, width:80},
                        {title:"비고(팀장MBB활동)",field:"data4_6",headerSort:false, width:130}
                    ],
                },
                {//create column group
                    title:"활동인원(계)",field:"name5",
                    columns:[
                    {title:"인원(명)", field:"data5_1",headerSort:false, width:60},
                        {title:"활용율(%)", field:"data5_2",headerSort:false, width:80},
                    ],
                },
                {//create column group
                    title:"계획대비(연간)",field:"name6",
                    columns:[
                    {title:"인원(명)", field:"data6_1",headerSort:false, width:60},
                        {title:"활용율(%)", field:"data6_2",headerSort:false, width:80},
                    ],
                }
            ],
		});
	</script>
</body>
</html>