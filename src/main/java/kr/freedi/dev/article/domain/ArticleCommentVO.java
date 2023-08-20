package kr.freedi.dev.article.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: ArticleCommentVO.java
 * @author	: pdh
 * @date	: 2017/8/5 9:7:12
 * @history	:
 * @comment	:
 */

public class ArticleCommentVO {

	private Integer articleCommentKey;
	private Integer articleKey;
	private Integer fkey;
	private Integer pkey;
	private Integer okey;
	private Integer gkey;
	private String content;
	private String writer;
	private String writerPwd;
	private String deleteFlg;
	private String deleteTyp;
	private String frstOperId;
	private Date frstOperDt;
	private String frstOperIp;
	private String lastOperId;
	private Date lastOperDt;
	private String lastOperIp;
	
	private Integer boardKey;

	public ArticleCommentVO(){
	}


	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

	public Integer getArticleCommentKey(){
		return articleCommentKey;
	}
	public void setArticleCommentKey(Integer articleCommentKey){
		this.articleCommentKey = articleCommentKey;
	}

	public Integer getArticleKey(){
		return articleKey;
	}
	public void setArticleKey(Integer articleKey){
		this.articleKey = articleKey;
	}

	public Integer getFkey(){
		return fkey;
	}
	public void setFkey(Integer fkey){
		this.fkey = fkey;
	}

	public Integer getPkey(){
		return pkey;
	}
	public void setPkey(Integer pkey){
		this.pkey = pkey;
	}

	public Integer getOkey(){
		return okey;
	}
	public void setOkey(Integer okey){
		this.okey = okey;
	}

	public Integer getGkey(){
		return gkey;
	}
	public void setGkey(Integer gkey){
		this.gkey = gkey;
	}

	public String getContent(){
		return content;
	}
	public void setContent(String content){
		this.content = content;
	}

	public String getWriter(){
		return writer;
	}
	public void setWriter(String writer){
		this.writer = writer;
	}

	public String getWriterPwd(){
		return writerPwd;
	}
	public void setWriterPwd(String writerPwd){
		this.writerPwd = writerPwd;
	}

	public String getDeleteFlg(){
		return deleteFlg;
	}
	public void setDeleteFlg(String deleteFlg){
		this.deleteFlg = deleteFlg;
	}

	public String getDeleteTyp(){
		return deleteTyp;
	}
	public void setDeleteTyp(String deleteTyp){
		this.deleteTyp = deleteTyp;
	}

	public String getFrstOperId(){
		return frstOperId;
	}
	public void setFrstOperId(String frstOperId){
		this.frstOperId = frstOperId;
	}

	public Date getFrstOperDt(){
		return frstOperDt;
	}
	public void setFrstOperDt(Date frstOperDt){
		this.frstOperDt = frstOperDt;
	}

	public String getFrstOperIp(){
		return frstOperIp;
	}
	public void setFrstOperIp(String frstOperIp){
		this.frstOperIp = frstOperIp;
	}

	public String getLastOperId(){
		return lastOperId;
	}
	public void setLastOperId(String lastOperId){
		this.lastOperId = lastOperId;
	}

	public Date getLastOperDt(){
		return lastOperDt;
	}
	public void setLastOperDt(Date lastOperDt){
		this.lastOperDt = lastOperDt;
	}

	public String getLastOperIp(){
		return lastOperIp;
	}
	public void setLastOperIp(String lastOperIp){
		this.lastOperIp = lastOperIp;
	}


	public Integer getBoardKey() {
		return boardKey;
	}


	public void setBoardKey(Integer boardKey) {
		this.boardKey = boardKey;
	}


}
