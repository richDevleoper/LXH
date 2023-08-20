package kr.freedi.dev.index.domain;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

/**
 * @project : dev_default
 * @file 	: SearchAllVO.java
 * @date	: 2023. 6. 29.
 * @author	: swpark
 * @comment :  
 * @history	: 
 */
public class SearchAllVO extends CommonVO {

	
	@ParamField
	private String searchText;	//검색어
	
	@ParamField
	private String searchType; // 검색타입

	public String getSearchText() {
		return searchText;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	@Override
	public String toString() {
		return "SearchAllVO [searchText=" + searchText + ", searchType=" + searchType + "]";
	}
	
}
