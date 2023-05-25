package kr.freedi.dev.qapprove.domain;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

/**
 * @project : dev_default
 * @file 	: ArticleSearchVO.java
 * @date	: 2017. 2. 20.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class ApproveSearchVO extends CommonVO {

	
	@ParamField
	private String searchName;
	
	@ParamField
	private String searchDivision;
	
	@ParamField
	private String searchType;
	
	@ParamField
	private String searchStatus;
	
	private String orderByTyp;
	
	private String aprovalCode;
	
	@ParamField
	private String searchReqEmpNm;  // 결재의뢰자
	
	@ParamField
	private String searchUserId;
	
	@ParamField
	private String searchFromDt; // 조회기간(시작)
	
	@ParamField
	private String searchToDt; // 조회기간(끝)
	
	@ParamField
	private String searchGubun; // 기간조회 기준

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchDivision() {
		return searchDivision;
	}

	public void setSearchDivision(String searchDivision) {
		this.searchDivision = searchDivision;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchStatus() {
		return searchStatus;
	}

	public void setSearchStatus(String searchStatus) {
		this.searchStatus = searchStatus;
	}

	public String getOrderByTyp() {
		return orderByTyp;
	}

	public void setOrderByTyp(String orderByTyp) {
		this.orderByTyp = orderByTyp;
	}

	public String getAprovalCode() {
		return aprovalCode;
	}

	public void setAprovalCode(String aprovalCode) {
		this.aprovalCode = aprovalCode;
	}

	public String getSearchUserId() {
		return searchUserId;
	}

	public void setSearchUserId(String searchUserId) {
		this.searchUserId = searchUserId;
	}

	public String getSearchFromDt() {
		return searchFromDt;
	}

	public void setSearchFromDt(String searchFromDt) {
		this.searchFromDt = searchFromDt;
	}

	public String getSearchToDt() {
		return searchToDt;
	}

	public void setSearchToDt(String searchToDt) {
		this.searchToDt = searchToDt;
	}

	public String getSearchGubun() {
		return searchGubun;
	}

	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
	}

	public String getSearchReqEmpNm() {
		return searchReqEmpNm;
	}

	public void setSearchReqEmpNm(String searchReqEmpNm) {
		this.searchReqEmpNm = searchReqEmpNm;
	}

	@Override
	public String toString() {
		return "ApproveSearchVO [searchName=" + searchName + ", searchDivision=" + searchDivision + ", searchType="
				+ searchType + ", searchStatus=" + searchStatus + ", orderByTyp=" + orderByTyp + ", aprovalCode="
				+ aprovalCode + ", searchReqEmpNm=" + searchReqEmpNm + ", searchUserId=" + searchUserId
				+ ", searchFromDt=" + searchFromDt + ", searchToDt=" + searchToDt + ", searchGubun=" + searchGubun
				+ "]";
	}

}
