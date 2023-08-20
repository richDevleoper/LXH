package kr.freedi.dev.attachfile.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: AttachFileVO.java
 * @author	: pdh
 * @date	: 2017/4/1 9:33:15
 * @history	:
 * @comment	:
 */

public class AttachFileVO implements Serializable {

	private static final long serialVersionUID = 5112544423602608343L;
	private String fileId;
	private Integer fileSeq;
	private String fileGrp;
	private String fileNm;
	private long fileSiz;
	private String fileMsk;
	private Integer dwnldCnt;
	private String deleteFlg;
	private Date operDt;
	
	private String filePath;
	@SuppressWarnings("unused")
	private boolean isImage;
	
	public AttachFileVO(){
	}


	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
	
	public String getFileId(){
		return fileId;
	}
	public void setFileId(String fileId){
		this.fileId = fileId;
	}

	public Integer getFileSeq(){
		return fileSeq;
	}
	public void setFileSeq(Integer fileSeq){
		this.fileSeq = fileSeq;
	}

	public String getFileNm(){
		return fileNm;
	}
	public void setFileNm(String fileNm){
		this.fileNm = fileNm;
	}

	public long getFileSiz(){
		return fileSiz;
	}
	public void setFileSiz(long fileSiz){
		this.fileSiz = fileSiz;
	}

	public String getFileMsk(){
		return fileMsk;
	}
	public void setFileMsk(String fileMsk){
		this.fileMsk = fileMsk;
	}

	public Integer getDwnldCnt(){
		return dwnldCnt;
	}
	public void setDwnldCnt(Integer dwnldCnt){
		this.dwnldCnt = dwnldCnt;
	}

	public String getDeleteFlg(){
		return deleteFlg;
	}
	public void setDeleteFlg(String deleteFlg){
		this.deleteFlg = deleteFlg;
	}

	public Date getOperDt(){
		return operDt;
	}
	public void setOperDt(Date operDt){
		this.operDt = operDt;
	}

	public String getFileGrp() {
		return fileGrp;
	}

	public void setFileGrp(String fileGrp) {
		this.fileGrp = fileGrp;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public boolean isImage() {
		if(StringUtils.isEmpty(this.fileNm)){
			return false;
		}
		
        String pattern = "^.+\\.(?i)(gif|png|bmp|jpe?g|tiff)$";
        boolean result = Pattern.matches(pattern, this.fileNm);
        if(result){
            return true;
        }else{
            return false;
        }
	}

}
