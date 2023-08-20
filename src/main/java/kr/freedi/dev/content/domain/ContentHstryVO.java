package kr.freedi.dev.content.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: ContentHstryVO.java
 * @author	: pdh
 * @date	: 2017/8/5 17:39:19
 * @history	:
 * @comment	:
 */

public class ContentHstryVO {

	private Integer contentHstryKey;
	private Integer contentKey;
	private String content;
	private String operId;
	private Date operDt;

	public ContentHstryVO(){
	}


	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
	
	public Integer getContentHstryKey(){
		return contentHstryKey;
	}
	public void setContentHstryKey(Integer contentHstryKey){
		this.contentHstryKey = contentHstryKey;
	}

	public Integer getContentKey(){
		return contentKey;
	}
	public void setContentKey(Integer contentKey){
		this.contentKey = contentKey;
	}

	public String getContent(){
		return content;
	}
	public void setContent(String content){
		this.content = content;
	}

	public String getOperId(){
		return operId;
	}
	public void setOperId(String operId){
		this.operId = operId;
	}

	public Date getOperDt() {
		return operDt;
	}
	public void setOperDt(Date operDt) {
		this.operDt = operDt;
	}

}
