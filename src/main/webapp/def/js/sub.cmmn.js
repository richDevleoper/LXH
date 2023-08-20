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


/***
 * 페이지 프린트기능
 * ***/
var prtContent; // 프린트 하고 싶은 영역
var initBody;  // body 내용 원본

// 프린트하고 싶은 영역의 id 값을 통해 출력 시작
function startPrint (div_id) {
	prtContent = document.getElementById(div_id);
	window.onbeforeprint = beforePrint;
	window.onafterprint = afterPrint;
	window.print();
}

// 웹페이지 body 내용을 프린트하고 싶은 내용으로 교체
function beforePrint(){
	initBody = document.body.innerHTML;
	document.body.innerHTML = prtContent.innerHTML;
}

// 프린트 후, 웹페이지 body 복구
function afterPrint(){
	document.body.innerHTML = initBody;
}
