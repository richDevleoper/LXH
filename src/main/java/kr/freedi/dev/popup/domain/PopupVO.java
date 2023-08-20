package kr.freedi.dev.popup.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: PopupVO.java
 * @author	: pdh
 * @date	: 2017/2/5 16:21:38
 * @history	:
 * @comment	:
 */

public class PopupVO {

	private Integer popupKey;
	private String locateTyp;
	private String title;
	private String periodFlg;
	private Date startDt;
	private Date endDt;
	private String sizeAutoFlg;
	private Integer sizeWdh;
	private Integer sizeHgt;
	private String content;
	private String actFlg;
	private Integer viewOrd;
	private String frstOperId;
	private Date frstOperDt;
	private String lastOperId;
	private Date lastOperDt;

	public PopupVO(){
	}


	public Integer getPopupKey(){
		return popupKey;
	}
	public void setPopupKey(Integer popupKey){
		this.popupKey = popupKey;
	}

	public String getLocateTyp(){
		return locateTyp;
	}
	public void setLocateTyp(String locateTyp){
		this.locateTyp = locateTyp;
	}

	public String getTitle(){
		return title;
	}
	public void setTitle(String title){
		this.title = title;
	}

	public String getPeriodFlg(){
		return periodFlg;
	}
	public void setPeriodFlg(String periodFlg){
		this.periodFlg = periodFlg;
	}

	public Date getStartDt(){
		return startDt;
	}
	public void setStartDt(Date startDt){
		this.startDt = startDt;
	}

	public Date getEndDt(){
		return endDt;
	}
	public void setEndDt(Date endDt){
		this.endDt = endDt;
	}

	public String getSizeAutoFlg(){
		return sizeAutoFlg;
	}
	public void setSizeAutoFlg(String sizeAutoFlg){
		this.sizeAutoFlg = sizeAutoFlg;
	}

	public Integer getSizeWdh(){
		return sizeWdh;
	}
	public void setSizeWdh(Integer sizeWdh){
		this.sizeWdh = sizeWdh;
	}

	public Integer getSizeHgt(){
		return sizeHgt;
	}
	public void setSizeHgt(Integer sizeHgt){
		this.sizeHgt = sizeHgt;
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

	public Integer getViewOrd() {
		return viewOrd;
	}

	public void setViewOrd(Integer viewOrd) {
		this.viewOrd = viewOrd;
	}

	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
