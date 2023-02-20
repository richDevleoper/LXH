var mngrUserLoginFormUrl = '/csl/user/mngr/loginForm.do';

// onload
$(function() {

	if($(".jButton").length > 0){ $(".jButton").button(); }
	if($(".jConfigButton").lenth > 0){$(".jConfigButton").button({icons: {primary: "ui-icon-disk"}});}
	if($(".jDeleteButton").length > 0){$(".jDeleteButton").button({icons: {primary: "ui-icon-trash"}});}
	if($(".jCreateButton").length > 0){$(".jCreateButton").button({icons: {primary: "ui-icon-document"}});}
	if($(".jEditButton").length > 0){$(".jEditButton").button({icons: {primary: "ui-icon-disk"}});}
	if($(".jSearchButton").length > 0){$(".jSearchButton").button({icons: {primary: "ui-icon-search"}});}
	if($(".jSaveButton").length > 0){$(".jSaveButton").button({icons: {primary: "ui-icon-disk"}});}
	if($(".jCancelButton").length > 0){$(".jCancelButton").button({icons: {primary: "ui-icon-cancel"}});}
	if($(".jListButton").length > 0){$(".jListButton").button({icons: {primary: "ui-icon-clipboard"}});}
	if($(".jCheckButton").length > 0){$(".jCheckButton").button({icons: {primary: "ui-icon-check"}});}
	if($(".jAllCheckButton").length > 0){$(".jAllCheckButton").button({icons: {primary: "ui-icon-check"}});};
	
	if($(".jUploadButton").length > 0){$(".jUploadButton").button({icons: {primary: "ui-icon-arrowthickstop-1-n"}});}
	if($(".jSignalButton").length > 0){$(".jSignalButton").button({icons: {primary: "ui-icon-signal-diag"}});}
	if($(".jPrintButton").length > 0){$(".jPrintButton").button({icons: {primary: "ui-icon-print"}});}
	
	if($(".jOpenButton").length > 0){$(".jOpenButton").button({icons: {primary: "ui-icon-folder-open"}});}
	if($(".jCloseButton").length > 0){$(".jCloseButton").button({icons: {primary: "ui-icon-folder-collapsed"}});}
	if($(".jRadioButton").length > 0){$(".jRadioButton").buttonset({icons:{iconclass:["ui-icon-unlocked","ui-icon-locked"]}});}
	
	if($(".jRadioButtonSet").length > 0){$(".jRadioButtonSet").buttonset();}
	if($(".jButtonSet").length > 0){$(".jButtonSet").buttonset();}
	if($(".jLockRadio").length > 0){$(".jLockRadio").buttonset({icons:{iconclass:["ui-icon-unlocked","ui-icon-locked"]}})};
	if($(".jTargetRadio").length > 0){$( ".jTargetRadio" ).buttonset()};
	
	if($(".jDisabled").length > 0){$(".jDisabled").button({disabled: true});}

});


/**
 * 공통페이징함수
 */
function cfnPageLink(page) {
	var frm = $("#currentPageNo").parent("form");
	$("#currentPageNo").parent("form").validationEngine('detach');
	$("#currentPageNo").val(page);
	frm.submit();
}
