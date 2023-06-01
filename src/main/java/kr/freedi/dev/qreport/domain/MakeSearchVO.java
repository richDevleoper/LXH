package kr.freedi.dev.qreport.domain;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

public class MakeSearchVO extends CommonVO {
	@ParamField
	private String searchDiv;			// 검색구분
	private String searchText;			// 검색내용
	private String searchPlaceCode; // 사업장
	private String searchName;			// 조직
	private String cirCode;
	
	public String getSearchDiv() {
		return searchDiv;
	}
	public void setSearchDiv(String searchDiv) {
		this.searchDiv = searchDiv;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getSearchPlaceCode() {
		return searchPlaceCode;
	}
	public void setSearchPlaceCode(String searchPlaceCode) {
		this.searchPlaceCode = searchPlaceCode;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getCirCode() {
		return cirCode;
	}
	public void setCirCode(String cirCode) {
		this.cirCode = cirCode;
	}
	@Override
	public String toString() {
		return "MakeSearchVO [searchDiv=" + searchDiv + ", searchText=" + searchText + ", searchPlaceCode="
				+ searchPlaceCode + ", searchName=" + searchName + ", cirCode=" + cirCode + "]";
	}
}
