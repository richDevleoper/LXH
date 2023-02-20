package kr.freedi.dev.user.domain;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: CorpUserVO.java
 * @author	: pdh
 * @date	: 2017/2/5 13:11:48
 * @history	:
 * @comment	:
 */

public class CorpUserVO implements Serializable {

	private static final long serialVersionUID = 6776601336079408387L;
	private String userId;
	private String userPw;
	private String userNm;
	private String chrTel;
	private String chrMob;
	private String chrFax;
	private String chrEmail;
	private String chrZip;
	private String chrAddr1;
	private String chrAddr2;
	private String corpId;
	private String corpNm;
	private String corpTel;
	private String corpMob;
	private String corpFax;
	private String corpEmail;
	private String corpZip;
	private String corpAddr1;
	private String corpAddr2;
	private String regSt;
	private String authId;
	private Date lastLoginDt;
	private Date frstOperDt;
	private Date lastOperDt;

	public CorpUserVO(){
	}


	public String getUserId(){
		return userId;
	}
	public void setUserId(String userId){
		this.userId = userId;
	}

	public String getUserPw(){
		return userPw;
	}
	public void setUserPw(String userPw){
		this.userPw = userPw;
	}

	public String getUserNm(){
		return userNm;
	}
	public void setUserNm(String userNm){
		this.userNm = userNm;
	}

	public String getChrTel(){
		return chrTel;
	}
	public void setChrTel(String chrTel){
		this.chrTel = chrTel;
	}

	public String getChrMob(){
		return chrMob;
	}
	public void setChrMob(String chrMob){
		this.chrMob = chrMob;
	}

	public String getChrFax(){
		return chrFax;
	}
	public void setChrFax(String chrFax){
		this.chrFax = chrFax;
	}

	public String getChrEmail(){
		return chrEmail;
	}
	public void setChrEmail(String chrEmail){
		this.chrEmail = chrEmail;
	}

	public String getChrZip(){
		return chrZip;
	}
	public void setChrZip(String chrZip){
		this.chrZip = chrZip;
	}

	public String getChrAddr1(){
		return chrAddr1;
	}
	public void setChrAddr1(String chrAddr1){
		this.chrAddr1 = chrAddr1;
	}

	public String getChrAddr2(){
		return chrAddr2;
	}
	public void setChrAddr2(String chrAddr2){
		this.chrAddr2 = chrAddr2;
	}

	public String getCorpId(){
		return corpId;
	}
	public void setCorpId(String corpId){
		this.corpId = corpId;
	}

	public String getCorpNm(){
		return corpNm;
	}
	public void setCorpNm(String corpNm){
		this.corpNm = corpNm;
	}

	public String getCorpTel(){
		return corpTel;
	}
	public void setCorpTel(String corpTel){
		this.corpTel = corpTel;
	}

	public String getCorpMob(){
		return corpMob;
	}
	public void setCorpMob(String corpMob){
		this.corpMob = corpMob;
	}

	public String getCorpFax(){
		return corpFax;
	}
	public void setCorpFax(String corpFax){
		this.corpFax = corpFax;
	}

	public String getCorpEmail(){
		return corpEmail;
	}
	public void setCorpEmail(String corpEmail){
		this.corpEmail = corpEmail;
	}

	public String getCorpZip(){
		return corpZip;
	}
	public void setCorpZip(String corpZip){
		this.corpZip = corpZip;
	}

	public String getCorpAddr1(){
		return corpAddr1;
	}
	public void setCorpAddr1(String corpAddr1){
		this.corpAddr1 = corpAddr1;
	}

	public String getCorpAddr2(){
		return corpAddr2;
	}
	public void setCorpAddr2(String corpAddr2){
		this.corpAddr2 = corpAddr2;
	}

	public String getRegSt(){
		return regSt;
	}
	public void setRegSt(String regSt){
		this.regSt = regSt;
	}

	public String getAuthId(){
		return authId;
	}
	public void setAuthId(String authId){
		this.authId = authId;
	}

	public Date getLastLoginDt(){
		return lastLoginDt;
	}
	public void setLastLoginDt(Date lastLoginDt){
		this.lastLoginDt = lastLoginDt;
	}

	public Date getFrstOperDt(){
		return frstOperDt;
	}
	public void setFrstOperDt(Date frstOperDt){
		this.frstOperDt = frstOperDt;
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

}
