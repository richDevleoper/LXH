package kr.freedi.dev.qproposal.domain;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

public class ProposalSearchVO extends CommonVO{

	@ParamField
	private String searchPropCategoryCode;
	@ParamField
	private String searchPropName;
	@ParamField
	private String searchPropTypeCode;
	@ParamField
	private String searchPropClassCode;
	@ParamField
	private String searchPropFromDate;
	@ParamField
	private String searchPropToDate;
	@ParamField
	private int searchPropSeq;
	
	
	
	public String getSearchPropCategoryCode() {
		return searchPropCategoryCode;
	}
	public void setSearchPropCategoryCode(String searchPropCategoryCode) {
		this.searchPropCategoryCode = searchPropCategoryCode;
	}
	public String getSearchPropName() {
		return searchPropName;
	}
	public void setSearchPropName(String searchPropName) {
		this.searchPropName = searchPropName;
	}
	public String getSearchPropTypeCode() {
		return searchPropTypeCode;
	}
	public void setSearchPropTypeCode(String searchPropTypeCode) {
		this.searchPropTypeCode = searchPropTypeCode;
	}
	public String getSearchPropClassCode() {
		return searchPropClassCode;
	}
	public void setSearchPropClassCode(String searchPropClassCode) {
		this.searchPropClassCode = searchPropClassCode;
	}
	public String getSearchPropFromDate() {
		return searchPropFromDate;
	}
	public void setSearchPropFromDate(String searchPropFromDate) {
		this.searchPropFromDate = searchPropFromDate;
	}
	public String getSearchPropToDate() {
		return searchPropToDate;
	}
	public void setSearchPropToDate(String searchPropToDate) {
		this.searchPropToDate = searchPropToDate;
	}
	public int getSearchPropSeq() {
		return searchPropSeq;
	}
	public void setSearchPropSeq(int searchPropSeq) {
		this.searchPropSeq = searchPropSeq;
	}
}
