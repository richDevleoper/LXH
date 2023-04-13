package kr.freedi.dev.qreport.domain;

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
public class ReportSearchVO extends CommonVO {

	
	@ParamField
	private String searchRepName;
	
	@ParamField
	private String searchDivision;
	
	@ParamField
	private String searchType;
	
	@ParamField
	private String searchStatus;
	
	private String orderByTyp;

	public String getSearchRepName() {
		return searchRepName;
	}

	public void setSearchRepName(String searchRepName) {
		this.searchRepName = searchRepName;
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
}