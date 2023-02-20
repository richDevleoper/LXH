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
<title>사이트통계(기본)</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<script type="text/javascript" src="<c:url value='/csl/jquery/Chart-2.5.0/Chart.js'/>"></script>
<script type="text/javascript">
<!--
var backgroundColor = ['rgba(255, 99, 132, 0.2)' ,'rgba(54, 162, 235, 0.2)' ,'rgba(255, 206, 86, 0.2)' ,'rgba(75, 192, 192, 0.2)' ,'rgba(153, 102, 255, 0.2)' ,'rgba(255, 159, 64, 0.2)'];
var borderColor = ['rgba(255,99,132,1)' ,'rgba(54, 162, 235, 1)' ,'rgba(255, 206, 86, 1)' ,'rgba(75, 192, 192, 1)' ,'rgba(153, 102, 255, 1)' ,'rgba(255, 159, 64, 1)'];

$(function() {
	statTopMenu($('#menuTyp').val(), $('#statYm').val());
});


function statTopMenu(menuTyp, ym){
	console.log("menuTyp=" + menuTyp + ", ym=" + ym);
	$('[id^=chartDepthMenuWrap_]').each(function(){
		d = $(this).css('display', 'none');
	});
	
	$('#chartTopMenuWrap').empty().append("<canvas id=\"chartTopMenu\" width=\"600\" height=\"150\"></canvas>");
	$.ajax({
		url : '/csl/stat/getStatTopMenu.do' 
        ,method : "post"
		,dataType : 'json'
		,data : {
			menuTyp : menuTyp
			,ym : ym
		}
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,success : function(data, stat, xhr) {
			if(data != null && data.statSize > 0){
				
				window.charTm = new Chart(document.getElementById("chartTopMenu").getContext("2d"), {
				    type: 'bar'
				    ,options: {
				    	scales: {
				            yAxes: [{
				            	stacked: true
				            }]
							,xAxes: [{
								stacked: true
				                ,ticks: {
				                    display: true
				                    ,maxRotation:180
				            		,callback: function(tick) {
				            			var tickLabel = tick == '' ? '' : tick.split(',')[0];
				            			return tickLabel;
				            		}
				                }
				            }]
				        }
					    ,tooltips: {
					    	mode: 'label'
					        ,callbacks: {
				            	title: function(tooltipItem, data) { 
				            		if(data.labels[tooltipItem[0].index] == ''){
				            			return data.labels[tooltipItem[0].index];
				            		}
				            		var titles = data.labels[tooltipItem[0].index].split(',');
				            		var t = titles[0];
				            		return t;
					            }
					            ,label: function(tooltipItem, data) { 
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
					            label: ym.substring(0,4) + "-" + ym.substring(4,6) + ", 최상위메뉴"
					            ,backgroundColor: backgroundColor[0]
					            ,borderColor: borderColor[0]
					            ,borderWidth: 1
					            ,data: data.statData
					        }
					    ]
				    }
				 });
			}
			$('#chartTopMenu').bind('click', function(evt){
				var activePoints = charTm.getElementsAtEvent(evt);
	            var firstPoint = activePoints[0];
	            if(firstPoint != null){
		            var lb = charTm.data.labels[firstPoint._index];
		            statMenu(menuTyp, ym, lb.split(',')[0], lb.split(',')[1], 1);
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


function statMenu(menuTyp, ym, label, mnKey, depth){
	$('[id^=chartDepthMenuWrap_]').each(function(){
		d = $(this).attr('id').split('_')[1];
		if(d == depth){
			$(this).css('display', '');
		}else if(d > depth){
			$(this).css('display', 'none');
		}
	});
	$('#chartDepthMenuWrap_'+depth).empty().append("<canvas id=\"chartMenu" + depth + "\" width=\"600\" height=\"150\"></canvas>");
	$.ajax({
		url : '/csl/stat/getStatMenu.do' 
        ,method : "post"
		,dataType : 'json'
		,data : {
			menuTyp : menuTyp
			,ym : ym
			,mnKey : mnKey
		}
		,beforeSend : function(){
			$.blockUI({ overlayCSS: { cursor:'cursor'}, message: $('<div>처리중입니다.</div>'), css: { cursor:'cursor', border: 'none', padding: '5px', backgroundColor: '#000', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5, color: '#fff' } });
		}
		,success : function(data, stat, xhr) {
			if(data != null && data.statSize > 0){
				
				eval("window.chartM"+depth+" = new Chart(document.getElementById('chartMenu'+depth).getContext('2d'), {" + 
				    "type: 'bar'" + 
				    ",options: {" + 
				    	"scales: {" + 
				            "yAxes: [{" + 
				            	"stacked: true" + 
				            "}]" + 
							",xAxes: [{" + 
								"stacked: true" + 
				                ",ticks: {" + 
				                    "display: true" + 
				                    ",maxRotation:180" + 
				            		",callback: function(tick) {" + 
				            			"var tickLabel = tick == '' ? '' : tick.split(',')[0];" + 
				            			"return tickLabel;" + 
				            		"}" + 
				                "}" + 
				            "}]" + 
				        "}" + 
					    ",tooltips: {" + 
					    	"mode: 'label'" + 
					        ",callbacks: {" + 
				            	"title: function(tooltipItem, data) {" +  
				            		"if(data.labels[tooltipItem[0].index] == ''){" + 
				            			"return data.labels[tooltipItem[0].index];" + 
				            		"}" + 
				            		"var titles = data.labels[tooltipItem[0].index].split(',');" + 
				            		"var t = titles[0];" + 
				            		"return t;" + 
					            "}" + 
					            ",label: function(tooltipItem, data) {" +  
					                "var idx = tooltipItem.index;         " +         
					                "return comma(data.datasets[0].data[idx]);" + 
					            "}" + 
					        "}" + 
			            "}" + 
				    "}" + 
				    ",data: {" + 
					    "labels: data.statLabel" + 
					    ",datasets: [" + 
					        "{" + 
					        	"label: ym.substring(0,4) + '-' + ym.substring(4,6) + ', ' + label" + 
					            ",backgroundColor: backgroundColor[depth]" + 
					            ",borderColor: borderColor[depth]" + 
					            ",borderWidth: 1" + 
					            ",data: data.statData" + 
					        "}" + 
					    "]" + 
				    "}" + 
				 "});");
			}
			
			$('#chartMenu'+depth).bind('click', function(evt){
				eval("var activePoints = chartM"+depth+".getElementsAtEvent(evt);" +
	            "var firstPoint = activePoints[0];" +
	            "if(firstPoint != null){" +
		            "var lb = chartM"+depth+".data.labels[firstPoint._index];" +
		            "statMenu(menuTyp, ym, label + ' > ' + lb.split(',')[0], lb.split(',')[1], depth+1);" +
	            "}");
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
-->
</script>
</head>
<body>
<!-- 검색 -->
<input type="hidden" id="menuTyp" name="menuTyp" value="${paramMap.menuTyp }" />
<div id="search_header">
	<div class="search">
		<fieldset>
			<legend class="hidden">검색</legend>
			<ul>
				<li>
					<label class="w_none" for="statYear">년월선택</label>
					<select id="statYm" name="statYm" title="년월선택">
						<c:set var="lYear" value="2016" />
						<c:set var="lMonth" value="10" />
						<c:set var="lYm" value="${lYear*100 + lMonth}" />
						<c:set var="fYear" value="0" />
						<c:set var="fMonth" value="0" />
						<c:set var="fYm" value="0" />
						
						<c:set var="ym" value="" />
						
						<c:forEach var="year" begin="${0}" end="${paramMap.cYear-distYear}" varStatus="i">
							<c:set var="fYear" value="${paramMap.cYear-i.index}" />
							<c:forEach var="month" begin="${0}" end="11" varStatus="j">
								<c:set var="fMonth" value="${12-j.index}" />
								<c:set var="fYm" value="${fYear*100 + fMonth }" />
								<fmt:formatNumber var="m" minIntegerDigits="2" value="${12-j.index}" />
								<!-- ${fYm},${paramMap.cYm},${lYm} -->
								<c:if test="${fYm <= paramMap.cYm and fYm >= lYm }">
											<option value="${fYm}" <c:if test="${fYm == cYm}">selected="selected"</c:if>>
												${fYear}-${m }
											</option>
								</c:if>
							</c:forEach>
						</c:forEach>
					</select>
					<button class="jSearchButton" onclick="statTopMenu($('#menuTyp').val(), $('#statYm').val());" title="조회">조회</button>
				</li>
			</ul>
		</fieldset>
	</div>
</div>
<!-- 검색 //-->


<div id="chartTopMenuWrap" style="width:100%;"></div>
<div style="height:60px;"></div>
<div id="chartDepthMenuWrap_1" style="display:none;width:100%;"></div>
<div style="height:60px;"></div>
<div id="chartDepthMenuWrap_2" style="display:none;width:100%;"></div>
<div style="height:60px;"></div>
<div id="chartDepthMenuWrap_3" style="display:none;width:100%;"></div>
<div style="height:60px;"></div>
<div id="chartDepthMenuWrap_4" style="display:none;width:100%;"></div>
<div style="height:60px;"></div>
<div id="chartDepthMenuWrap_5" style="display:none;width:100%;"></div>
<div style="height:60px;"></div>
<div id="chartDepthMenuWrap_6" style="display:none;width:100%;"></div>
</body>
</html>







