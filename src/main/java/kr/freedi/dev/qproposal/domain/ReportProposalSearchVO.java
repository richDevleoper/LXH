package kr.freedi.dev.qproposal.domain;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

public class ReportProposalSearchVO extends CommonVO{

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
	
	@ParamField
	private String searchGroupCode;
	@ParamField
	private String searchGroupName;
	@ParamField
	private String searchBizPlaceCode;
	@ParamField
	private String searchBizPlaceName;
	@ParamField
	private String searchPropUser;
	@ParamField
	private String searchPropUserName;
	@ParamField
	private String searchPropStatCode; // 제안검색 - 진행단계

	@ParamField
	private String searchFinalEvalUser;
	@ParamField
	private String searchFinalUserName;
	@ParamField
	private String searchCircleCode;
	@ParamField
	private String searchCircleName;
	
	@ParamField
	private String searchUserTypeCode;
	@ParamField
	private String searchPaymentCode;
	
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
	public String getSearchGroupCode() {
		return searchGroupCode;
	}
	public void setSearchGroupCode(String searchGroupCode) {
		this.searchGroupCode = searchGroupCode;
	}
	public String getSearchGroupName() {
		return searchGroupName;
	}
	public void setSearchGroupName(String searchGroupName) {
		this.searchGroupName = searchGroupName;
	}
	public String getSearchBizPlaceCode() {
		return searchBizPlaceCode;
	}
	public void setSearchBizPlaceCode(String searchBizPlaceCode) {
		this.searchBizPlaceCode = searchBizPlaceCode;
	}
	public String getSearchBizPlaceName() {
		return searchBizPlaceName;
	}
	public void setSearchBizPlaceName(String searchBizPlaceName) {
		this.searchBizPlaceName = searchBizPlaceName;
	}
	public String getSearchPropUser() {
		return searchPropUser;
	}
	public void setSearchPropUser(String searchPropUser) {
		this.searchPropUser = searchPropUser;
	}
	public String getSearchPropUserName() {
		return searchPropUserName;
	}
	public void setSearchPropUserName(String searchPropUserName) {
		this.searchPropUserName = searchPropUserName;
	}
	public String getSearchPropStatCode() {
		return searchPropStatCode;
	}
	public void setSearchPropStatCode(String searchPropStatCode) {
		this.searchPropStatCode = searchPropStatCode;
	}
	public String getSearchFinalEvalUser() {
		return searchFinalEvalUser;
	}
	public void setSearchFinalEvalUser(String searchFinalEvalUser) {
		this.searchFinalEvalUser = searchFinalEvalUser;
	}
	public String getSearchFinalUserName() {
		return searchFinalUserName;
	}
	public void setSearchFinalUserName(String searchFinalUserName) {
		this.searchFinalUserName = searchFinalUserName;
	}
	public String getSearchCircleCode() {
		return searchCircleCode;
	}
	public void setSearchCircleCode(String searchCircleCode) {
		this.searchCircleCode = searchCircleCode;
	}
	public String getSearchCircleName() {
		return searchCircleName;
	}
	public void setSearchCircleName(String searchCircleName) {
		this.searchCircleName = searchCircleName;
	}
	public String getSearchUserTypeCode() {
		return searchUserTypeCode;
	}
	public void setSearchUserTypeCode(String searchUserTypeCode) {
		this.searchUserTypeCode = searchUserTypeCode;
	}
	public String getSearchPaymentCode() {
		return searchPaymentCode;
	}
	public void setSearchPaymentCode(String searchPaymentCode) {
		this.searchPaymentCode = searchPaymentCode;
	}
}
