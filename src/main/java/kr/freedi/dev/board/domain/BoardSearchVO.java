package kr.freedi.dev.board.domain;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

/**
 * @project : dev_default
 * @file 	: BoardSearchVO.java
 * @date	: 2017. 2. 20.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class BoardSearchVO extends CommonVO {

	@ParamField
	private String searchClass;
	
	@ParamField
	private String searchValue;
	
	@ParamField
	private String searchActFlg;
	
	@ParamField
	private String searchSearchFlg;
	
	@ParamField
	private String searchRssFlg;
	
	@ParamField
	private String searchStartFrstOperDt;
	@ParamField
	private String searchEndFrstOperDt;
	
	
	public BoardSearchVO(){
		super.setOrderBy("BOARD_NM");
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchActFlg() {
		return searchActFlg;
	}

	public void setSearchActFlg(String searchActFlg) {
		this.searchActFlg = searchActFlg;
	}

	public String getSearchSearchFlg() {
		return searchSearchFlg;
	}

	public void setSearchSearchFlg(String searchSearchFlg) {
		this.searchSearchFlg = searchSearchFlg;
	}

	public String getSearchRssFlg() {
		return searchRssFlg;
	}

	public void setSearchRssFlg(String searchRssFlg) {
		this.searchRssFlg = searchRssFlg;
	}

	public String getSearchClass() {
		return searchClass;
	}

	public void setSearchClass(String searchClass) {
		this.searchClass = searchClass;
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
