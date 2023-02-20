package kr.freedi.dev.article.domain;

import kr.freedi.dev.common.domain.CommonVO;

public class ArticleCommentSearchVO extends CommonVO {

	private Integer articleKey;
	private String searchDeleteFlg;
	
	
	
	public ArticleCommentSearchVO(){
		super.setRecordCountPerPage(10);
	}

	public Integer getArticleKey() {
		return articleKey;
	}

	public void setArticleKey(Integer articleKey) {
		this.articleKey = articleKey;
	}

	public String getSearchDeleteFlg() {
		return searchDeleteFlg;
	}

	public void setSearchDeleteFlg(String searchDeleteFlg) {
		this.searchDeleteFlg = searchDeleteFlg;
	}
}
