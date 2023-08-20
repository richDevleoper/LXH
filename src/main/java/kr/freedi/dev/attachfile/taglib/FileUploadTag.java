package kr.freedi.dev.attachfile.taglib;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @project : offset
 * @file 	: UploadFormTag.java
 * @date	: 2017. 4. 4.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class FileUploadTag extends TagSupport {

	private static final long serialVersionUID = -2118508312644253923L;
	
	private String objectId;
	private String ctx;
	private String wrapperId;
	private String fileId;
	private String fileGrp;
	//private String formUrl;
	//private String listUrl;
	//private String uploadUrl;
	//private String deleteUrl;
	private String autoUpload;
	private String maxFileSize;
	private String maxNumberOfFiles;
	
	public FileUploadTag(){
		ctx = "";
		wrapperId = "";
		fileId = "";
		fileGrp = "";
		autoUpload = "false";
		maxFileSize = "1000000";
		maxNumberOfFiles = "1";
	}

	public int doStartTag()	throws JspException {
		try {
            //HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
            StringBuilder bf = new StringBuilder()
            .append("<script type=\"text/javascript\">")
            .append("var " + this.getObjectId() + ";")
            .append("$(document).ready(function() {")
            .append(getObjectId() + "= new jAttachFile.fileUploader(")
            .append("'" + this.getCtx() + "'")
            .append(",'" + this.getWrapperId() + "'")
            .append(",'" + this.fileId + "'")
            .append(",'" + this.getFileGrp() + "'")
            .append(",{")
            .append("autoUpload:" + this.getAutoUpload())
            .append(",maxFileSize:" + this.getMaxFileSize())
            .append(",maxNumberOfFiles:" + this.getMaxNumberOfFiles())
			.append("});")
			.append("});")
            .append("</script>")
            .append("<div id=\"" + this.getWrapperId() + "\"></div>");                        
            pageContext.getOut().print(bf.toString());
        } catch(IOException ioe) {
        	throw new JspTagException("Error:  IOException while writing to the user");
        } catch(Exception e) {
        	throw new JspTagException("Error:  Exception while writing to the user " + e.getMessage() );
        }
        return SKIP_BODY;
	}
	
	public void release(){
		super.release();
		ctx = null;
		wrapperId = null;
		fileId = null;
		fileGrp = null;
		maxNumberOfFiles = null;
	}

	
	public String getObjectId() {
		return objectId;
	}

	public void setObjectId(String objectId) {
		this.objectId = objectId;
	}

	public String getCtx() {
		return ctx;
	}

	public void setCtx(String ctx) {
		this.ctx = ctx;
	}

	public String getWrapperId() {
		return wrapperId;
	}

	public void setWrapperId(String wrapperId) {
		this.wrapperId = wrapperId;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFileGrp() {
		return fileGrp;
	}

	public void setFileGrp(String fileGrp) {
		this.fileGrp = fileGrp;
	}

	public String getAutoUpload() {
		return autoUpload;
	}

	public void setAutoUpload(String autoUpload) {
		this.autoUpload = autoUpload;
	}

	public String getMaxFileSize() {
		return maxFileSize;
	}

	public void setMaxFileSize(String maxFileSize) {
		this.maxFileSize = maxFileSize;
	}

	public String getMaxNumberOfFiles() {
		return maxNumberOfFiles;
	}

	public void setMaxNumberOfFiles(String maxNumberOfFiles) {
		this.maxNumberOfFiles = maxNumberOfFiles;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}


