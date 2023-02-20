package kr.freedi.dev.menu.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: MenuVO.java
 * @author	: pdh
 * @date	: 2017/2/2 10:51:57
 * @history	:
 * @comment	:
 */

@SuppressWarnings("serial")
public class MenuVO implements Serializable{


	private Integer menuKey;
	private Integer fkey;
	private Integer pkey;
	private Integer okey;
	private Integer gkey;
	
	private String menuNm;

	private String naviFlg;
	private String menuTyp;
	private String linkTyp;
	private Integer boardKey;
	private Integer contentKey;
	private String url;
	private String subViewTyp;
	private String actFlg;
	
	private String mainTopImgOn;
	private String mainTopImgOff;
	private String topImgOn;
	private String topImgOff;
	private String leftTopImg;
	private String leftImgOn;
	private String leftImgOff;
	private String titleImg;
	
	private String frstOperId;
	private Date frstOperDt;
	private String lastOperId;
	private Date lastOperDt;
	
	private List<MenuVO> childList;

	
	public MenuVO(){
	}


	public Integer getMenuKey(){
		return menuKey;
	}
	public void setMenuKey(Integer menuKey){
		this.menuKey = menuKey;
	}

	public Integer getFkey(){
		return fkey;
	}
	public void setFkey(Integer fkey){
		this.fkey = fkey;
	}

	public Integer getPkey(){
		return pkey;
	}
	public void setPkey(Integer pkey){
		this.pkey = pkey;
	}

	public Integer getOkey(){
		return okey;
	}
	public void setOkey(Integer okey){
		this.okey = okey;
	}

	public Integer getGkey(){
		return gkey;
	}
	public void setGkey(Integer gkey){
		this.gkey = gkey;
	}

	public String getMenuNm(){
		return menuNm;
	}
	public void setMenuNm(String menuNm){
		this.menuNm = menuNm;
	}

	public String getNaviFlg() {
		return naviFlg;
	}
	public void setNaviFlg(String naviFlg) {
		this.naviFlg = naviFlg;
	}

	public String getMenuTyp() {
		return menuTyp;
	}
	public void setMenuTyp(String menuTyp) {
		this.menuTyp = menuTyp;
	}
	
	public String getLinkTyp(){
		return linkTyp;
	}
	public void setLinkTyp(String linkTyp){
		this.linkTyp = linkTyp;
	}

	public Integer getBoardKey(){
		return boardKey;
	}
	public void setBoardKey(Integer boardKey){
		this.boardKey = boardKey;
	}

	public Integer getContentKey(){
		return contentKey;
	}
	public void setContentKey(Integer contentKey){
		this.contentKey = contentKey;
	}

	public String getUrl(){
		return url;
	}
	public void setUrl(String url){
		this.url = url;
	}

	public String getSubViewTyp(){
		return subViewTyp;
	}
	public void setSubViewTyp(String subViewTyp){
		this.subViewTyp = subViewTyp;
	}

	public String getActFlg(){
		return actFlg;
	}
	public void setActFlg(String actFlg){
		this.actFlg = actFlg;
	}

	public String getMainTopImgOn(){
		return mainTopImgOn;
	}
	public void setMainTopImgOn(String mainTopImgOn){
		this.mainTopImgOn = mainTopImgOn;
	}

	public String getMainTopImgOff(){
		return mainTopImgOff;
	}
	public void setMainTopImgOff(String mainTopImgOff){
		this.mainTopImgOff = mainTopImgOff;
	}

	public String getTopImgOn(){
		return topImgOn;
	}
	public void setTopImgOn(String topImgOn){
		this.topImgOn = topImgOn;
	}

	public String getTopImgOff(){
		return topImgOff;
	}
	public void setTopImgOff(String topImgOff){
		this.topImgOff = topImgOff;
	}

	public String getLeftTopImg(){
		return leftTopImg;
	}
	public void setLeftTopImg(String leftTopImg){
		this.leftTopImg = leftTopImg;
	}

	public String getLeftImgOn(){
		return leftImgOn;
	}
	public void setLeftImgOn(String leftImgOn){
		this.leftImgOn = leftImgOn;
	}

	public String getLeftImgOff(){
		return leftImgOff;
	}
	public void setLeftImgOff(String leftImgOff){
		this.leftImgOff = leftImgOff;
	}

	public String getTitleImg(){
		return titleImg;
	}
	public void setTitleImg(String titleImg){
		this.titleImg = titleImg;
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

	public String getMenuUrl() {
		
		if(!this.getLinkTyp().equals("EMPTY")) {
			String prefix = "";
			if(this.getMenuTyp().equals("DEF")) {
				prefix = "";
			}else if(this.getMenuTyp().equals("CSL")) {
				prefix = "/csl";
			}else if(this.getMenuTyp().equals("ENG")) {
				prefix = "/eng";
			}
			
			if(this.getLinkTyp().equals("FRAME")) {
				return prefix + "/bridge/frameView.do?menuKey=" + this.getMenuKey();
				
			}else if(this.getLinkTyp().equals("SCRIPT")) {
				return prefix + "/bridge/scriptView.do?menuKey=" + this.getMenuKey();
				
			}else if(this.getLinkTyp().equals("URL")) {
				if(this.getUrl() != null && this.getUrl().length() > 0) {
					if(StringUtils.startsWith(this.getUrl(), "http")){
						return prefix + "/bridge/urlView.do?menuKey=" + this.getMenuKey();
					}else{
						if(this.getUrl().indexOf("?") != -1) {
							return this.getUrl() + "&menuKey=" + this.menuKey;
						} else {
							return this.getUrl() + "?menuKey=" + this.menuKey;
						}
					}
				}
			}else if(this.getLinkTyp().equals("BOARD")) {
				return prefix + "/article/list.do?menuKey=" + this.getMenuKey() + "&boardKey=" + this.getBoardKey();	
			}else if(this.getLinkTyp().equals("CONTENT")) {
				return prefix + "/content/view.do?menuKey=" + this.getMenuKey() + "&contentKey=" + this.getContentKey();	
			}
		}
		return "#none";
	}

	public List<MenuVO> getChildList() {
		return childList;
	}
	public void setChildList(List<MenuVO> childList) {
		this.childList = childList;
	}

	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
