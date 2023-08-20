package kr.freedi.dev.user.domain;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

/**
 * @project : dev_default
 * @file 	: UserAuthSearchVO.java
 * @date	: 2017. 2. 16.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class UserAuthSearchVO extends CommonVO {

	@ParamField
	private String searchClass;
	
	@ParamField
	private String searchValue;
	
	@ParamField
	private String searchUserGrp;
	
	@ParamField
	private String searchStartFrstOperDt;
	@ParamField
	private String searchEndFrstOperDt;
	
	
	public UserAuthSearchVO() {
	}

	
	public String getSearchUserGrp() {
		return searchUserGrp;
	}

	public void setSearchUserGrp(String searchUserGrp) {
		this.searchUserGrp = searchUserGrp;
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


