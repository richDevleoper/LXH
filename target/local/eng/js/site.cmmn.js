$(function(){
	//
});

//paging
function cfnPageLink(page) {
	var frm = $("#currentPageNo").parent("form");
	$("#currentPageNo").parent("form").validationEngine('detach');
	$("#currentPageNo").val(page);
	frm.submit();
}
