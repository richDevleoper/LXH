package kr.freedi.dev.qreport.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.freedi.dev.attachfile.domain.AttachFileVO;

public class ReportTeamVO {

	private Integer repTeamCode;
	private Integer repCode;
	private String comNo;
	private String deptCode;
	private String cirCode; 		// 분임조코드
	private String deptName;		// 
	private String comJobxCode;		// 직위코드
	private String comPositionCode;	// 직책코드
	private String beltCode; 		
	private String repTeamMemName;
	private String repTeamMemEduCode;	// 학력코드
	private String repTeamMemRole;		// 과제 역할
	private String repTeamRegUser;
	private Date repTeamRegDate;
	private String repTeamUpdateUser;
	private Date repTeamUpdateDate;
	private String repTeamMemStatus;
	
	private String repTeamMemRoleNm;		// 역할(명)
	private String comJobxNm;		// 직위(명)
	private String comPositionNm;		// 직책(명)
	private String repTeamMemEduNm; // 학력(명)
	private String beltNm; //벨트(명)
	
	private String cirName; 		// 분임조명
	private String cirMemCode;
	
	
	public Integer getRepTeamCode() {
		return repTeamCode;
	}
	public void setRepTeamCode(Integer repTeamCode) {
		this.repTeamCode = repTeamCode;
	}
	public Integer getRepCode() {
		return repCode;
	}
	public void setRepCode(Integer repCode) {
		this.repCode = repCode;
	}
	public String getComNo() {
		return comNo;
	}
	public void setComNo(String comNo) {
		this.comNo = comNo;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getCirCode() {
		return cirCode;
	}
	public void setCirCode(String cirCode) {
		this.cirCode = cirCode;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getComJobxCode() {
		return comJobxCode;
	}
	public void setComJobxCode(String comJobxCode) {
		this.comJobxCode = comJobxCode;
	}
	public String getComPositionCode() {
		return comPositionCode;
	}
	public void setComPositionCode(String comPositionCode) {
		this.comPositionCode = comPositionCode;
	}
	public String getBeltCode() {
		return beltCode;
	}
	public void setBeltCode(String beltCode) {
		this.beltCode = beltCode;
	}
	public String getRepTeamMemName() {
		return repTeamMemName;
	}
	public void setRepTeamMemName(String repTeamMemName) {
		this.repTeamMemName = repTeamMemName;
	}
	public String getRepTeamMemEduCode() {
		return repTeamMemEduCode;
	}
	public void setRepTeamMemEduCode(String repTeamMemEduCode) {
		this.repTeamMemEduCode = repTeamMemEduCode;
	}
	public String getRepTeamMemRole() {
		return repTeamMemRole;
	}
	public void setRepTeamMemRole(String repTeamMemRole) {
		this.repTeamMemRole = repTeamMemRole;
	}
	public String getRepTeamRegUser() {
		return repTeamRegUser;
	}
	public void setRepTeamRegUser(String repTeamRegUser) {
		this.repTeamRegUser = repTeamRegUser;
	}
	public Date getRepTeamRegDate() {
		return repTeamRegDate;
	}
	public void setRepTeamRegDate(Date repTeamRegDate) {
		this.repTeamRegDate = repTeamRegDate;
	}
	public String getRepTeamUpdateUser() {
		return repTeamUpdateUser;
	}
	public void setRepTeamUpdateUser(String repTeamUpdateUser) {
		this.repTeamUpdateUser = repTeamUpdateUser;
	}
	public Date getRepTeamUpdateDate() {
		return repTeamUpdateDate;
	}
	public void setRepTeamUpdateDate(Date repTeamUpdateDate) {
		this.repTeamUpdateDate = repTeamUpdateDate;
	}
	public String getRepTeamMemStatus() {
		return repTeamMemStatus;
	}
	public void setRepTeamMemStatus(String repTeamMemStatus) {
		this.repTeamMemStatus = repTeamMemStatus;
	}
	public String getRepTeamMemRoleNm() {
		return repTeamMemRoleNm;
	}
	public void setRepTeamMemRoleNm(String repTeamMemRoleNm) {
		this.repTeamMemRoleNm = repTeamMemRoleNm;
	}
	public String getComJobxNm() {
		return comJobxNm;
	}
	public void setComJobxNm(String comJobxNm) {
		this.comJobxNm = comJobxNm;
	}
	public String getComPositionNm() {
		return comPositionNm;
	}
	public void setComPositionNm(String comPositionNm) {
		this.comPositionNm = comPositionNm;
	}
	
	public String getRepTeamMemEduNm() {
		return repTeamMemEduNm;
	}
	public void setRepTeamMemEduNm(String repTeamMemEduNm) {
		this.repTeamMemEduNm = repTeamMemEduNm;
	}
	public String getBeltNm() {
		return beltNm;
	}
	public void setBeltNm(String beltNm) {
		this.beltNm = beltNm;
	}
	public String getCirName() {
		return cirName;
	}
	public void setCirName(String cirName) {
		this.cirName = cirName;
	}
	public String getCirMemCode() {
		return cirMemCode;
	}
	public void setCirMemCode(String cirMemCode) {
		this.cirMemCode = cirMemCode;
	}
	@Override
	public String toString() {
		return "ReportTeamVO [repTeamCode=" + repTeamCode + ", repCode=" + repCode + ", comNo=" + comNo + ", deptCode="
				+ deptCode + ", cirCode=" + cirCode + ", deptName=" + deptName + ", comJobxCode=" + comJobxCode
				+ ", comPositionCode=" + comPositionCode + ", beltCode=" + beltCode + ", repTeamMemName="
				+ repTeamMemName + ", repTeamMemEduCode=" + repTeamMemEduCode + ", repTeamMemRole=" + repTeamMemRole
				+ ", repTeamRegUser=" + repTeamRegUser + ", repTeamRegDate=" + repTeamRegDate + ", repTeamUpdateUser="
				+ repTeamUpdateUser + ", repTeamUpdateDate=" + repTeamUpdateDate + ", repTeamMemStatus="
				+ repTeamMemStatus + ", repTeamMemRoleNm=" + repTeamMemRoleNm + ", comJobxNm=" + comJobxNm
				+ ", comPositionNm=" + comPositionNm + ", repTeamMemEduNm=" + repTeamMemEduNm + ", beltNm=" + beltNm
				+ ", cirName=" + cirName + ", cirMemCode=" + cirMemCode + "]";
	}

}
