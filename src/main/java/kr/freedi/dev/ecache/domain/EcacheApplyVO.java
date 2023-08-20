package kr.freedi.dev.ecache.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project : dev_default
 * @file 	: EcacheApplyVO.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class EcacheApplyVO {

	private String nodeNm;
	private String menuFlg;
	private String contentFlg;
	private String bannerFlg;
	private String popupFlg;
	private String linkFlg;
	private Date operDt;

	
	public EcacheApplyVO(){
	}

	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
	
	public String getNodeNm() {
		return nodeNm;
	}

	public void setNodeNm(String nodeNm) {
		this.nodeNm = nodeNm;
	}

	public String getMenuFlg() {
		return menuFlg;
	}

	public void setMenuFlg(String menuFlg) {
		this.menuFlg = menuFlg;
	}

	public String getBannerFlg() {
		return bannerFlg;
	}

	public void setBannerFlg(String bannerFlg) {
		this.bannerFlg = bannerFlg;
	}

	public String getPopupFlg() {
		return popupFlg;
	}

	public void setPopupFlg(String popupFlg) {
		this.popupFlg = popupFlg;
	}

	public String getLinkFlg() {
		return linkFlg;
	}

	public void setLinkFlg(String linkFlg) {
		this.linkFlg = linkFlg;
	}

	public Date getOperDt() {
		return operDt;
	}

	public void setOperDt(Date operDt) {
		this.operDt = operDt;
	}

	public String getContentFlg() {
		return contentFlg;
	}

	public void setContentFlg(String contentFlg) {
		this.contentFlg = contentFlg;
	}
}
