/*****************************************************************
 *  현재 사이트의 사용자 페이지에서 공통으로 사용되는 스크립트
 *  주로 ui관련된 스크립트 위주가 될것이다
 *****************************************************************/

/** onload *********************************************************/
$(function() {

	//$('#gnb_mn ul li a').enter();
	$('#snb ul li a').enter();
	$('.imgcg a').enter();
	
	//주메뉴
	$('#gnb_mn>ul>li>a').each(function(){
		$(this).focus(function(){
			$('#gnb_mn ul li').css({'height':'342px'});
			$('#gnb_mn ul li div').css({'display':'block'});
			$('#gnb_mn ul li div ul li').css({'height':'auto'});
			$('.gnb_img').css({'display':'block'});
			//$(this).parent().find('div').css("background","#f5f7f8");
			$('#gnb_mn>ul>li>a>img').each(function(){
				$(this).attr('src', $(this).attr('src').replace('_on.gif', '_off.gif'));
			});
			$(this).find('img').attr('src', $(this).find('img').attr('src').replace('_off.gif', '_on.gif'));
		});
	});
	$('#gnb_mn>ul>li').each(function(){
		$(this).mouseover(function(){
			$('#gnb_mn ul li').css({'height':'342px'});
			$('#gnb_mn ul li div').css({'display':'block'});
			$('#gnb_mn ul li div ul li').css({'height':'auto'});
			$('.gnb_img').css({'display':'block'});
			//$(this).parent().find('div').css("background","#f5f7f8");
			$('#gnb_mn>ul>li>a>img').each(function(){
				$(this).attr('src', $(this).attr('src').replace('_on.gif', '_off.gif'));
			});
			$(this).find('img').attr('src', $(this).find('img').attr('src').replace('_off.gif', '_on.gif'));
		});
		$(this).mouseout(function(){
			$('#gnb_mn ul li').css({'height':'50px'});
			$('#gnb_mn ul li div').css({'display':'none'});
			$('.gnb_img').css({'display':'none'});
			//$(this).parent().find('div').css("background","#fff");
		});
	});
});
