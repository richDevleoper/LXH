package kr.freedi.dev.qapprove.domain;

import java.util.Date;

public class ApproveDetailVO {

	private String aprovalCode;	//결재코드
	private String aprovalSeq;	//순번
	private String comNo;		//결재자_사번
	private String comJobx;		//결재자_직급
	private String comPosition;	//결재자_직책
	private String comDepartCode;	//결재자_부서코드
	private Date aprovalRegDate;	//승인일
	private String aprovalReqComNo;	//결재상신자
	private Date aprovalCompltDate;	//결재일
	private String aprovalStatCode;		//결재상태
	private String aprovalMailSendDate;	//이메일 발송일
	private String aprovalMailSendYn;	//이메일 전송여부
	private String aprovalComment;	// 결재 코멘트
	
	private String aprovalStat;
	private String aprovalType;
	private String userName; // 사원명
	
	public String getAprovalCode() {
		return aprovalCode;
	}
	public void setAprovalCode(String aprovalCode) {
		this.aprovalCode = aprovalCode;
	}
	public String getAprovalSeq() {
		return aprovalSeq;
	}
	
	public void setAprovalSeq(String aprovalSeq) {
		this.aprovalSeq = aprovalSeq;
	}
	public String getComNo() {
		return comNo;
	}
	public void setComNo(String comNo) {
		this.comNo = comNo;
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
	public String getComDepartCode() {
		return comDepartCode;
	}
	public void setComDepartCode(String comDepartCode) {
		this.comDepartCode = comDepartCode;
	}
	public Date getAprovalRegDate() {
		return aprovalRegDate;
	}
	public void setAprovalRegDate(Date aprovalRegDate) {
		this.aprovalRegDate = aprovalRegDate;
	}
	public String getAprovalReqComNo() {
		return aprovalReqComNo;
	}
	public void setAprovalReqComNo(String aprovalReqComNo) {
		this.aprovalReqComNo = aprovalReqComNo;
	}
	public Date getAprovalCompltDate() {
		return aprovalCompltDate;
	}
	public void setAprovalCompltDate(Date aprovalCompltDate) {
		this.aprovalCompltDate = aprovalCompltDate;
	}
	public String getAprovalStatCode() {
		return aprovalStatCode;
	}
	public void setAprovalStatCode(String aprovalStatCode) {
		this.aprovalStatCode = aprovalStatCode;
	}
	public String getAprovalMailSendDate() {
		return aprovalMailSendDate;
	}
	public void setAprovalMailSendDate(String aprovalMailSendDate) {
		this.aprovalMailSendDate = aprovalMailSendDate;
	}
	public String getAprovalMailSendYn() {
		return aprovalMailSendYn;
	}
	public void setAprovalMailSendYn(String aprovalMailSendYn) {
		this.aprovalMailSendYn = aprovalMailSendYn;
	}
	public String getAprovalComment() {
		return aprovalComment;
	}

	public void setAprovalComment(String aprovalComment) {
		this.aprovalComment = aprovalComment;
	}	

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	/**
	 * @return the aprovalStat
	 */
	public String getAprovalStat() {
		return aprovalStat;
	}
	/**
	 * @param aprovalStat the aprovalStat to set
	 */
	public void setAprovalStat(String aprovalStat) {
		this.aprovalStat = aprovalStat;
	}
	/**
	 * @return the aprovalType
	 */
	public String getAprovalType() {
		return aprovalType;
	}
	/**
	 * @param aprovalType the aprovalType to set
	 */
	public void setAprovalType(String aprovalType) {
		this.aprovalType = aprovalType;
	}
	@Override
	public String toString() {
		return "ApproveDetailVO [aprovalCode=" + aprovalCode + ", aprovalSeq=" + aprovalSeq + ", comNo=" + comNo
				+ ", comJobx=" + comJobx + ", comPosition=" + comPosition + ", comDepartCode=" + comDepartCode
				+ ", aprovalRegDate=" + aprovalRegDate + ", aprovalReqComNo=" + aprovalReqComNo + ", aprovalCompltDate="
				+ aprovalCompltDate + ", aprovalStatCode=" + aprovalStatCode + ", aprovalMailSendDate="
				+ aprovalMailSendDate + ", aprovalMailSendYn=" + aprovalMailSendYn + ", aprovalComment="
				+ aprovalComment + ", aprovalStat=" + aprovalStat + ", aprovalType=" + aprovalType + ", userName="
				+ userName + "]";
	}
}
