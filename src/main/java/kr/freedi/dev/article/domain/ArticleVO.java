package kr.freedi.dev.article.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import kr.freedi.dev.attachfile.domain.AttachFileVO;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: ArticleVO.java
 * @author	: pdh
 * @date	: 2017/2/1 23:40:16
 * @history	:
 * @comment	:
 */

public class ArticleVO implements Serializable {

	private static final long serialVersionUID = -1151665876944102315L;
	private Integer articleKey;
	private Integer boardKey;
	private Integer fkey;
	private Integer pkey;
	private Integer okey;
	private Integer gkey;
	private String catgr;
	private String title;
	private String content;
	private String writer;
	private String writerPwd;
	private String noticeFlg;
	private String secretFlg;
	private Date viewStartDt;
	private Date viewEndDt;
	private String deleteTyp;
	private String deleteFlg;
	private Integer viewCnt;
	private String moveFlg;
	private Date moveDt;
	private Integer orgnlBoardKey;
	private String frstOperId;
	private Date frstOperDt;
	private String frstOperIp;
	private String lastOperId;
	private Date lastOperDt;
	private String lastOperIp;
	
	//private Integer operPrd;
	private Long operPrd;	//J's 20230202
	private List<AttachFileVO> fileList;
	

	public ArticleVO(){
	}


	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
	
	public Integer getArticleKey(){
		return articleKey;
	}
	public void setArticleKey(Integer articleKey){
		this.articleKey = articleKey;
	}

	public Integer getBoardKey(){
		return boardKey;
	}
	public void setBoardKey(Integer boardKey){
		this.boardKey = boardKey;
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

	public String getCatgr(){
		return catgr;
	}
	public void setCatgr(String catgr){
		this.catgr = catgr;
	}

	public String getTitle(){
		return title;
	}
	public void setTitle(String title){
		this.title = title;
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

	public String getNoticeFlg(){
		return noticeFlg;
	}
	public void setNoticeFlg(String noticeFlg){
		this.noticeFlg = noticeFlg;
	}

	public String getDeleteTyp(){
		return deleteTyp;
	}
	public void setDeleteTyp(String deleteTyp){
		this.deleteTyp = deleteTyp;
	}

	public String getDeleteFlg(){
		return deleteFlg;
	}
	public void setDeleteFlg(String deleteFlg){
		this.deleteFlg = deleteFlg;
	}

	public Integer getViewCnt(){
		return viewCnt;
	}
	public void setViewCnt(Integer viewCnt){
		this.viewCnt = viewCnt;
	}

	public String getMoveFlg(){
		return moveFlg;
	}
	public void setMoveFlg(String moveFlg){
		this.moveFlg = moveFlg;
	}

	public Date getMoveDt(){
		return moveDt;
	}
	public void setMoveDt(Date moveDt){
		this.moveDt = moveDt;
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

	public List<AttachFileVO> getFileList() {
		return fileList;
	}
	public void setFileList(List<AttachFileVO> fileList) {
		this.fileList = fileList;
	}

	public Integer getOrgnlBoardKey() {
		return orgnlBoardKey;
	}

	public void setOrgnlBoardKey(Integer orgnlBoardKey) {
		this.orgnlBoardKey = orgnlBoardKey;
	}

//	public Integer getOperPrd() {
//		return operPrd;
//	}
//
//	public void setOperPrd(Integer operPrd) {
//		this.operPrd = operPrd;
//	}

	public String getSecretFlg() {
		return secretFlg;
	}

	public void setSecretFlg(String secretFlg) {
		this.secretFlg = secretFlg;
	}

	public Date getViewStartDt() {
		return viewStartDt;
	}

	public void setViewStartDt(Date viewStartDt) {
		this.viewStartDt = viewStartDt;
	}

	public Date getViewEndDt() {
		return viewEndDt;
	}

	public void setViewEndDt(Date viewEndDt) {
		this.viewEndDt = viewEndDt;
	}


	public Long getOperPrd() {
		return operPrd;
	}


	public void setOperPrd(Long operPrd) {
		this.operPrd = operPrd;
	}
	
	
	
}
