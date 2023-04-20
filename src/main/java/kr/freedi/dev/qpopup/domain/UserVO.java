package kr.freedi.dev.qpopup.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.freedi.dev.attachfile.domain.AttachFileVO;

public class UserVO {

	private String userId;      //사용자 ID
	private String userPw;      //사용자 비밀번호
	private String userSchool;  //출신학교 (공통코드)
	private String userMajor;   //전공 (공통코드)
	private String userName;    //이름
	private String userState;       //사용자 상태코드 (Y-계정잠김, N-사용중인계정)
	private String userSecurityLv;      //보안등급
	private String userPhoneNo;     //전화번호
	private String userEmail;       //E-Mail
	private String userType;        //사용자구분
	private String userComState;        //재직여부 (Y-재직, N-퇴직)
	private String userLevelFlag;       //임직원여부, 임직원-Y, 비직원-N
	private String comCode;     //회사코드
	private String comNo;       //사번
	private String comLeaderNo;     //리더 사번
	private String comJobx;     //직위 (공통코드)
	private String comPosition;     //직책 (공통코드)
	private String comGroupJobx;        //GROUP 직위 (공통코드)
	private String comDepartCode;       //부서코드
	private String comWorkPlace;        //근무지 (공통코드)
	private String comSixSigmaCode;     //6시그마 부서코드
	private String comPostBelt;     //POST 벨트
	private String comPostType;     //직무형태(전담(Full-time),겸직(Part-time))
	private String comPostRange;        //직무범위(전사,사업부)
	private String comCertBelt;     //CERT 벨트
	private String comCertBlet2;        //CERT 벨트2
	private String comChargeWork;       //담당업무 (공통코드)
	private Date comJoinDate;     //입사일 (YYYY-MM-DD HH:MM:SS)
	private String costCenter;      //코스트센터
	private Date lastChangePwDate;        //최근 비밀번호 변경일 (YYYY-MM-DD HH:MM:SS)
	private Date lastLoginDate;       //최근 로그인 (YYYY-MM-DD HH:MM:SS)
	private Date appointmentDate;     //발령일 (YYYY-MM-DD HH:MM:SS)
	private Date updateDate;      //최종 수정일 (YYYY-MM-DD HH:MM:SS)
	private Date regDate;     //등록일 (YYYY-MM-DD HH:MM:SS)
	
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
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userSchool=" + userSchool + ", userMajor="
				+ userMajor + ", userName=" + userName + ", userState=" + userState + ", userSecurityLv="
				+ userSecurityLv + ", userPhoneNo=" + userPhoneNo + ", userEmail=" + userEmail + ", userType="
				+ userType + ", userComState=" + userComState + ", userLevelFlag=" + userLevelFlag + ", comCode="
				+ comCode + ", comNo=" + comNo + ", comLeaderNo=" + comLeaderNo + ", comJobx=" + comJobx
				+ ", comPosition=" + comPosition + ", comGroupJobx=" + comGroupJobx + ", comDepartCode=" + comDepartCode
				+ ", comWorkPlace=" + comWorkPlace + ", comSixSigmaCode=" + comSixSigmaCode + ", comPostBelt="
				+ comPostBelt + ", comPostType=" + comPostType + ", comPostRange=" + comPostRange + ", comCertBelt="
				+ comCertBelt + ", comCertBlet2=" + comCertBlet2 + ", comChargeWork=" + comChargeWork + ", comJoinDate="
				+ comJoinDate + ", costCenter=" + costCenter + ", lastChangePwDate=" + lastChangePwDate
				+ ", lastLoginDate=" + lastLoginDate + ", appointmentDate=" + appointmentDate + ", updateDate="
				+ updateDate + ", regDate=" + regDate + "]";
	}
}
