<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>메인</title>
<script type="text/javascript">
//<!--
$(function() {
	getDefStat('defStat', 'DEF');
	getDefStat('defStat', 'DEF', '${nYear}');
	getDefStat('defStat', 'DEF', '${nYear}', '${nMonth}');
	getDefStat('defStat', 'DEF', '${nYear}', '${nMonth}', '${nDate}');
	
	getDefStat('engStat', 'ENG');
	getDefStat('engStat', 'ENG', '${nYear}');
	getDefStat('engStat', 'ENG', '${nYear}', '${nMonth}');
	getDefStat('engStat', 'ENG', '${nYear}', '${nMonth}', '${nDate}');
});

//def 접속정보
function getDefStat(layerId, statTyp, year, month, date){
	$.ajax({
		url : '/csl/stat/selectCount.do' 
        ,method : "post"
		,dataType : 'json'
		,data : {
			statTyp:statTyp
			,year:year
			,month:month
			,date:date
		}
		,success : function(data, stat, xhr) {
			//console.log('getStat');
			//console.log(data);
			if(data != null){
				if(statTyp != undefined){
					if(year != undefined){
						if(month != undefined){
							if(date != undefined){
								$('#'+layerId+' .statDate').text(comma(data.cnt));
							}else{
								$('#'+layerId+' .statMonth').text(comma(data.cnt));
							}
						}else{
							$('#'+layerId+' .statYear').text(comma(data.cnt));
						}
					}else{
						$('#'+layerId+' .statTotal').text(comma(data.cnt));
					}
				}
			}
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
}

//-->
</script>
</head>
<body>

<table id="defStat" class="tb_base" summary="">
	<caption><span>접속정보(기본사이트)</span></caption>
	<colgroup>
		<col style="width:17%"/><col style="width:17%"/><col style="width:17%"/><col style="width:17%"/><col style="width:16%"/><col style="width:16%"/>
	</colgroup>
	<thead>
		<tr>
			<th colspan="6">접속정보(기본사이트)</th>
		</tr>
		<tr>
			<th>전체</th>
			<th>이번 연도</th>
			<th>이번 달</th>
			<th>오늘</th>
			<th>-</th>
			<th>-</th>
		</tr>
	</thead>
	<tbody class="list">
		<tr>
			<td class="statTotal">0</td>
			<td class="statYear">0</td>
			<td class="statMonth">0</td>
			<td class="statDate">0</td>
			<td>-</td>
			<td>-</td>
	</tbody>
</table>
<br />

<table id="engStat" class="tb_base" summary="">
	<caption><span>접속정보(영문사이트)</span></caption>
	<colgroup>
		<col style="width:17%"/><col style="width:17%"/><col style="width:17%"/><col style="width:17%"/><col style="width:16%"/><col style="width:16%"/>
	</colgroup>
	<thead>
		<tr>
			<th colspan="6">접속정보(영문사이트)</th>
		</tr>
		<tr>
			<th>전체</th>
			<th>이번 연도</th>
			<th>이번 달</th>
			<th>오늘</th>
			<th>-</th>
			<th>-</th>
		</tr>
	</thead>
	<tbody class="list">
		<tr>
			<td class="statTotal">0</td>
			<td class="statYear">0</td>
			<td class="statMonth">0</td>
			<td class="statDate">0</td>
			<td>-</td>
			<td>-</td>
	</tbody>
</table>
<br /><br /><br />

<br /><br /><br />
<br /><br /><br />
</body>
</html>
