package kr.freedi.dev.qapprove.domain;

import java.util.Date;

public class ApproveDetailVO {

	private String aprovalCode;	//결재코드
	private String aprovalSeq;	//순번
	private String comNo;		//결재자_사번
	private String comJobx;		//결재자_직급
	private String comPosition;	//결재자_직책
	private String comDepartCode;	//결재자_부서코드
	private String aprovalRegDate;	//승인일
	private String aprovalReqComNo;	//결재상신자
	private String aprovalCompltDate;	//결재일
	private String aprovalStatCode;		//결재상태
	private String aprovalMailSendDate;	//이메일 발송일
	private String aprovalMailSendYn;	//이메일 전송여부
	
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
	public String getAprovalRegDate() {
		return aprovalRegDate;
	}
	public void setAprovalRegDate(String aprovalRegDate) {
		this.aprovalRegDate = aprovalRegDate;
	}
	public String getAprovalReqComNo() {
		return aprovalReqComNo;
	}
	public void setAprovalReqComNo(String aprovalReqComNo) {
		this.aprovalReqComNo = aprovalReqComNo;
	}
	public String getAprovalCompltDate() {
		return aprovalCompltDate;
	}
	public void setAprovalCompltDate(String aprovalCompltDate) {
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
			 
}
