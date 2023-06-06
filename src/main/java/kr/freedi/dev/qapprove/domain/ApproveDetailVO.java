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
	
	private String score1;
	private String score4;
	private String score5;
	private String score6;
	private String score7;
	private String scoreTotal;
	
	private String aprovalStat;
	private String aprovalType;
	private String userName; // 사원명
	public String getAprovalCode() {
		return aprovalCode;
	}
	public String getAprovalSeq() {
		return aprovalSeq;
	}
	public String getComNo() {
		return comNo;
	}
	public String getComJobx() {
		return comJobx;
	}
	public String getComPosition() {
		return comPosition;
	}
	public String getComDepartCode() {
		return comDepartCode;
	}
	public Date getAprovalRegDate() {
		return aprovalRegDate;
	}
	public String getAprovalReqComNo() {
		return aprovalReqComNo;
	}
	public Date getAprovalCompltDate() {
		return aprovalCompltDate;
	}
	public String getAprovalStatCode() {
		return aprovalStatCode;
	}
	public String getAprovalMailSendDate() {
		return aprovalMailSendDate;
	}
	public String getAprovalMailSendYn() {
		return aprovalMailSendYn;
	}
	public String getAprovalComment() {
		return aprovalComment;
	}
	public String getScore1() {
		return score1;
	}
	public String getScore4() {
		return score4;
	}
	public String getScore5() {
		return score5;
	}
	public String getScore6() {
		return score6;
	}
	public String getScore7() {
		return score7;
	}
	public String getScoreTotal() {
		return scoreTotal;
	}
	public String getAprovalStat() {
		return aprovalStat;
	}
	public String getAprovalType() {
		return aprovalType;
	}
	public String getUserName() {
		return userName;
	}
	public void setAprovalCode(String aprovalCode) {
		this.aprovalCode = aprovalCode;
	}
	public void setAprovalSeq(String aprovalSeq) {
		this.aprovalSeq = aprovalSeq;
	}
	public void setComNo(String comNo) {
		this.comNo = comNo;
	}
	public void setComJobx(String comJobx) {
		this.comJobx = comJobx;
	}
	public void setComPosition(String comPosition) {
		this.comPosition = comPosition;
	}
	public void setComDepartCode(String comDepartCode) {
		this.comDepartCode = comDepartCode;
	}
	public void setAprovalRegDate(Date aprovalRegDate) {
		this.aprovalRegDate = aprovalRegDate;
	}
	public void setAprovalReqComNo(String aprovalReqComNo) {
		this.aprovalReqComNo = aprovalReqComNo;
	}
	public void setAprovalCompltDate(Date aprovalCompltDate) {
		this.aprovalCompltDate = aprovalCompltDate;
	}
	public void setAprovalStatCode(String aprovalStatCode) {
		this.aprovalStatCode = aprovalStatCode;
	}
	public void setAprovalMailSendDate(String aprovalMailSendDate) {
		this.aprovalMailSendDate = aprovalMailSendDate;
	}
	public void setAprovalMailSendYn(String aprovalMailSendYn) {
		this.aprovalMailSendYn = aprovalMailSendYn;
	}
	public void setAprovalComment(String aprovalComment) {
		this.aprovalComment = aprovalComment;
	}
	public void setScore1(String score1) {
		this.score1 = score1;
	}
	public void setScore4(String score4) {
		this.score4 = score4;
	}
	public void setScore5(String score5) {
		this.score5 = score5;
	}
	public void setScore6(String score6) {
		this.score6 = score6;
	}
	public void setScore7(String score7) {
		this.score7 = score7;
	}
	public void setScoreTotal(String scoreTotal) {
		this.scoreTotal = scoreTotal;
	}
	public void setAprovalStat(String aprovalStat) {
		this.aprovalStat = aprovalStat;
	}
	public void setAprovalType(String aprovalType) {
		this.aprovalType = aprovalType;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "ApproveDetailVO [aprovalCode=" + aprovalCode + ", aprovalSeq=" + aprovalSeq + ", comNo=" + comNo
				+ ", comJobx=" + comJobx + ", comPosition=" + comPosition + ", comDepartCode=" + comDepartCode
				+ ", aprovalRegDate=" + aprovalRegDate + ", aprovalReqComNo=" + aprovalReqComNo + ", aprovalCompltDate="
				+ aprovalCompltDate + ", aprovalStatCode=" + aprovalStatCode + ", aprovalMailSendDate="
				+ aprovalMailSendDate + ", aprovalMailSendYn=" + aprovalMailSendYn + ", aprovalComment="
				+ aprovalComment + ", score1=" + score1 + ", score4=" + score4 + ", score5=" + score5 + ", score6="
				+ score6 + ", score7=" + score7 + ", scoreTotal=" + scoreTotal + ", aprovalStat=" + aprovalStat
				+ ", aprovalType=" + aprovalType + ", userName=" + userName + "]";
	}
}
