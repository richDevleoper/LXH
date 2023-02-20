<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!doctype html>
<html lang="ko">
<head>
<title>사이트통계(언어)</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<script type="text/javascript" src="<c:url value='/csl/jquery/Chart-2.5.0/Chart.js'/>"></script>
<script type="text/javascript">
<!--
var backgroundColor = ['rgba(255, 99, 132, 0.2)' ,'rgba(54, 162, 235, 0.2)' ,'rgba(255, 206, 86, 0.2)' ,'rgba(75, 192, 192, 0.2)' ,'rgba(153, 102, 255, 0.2)' ,'rgba(255, 159, 64, 0.2)'];
var borderColor = ['rgba(255,99,132,1)' ,'rgba(54, 162, 235, 1)' ,'rgba(255, 206, 86, 1)' ,'rgba(75, 192, 192, 1)' ,'rgba(153, 102, 255, 1)' ,'rgba(255, 159, 64, 1)'];

$(function() {
	statAll($('#statTyp').val(), $('#statYear').val());
});

function statAll(statTyp, year){
	$('#chartLangWrap').css('display', 'none');
	$('#chartYearWrap').css('display', 'none');
	$('#chartMonthWrap').css('display', 'none');
	$('#chartDateWrap').css('display', 'none');
	$('#chartHourWrap').css('display', 'none');
	$('#chartMinuteWrap').css('display', 'none');
	$('#chartAllWrap').empty().append("<canvas id=\"chartAll\" width=\"600\" height=\"60\"></canvas>");
	$.ajax({
		url : '/csl/stat/getStatAll.do' 
        ,method : "post"
		,dataType : 'json'
		,data : {
			statTyp : statTyp
			,year : year
		}
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,success : function(data, stat, xhr) {
			console.log(data)
			if(data != null && data.statSize > 0){
				
				window.chartAll = new Chart(document.getElementById("chartAll").getContext("2d"), {
					type: 'horizontalBar'
				    ,options: {
				    	scales: {
				            yAxes: [{stacked: true}]
				        }
					    ,tooltips: {
					    	mode: 'label',
					        callbacks: {
					            label: function(tooltipItem, data) { 
					                var idx = tooltipItem.index;                 
					                //return  data.labels[idx] +': '+data.datasets[0].data[idx] + '';
					                return comma(data.datasets[0].data[idx]);
					            }
					        }
			            }
				    }
				    ,data: {
					    labels: data.statLabel
					    ,datasets: [
					        {
					            label: year + "년, 전체"
					            ,backgroundColor: backgroundColor[0]
					            ,borderColor: borderColor[0]
					            ,borderWidth: 1
					            ,data: data.statData
					        }
					    ]
				    }
				 });
			}
			$('#chartAll').bind('click', function(evt){
				statLang(statTyp, year);
			});
		}
		,complete : function(){
			$.unblockUI();
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

function statLang(statTyp, year){
	$('#chartLangWrap').css('display', '');
	$('#chartYearWrap').css('display', 'none');
	$('#chartMonthWrap').css('display', 'none');
	$('#chartDateWrap').css('display', 'none');
	$('#chartHourWrap').css('display', 'none');
	$('#chartMinuteWrap').css('display', 'none');
	$('#chartLangWrap').empty().append("<canvas id=\"chartLang\" width=\"600\" height=\"150\"></canvas>");
	$.ajax({
		url : '/csl/stat/getStatLang.do' 
        ,method : "post"
		,dataType : 'json'
		,data : {
			statTyp : statTyp
			,year : year
		}
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,success : function(data, stat, xhr) {
			if(data != null && data.statSize > 0){
				
				window.chartLang = new Chart(document.getElementById("chartLang").getContext("2d"), {
				    type: 'bar'
				    ,options: {
				    	scales: {
				            yAxes: [{stacked: true}]
							,xAxes: [{
								stacked: true
				                ,ticks: {
				                    display: true
				                    ,maxRotation:180
				                }
				            }]
				        }
					    ,tooltips: {
					    	mode: 'label',
					        callbacks: {
					            label: function(tooltipItem, data) { 
					                var idx = tooltipItem.index;                 
					                //return  data.labels[idx] +': '+data.datasets[0].data[idx] + '';
					                return comma(data.datasets[0].data[idx]);
					            }
					        }
			            }
				    }
				    ,data: {
					    labels: data.statLabel
					    ,datasets: [
					        {
					            label: year + "년, 언어별통계"
					            ,backgroundColor: backgroundColor[1]
					            ,borderColor: borderColor[1]
					            ,borderWidth: 1
					            ,data: data.statData
					        }
					    ]
				    }
				 });
			}
			$('#chartLang').bind('click', function(evt){
				var activePoints = chartLang.getElementsAtEvent(evt);
	            var firstPoint = activePoints[0];
	            if(firstPoint != null){
	            	//console.log(chartLang.data.labels[tooltipItem[0].index]);
		            var label = chartLang.data.labels[firstPoint._index];
		            var value = chartLang.data.datasets[firstPoint._datasetIndex].data[firstPoint._index];
		            console.log(label + ": " + label);
		            console.log(label + ": " + value);
		            statMonth(statTyp, label, year);
	            }
			});
		}
		,complete : function(){
			$.unblockUI();
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

/*
function statYear(statTyp, statLang){
	console.log(statLang);
	$('#chartYearWrap').css('display', '');
	$('#chartMonthWrap').css('display', 'none');
	$('#chartDateWrap').css('display', 'none');
	$('#chartHourWrap').css('display', 'none');
	$('#chartMinuteWrap').css('display', 'none');
	$('#chartYearWrap').empty().append("<canvas id=\"chartYear\" width=\"600\" height=\"150\"></canvas>");
	$.ajax({
		url : '/csl/stat/getStat.do' 
        ,method : "post"
		,dataType : 'json'
		,data : {
			statTyp : statTyp
			,statLang : statLang
		}
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,success : function(data, stat, xhr) {
			if(data != null && data.statSize > 0){
				
				window.chartY = new Chart(document.getElementById("chartYear").getContext("2d"), {
				    type: 'bar'
				    ,options: {
				    	scales: {
				            yAxes: [{stacked: true}]
				        }
					    ,tooltips: {
					    	mode: 'label',
					        callbacks: {
					            label: function(tooltipItem, data) { 
					                var idx = tooltipItem.index;                 
					                //return  data.labels[idx] +': '+data.datasets[0].data[idx] + '';
					                return comma(data.datasets[0].data[idx]);
					            }
					        }
			            }
				    }
				    ,data: {
					    labels: data.statLabel
					    ,datasets: [
					        {
					            label: statLang + ", 연도별통계"
					            ,backgroundColor: backgroundColor[2]
					            ,borderColor: borderColor[2]
					            ,borderWidth: 1
					            ,data: data.statData
					        }
					    ]
				    }
				 });
			}
			$('#chartYear').bind('click', function(evt){
				var activePoints = chartY.getElementsAtEvent(evt);
	            var firstPoint = activePoints[0];
	            if(firstPoint != null){
		            var label = chartY.data.labels[firstPoint._index];
		            //var value = chart.data.datasets[firstPoint._datasetIndex].data[firstPoint._index];
		            //console.log(label + ": " + value);
		            statMonth(statTyp, statLang, label.replace(/\D/g,''));
	            }
			});
		}
		,complete : function(){
			$.unblockUI();
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}
*/

function statMonth(statTyp, statLang, year){
	$('#chartMonthWrap').css('display', '');
	$('#chartDateWrap').css('display', 'none');
	$('#chartHourWrap').css('display', 'none');
	$('#chartMinuteWrap').css('display', 'none');
	$('#chartMonthWrap').empty().append("<canvas id=\"chartMonth\" width=\"600\" height=\"150\"></canvas>");
	$.ajax({
		url : '/csl/stat/getStat.do' 
        ,method : "post"
		,dataType : 'json'
		,data : {
			statTyp : statTyp
			,statLang : statLang
			,year : year
		}
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,success : function(data, stat, xhr) {
			if(data != null && data.statSize > 0){
				
				window.chartYM = new Chart(document.getElementById("chartMonth").getContext("2d"), {
				    type: 'bar'
				    ,options: {
				    	scales: {
				            yAxes: [{stacked: true}]
				        }
					    ,tooltips: {
					    	mode: 'label',
					        callbacks: {
					            label: function(tooltipItem, data) { 
					                var idx = tooltipItem.index;                 
					                //return  data.labels[idx] +': '+data.datasets[0].data[idx] + '';
					                return comma(data.datasets[0].data[idx]);
					            }
					        }
			            }
				    }
				    ,data: {
					    labels: data.statLabel
					    ,datasets: [
					        {
					            label: year + "년, " + statLang + ", 월별통계"
					            ,backgroundColor: backgroundColor[3]
					            ,borderColor: borderColor[3]
					            ,borderWidth: 1
					            ,data: data.statData
					        }
					    ]
				    }
				 });
			}
			$('#chartMonth').bind('click', function(evt){
				var activePoints = chartYM.getElementsAtEvent(evt);
	            var firstPoint = activePoints[0];
	            if(firstPoint != null){
		            var label = chartYM.data.labels[firstPoint._index];
		            statDate(statTyp, statLang, year, label.replace(/\D/g,''));
	            }
			});
		}
		,complete : function(){
			$.unblockUI();
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

function statDate(statTyp, statLang, year, month){
	$('#chartDateWrap').css('display', '');
	$('#chartHourWrap').css('display', 'none');
	$('#chartMinuteWrap').css('display', 'none');
	$('#chartDateWrap').empty().append("<canvas id=\"chartDate\" width=\"600\" height=\"150\"></canvas>");
	$.ajax({
		url : '/csl/stat/getStat.do' 
        ,method : "post"
		,dataType : 'json'
		,data : {
			statTyp : statTyp
			,statLang : statLang
			,year : year
			,month : month
		}
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,success : function(data, stat, xhr) {
			if(data != null && data.statSize > 0){
				
				window.chartYMD = new Chart(document.getElementById("chartDate").getContext("2d"), {
				    type: 'bar'
				    ,options: {
				    	scales: {
				            yAxes: [{stacked: true}]
				        }
					    ,tooltips: {
					    	mode: 'label',
					        callbacks: {
					            label: function(tooltipItem, data) { 
					                var idx = tooltipItem.index;                 
					                //return  data.labels[idx] +': '+data.datasets[0].data[idx] + '';
					                return comma(data.datasets[0].data[idx]);
					            }
					        }
			            }
				    }
				    ,data: {
					    labels: data.statLabel
					    ,datasets: [
					        {
					            label: year + "년 " + month + "월, " + statLang + ", 일별통계"
					            ,backgroundColor: backgroundColor[4]
					            ,borderColor: borderColor[4]
					            ,borderWidth: 1
					            ,data: data.statData
					        }
					    ]
				    }
				 });
			}
			$('#chartDate').bind('click', function(evt){
				var activePoints = chartYMD.getElementsAtEvent(evt);
	            var firstPoint = activePoints[0];
	            if(firstPoint != null){
		            var label = chartYMD.data.labels[firstPoint._index];
		            statHour(statTyp, statLang, year, month, label.replace(/\D/g,''));
	            }
			});
		}
		,complete : function(){
			$.unblockUI();
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

function statHour(statTyp, statLang, year, month, date){
	$('#chartHourWrap').css('display', '');
	$('#chartMinuteWrap').css('display', 'none');
	$('#chartHourWrap').empty().append("<canvas id=\"chartHour\" width=\"600\" height=\"150\"></canvas>");
	$.ajax({
		url : '/csl/stat/getStat.do' 
        ,method : "post"
		,dataType : 'json'
		,data : {
			statTyp : statTyp
			,statLang : statLang
			,year : year
			,month : month
			,date : date
		}
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,success : function(data, stat, xhr) {
			if(data != null && data.statSize > 0){
				
				window.chartYMDH = new Chart(document.getElementById("chartHour").getContext("2d"), {
				    type: 'bar'
				    ,options: {
				    	scales: {
				            yAxes: [{stacked: true}]
				        }
					    ,tooltips: {
					    	mode: 'label',
					        callbacks: {
					            label: function(tooltipItem, data) { 
					                var idx = tooltipItem.index;                 
					                //return  data.labels[idx] +': '+data.datasets[0].data[idx] + '';
					                return comma(data.datasets[0].data[idx]);
					            }
					        }
			            }
				    }
				    ,data: {
					    labels: data.statLabel
					    ,datasets: [
					        {
					            label: year + "년 " + month + "월 " + date + "일, " + statLang + ", 시간별통계"
					            ,backgroundColor: backgroundColor[5]
					            ,borderColor: borderColor[5]
					            ,borderWidth: 1
					            ,data: data.statData
					        }
					    ]
				    }
				 });
			}
			$('#chartHour').bind('click', function(evt){
				var activePoints = chartYMDH.getElementsAtEvent(evt);
	            var firstPoint = activePoints[0];
	            if(firstPoint != null){
		            var label = chartYMDH.data.labels[firstPoint._index];
		            statMinute(statTyp, statLang, year, month, date, label.replace(/\D/g,''));
	            }
			});
		}
		,complete : function(){
			$.unblockUI();
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

function statMinute(statTyp, statLang, year, month, date, hour){
	$('#chartMinuteWrap').css('display', '');
	$('#chartMinuteWrap').empty().append("<canvas id=\"chartMinute\" width=\"600\" height=\"150\"></canvas>");
	$.ajax({
		url : '/csl/stat/getStat.do' 
        ,method : "post"
		,dataType : 'json'
		,data : {
			statTyp : statTyp
			,statLang : statLang
			,year : year
			,month : month
			,date : date
			,hour : hour
		}
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,success : function(data, stat, xhr) {
			if(data != null && data.statSize > 0){
				
				window.chartYNDHM = new Chart(document.getElementById("chartMinute").getContext("2d"), {
				    type: 'bar'
				    ,options: {
				    	scales: {
				            yAxes: [{stacked: true}]
				        }
					    ,tooltips: {
					    	mode: 'label',
					        callbacks: {
					            label: function(tooltipItem, data) { 
					                var idx = tooltipItem.index;                 
					                //return  data.labels[idx] +': '+data.datasets[0].data[idx] + '';
					                return comma(data.datasets[0].data[idx]);
					            }
					        }
			            }
				    }
				    ,data: {
					    labels: data.statLabel
					    ,datasets: [
					        {
					            label: year + "년 " + month + "월 " + date + "일 " + hour + "시, " + statLang + ", 분별통계"
					            ,backgroundColor: backgroundColor[0]
					            ,borderColor: borderColor[0]
					            ,borderWidth: 1
					            ,data: data.statData
					        }
					    ]
				    }
				 });
			}
		}
		,complete : function(){
			$.unblockUI();
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

//검색
function searchList(){
	$("#defaultForm").submit();
}
-->
</script>
</head>
<body>
<!-- 검색 -->
<input type="hidden" id="statTyp" name="statTyp" value="${paramMap.statTyp }" />
<div id="search_header">
	<div class="search">
		<fieldset>
			<legend class="hidden">검색</legend>
			<ul>
				<li>
					<label class="w_none" for="statYear">연도선택</label>
					<select id="statYear" name="statYear" title="연도선택">
						<c:set var="lYear" value="2016" />
						<c:forEach var="year" begin="${0}" end="${paramMap.nYear-lYear}" varStatus="i">
							<option value="${paramMap.nYear-i.index}" <c:if test="${paramMap.nYear-i.index == paramMap.statYear}">selected="selected"</c:if>>${paramMap.nYear-i.index}년도</option>	
						</c:forEach>
					</select>
					<button class="jSearchButton" onclick="statAll($('#statTyp').val(), $('#statYear').val());" title="조회">조회</button>
				</li>
			</ul>
		</fieldset>
	</div>
</div>
<!-- 검색 //-->
<div id="chartAllWrap" style="width:100%;"></div>
<div style="height:60px;"></div>
<div id="chartLangWrap" style="display:none;width:100%;"></div>
<div style="height:60px;"></div>
<!--  
<div id="chartYearWrap" style="display:none;width:100%;"></div>
<div style="height:60px;"></div>
-->
<div id="chartMonthWrap" style="display:none;width:100%;"></div>
<div style="height:60px;"></div>
<div id="chartDateWrap" style="display:none;width:100%;"></div>
<div style="height:60px;"></div>
<div id="chartHourWrap" style="display:none;width:100%;"></div>
<div style="height:60px;"></div>
<div id="chartMinuteWrap" style="display:none;width:100%;"></div>
</body>
</html>