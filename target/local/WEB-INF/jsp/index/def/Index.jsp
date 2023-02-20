<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tld/string-taglib.tld" prefix="string"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>Heungdeok Construction 흥덕건설</title>

<style type="text/css"></style>

<script type="text/javascript">
$(function(){
	<c:forEach var="item" items="${visualBannerList }" varStatus="i">
		$(".visual.bg${i.count}").css('background', 'url(/upload/banner/${item.fileMsk}) no-repeat 50% 0');
		<c:if test="${i.count ne 1 }">
			$(".visual.bg${i.count}").css('opacity', '0');
		</c:if>
	</c:forEach>
});
</script>
</head>
<body>
<!-- style="background: url(/upload/banner/${item.fileMsk}) no-repeat 50% 0;" -->
	<!-- visual_wrap -->
	<div id="index_visual_wrap">
		<div id="index_visual">
			<div id="bg">
				<c:forEach items="${visualBannerList }" var="item" varStatus="i">
					<div class="visual bg${i.count }">
						<a href="${item.url}"></a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="bgChanger">
			<div class="wrap">
				<ul>
					<c:forEach items="${visualBannerList }" var="item">
						<li><a href="#">${item.title}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	<!-- //
	(function($) {
		$.fn.imgsSrcToggle = function(settings) {
			var config = {
				orgSrc : '_off', newSrc : '_on'
			};
			if (settings) $.extend(config, settings);
			this.each(function() {
				if($(this).attr('src')){
					$(this).attr('src',$(this).attr('src').replace(config.orgSrc, config.newSrc));
				}
			});
		};

		$.fn.imgsRollOver = function(settings) {
			var config = {
				orgSrc : '_off', newSrc : '_on'
			};
			if (settings) $.extend(config, settings);
			this.each(function() {
				$(this).bind('mouseenter',function() {
					if ($(this).attr('src') && $(this).attr('src').match(config.orgSrc)) {
						$(this).attr('src', $(this).attr('src').replace(config.orgSrc, config.newSrc));
						$(this).bind('mouseleave',function() {
							$(this).attr('src', $(this).attr('src').replace(config.newSrc, config.orgSrc));
						});
					}
				});
			});
		};
	})(jQuery);

	// Background Switcher
	var timerBg;
	var o = -1;
	var max = $('#bgChanger li').length;
	var times = 6000;

	function switchBg(num){
		if(num != null){
			o = num;
		} else {
			o = o + 1;
			if(o >= max) o = 0;
		}

		var $button = $('#bgChanger li').eq(o).children('a');
		$button.addClass('current').children().imgsSrcToggle({ orgSrc : '_off', newSrc : '_on' });
		$button.parent().siblings().children().removeClass('current').children().imgsSrcToggle({ orgSrc : '_on', newSrc : '_off' });

		$('#bg').children().eq(o).animate({
			opacity: 1
		}).siblings().animate({
			opacity: 0
		});

		if (timerBg) {
			clearInterval(timerBg);
		}
		timerBg = setTimeout('switchBg()', times);
	}

	function play() {
		if (timerBg) {
			clearInterval(timerBg);
		}
		timerBg = setTimeout('switchBg()', times);
		$('#playbtn').hide();
		$('#stopbtn').show();
	}

	function stop() {
		if (timerBg) clearInterval(timerBg);
		$('#stopbtn').hide();
		$('#playbtn').show();
	}

	$(document).ready(function(){
		$('#bgChanger li a').on('click', function(event){
			//event.preventDefault();
			if($(this).attr('class') != 'current') switchBg($(this).parent().index());
		});
		switchBg();
	});

	// -->
	</script>
	<!-- //visual_wrap -->

	<!-- container_wrap -->
	<div id="container_wrap" >

		<div class="grey_wrap">
			<div id="container_box">
				<p class="title"><b><span>주요사업</span></b> Businesses</p>
				<div class="index_cont_box mt30">
					<c:forEach items="${mainBizList }" var="item" varStatus="i">
						<div class="cont_box${i.count }">
							<div class="box1">
								<c:choose>
									<c:when test="${item.codeId eq 'OUR' }"><p>OUR <span>Projects</span></p></c:when>
									<c:when test="${item.codeId eq 'ENG' }"><p>토목사업 <span>engineering projects</span></p></c:when>
									<c:when test="${item.codeId eq 'CON' }"><p>건축사업 <span>construction projects</span></p></c:when>
								</c:choose>
							</div>
							<div class="box2">
								<p><b>${item.codeNm }</b><span>${item.attr1} ~ ${item.attr2 }</span></p>
								<a href="${item.attr3 }">자세히보기<span>GO</span></a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="container_box">
			<p class="title"><b><span>뉴스</span></b> News</p>
			<div class="index_news_box">
				<c:forEach items="${noticeList }" var="item" varStatus="i">
					<div>
						<p class="img"><img src="/def/img/index/img_news${i.count }.jpg" alt=""/></p>
						<div class="text_box">
							<a href="/article/view.do?menuKey=35&boardKey=${item.boardKey }&articleKey=${item.articleKey }" class="text1">${item.title }</a>
							<a href="/article/view.do?menuKey=35&boardKey=${item.boardKey }&articleKey=${item.articleKey }" class="text2">${item.content }</a>
							<p class="text3">
								<c:choose>
									<c:when test="${empty item.lastOperDt }">
										<fmt:formatDate value="${item.frstOperDt }" pattern="YYYY. MM. dd"/>
									</c:when>
									<c:otherwise>
										<fmt:formatDate value="${item.lastOperDt }" pattern="YYYY. MM. dd"/>
									</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="index_contact_box">
				<div class="left_box">
					<p><img src="/def/img/index/img_contact.jpg" alt=""/></p>
					<a href="/content/view.do?menuKey=27&contentKey=5">Contact US<span>GO</span></a>
				</div>
				<div class="right_box">
					<p class="text1">Contact US</p>
					<p class="img"><img src="/def/img/index/img_contact2.png" alt=""/></p>
					<p class="text2">흥덕건설은 혁신적인 건설문화 선도를 위하여<br />새로운 도전을 지향 하고 있습니다,형태와 공간이 조화를 이루고<br />소통하고 조화를 이루고자 노력하는 흥덕건설입니다.</p>
					<a href="/content/view.do?menuKey=27&contentKey=5">자세히보기<span>GO</span></a>
				</div>
				<%-- <c:forEach items="${bottomBannerList }" var="item" varStatus="i">
					<c:choose>
						<c:when test="${ i.index eq 1 }">
							<div class="left_box">
								<p><img src="/upload/banner/${item.fileMsk }" alt=""/></p>
								<a href="${item.url }">Contact US<span>GO</span></a>
							</div>
						</c:when>
						<c:when test="${ i.index eq 0 }">
							<div class="right_box">
								<p class="text1">Contact US</p>
								<p class="img"><img src="/upload/banner/${item.fileMsk }" alt=""/></p>
								<p class="text2">흥덕건설은 혁신적인 건설문화 선도를 위하여<br />새로운 도전을 지향 하고 있습니다,형태와 공간이 조화를 이루고<br />소통하고 조화를 이루고자 노력하는 흥덕건설입니다.</p>
								<a href="${item.url }">자세히보기<span>GO</span></a>
							</div>
						</c:when>
					</c:choose>
				</c:forEach> --%>
			</div>
		</div>
	</div>
	<!-- //container_wrap -->
</body>
</html>
