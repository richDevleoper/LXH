package kr.freedi.dev.link.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: LinkVO.java
 * @author	: pdh
 * @date	: 2017/2/3 17:8:52
 * @history	:
 * @comment	:
 */

public class LinkVO {

	private Integer linkKey;
	private String locateTyp;
	private String title;
	private String url;
	private String targetTyp;
	private String viewOrd;
	private String periodFlg;
	private Date startDt;
	private Date endDt;
	private String actFlg;
	private String frstOperId;
	private Date frstOperDt;
	private String lastOperId;
	private Date lastOperDate;
	
	
	public LinkVO(){
	}
	
	public Integer getLinkKey() {
		return linkKey;
	}
	public void setLinkKey(Integer linkKey) {
		this.linkKey = linkKey;
	}
	public String getLocateTyp() {
		return locateTyp;
	}
	public void setLocateTyp(String locateTyp) {
		this.locateTyp = locateTyp;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTargetTyp() {
		return targetTyp;
	}
	public void setTargetTyp(String targetTyp) {
		this.targetTyp = targetTyp;
	}
	public String getPeriodFlg() {
		return periodFlg;
	}
	public void setPeriodFlg(String periodFlg) {
		this.periodFlg = periodFlg;
	}
	public Date getStartDt() {
		return startDt;
	}
	public void setStartDt(Date startDt) {
		this.startDt = startDt;
	}
	public Date getEndDt() {
		return endDt;
	}
	public void setEndDt(Date endDt) {
		this.endDt = endDt;
	}
	public String getActFlg() {
		return actFlg;
	}
	public void setActFlg(String actFlg) {
		this.actFlg = actFlg;
	}
	public String getFrstOperId() {
		return frstOperId;
	}
	public void setFrstOperId(String frstOperId) {
		this.frstOperId = frstOperId;
	}
	public Date getFrstOperDt() {
		return frstOperDt;
	}
	public void setFrstOperDt(Date frstOperDt) {
		this.frstOperDt = frstOperDt;
	}
	public String getLastOperId() {
		return lastOperId;
	}
	public void setLastOperId(String lastOperId) {
		this.lastOperId = lastOperId;
	}
	public Date getLastOperDate() {
		return lastOperDate;
	}
	public void setLastOperDate(Date lastOperDate) {
		this.lastOperDate = lastOperDate;
	}
	public String getViewOrd() {
		return viewOrd;
	}
	public void setViewOrd(String viewOrd) {
		this.viewOrd = viewOrd;
	}
	
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
