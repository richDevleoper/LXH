package kr.freedi.dev.board.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: BoardVO.java
 * @author	: pdh
 * @date	: 2017/2/1 15:57:28
 * @history	:
 * @comment	:
 */

public class BoardVO {

	private Integer boardKey;
	private String boardNm;
	private String boardTyp;
	private String actFlg;
	private String catgrFlg;
	private String catgrId;
	private String noticeFlg;
	private String replyFlg;
	private String commentFlg;
	private String wysiwygFlg;
	private String searchFlg;
	private String rssFlg;
	private String secretFlg;
	private String viewPrdFlg;
	private String attachFlg;
	private Integer attachCnt;
	private Integer attachSiz;
	private Integer newPrd;
	private Integer pageRows;
	private Integer pageCols;
	private String headHtml;
	private String footHtml;
	private String frstOperId;
	private Date frstOperDt;
	private String lastOperId;
	private Date lastOperDt;

	public BoardVO(){
	}


	public Integer getBoardKey(){
		return boardKey;
	}
	public void setBoardKey(Integer boardKey){
		this.boardKey = boardKey;
	}

	public String getBoardNm(){
		return boardNm;
	}
	public void setBoardNm(String boardNm){
		this.boardNm = boardNm;
	}

	public String getBoardTyp(){
		return boardTyp;
	}
	public void setBoardTyp(String boardTyp){
		this.boardTyp = boardTyp;
	}

	public String getActFlg(){
		return actFlg;
	}
	public void setActFlg(String actFlg){
		this.actFlg = actFlg;
	}

	public String getCatgrFlg(){
		return catgrFlg;
	}
	public void setCatgrFlg(String catgrFlg){
		this.catgrFlg = catgrFlg;
	}

	public String getCatgrId(){
		return catgrId;
	}
	public void setCatgrId(String catgrId){
		this.catgrId = catgrId;
	}

	public String getNoticeFlg(){
		return noticeFlg;
	}
	public void setNoticeFlg(String noticeFlg){
		this.noticeFlg = noticeFlg;
	}

	public String getReplyFlg(){
		return replyFlg;
	}
	public void setReplyFlg(String replyFlg){
		this.replyFlg = replyFlg;
	}

	public String getCommentFlg(){
		return commentFlg;
	}
	public void setCommentFlg(String commentFlg){
		this.commentFlg = commentFlg;
	}

	public String getWysiwygFlg(){
		return wysiwygFlg;
	}
	public void setWysiwygFlg(String wysiwygFlg){
		this.wysiwygFlg = wysiwygFlg;
	}

	public String getSearchFlg(){
		return searchFlg;
	}
	public void setSearchFlg(String searchFlg){
		this.searchFlg = searchFlg;
	}

	public String getRssFlg(){
		return rssFlg;
	}
	public void setRssFlg(String rssFlg){
		this.rssFlg = rssFlg;
	}

	public String getAttachFlg(){
		return attachFlg;
	}
	public void setAttachFlg(String attachFlg){
		this.attachFlg = attachFlg;
	}

	public Integer getAttachCnt(){
		return attachCnt;
	}
	public void setAttachCnt(Integer attachCnt){
		this.attachCnt = attachCnt;
	}

	public Integer getAttachSiz(){
		return attachSiz;
	}
	public void setAttachSiz(Integer attachSiz){
		this.attachSiz = attachSiz;
	}

	public Integer getNewPrd(){
		return newPrd;
	}
	public void setNewPrd(Integer newPrd){
		this.newPrd = newPrd;
	}

	public Integer getPageRows(){
		return pageRows;
	}
	public void setPageRows(Integer pageRows){
		this.pageRows = pageRows;
	}

	public Integer getPageCols(){
		return pageCols;
	}
	public void setPageCols(Integer pageCols){
		this.pageCols = pageCols;
	}

	public String getHeadHtml(){
		return headHtml;
	}
	public void setHeadHtml(String headHtml){
		this.headHtml = headHtml;
	}

	public String getFootHtml(){
		return footHtml;
	}
	public void setFootHtml(String footHtml){
		this.footHtml = footHtml;
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


	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}


	public String getSecretFlg() {
		return secretFlg;
	}


	public void setSecretFlg(String secretFlg) {
		this.secretFlg = secretFlg;
	}


	public String getViewPrdFlg() {
		return viewPrdFlg;
	}


	public void setViewPrdFlg(String viewPrdFlg) {
		this.viewPrdFlg = viewPrdFlg;
	}

}
