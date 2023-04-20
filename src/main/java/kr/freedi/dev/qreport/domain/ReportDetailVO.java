package kr.freedi.dev.qreport.domain;

import java.util.Date;


public class ReportDetailVO {

	private Integer repSeq;
	private Integer repTeamCode;
	private Integer repCode;
	private String repMenuCode;
	private String repDivisionCode;
	private String repStepCode;
	private Date repPlanStartDate;
	private Date repPlanEndDate;
	private Date repActStartDate;
	private Date repActEndDate;
	private String repPropelBg;
	private String repActivity;
	private String repFinishSummary;
	private String repCtqCtp;
	private String repKpi;
	private String repExpectationResult;
	private String repApprovalMemCode;
	private String repApprovalMemRole;
	private String repStatus;
	private String repRegUser;
	private Date repRegDate;
	private String repUpdateUser;
	private Date repUpdateDate;

	public Integer getRepSeq() {
		return repSeq;
	}
	public void setRepSeq(Integer repSeq) {
		this.repSeq = repSeq;
	}
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
	public String getRepMenuCode() {
		return repMenuCode;
	}
	public void setRepMenuCode(String repMenuCode) {
		this.repMenuCode = repMenuCode;
	}
	public String getRepDivisionCode() {
		return repDivisionCode;
	}
	public void setRepDivisionCode(String repDivisionCode) {
		this.repDivisionCode = repDivisionCode;
	}
	public String getRepStepCode() {
		return repStepCode;
	}
	public void setRepStepCode(String repStepCode) {
		this.repStepCode = repStepCode;
	}
	public Date getRepPlanStartDate() {
		return repPlanStartDate;
	}
	public void setRepPlanStartDate(Date repPlanStartDate) {
		this.repPlanStartDate = repPlanStartDate;
	}
	public Date getRepPlanEndDate() {
		return repPlanEndDate;
	}
	public void setRepPlanEndDate(Date repPlanEndDate) {
		this.repPlanEndDate = repPlanEndDate;
	}
	public Date getRepActStartDate() {
		return repActStartDate;
	}
	public void setRepActStartDate(Date repActStartDate) {
		this.repActStartDate = repActStartDate;
	}
	public Date getRepActEndDate() {
		return repActEndDate;
	}
	public void setRepActEndDate(Date repActEndDate) {
		this.repActEndDate = repActEndDate;
	}
	public String getRepPropelBg() {
		return repPropelBg;
	}
	public void setRepPropelBg(String repPropelBg) {
		this.repPropelBg = repPropelBg;
	}
	public String getRepActivity() {
		return repActivity;
	}
	public void setRepActivity(String repActivity) {
		this.repActivity = repActivity;
	}
	public String getRepFinishSummary() {
		return repFinishSummary;
	}
	public void setRepFinishSummary(String repFinishSummary) {
		this.repFinishSummary = repFinishSummary;
	}
	public String getRepCtqCtp() {
		return repCtqCtp;
	}
	public void setRepCtqCtp(String repCtqCtp) {
		this.repCtqCtp = repCtqCtp;
	}
	public String getRepKpi() {
		return repKpi;
	}
	public void setRepKpi(String repKpi) {
		this.repKpi = repKpi;
	}
	public String getRepExpectationResult() {
		return repExpectationResult;
	}
	public void setRepExpectationResult(String repExpectationResult) {
		this.repExpectationResult = repExpectationResult;
	}
	public String getRepApprovalMemCode() {
		return repApprovalMemCode;
	}
	public void setRepApprovalMemCode(String repApprovalMemCode) {
		this.repApprovalMemCode = repApprovalMemCode;
	}
	public String getRepApprovalMemRole() {
		return repApprovalMemRole;
	}
	public void setRepApprovalMemRole(String repApprovalMemRole) {
		this.repApprovalMemRole = repApprovalMemRole;
	}
	public String getRepStatus() {
		return repStatus;
	}
	public void setRepStatus(String repStatus) {
		this.repStatus = repStatus;
	}
	public String getRepRegUser() {
		return repRegUser;
	}
	public void setRepRegUser(String repRegUser) {
		this.repRegUser = repRegUser;
	}
	public Date getRepRegDate() {
		return repRegDate;
	}
	public void setRepRegDate(Date repRegDate) {
		this.repRegDate = repRegDate;
	}
	public String getRepUpdateUser() {
		return repUpdateUser;
	}
	public void setRepUpdateUser(String repUpdateUser) {
		this.repUpdateUser = repUpdateUser;
	}
	public Date getRepUpdateDate() {
		return repUpdateDate;
	}
	public void setRepUpdateDate(Date repUpdateDate) {
		this.repUpdateDate = repUpdateDate;
	}
	@Override
	public String toString() {
		return "ReportDetailVO [repSeq=" + repSeq + ", repTeamCode=" + repTeamCode + ", repCode=" + repCode
				+ ", repMenuCode=" + repMenuCode + ", repDivisionCode=" + repDivisionCode + ", repStepCode="
				+ repStepCode + ", repPlanStartDate=" + repPlanStartDate + ", repPlanEndDate=" + repPlanEndDate
				+ ", repActStartDate=" + repActStartDate + ", repActEndDate=" + repActEndDate + ", repPropelBg="
				+ repPropelBg + ", repActivity=" + repActivity + ", repFinishSummary=" + repFinishSummary
				+ ", repCtqCtp=" + repCtqCtp + ", repKpi=" + repKpi + ", repExpectationResult=" + repExpectationResult
				+ ", repApprovalMemCode=" + repApprovalMemCode + ", repApprovalMemRole=" + repApprovalMemRole
				+ ", repStatus=" + repStatus + ", repRegUser=" + repRegUser + ", repRegDate=" + repRegDate
				+ ", repUpdateUser=" + repUpdateUser + ", repUpdateDate=" + repUpdateDate + "]";
	}
	
	
}
