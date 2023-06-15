package kr.freedi.dev.user.domain;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: LxhUserVO.java
 * @author	: pdh
 * @date	: 2023/4/26 
 * @history	:
 * @comment	:
 */

public class IntfUserVO implements Serializable {

	private static final long serialVersionUID = 6776601336079408387L;
	private String userId;
	private String userPw;
	private String userSchool;
	private String userMajor;
	private String userName;
	private String userState;
	private String userSecurityLv;
	private String userPhoneNo;
	private String userEmail;
	private String userType;
	private String userComState;
	private String userLevelFlag;
	private String comCode;
	private String comNo;
	private String comLeaderNo;
	private String comJobx;
	private String comPosition;
	private String comGroupJobx;
	private String comDepartCode;
	private String comDepartName;
	private String comWorkPlace;
	private String comSixSigmaCode;
	private String comPostBelt;
	private String comPostType;
	private String comPostRange;
	private String comCertBelt;
	private String comCertBlet2;
	private String comChargeWork;
	private Date comJoinDate;
	private String costCenter;
	private Date lastChangePwDate;
	private Date lastLoginDate;
	private Date appointmentDate;
	private Date updateDate;
	private Date regDate;
	private String authId;
	private String isAdmin; // 0 이면 Admin 아님.1 이면 Admin
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserSchool() {
		return userSchool;
	}
	public void setUserSchool(String userSchool) {
		this.userSchool = userSchool;
	}
	public String getUserMajor() {
		return userMajor;
	}
	public void setUserMajor(String userMajor) {
		this.userMajor = userMajor;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserState() {
		return userState;
	}


	public void setUserState(String userState) {
		this.userState = userState;
	}


	public String getUserSecurityLv() {
		return userSecurityLv;
	}


	public void setUserSecurityLv(String userSecurityLv) {
		this.userSecurityLv = userSecurityLv;
	}


	public String getUserPhoneNo() {
		return userPhoneNo;
	}


	public void setUserPhoneNo(String userPhoneNo) {
		this.userPhoneNo = userPhoneNo;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserType() {
		return userType;
	}


	public void setUserType(String userType) {
		this.userType = userType;
	}


	public String getUserComState() {
		return userComState;
	}


	public void setUserComState(String userComState) {
		this.userComState = userComState;
	}


	public String getUserLevelFlag() {
		return userLevelFlag;
	}


	public void setUserLevelFlag(String userLevelFlag) {
		this.userLevelFlag = userLevelFlag;
	}


	public String getComCode() {
		return comCode;
	}


	public void setComCode(String comCode) {
		this.comCode = comCode;
	}


	public String getComNo() {
		return comNo;
	}


	public void setComNo(String comNo) {
		this.comNo = comNo;
	}


	public String getComLeaderNo() {
		return comLeaderNo;
	}


	public void setComLeaderNo(String comLeaderNo) {
		this.comLeaderNo = comLeaderNo;
	}


	public String getComJobx() {
		return comJobx;
	}


	public void setComJobx(String comJobx) {
		this.comJobx = comJobx;
	}


	public String getComPosition() {
		return comPosition;
	}


	public void setComPosition(String comPosition) {
		this.comPosition = comPosition;
	}


	public String getComGroupJobx() {
		return comGroupJobx;
	}


	public void setComGroupJobx(String comGroupJobx) {
		this.comGroupJobx = comGroupJobx;
	}


	public String getComDepartCode() {
		return comDepartCode;
	}


	public void setComDepartCode(String comDepartCode) {
		this.comDepartCode = comDepartCode;
	}


	public String getComWorkPlace() {
		return comWorkPlace;
	}


	public void setComWorkPlace(String comWorkPlace) {
		this.comWorkPlace = comWorkPlace;
	}


	public String getComSixSigmaCode() {
		return comSixSigmaCode;
	}


	public void setComSixSigmaCode(String comSixSigmaCode) {
		this.comSixSigmaCode = comSixSigmaCode;
	}


	public String getComPostBelt() {
		return comPostBelt;
	}


	public void setComPostBelt(String comPostBelt) {
		this.comPostBelt = comPostBelt;
	}


	public String getComPostType() {
		return comPostType;
	}


	public void setComPostType(String comPostType) {
		this.comPostType = comPostType;
	}


	public String getComPostRange() {
		return comPostRange;
	}


	public void setComPostRange(String comPostRange) {
		this.comPostRange = comPostRange;
	}


	public String getComCertBelt() {
		return comCertBelt;
	}


	public void setComCertBelt(String comCertBelt) {
		this.comCertBelt = comCertBelt;
	}


	public String getComCertBlet2() {
		return comCertBlet2;
	}


	public void setComCertBlet2(String comCertBlet2) {
		this.comCertBlet2 = comCertBlet2;
	}


	public String getComChargeWork() {
		return comChargeWork;
	}


	public void setComChargeWork(String comChargeWork) {
		this.comChargeWork = comChargeWork;
	}


	public Date getComJoinDate() {
		return comJoinDate;
	}


	public void setComJoinDate(Date comJoinDate) {
		this.comJoinDate = comJoinDate;
	}


	public String getCostCenter() {
		return costCenter;
	}


	public void setCostCenter(String costCenter) {
		this.costCenter = costCenter;
	}


	public Date getLastChangePwDate() {
		return lastChangePwDate;
	}


	public void setLastChangePwDate(Date lastChangePwDate) {
		this.lastChangePwDate = lastChangePwDate;
	}


	public Date getLastLoginDate() {
		return lastLoginDate;
	}


	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}


	public Date getAppointmentDate() {
		return appointmentDate;
	}


	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getAuthId() {
		return authId;
	}
	public void setAuthId(String authId) {
		this.authId = authId;
	}
	public String getComDepartName() {
		return comDepartName;
	}
	public void setComDepartName(String comDepartName) {
		this.comDepartName = comDepartName;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	@Override
	public String toString() {
		return "IntfUserVO [userId=" + userId + ", userPw=" + userPw + ", userSchool=" + userSchool + ", userMajor="
				+ userMajor + ", userName=" + userName + ", userState=" + userState + ", userSecurityLv="
				+ userSecurityLv + ", userPhoneNo=" + userPhoneNo + ", userEmail=" + userEmail + ", userType="
				+ userType + ", userComState=" + userComState + ", userLevelFlag=" + userLevelFlag + ", comCode="
				+ comCode + ", comNo=" + comNo + ", comLeaderNo=" + comLeaderNo + ", comJobx=" + comJobx
				+ ", comPosition=" + comPosition + ", comGroupJobx=" + comGroupJobx + ", comDepartCode=" + comDepartCode
				+ ", comDepartName=" + comDepartName + ", comWorkPlace=" + comWorkPlace + ", comSixSigmaCode="
				+ comSixSigmaCode + ", comPostBelt=" + comPostBelt + ", comPostType=" + comPostType + ", comPostRange="
				+ comPostRange + ", comCertBelt=" + comCertBelt + ", comCertBlet2=" + comCertBlet2 + ", comChargeWork="
				+ comChargeWork + ", comJoinDate=" + comJoinDate + ", costCenter=" + costCenter + ", lastChangePwDate="
				+ lastChangePwDate + ", lastLoginDate=" + lastLoginDate + ", appointmentDate=" + appointmentDate
				+ ", updateDate=" + updateDate + ", regDate=" + regDate + ", authId=" + authId + ", isAdmin=" + isAdmin
				+ "]";
	}
}
