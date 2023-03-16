<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- CSS -->
    <link rel="stylesheet" href="../css/jqury-ui.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/tree.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/style.css">

    <!-- JS -->
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/jquery-ui.js"></script>
    <script src="../js/jstree.min.js"></script>    
    <script src="../js/common.js"></script>

    <title>품질혁신지원시스템</title>
</head>
<body>
    <div id="wrap">
        <!-- header -->
        <header>
            <div class="header-top">
                <div class="inner">
                    <h1>
                        <img src="../images/logo.png" alt="">
                        <span>품질혁신지원시스템</span>
                    </h1>
                    <div class="header-util">
                        <p>홍길동(품질관리팀) 과제 <a href="" class="lx-red">3</a>건, 결제 <a href="" class="lx-red">1</a>건, 교육 <a href="" class="lx-red">1</a>건</p>
                        <ul>
                            <li><a href=""><img src="../images/icon_mypage.png" alt=""><span>마이페이지</span></a></li>
                            <li><a href=""><img src="../images/icon_help.png" alt=""><span>도움말</span></a></li>
                            <li><a href=""><img src="../images/icon_logout.png" alt=""><span>로그아웃</span></a></li>
                            <li><a href=""><img src="../images/icon_admin.png" alt=""></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="header-btm">
                <div class="inner">
                    <div class="header-menu">
                        <button type="button" class="btn-gnb">메뉴</button>
                        <nav>
                            <ul>
                                <li><a href="">품질KPI</a></li>
                                <li><a href="">과제/10+ No Policy활동</a></li>
                                <li><a href="">분임조활동</a></li>
                                <li><a href="">제안활동</a></li>
                                <li><a href="">품질인재육성</a></li>
                                <li><a href="">Big Data/커뮤니티</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="search-box">
                        <div class="search-form">
                            <form method="GET">
                                <span>전체</span>
                                <input type="text" name="" placeholder="검색어를 입력하세요">
                                <button type="submit" class="btn-search">검색</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="total-menu">
                    <div class="inner">
                        <div id="gnb">
                            <ul>
                                <li>
                                    <a href="">품질KPI</a>
                                    <div>
                                        <ul class="depth1">
                                            <li><a href="">6σ인재 현황</a></li>
                                            <li><a href="">팀장MBB율</a></li>
                                            <li><a href="">MBB활용율</a></li>
                                            <li>
                                                <a class="lx-red" href="">KPI관리</a>
                                                <ul class="depth2">
                                                    <li><a class="lx-red" href="">- 관리대상</a></li>
                                                    <li><a class="lx-red" href="">- 계획수립</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="">과제/10+ No Policy활동</a>
                                    <div>
                                        <ul class="depth1">
                                            <li>
                                                <a href="">나의 과제</a>                                                
                                            </li>
                                            <li><a href="">과제검색</a></li>
                                            <li><a href="" class="lx-red">Report</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="">제안활동</a>
                                    <div>
                                        <ul class="depth1">
                                            <li>
                                                <a href="">나의 분임조과제</a>                                                
                                            </li>
                                            <li><a href="">과제검색</a></li>
                                            <li><a href="" class="lx-red">분임조 편성</a></li>
                                            <li><a href="" class="lx-red">Report</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="">제안활동y</a>
                                    <div>
                                        <ul class="depth1">
                                            <li>
                                                <a href="">나의 제안</a>
                                                <ul class="depth2">
                                                    <li><a href="">- 실시제안</a></li>
                                                    <li><a href="">- 쪽지제안</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="">제안검색</a></li>
                                            <li><a href="" class="lx-red">제안 심사</a></li>
                                            <li>
                                                <a href="" class="lx-red">제안 마감</a>
                                                <ul class="depth2">
                                                    <li><a href="">- 등급평가</a></li>
                                                    <li><a href="">- 비용지급</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="">10+ No Policy</a></li>
                                            <li><a href="" class="lx-red">Report</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="">품질인재육성</a>
                                    <div>
                                        <ul class="depth1">
                                            <li><a href="">나의 육성 현황</a></li>
                                            <ul class="depth2">
                                                <li><a href="">- GB</a></li>
                                                <li><a href="">- MGB</a></li>
                                                <li><a href="">- BB</a></li>
                                                <li><a href="">- MBB</a></li>
                                            </ul>
                                            <li><a href="">년간계획(교육,Test)</a></li>                                            
                                            <li>
                                                <a href="" class="lx-red">교육/Test/인증</a>
                                                <ul class="depth2">
                                                    <li><a href="">- 계획수립</a></li>
                                                    <li><a href="">- 실적입력</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="">Big Data/커뮤니티</a>
                                    <div>
                                        <ul class="depth1">
                                            <li><a href="">Big DATA</a></li>
                                            <li><a href="">자료실</a></li>
                                            <li><a href="">BP사례</a></li>
                                            <li><a href="">공지사항</a></li>
                                            <li><a href="">Q&A</a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
        
                        <button type="button" class="btn-close">닫기</button>
                    </div>
                </div>
            </div>
        </header>
        <div class="dimmed"></div>
        <input type="checkbox" id="orgSelAll">
        <!-- //header -->
        <!-- container -->
        <div id="container">
            <div id="page-header">
                <div class="inner">
                    <div class="page-category">제안활동</div>
                    <div id="path">
                        <a href="">홈</a>
                        <span class="arr">></span>
                        <a href="">제안활동</a>
                        <span class="arr">></span>
                        <a href="">제안마감(관리)</a>
                        <span class="arr">></span>
                        <a href="">비용지급</a>
                    </div>
                    <button tpye="button" class="btn-print">
                        <img src="../images/btn_print.png" alt="">
                        <span>인쇄</span>
                    </button>
                </div>
            </div>
            <input type="checkbox" id="orgSelAll">
            <div id="page-container">
                <div class="inner">
                    <nav id="page-left">
                        <ul class="depth1">
                            <li>
                                <a href="javascript:void(0)" class="has-depth">나의 제안</a>
                                <ul class="depth2">
                                    <li><a href="">실시 제안</a></li>
                                    <li><a href="">쪽지 제안</a></li>
                                </ul>
                            </li>
                            <li><a href="">제안 검색</a></li>
                            <li><a href="">제안 심사(관리)</a></li>
                            <li>
                                <a href="javascript:void(0)" class="has-depth cur active">제안 마감(관리)</a>
                                <ul class="depth2" style="display:block">
                                    <li><a href="">등급평가</a></li>
                                    <li><a href="" class="lx-red">비용지급</a></li>
                                </ul>
                            </li>                            
                            <li><a href="">Report(관리)</a></li>
                        </ul>
                    </nav>                  
                    <section id="page-content">
                        <div class="list-wrap">
                            <div class="list-search">
                                <div class="search-form row">
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>제안명</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <input type="text" name="">
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4 ">
                                        <div class="col s4 align-right">
                                            <label>조직</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <input type="text" name="">
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>사업장</label>
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
                                            <label>제안자</label>
                                        </div>
                                       
                                        <div class="col s12 input-text search">
                                            <input type="text" id="text3" name="" value="">
                                            <button type="button">검색</button>
                                        </div>
                                        
                                    </div>
                                    <div class="form-inline form-input col s4 ">
                                        <div class="col s4 align-right">
                                            <label>분임조</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-inline form-input col s4">
                                        <div class="col s4 align-right">
                                            <label>최종심사자</label>
                                        </div>
                                        <div class="col s12 input-text search">
                                            <input type="text" id="text3" name="" value="">
                                            <button type="button">검색</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-form row">
                                    <div class="form-inline form-input col s8">
                                        <div class="col s2 align-right">
                                            <label>제안유형</label>
                                        </div>

                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>
                                    
                                        <div class="col s2 align-right">
                                            <label>제안유형</label>
                                        </div>

                                        <div class="pd-l10 col s8">
                                            <select name="" id="">
                                                <option value="">전체</option>
                                            </select>
                                        </div>

                                        <div class="col s2 align-right">
                                            <label>제안일</label>
                                        </div>
                                        <div class="pd-l10 col s8">
                                            <div class="col s5 input-date">
                                                <input type="text" class="datepicker">
                                                <i class="ico calendar"></i>
                                            </div>
                                            <span class="col s1 text-bul align-center">~</span>
                                            <div class="col s5 input-date">
                                                <input type="text" class="datepicker">
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
                                <p class="title">심사 완료 제안목록</p>
                                <span class="bar"></span>
                                <p class="total">총 100</p>
                                <select name="limit" class="limit">
                                    <option value="10">10개</option>
                                    <option value="50">50개</option>
                                    <option value="100">100개</option>
                                </select>
                            </div>
                            <div class="list-content">
                                <div class="list-table">
                                    <table class="even">
                                        <thead>
                                            <colgroup>
                                                <col style="width:30px">
                                                <col>
                                                <col style="width:70px">
                                                <col style="width:80px">
                                                <col style="width:100px">
                                                <col style="width:100px">
                                                <col style="width:80px">
                                                <col style="width:50px">
                                                <col style="width:100px">
                                                <col style="width:80px">
                                                <col style="width:80px">
                                            </colgroup>

                                            <tr>
                                                <th class="bg-gray font-weight-bold"><input type="checkbox" name="" id="SelAll" value=""><label for="SelAll"></label></th>
                                                <th class="bg-gray font-weight-bold">제안명</th>
                                                <th class="bg-gray font-weight-bold">제안자</th>
                                                <th class="bg-gray font-weight-bold">분임조</th>
                                                <th class="bg-gray font-weight-bold">제안유형</th>
                                                <th class="bg-gray font-weight-bold">조직명</th>
                                                <th class="bg-gray font-weight-bold">심사자</th>
                                                <th class="bg-gray font-weight-bold">등급</th>
                                                <th class="bg-gray font-weight-bold">제안일</th>
                                                <th class="bg-gray font-weight-bold">평가점수</th>
                                                <th class="bg-gray font-weight-bold">효과금액</th>
                                            </tr>                                            
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><input type="checkbox" name="" id="10" value=""><label for="10"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>분임조</td>
                                                <td>생산성향상</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                    <select name="" id="">
                                                        <option value="">전체</option>
                                                    </select>
                                                    </div>
                                                </td>
                                                <td>2023.01.30</td>
                                                <td>66</td>
                                                <td>66</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="9" value=""><label for="9"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>원가개선</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                
                                                <div class="pd-l10 col s12">
                                                    <select name="" id="">
                                                        <option value="">전체</option>
                                                    </select>
                                                </div>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="8" value=""><label for="8"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>에너지</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="7" value=""><label for="7"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>기타</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><input type="checkbox" name="" id="6" value=""><label for="6"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>분임조</td>
                                                <td>생산성향상</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="5" value=""><label for="5"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>원가개선</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="4" value=""><label for="4"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>에너지</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="3" value=""><label for="3"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>기타</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><input type="checkbox" name="" id="2" value=""><label for="2"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>에너지</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="" id="1" value=""><label for="1"></label></td>
                                                <td>예시) 23년 신제품 싸움닭...</td>
                                                <td>홍길동</td>
                                                <td>-</td>
                                                <td>기타</td>
                                                <td>조직명1</td>
                                                <td>청길동</td>
                                                <td>C</td>
                                                <td>2023.01.30</td>
                                                <td class="pd3">
                                                    
                                                    <div class="row">
                                                        <div class="col s12 input-text">
                                                            <input type="text" id="text15" name="" value="" title="항목 입력">
                                                        </div>
                                                    </div>
                                                
                                                </td>   
                                                <td>
                                                    <div class="pd-l10 col s12">
                                                        <select name="" id="">
                                                            <option value="">전체</option>
                                                        </select>
                                                    </div>
                                                </td>
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
                                    <button type="button" class="btn bg-gray">                                        
                                        <span>마감</span>
                                    </button>
                                    <button type="button" class="btn-excel">
                                        <img src="../images/icon_excel.png" alt="">
                                        <span>다운로드</span>
                                    </button>
                                </div>

                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- //container -->
        <!-- footer -->
        <footer>
            <div class="inner">
                <div class="footer-logo">
                    <img src="../images/footer_logo.png" alt="LX 하우시스">
                    <span>품질혁신지원시스템</span>
                </div>
                <p class="copyright">COPYRIGHT © 2021 LX HAUSYS. ALL RIGHTS RESERVED.</p>
            </div>
        </footer>
        <!-- //footer -->
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
    </div>
</body>
</html>