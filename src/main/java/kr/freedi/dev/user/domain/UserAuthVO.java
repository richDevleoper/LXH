package kr.freedi.dev.user.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: UserAuthVO.java
 * @author	: pdh
 * @date	: 2017/2/4 11:38:47
 * @history	:
 * @comment	:
 */

public class UserAuthVO {

	private String authId;
	private String authNm;
	private String userGrp;
	private Integer orderNo;
	private String actFlg;
	private String frstOperId;
	private Date frstOperDt;
	private String lastOperId;
	private Date lastOperDt;

	public UserAuthVO(){
	}


	public String getAuthId(){
		return authId;
	}
	public void setAuthId(String authId){
		this.authId = authId;
	}

	public String getAuthNm(){
		return authNm;
	}
	public void setAuthNm(String authNm){
		this.authNm = authNm;
	}

	public String getUserGrp(){
		return userGrp;
	}
	public void setUserGrp(String userGrp){
		this.userGrp = userGrp;
	}

	public Integer getOrderNo(){
		return orderNo;
	}
	public void setOrderNo(Integer orderNo){
		this.orderNo = orderNo;
	}

	public String getActFlg(){
		return actFlg;
	}
	public void setActFlg(String actFlg){
		this.actFlg = actFlg;
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

}
