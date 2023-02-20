package kr.freedi.dev.content.domain;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

/**
 * @project : dev_default
 * @file 	: ContentSearchVO.java
 * @date	: 2017. 2. 22.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class ContentSearchVO extends CommonVO {

	@ParamField
	private String searchClass;
	
	@ParamField
	private String searchValue;
	
	@ParamField
	private String searchActFlg;
	
	@ParamField
	private String searchStartFrstOperDt;
	@ParamField
	private String searchEndFrstOperDt;
	
	
	public ContentSearchVO(){
		super.setOrderBy("TITLE");
	}

	
	public String getSearchClass() {
		return searchClass;
	}
	public void setSearchClass(String searchClass) {
		this.searchClass = searchClass;
	}

	public String getSearchValue() {
		return searchValue == null ? null : searchValue.replaceAll("\\s{2,}", " ");
	}
	public String[] getSearchItrValue() {
		return this.getSearchValue() == null ? null : this.getSearchValue().split(" ");
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}


	public String getSearchActFlg() {
		return searchActFlg;
	}


	public void setSearchActFlg(String searchActFlg) {
		this.searchActFlg = searchActFlg;
	}


	public String getSearchStartFrstOperDt() {
		return searchStartFrstOperDt;
	}


	public void setSearchStartFrstOperDt(String searchStartFrstOperDt) {
		this.searchStartFrstOperDt = searchStartFrstOperDt;
	}


	public String getSearchEndFrstOperDt() {
		return searchEndFrstOperDt;
	}


	public void setSearchEndFrstOperDt(String searchEndFrstOperDt) {
		this.searchEndFrstOperDt = searchEndFrstOperDt;
	}
	
	
}
