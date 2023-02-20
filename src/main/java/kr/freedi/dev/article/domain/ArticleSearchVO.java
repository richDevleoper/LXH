package kr.freedi.dev.article.domain;

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
public class ArticleSearchVO extends CommonVO {

	@ParamField
	private Integer boardKey;
	
	@ParamField
	private String searchCatgr;
	
	@ParamField
	private String searchClass;
	
	@ParamField
	private String searchValue;
	
	@ParamField
	private String searchStartFrstOperDt;
	@ParamField
	private String searchEndFrstOperDt;
	
	//NoneParamField
	private String searchViewPrdFlg;
	private String searchDeleteFlg;
	private String searchWriterPwd;
	
	private String orderByTyp;

	
	public ArticleSearchVO(){
	}

	
	public Integer getBoardKey() {
		return boardKey;
	}

	public void setBoardKey(Integer boardKey) {
		this.boardKey = boardKey;
	}

	public String getSearchCatgr() {
		return searchCatgr;
	}

	public void setSearchCatgr(String searchCatgr) {
		this.searchCatgr = searchCatgr;
	}

	public String getSearchClass() {
		return searchClass;
	}

	public void setSearchClass(String searchClass) {
		this.searchClass = searchClass;
	}

	public String getSearchValue() {
		return searchValue == null ? null : searchValue.replaceAll("\\s{2,}", " ");
	}
	public String[] getSearchItrValue() {
		return this.getSearchValue() == null ? null : this.getSearchValue().split(" ");
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getSearchWriterPwd() {
		return searchWriterPwd;
	}
	public void setSearchWriterPwd(String searchWriterPwd) {
		this.searchWriterPwd = searchWriterPwd;
	}

	public String getSearchDeleteFlg() {
		return searchDeleteFlg;
	}
	public void setSearchDeleteFlg(String searchDeleteFlg) {
		this.searchDeleteFlg = searchDeleteFlg;
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


	public String getOrderByTyp() {
		return orderByTyp;
	}


	public void setOrderByTyp(String orderByTyp) {
		this.orderByTyp = orderByTyp;
	}


	public String getSearchViewPrdFlg() {
		return searchViewPrdFlg;
	}


	public void setSearchViewPrdFlg(String searchViewPrdFlg) {
		this.searchViewPrdFlg = searchViewPrdFlg;
	}

}
