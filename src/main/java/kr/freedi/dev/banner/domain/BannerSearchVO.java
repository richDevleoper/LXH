package kr.freedi.dev.banner.domain;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

import org.apache.commons.lang3.builder.ToStringBuilder;


/**
 * @project	: default
 * @file	: BannerSearchVO.java
 * @author	: pdh
 * @date	: 2017/2/4 19:47:20
 * @history	:
 * @comment	:
 */

public class BannerSearchVO extends CommonVO {

	@ParamField
	private String searchClass;
	
	@ParamField
	private String searchValue;
	
	@ParamField
	private String searchLocateTyp;
	
	@ParamField
	private String searchPbsh;
	
	@ParamField
	private String searchStartFrstOperDt;
	@ParamField
	private String searchEndFrstOperDt;

	
	public BannerSearchVO(){
		super.setOrderBy("FRST_OPER_DT");
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

	public String getSearchLocateTyp() {
		return searchLocateTyp;
	}

	public void setSearchLocateTyp(String searchLocateTyp) {
		this.searchLocateTyp = searchLocateTyp;
	}

	public String getSearchPbsh() {
		return searchPbsh;
	}
	public void setSearchPbsh(String searchPbsh) {
		this.searchPbsh = searchPbsh;
	}
	
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
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
