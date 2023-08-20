package kr.freedi.dev.popup.domain;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;


/**
 * @project : dev_default
 * @file 	: PopupSearchVO.java
 * @date	: 2017. 2. 10.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class PopupSearchVO extends CommonVO {

	@ParamField
	private String searchClass;
	
	@ParamField
	private String searchValue;
	
	@ParamField
	private String searchPbsh;
	
	@ParamField
	private String searchLocateTyp;
	
	@ParamField
	private String searchStartFrstOperDt;
	@ParamField
	private String searchEndFrstOperDt;
	
	
	public PopupSearchVO(){
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

	public String getSearchPbsh() {
		return searchPbsh;
	}

	public void setSearchPbsh(String searchPbsh) {
		this.searchPbsh = searchPbsh;
	}

	public String getSearchLocateTyp() {
		return searchLocateTyp;
	}

	public void setSearchLocateTyp(String searchLocateTyp) {
		this.searchLocateTyp = searchLocateTyp;
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
