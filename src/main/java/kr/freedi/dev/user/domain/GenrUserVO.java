package kr.freedi.dev.user.domain;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: GenrUserVO.java
 * @author	: pdh
 * @date	: 2017/2/5 13:10:49
 * @history	:
 * @comment	:
 */

public class GenrUserVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 120809071642545805L;
	private String userId;
	private String userPw;
	private String userNm;
	private String tel;
	private String mob;
	private String email;
	private String zip;
	private String addr1;
	private String addr2;
	private String regSt;
	private String authId;
	private Date lastLoginDt;
	private Date frstOperDt;
	private Date lastOperDt;

	public GenrUserVO(){
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

	public String getTel(){
		return tel;
	}
	public void setTel(String tel){
		this.tel = tel;
	}

	public String getMob(){
		return mob;
	}
	public void setMob(String mob){
		this.mob = mob;
	}

	public String getEmail(){
		return email;
	}
	public void setEmail(String email){
		this.email = email;
	}

	public String getZip(){
		return zip;
	}
	public void setZip(String zip){
		this.zip = zip;
	}

	public String getAddr1(){
		return addr1;
	}
	public void setAddr1(String addr1){
		this.addr1 = addr1;
	}

	public String getAddr2(){
		return addr2;
	}
	public void setAddr2(String addr2){
		this.addr2 = addr2;
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
