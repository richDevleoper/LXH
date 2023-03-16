<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tld/string-taglib.tld" prefix="string"%>
<head>
    <script src="./assets/js/chart.js"></script>"
	<script src="./assets/js/handleChart.js"></script>
   <!--  
   	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script> 
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    -->
    
    <script src="./assets/js/chart.js"></script>
    <script src="./assets/js/chartjs-plugin-datalabels@2.0.0"></script>
    <script src="./assets/js/apexcharts.js"></script>
    
    
    

</head>
<body>
    <div id="wrap">
        <div class="dimmed"></div>
        <!-- //header -->
        <!-- container -->
        <div id="container">
            <!-- 001-main-1. main-dashboard -->
            <div class="main-layout-dashboard">
                <ul class="main-layout-dashboard-list-col3">
                    <li>
                        <div class="dashboard-item-top flex-col2">
                            <div class="flex-item">
                                <span> 인재 현황</span>
                                <a href=""></a>
                            </div>
                            <span>2023년 기준</span>
                        </div>
                        <div class="dashboard-item-bottom">
                            <p>2023육성계획<br>(500명)</p>
                            <canvas id="chart_1"></canvas>
                            <div class="chart-1-items">
                                <span>82.1%</span>
                                <span>13%</span>
                                <span>4.9%</span>
                            </div>
                            <div class="chart-1-items2">
                                <span>BB : 305명</span>
                                <span>MBB : 112명</span>
                            </div>
                            <div class="chart-container">
                                <div class="center-circle">
                                    <p class="text">100%</p>
                                </div>
                                <div class="segment" style="--percent: 13; --start: 0">
                                    <div class="overlay">
                                        <p>13%</p>
                                    </div>
                                </div>
                                <div class="segment" style="--percent: 4.9; --start: 13">
                                    <div class="overlay">
                                        <p>4.9%</p>
                                    </div>
                                </div>
                                <div class="segment" style="--percent: 82.1; --start: 18">
                                    <div class="overlay">
                                        <p>82.1%</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="dashboard-item-top flex-col2">
                            <div class="flex-item">
                                <span>팀장 MBB현황</span>
                                <a href=""></a>
                            </div>
                            <span>2023.06.01 기준</span>
                        </div>
                        <div class="dashboard-item-bottom">
                            <div class="bar-chart color-or" id="chart" style="min-height: 365px">
                                <!-- <ul class="bar-chart-head">
                                    <li>0</li>
                                    <li>50</li>
                                    <li>100</li>
                                </ul>
                                <ul class="bar-chart-contents">
                                    <li>
                                        <span>창호</span>
                                        <div style="background-color:#c4c4c4">
                                            <div></div>
                                            <p><span class="color-white">80</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>바닥재</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">45</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;55</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>단열재</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">90</span></p>
                                            <span class="color-white">10</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>벽지</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">70</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;30</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>표면소재</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">60</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;40</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>산업용필름</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">80</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>자동차소재</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">80</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>인테리어</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">80</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>연구소</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">80</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>품질</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">80</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20</span>
                                        </div>
                                    </li>
                                </ul> -->
                            </div>
                            <script>
                                var options = {
                                    series: [{
                                        data: [44, 55, 55, 55, 55, 55, 55, 55, 55, 55],
                                    }, {
                                        data: [53, 32, 33, 52, 13, 53, 32, 33, 52, 13],
                                    }],
                                    chart: {
                                        type: 'bar',
                                        height: 330,
                                        stacked: true,
                                        stackType: '100%',
                                        toolbar: false,
                                        fontFamily: '나눔고딕, NanumGothic, sans-serif',
                                        foreColor: '#AAAAAA',
                                    },
                                    plotOptions: {
                                        bar: {
                                            horizontal: true,
                                        },
                                    },
                                    dataLabels: {
                                        style: {
                                            colors: ['#000', '#FFF'],
                                        }
                                    },
                                    stroke: {
                                        width: 1,
                                        colors: ['#fff'],
                                    },
                                    title: {
                                        text: undefined,
                                    },
                                    xaxis: {
                                        categories: ['창호', '바닥재', '단열재', '벽지', '표면소재', '산업용필름', '자동차소재', '인테리어', '연구소', '품질'],
                                        position: 'top',
                                        tickAmount: 2,
                                    },
                                    tooltip: {
                                        enabled: false,
                                    },
                                    fill: {
                                        opacity: 1,
                                    },
                                    legend: {
                                        show: false,
                                    },
                                    grid: {
                                        show: false,
                                    },
                                    fill: {
                                        colors: ['#ff9800', '#c4c4c4'],
                                        opacity: 1,
                                    },
                                    
                                };
                        
                                var chart = new ApexCharts(document.querySelector("#chart"), options);
                                chart.render();
                            </script>
                        </div>
                    </li>
                    <li>
                        <div class="dashboard-item-top flex-col2">
                            <div class="flex-item">
                                <span>MBB 활용현황</span>
                                <a href=""></a>
                            </div>
                            <span>2023,06.01 기준</span>
                        </div>
                        <div class="dashboard-item-bottom">
                            <div class="bar-chart color-gr" id="chart2">
                                <script>
                                    var options = {
                                        series: [{
                                            data: [44, 55, 55, 55, 55, 55, 55, 55, 55, 55],
                                        }, {
                                            data: [53, 32, 33, 52, 13, 53, 32, 33, 52, 13],
                                        }],
                                        chart: {
                                            type: 'bar',
                                            height: 330,
                                            stacked: true,
                                            stackType: '100%',
                                            toolbar: false,
                                            fontFamily: '나눔고딕, NanumGothic, sans-serif',
                                            foreColor: '#AAAAAA',
                                        },
                                        plotOptions: {
                                            bar: {
                                                horizontal: true,
                                            },
                                        },
                                        dataLabels: {
                                            style: {
                                                colors: ['#000', '#FFF'],
                                            }
                                        },
                                        stroke: {
                                            width: 1,
                                            colors: ['#fff'],
                                        },
                                        title: {
                                            text: undefined,
                                        },
                                        xaxis: {
                                            categories: ['창호', '바닥재', '단열재', '벽지', '표면소재', '산업용필름', '자동차소재', '인테리어', '연구소', '품질'],
                                            position: 'top',
                                            tickAmount: 2,
                                        },
                                        tooltip: {
                                            enabled: false,
                                        },
                                        fill: {
                                            opacity: 1,
                                        },
                                        legend: {
                                            show: false,
                                        },
                                        grid: {
                                            show: false,
                                        },
                                        fill: {
                                            colors: ['#9ee5a1', '#c4c4c4'],
                                            opacity: 1,
                                        }
                                    };
                            
                                    var chart = new ApexCharts(document.querySelector("#chart2"), options);
                                    chart.render();
                                </script>
                                <!-- <ul class="bar-chart-head">
                                    <li>0</li>
                                    <li>50</li>
                                    <li>100</li>
                                </ul>
                                <ul class="bar-chart-contents">
                                    <li>
                                        <span>창호</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">80</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>바닥재</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">45</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;55</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>단열재</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">90</span></p>
                                            <span class="color-white">10</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>벽지</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">70</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;30</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>표면소재</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">60</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;40</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>산업용필름</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">80</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>자동차소재</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">80</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>인테리어</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">80</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>연구소</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">80</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>품질</span>
                                        <div style="background-color:#c4c4c4">
                                            <p><span class="color-white">80</span></p>
                                            <span class="color-white">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20</span>
                                        </div>
                                    </li>
                                </ul> -->
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- 001-main-2. main-board-view -->
            <div class="main-layout-board-view">
                <ul class="main-layout-board-view-col3">
                    <li>
                        <div class="board-view-item-top flex-col2">
                            <h1>공지사항</h1>
                            <a href=""></a>
                        </div>
                        <ul>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                        </ul>
                    </li>
                    <li>
                        <div class="board-view-item-top flex-col2">
                            <h1>최신자료실</h1>
                            <a href=""></a>
                        </div>
                        <ul>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                        </ul>
                    </li>
                    <li>
                        <div class="board-view-item-top flex-col2">
                            <h1>BP사례</h1>
                            <a href=""></a>
                        </div>
                        <ul>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                            <li><a href=""> · 품질혁신지원시스템 공지사항을 보여줍니다....</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="board-item"></div>
            </div>
        </div>

    </div>
</body>
</html>
