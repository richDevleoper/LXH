package kr.freedi.dev.code.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

/**
 * @project : cms_10_oracle
 * @file 	: SearchCodeVO.java
 * @author	: ParkDongHee
 * @date	: 2014. 9. 3. 오후 10:39:36
 * @history	:
 * 
 * @comment : 
 * 
 * 
 * 
 */
public class CodeSearchVO extends CommonVO {
	@ParamField
	private String searchSelect;
	@ParamField
	private String searchValue;
	@ParamField
	private String searchCodeGrpId;
	
	
	public CodeSearchVO(){
		
	}
	
	public String getSearchSelect() {
		return searchSelect;
	}
	public void setSearchSelect(String searchSelect) {
		this.searchSelect = searchSelect;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchCodeGrpId() {
		return searchCodeGrpId;
	}

	public void setSearchCodeGrpId(String searchCodeGrpId) {
		this.searchCodeGrpId = searchCodeGrpId;
	}
	
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
