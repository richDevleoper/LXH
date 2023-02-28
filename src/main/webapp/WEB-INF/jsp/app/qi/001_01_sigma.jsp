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

<script type="text/javascript">

$(function() {
	if($("#defaultForm").validationEngine){
		$("#defaultForm").validationEngine('attach', {
			unbindEngine:false,
			customFunctions : {
				//	
			},
			onValidationComplete: function(form, status){
				if(status == true) {
					return true;	
				}
				return false;
			}
		});	
	}
	
	
	//달력
	if($('.datepicker').datepicker){
		$('.datepicker').datepicker({
			showOn: "both",
			dateFormat: "yy-mm-dd",
			changeYear: true,
			changeMonth: true,
			buttonImage: "/def/img/article/btn_calender.gif",
			buttonImageOnly: true,
			showButtonPanel: true,
			closeText: "닫기",
			onClose: function(){/**/}
		}).next('img').css('vertical-align', 'middle').css('margin-left','5px');	
	}	
});

//검색
function searchList(){
	$('#currentPageNo').val('1');
	$("#defaultForm").submit();
}
//추가
function insertForm(){
	$("#defaultForm").attr('action', 'insertForm.do');
	$("#defaultForm").submit();
}
//조회
function view(key){
	$("#defaultForm").attr('action', 'view.do');
	$("#articleKey").attr('value', key);
	$("#defaultForm").submit();
}

</script>
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


        <!-- //container -->
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
            {name:"생산/기술/R&D/품질",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1"},
			{name:"창호 사업부",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1",
                _children:[
                    {name:"창호 사업부",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1",
                    _children:[
                        {name:"창호 사업부",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1"}
                    ]}
                ]
            },
            {name:"창호.생산담당",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1",
                _children:[
                    {name:"창호.프로파일생산팀",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1"},
                    {name:"창호.기술팀",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1"},
                    {name:"창호.공정혁신팀",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1"},
                    {name:"창호.완성창공정기술팀",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1"},
                ]
            },
            {name:"창호 사업부",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1",
                _children:[
                    {name:"창호 사업부",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1",
                    _children:[
                        {name:"창호 사업부",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1"}
                    ]}
                ]
            },
            {name:"생산/기술/R&D/품질 外",GB1_1:"193",GB1_2:"30",BB1_1:"193",BB1_2:"30",MBB1_1:"193",MBB1_2:"30",BB이상1_1:"193",BB이상1_2:"30",GB2_1:"193",GB2_2:"30",BB2_1:"193",BB2_2:"30",MBB2_1:"193",MBB2_2:"30",BB이상2_1:"193",BB이상2_2:"30",GB3_1:"193",GB3_2:"30",BB3_1:"193",BB3_2:"30",MBB3_1:"193",MBB3_2:"30",BB이상3_1:"193",BB이상3_2:"30",name5:"1"},
		];

		if(Tabulator){
			var table = new Tabulator("#example-table", {
				data:tableDataNested,
				dataTree:true,
				dataTreeStartExpanded:true,
	            columnHeaderVertAlign:"middle", //align header contents to bottom of cell
				columns:[
	                {title:"대상구분", field:"name",headerSort:false, width:160},
	                {//create column group
	                    title:"‘22년(직전년도)",field:"name2",
	                    columns:[
	                        {
	                            title:"GB",field:"GB1",
	                            columns:[
	                                {title:"인원", field:"GB1_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"GB1_2",headerSort:false, width:40},
	                            ],
	                        },
	                        {
	                            title:"BB",field:"BB1",
	                            columns:[
	                                {title:"인원", field:"BB1_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"BB1_2",headerSort:false, width:40},
	                            ],
	                            
	                        },
	                        {
	                            title:"MBB",field:"MBB1",
	                            columns:[
	                                {title:"인원", field:"MBB1_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"MBB1_2",headerSort:false, width:40},
	                            ],
	                        },
	                        {
	                            title:"BB이상",field:"BB이상1",
	                            columns:[
	                                {title:"인원", field:"BB이상1_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"BB이상1_2",headerSort:false, width:40},
	                            ],
	                        }
	                    ],
	                },
	                {//create column group
	                    title:"‘23년 육성 계획",field:"name3",
	                    columns:[
	                        {
	                            title:"GB",field:"GB2",
	                            columns:[
	                                {title:"인원", field:"GB2_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"GB2_2",headerSort:false, width:40},
	                            ],
	                        },
	                        {
	                            title:"BB",field:"BB2",
	                            columns:[
	                                {title:"인원", field:"BB2_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"BB2_2",headerSort:false, width:40},
	                            ],
	                            
	                        },
	                        {
	                            title:"MBB",field:"MBB2",
	                            columns:[
	                                {title:"인원", field:"MBB2_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"MBB2_2",headerSort:false, width:40},
	                            ],
	                        },
	                        {
	                            title:"BB이상",field:"BB이상2",
	                            columns:[
	                                {title:"인원", field:"BB이상2_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"BB이상2_2",headerSort:false, width:40},
	                            ],
	                        }
	                    ],
	                },
	                {//create column group
	                    title:"<span class='color primary'>‘23년 6월 1일 기준</span>",field:"name4",
	                    columns:[
	                        {
	                            title:"GB",field:"GB3",
	                            columns:[
	                                {title:"인원", field:"GB3_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"GB3_2",headerSort:false, width:40},
	                            ],
	                        },
	                        {
	                            title:"BB",field:"BB3",
	                            columns:[
	                                {title:"인원", field:"BB3_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"BB3_2",headerSort:false, width:40},
	                            ],
	                            
	                        },
	                        {
	                            title:"MBB",field:"MBB3",
	                            columns:[
	                                {title:"인원", field:"MBB3_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"MBB3_2",headerSort:false, width:40},
	                            ],
	                        },
	                        {
	                            title:"BB이상",field:"BB이상3",
	                            columns:[
	                                {title:"인원", field:"BB이상3_1",headerSort:false, width:40},
	                                {title:"율(%)", field:"BB이상3_2",headerSort:false, width:40},
	                            ],
	                        }
	                    ],
	                },
	                {title:"대상인원", field:"name5",headerSort:false, width:60},
	            ],
			});
		}
		
	</script>
</body>
</html>