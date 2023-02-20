/**
 * @project : 
 * @file 	: attachfile-fileupload
 * @date	: 2017. 4. 4.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */

if(jAttachFile == undefined) var jAttachFile = {};

jAttachFile.fileUploader = function(_ctx, _wrapperId, _fileId, _fileGrp, option){
	
	this.ctx = _ctx;
	this.wrapperId = _wrapperId;
	this.fileId = _fileId;
	this.fileGrp = _fileGrp;
	
	this.setPropertie();
	this.setOption(option);
	//this.debugPropertie();
	this.drawHtml().done();
	this.touch();
}

jAttachFile.fileUploader.prototype.setPropertie = function() {
	this.formUrl = this.ctx + "/attachfile/uploadForm.do";
	this.listUrl = this.ctx + "/attachfile/list.do";
	this.uploadUrl = this.ctx + "/attachfile/upload.do";
	this.deleteUrl = this.ctx + "/attachfile/delete.do";
	this.autoUpload = false;
	this.maxFileSize = 1000000; //byte
	this.maxNumberOfFiles = 1;
	this.denyFileTypes = /(\.|\/)(jsp|java|class|html?|js|php(\d)?|asp|inc|pl|cgi|exe)$/i;
}

jAttachFile.fileUploader.prototype.setOption = function(option) {
	for(var i in option) {
		if(option[i]) {
			this[i] = option[i];
		}
	}
}

jAttachFile.fileUploader.prototype.drawHtml = function() {
	var deferred = $.Deferred();
	
	var _url = this.formUrl
		,_wrapperId = this.wrapperId
		,_ctx = this.ctx;
	$.ajax({
		url : _url
		,async : false
		,success : function(resultText, status) {
			//console.log(resultText);
			$('#'+_wrapperId).html(resultText.replace(/#ctx#/gi, _ctx));
		}
		,complete : function(){
			deferred.resolve();
		}
		,error : function(xhr, ajaxSettings, thrownError){
			console.log(thrownError);
		}
	});
	return deferred.promise();
}

jAttachFile.fileUploader.prototype.touch = function() {
	
	var _uploadUrl = this.uploadUrl
		,_autoUpload = this.autoUpload
		,_maxFileSize = this.maxFileSize
        ,_maxNumberOfFiles = this.maxNumberOfFiles
        ,_denyFileTypes = this.denyFileTypes
        ,_formData = { fileId:this.fileId, fileGrp:this.fileGrp}
	
		,_listUrl = this.listUrl
		,_fileId = this.fileId;
	
    $('#fileupload').fileupload({
        url: _uploadUrl
    });
    
    $('#fileupload').fileupload('option', {
        dataType: 'json',
        autoUpload: _autoUpload,
        maxFileSize:_maxFileSize,
        maxNumberOfFiles: _maxNumberOfFiles,
        denyFileTypes: _denyFileTypes,
        formData:_formData
    });
    
    if($('#fileupload').fileupload('option').autoUpload){
    	$('#startAll').hide();
    }
    
    // Load existing files:
    $('#fileupload').addClass('fileupload-processing');
    $.ajax({
        // Uncomment the following to send cross-domain cookies:
        //xhrFields: {withCredentials: true},
        //url: _listUrl + '?fileId=' + _fileId,
        url:_listUrl + '?fileId=' + _fileId,
        dataType: 'json',
        context: $('#fileupload')[0]
    }).always(function () {
        $(this).removeClass('fileupload-processing');
    }).done(function (result) {
        $(this).fileupload('option', 'done').call(this, $.Event('done'), {result: result});
    });
}

jAttachFile.fileUploader.prototype.debugPropertie = function() {
	for(var i in this) {
		console.log(i + "=" + this[i]);
	}
};
