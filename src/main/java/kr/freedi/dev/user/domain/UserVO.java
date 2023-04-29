package kr.freedi.dev.user.domain;

import java.io.Serializable;
import java.util.List;

import kr.freedi.dev.article.domain.ArticleVO;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project : dev_default
 * @file 	: UserVO.java
 * @date	: 2017. 2. 17.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class UserVO implements Serializable {

	private static final long serialVersionUID = 5177597960167431226L;
	private final String USER_TYP_MNGR = "MNGR_USER"; //관리자
	private final String USER_TYP_GENR = "GENR_USER"; //개인회원
	private final String USER_TYP_CORP = "CORP_USER"; //기업회원
	private final String USER_TYP_GUEST = "GUEST_USER"; //비로그인
	
	private String userTyp;
	//private String userId;
	
	private MngrUserVO mngrUserVO;
	private GenrUserVO genrUserVO;
	private CorpUserVO corpUserVO;
	private IntfUserVO intfUserVO;
	
	private String loginYmdt;
	private String locale;
	private String ipAddr;
	private String sessionId;
	
	private List<Integer> cslMenuUseKeys;
	
	private ArticleVO currentArticleVO;
	
	
	public UserVO(){
		userTyp = "GUEST_USER";
	}
	
	
	public String getUserId() {
		if(StringUtils.equals(userTyp, USER_TYP_MNGR)){
			return mngrUserVO.getUserId();
		}else if(StringUtils.equals(userTyp, USER_TYP_GENR)){
			return genrUserVO.getUserId();
		}else if(StringUtils.equals(userTyp, USER_TYP_CORP)){
			return corpUserVO.getUserId();
		}
		return null;
	}
	
	public String getUserNm() {
		if(StringUtils.equals(userTyp, USER_TYP_MNGR)){
			return mngrUserVO.getUserNm();
		}else if(StringUtils.equals(userTyp, USER_TYP_GENR)){
			return genrUserVO.getUserNm();
		}else if(StringUtils.equals(userTyp, USER_TYP_CORP)){
			return corpUserVO.getUserNm();
		}
		return null;
	}
	
	public String getUserEmail() {
		if(StringUtils.equals(userTyp, USER_TYP_MNGR)){
			return mngrUserVO.getEmail();
		}else if(StringUtils.equals(userTyp, USER_TYP_GENR)){
			return genrUserVO.getEmail();
		}else if(StringUtils.equals(userTyp, USER_TYP_CORP)){
			return corpUserVO.getChrEmail();
		}
		return null;
	}
	
	public String getAuthId() {
		if(StringUtils.equals(userTyp, USER_TYP_MNGR)){
			return mngrUserVO.getAuthId();
		}else if(StringUtils.equals(userTyp, USER_TYP_GENR)){
			return genrUserVO.getAuthId();
		}else if(StringUtils.equals(userTyp, USER_TYP_CORP)){
			return corpUserVO.getAuthId();
		}
		return null;
	}
	
	public boolean isMngrUser(){
		if(StringUtils.equals(userTyp, USER_TYP_MNGR)){
			return true;
		}
		return false;
	}
	
	public boolean isGenrUser(){
		if(StringUtils.equals(userTyp, USER_TYP_GENR)){
			return true;
		}
		return false;
	}
	
	public boolean isCorpUser(){
		if(StringUtils.equals(userTyp, USER_TYP_CORP)){
			return true;
		}
		return false;
	}

	public boolean isGuestUser(){
		if(StringUtils.equals(userTyp, USER_TYP_GUEST)){
			return true;
		}
		return false;
	}
	
	public boolean isPublicUser(){
		if(StringUtils.equals(userTyp, USER_TYP_GENR)){
			return true;
		}else if(StringUtils.equals(userTyp, USER_TYP_CORP)){
			return true;
		}
		return false; 
	}
	
	public boolean isLoginUser() {
		if(StringUtils.equals(userTyp, USER_TYP_MNGR)){
			return true;
		}else if(StringUtils.equals(userTyp, USER_TYP_GENR)){
			return true;
		}else if(StringUtils.equals(userTyp, USER_TYP_CORP)){
			return true;
		}
		return false;
	}
	
	public MngrUserVO getMngrUserVO() {
		return mngrUserVO;
	}
	public void setMngrUserVO(MngrUserVO mngrUserVO) {
		this.mngrUserVO = mngrUserVO;
	}
	public GenrUserVO getGenrUserVO() {
		return genrUserVO;
	}
	public void setGenrUserVO(GenrUserVO genrUserVO) {
		this.genrUserVO = genrUserVO;
	}
	public CorpUserVO getCorpUserVO() {
		return corpUserVO;
	}
	public void setCorpUserVO(CorpUserVO corpUserVO) {
		this.corpUserVO = corpUserVO;
	}
	public String getLoginYmdt() {
		return loginYmdt;
	}
	public void setLoginYmdt(String loginYmdt) {
		this.loginYmdt = loginYmdt;
	}
	public String getLocale() {
		return locale;
	}
	public void setLocale(String locale) {
		this.locale = locale;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public List<Integer> getCslMenuUseKeys() {
		return cslMenuUseKeys;
	}
	public void setCslMenuUseKeys(List<Integer> cslMenuUseKeys) {
		this.cslMenuUseKeys = cslMenuUseKeys;
	}
	public String getUserTyp() {
		return userTyp;
	}
	public void setUserTyp(String userTyp) {
		this.userTyp = userTyp;
	}
	
	public ArticleVO getCurrentArticleVO() {
		return currentArticleVO;
	}
	public void setCurrentArticleVO(ArticleVO currentArticleVO) {
		this.currentArticleVO = currentArticleVO;
	}
	
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}


	public IntfUserVO getIntfUserVO() {
		return intfUserVO;
	}


	public void setIntfUserVO(IntfUserVO intfUserVO) {
		this.intfUserVO = intfUserVO;
	}
}


