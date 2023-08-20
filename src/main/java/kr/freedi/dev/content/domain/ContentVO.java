package kr.freedi.dev.content.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: ContentVO.java
 * @author	: pdh
 * @date	: 2017/2/1 13:51:15
 * @history	:
 * @comment	:
 */

public class ContentVO {

	private Integer contentKey;
	private String title;
	private String content;
	private String actFlg;
	private String frstOperId;
	private Date frstOperDt;
	private String lastOperId;
	private Date lastOperDt;

	public ContentVO(){
	}


	public Integer getContentKey(){
		return contentKey;
	}
	public void setContentKey(Integer contentKey){
		this.contentKey = contentKey;
	}

	public String getTitle(){
		return title;
	}
	public void setTitle(String title){
		this.title = title;
	}

	public String getContent(){
		return content;
	}
	public void setContent(String content){
		this.content = content;
	}

	public String getActFlg(){
		return actFlg;
	}
	public void setActFlg(String actFlg){
		this.actFlg = actFlg;
	}

	public String getFrstOperId(){
		return frstOperId;
	}
	public void setFrstOperId(String frstOperId){
		this.frstOperId = frstOperId;
	}

	public Date getFrstOperDt(){
		return frstOperDt;
	}
	public void setFrstOperDt(Date frstOperDt){
		this.frstOperDt = frstOperDt;
	}

	public String getLastOperId(){
		return lastOperId;
	}
	public void setLastOperId(String lastOperId){
		this.lastOperId = lastOperId;
	}

	public Date getLastOperDt(){
		return lastOperDt;
	}
	public void setLastOperDt(Date lastOperDt){
		this.lastOperDt = lastOperDt;
	}


	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

}
