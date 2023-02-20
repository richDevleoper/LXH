var genrUserLoginFormUrl = '/user/genr/loginForm.do?menuKey=75';
var corpUserLoginFormUrl = '/user/corp/loginForm.do?menuKey=82';

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

$.fn.extend({
	enter: function() {//plugins creation
		return this.each(function() {
			var this_class = $(this).attr("class");
			if(this_class!='no'){
				if($(this).find("img")[0]){
					var pth = $(this).find("img")[0];
					 //alert($(this).children().attr("href"));
					$(this).focus(function(){
							$(pth).attr("src",pth.src.replace(/_off/g, '_on'));// mouse over Image
					})
					.mouseover(function(){
						$(pth).attr("src",pth.src.replace(/_off/g, '_on'));// mouse over Image
					})
					.mouseout(function(){
						$(pth).attr("src",pth.src.replace(/_on/g, '_off'));// mouse out image
					})
					.blur(function(){
						$(pth).attr("src",pth.src.replace(/_on/g, '_off'));// mouse out image
					});
				}
			}
		});
	}
});


//paging
function cfnPageLink(page) {
	var frm = $("#currentPageNo").parent("form");
	$("#currentPageNo").parent("form").validationEngine('detach');
	$("#currentPageNo").val(page);
	frm.submit();
}



