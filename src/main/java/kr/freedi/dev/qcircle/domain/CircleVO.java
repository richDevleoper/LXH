package kr.freedi.dev.qcircle.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;

public class CircleVO {

	private String cirCode;
	private String cirRegNum;
	private String deptCode;
	private String deptName;
	private String cirTchComNo;
	private String cirWorkMemNo;
	private String cirTeamLeaderNo;
	private String cirRecordCont;
	private String cirMemCnt;
	private String cirRegUser;
	private Date cirRegDate;
	private String cirUpdateUser;
	private Date cirUpdateDate;
	private String cirMemStatus;

	private List<ReportTeamVO> teamMemList;
	
	private String cirTchName;
	private String cirWorkName;
	private String cirLeaderName;

	public String getCirCode() {
		return cirCode;
	}

	public void setCirCode(String cirCode) {
		this.cirCode = cirCode;
	}

	public String getCirRegNum() {
		return cirRegNum;
	}

	public void setCirRegNum(String cirRegNum) {
		this.cirRegNum = cirRegNum;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getCirTchComNo() {
		return cirTchComNo;
	}

	public void setCirTchComNo(String cirTchComNo) {
		this.cirTchComNo = cirTchComNo;
	}

	public String getCirWorkMemNo() {
		return cirWorkMemNo;
	}

	public void setCirWorkMemNo(String cirWorkMemNo) {
		this.cirWorkMemNo = cirWorkMemNo;
	}

	public String getCirTeamLeaderNo() {
		return cirTeamLeaderNo;
	}

	public void setCirTeamLeaderNo(String cirTeamLeaderNo) {
		this.cirTeamLeaderNo = cirTeamLeaderNo;
	}

	public String getCirRecordCont() {
		return cirRecordCont;
	}

	public void setCirRecordCont(String cirRecordCont) {
		this.cirRecordCont = cirRecordCont;
	}

	public String getCirMemCnt() {
		return cirMemCnt;
	}

	public void setCirMemCnt(String cirMemCnt) {
		this.cirMemCnt = cirMemCnt;
	}

	public String getCirRegUser() {
		return cirRegUser;
	}

	public void setCirRegUser(String cirRegUser) {
		this.cirRegUser = cirRegUser;
	}

	public Date getCirRegDate() {
		return cirRegDate;
	}

	public void setCirRegDate(Date cirRegDate) {
		this.cirRegDate = cirRegDate;
	}

	public String getCirUpdateUser() {
		return cirUpdateUser;
	}

	public void setCirUpdateUser(String cirUpdateUser) {
		this.cirUpdateUser = cirUpdateUser;
	}

	public Date getCirUpdateDate() {
		return cirUpdateDate;
	}

	public void setCirUpdateDate(Date cirUpdateDate) {
		this.cirUpdateDate = cirUpdateDate;
	}

	public String getCirMemStatus() {
		return cirMemStatus;
	}

	public void setCirMemStatus(String cirMemStatus) {
		this.cirMemStatus = cirMemStatus;
	}

	public List<ReportTeamVO> getTeamMemList() {
		return teamMemList;
	}

	public void setTeamMemList(List<ReportTeamVO> teamMemList) {
		this.teamMemList = teamMemList;
	}

	public String getCirTchName() {
		return cirTchName;
	}

	public void setCirTchName(String cirTchName) {
		this.cirTchName = cirTchName;
	}

	public String getCirWorkName() {
		return cirWorkName;
	}

	public void setCirWorkName(String cirWorkName) {
		this.cirWorkName = cirWorkName;
	}

	public String getCirLeaderName() {
		return cirLeaderName;
	}

	public void setCirLeaderName(String cirLeaderName) {
		this.cirLeaderName = cirLeaderName;
	}

	@Override
	public String toString() {
		return "CircleVO [cirCode=" + cirCode + ", cirRegNum=" + cirRegNum + ", deptCode=" + deptCode + ", deptName="
				+ deptName + ", cirTchComNo=" + cirTchComNo + ", cirWorkMemNo=" + cirWorkMemNo + ", cirTeamLeaderNo="
				+ cirTeamLeaderNo + ", cirRecordCont=" + cirRecordCont + ", cirMemCnt=" + cirMemCnt + ", cirRegUser="
				+ cirRegUser + ", cirRegDate=" + cirRegDate + ", cirUpdateUser=" + cirUpdateUser + ", cirUpdateDate="
				+ cirUpdateDate + ", cirMemStatus=" + cirMemStatus + ", teamMemList=" + teamMemList + "]";
	} 

}
