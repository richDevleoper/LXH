package kr.freedi.dev.qkpi.domain;

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
public class KpiSearchVO extends CommonVO {

	
	@ParamField
	private String kudIdx;	// 6Sigma / MBB 구분
	
	@ParamField
	private String searchYear;	// 연도
	
	@ParamField
	private String searchMonth;
	
	@ParamField
	private String searchDepart;		// 조직
	
	@ParamField
	private String searchDepartName;		// 조직
	
	@ParamField
	private String searchWorkPlace;		// 사업장
	
	@ParamField
	private String searchBelt;	// 인증현황(MBB / BB / ,,,)
	
	private String searchIdx;	// 검색구분
	
	private String searchText;	// 검색어
	
	private String orderByTyp;


	public String getKudIdx() {
		return kudIdx;
	}


	public String getSearchYear() {
		return searchYear;
	}


	public String getSearchMonth() {
		return searchMonth;
	}


	public void setSearchMonth(String searchMonth) {
		this.searchMonth = searchMonth;
	}


	public String getSearchDepart() {
		return searchDepart;
	}


	public String getSearchBelt() {
		return searchBelt;
	}


	public String getSearchIdx() {
		return searchIdx;
	}


	public String getSearchText() {
		return searchText;
	}


	public String getOrderByTyp() {
		return orderByTyp;
	}


	public void setKudIdx(String kudIdx) {
		this.kudIdx = kudIdx;
	}


	public void setSearchYear(String searchYear) {
		this.searchYear = searchYear;
	}


	public void setSearchDepart(String searchDepart) {
		this.searchDepart = searchDepart;
	}


	public void setSearchBelt(String searchBelt) {
		this.searchBelt = searchBelt;
	}


	public void setSearchIdx(String searchIdx) {
		this.searchIdx = searchIdx;
	}


	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}


	public void setOrderByTyp(String orderByTyp) {
		this.orderByTyp = orderByTyp;
	}


	public String getSearchDepartName() {
		return searchDepartName;
	}


	public void setSearchDepartName(String searchDepartName) {
		this.searchDepartName = searchDepartName;
	}


	public String getSearchWorkPlace() {
		return searchWorkPlace;
	}


	public void setSearchWorkPlace(String searchWorkPlace) {
		this.searchWorkPlace = searchWorkPlace;
	}


	@Override
	public String toString() {
		return "KpiSearchVO [kudIdx=" + kudIdx + ", searchYear=" + searchYear + ", searchMonth=" + searchMonth
				+ ", searchDepart=" + searchDepart + ", searchDepartName=" + searchDepartName + ", searchWorkPlace="
				+ searchWorkPlace + ", searchBelt=" + searchBelt + ", searchIdx=" + searchIdx + ", searchText="
				+ searchText + ", orderByTyp=" + orderByTyp + "]";
	}
	
}
