package kr.freedi.dev.user.domain;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

/**
 * @project : dev_default
 * @file 	: MngrUserSearchVO.java
 * @date	: 2017. 2. 17.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class MngrUserSearchVO extends CommonVO {

	@ParamField
	private String searchClass;
	
	@ParamField
	private String searchValue;
	
	@ParamField
	private String searchRegSt;
	
	@ParamField
	private String searchAuthId;
	
	@ParamField
	private String searchStartFrstOperDt;
	@ParamField
	private String searchEndFrstOperDt;
	
	
	public MngrUserSearchVO(){
		super.setOrderBy("USER_NM");
	}

	
	public String getSearchClass() {
		return searchClass;
	}

	public void setSearchClass(String searchClass) {
		this.searchClass = searchClass;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchRegSt() {
		return searchRegSt;
	}

	public void setSearchRegSt(String searchRegSt) {
		this.searchRegSt = searchRegSt;
	}

	public String getSearchAuthId() {
		return searchAuthId;
	}

	public void setSearchAuthId(String searchAuthId) {
		this.searchAuthId = searchAuthId;
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


