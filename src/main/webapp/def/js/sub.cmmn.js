$('html').click(
		function(e) {
			var obj = $(e.target);
			if (obj.parents('.all_mn_wrap').length == 0
					&& !obj.hasClass('jq_all_menu')) {
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

let popupGetOrgCdReturnObj;
function popupGetOrgCd(obj) { // 조직 조회
	// objId : return 받을 Object ID
	
	popupGetOrgCdReturnObj = obj;	// 리턴받을 Object 지정
	$('.modal-dimmed, .org-modal').show();
}

function popupGetPosCd(obj) { // 직책 조회
	// objId : return 받을 Object ID
}