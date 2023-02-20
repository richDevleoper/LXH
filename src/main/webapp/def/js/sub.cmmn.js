$('html').click(function(e) {
	var obj = $(e.target);
	if (obj.parents('.all_mn_wrap').length == 0 && !obj.hasClass('jq_all_menu')) {
		if ($('.all_mn_wrap').is(':visible')) {
			$('.all_mn_wrap').slideUp();
		}
	}
	if (obj.parents('.location').length == 0) {
		$('[id^=location]').not(obj).slideUp();
	}
});

function hideLocation(obj) {
	$('[id^=location]').not(obj).slideUp();
}