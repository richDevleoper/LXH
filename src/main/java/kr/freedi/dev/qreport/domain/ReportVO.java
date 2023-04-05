package kr.freedi.dev.qreport.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.freedi.dev.attachfile.domain.AttachFileVO;

public class ReportVO {

	private Integer repCode;
	private String repName;
	private String repMenuCode;
	private String repDivisionCode;
	private String repTypeCode;
	private String repSectorCode;
	private String repProductClass;
	private String repLeaderBeltCode;
	private String repActionTypeCode;
	private String repMbbUseRateCode;
	private String repUseRefDate;
	private String repStatusCode;
	private Date repSixMeasureDate;
	private Date repSixExploreDate;
	private Date repSixDevelopDate;
	private Date repSixImplementDate;
	private Date repStartDate;
	private Date repFinishDate;
	private String repKeyword;
	private String repRegUser;
	private Date repRegDate;
	private String repUpdateUser;
	private Date repUpdateDate;
	private String repApprovalCode;
	private String repUseYn;
	private String repMailSendYn;
	private Date repMailSendDate;
	private String repPlaceCode;
	private String repLeaderCode;
	private String repFileYn;

	private String mode;
	private Integer idx;
	private String repDivision;
	private String repType;
	private String repStatus;
	
	private List<ReportTeamVO> repTemMemberList;
	
	
	

	private List<AttachFileVO> fileList;

	public Integer getRepCode() {
		return repCode;
	}

	public void setRepCode(Integer repCode) {
		this.repCode = repCode;
	}

	public String getRepName() {
		return repName;
	}

	public void setRepName(String repName) {
		this.repName = repName;
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

	public String getRepTypeCode() {
		return repTypeCode;
	}

	public void setRepTypeCode(String repTypeCode) {
		this.repTypeCode = repTypeCode;
	}

	public String getRepSectorCode() {
		return repSectorCode;
	}

	public void setRepSectorCode(String repSectorCode) {
		this.repSectorCode = repSectorCode;
	}

	public String getRepProductClass() {
		return repProductClass;
	}

	public void setRepProductClass(String repProductClass) {
		this.repProductClass = repProductClass;
	}

	public String getRepLeaderBeltCode() {
		return repLeaderBeltCode;
	}

	public void setRepLeaderBeltCode(String repLeaderBeltCode) {
		this.repLeaderBeltCode = repLeaderBeltCode;
	}

	public String getRepActionTypeCode() {
		return repActionTypeCode;
	}

	public void setRepActionTypeCode(String repActionTypeCode) {
		this.repActionTypeCode = repActionTypeCode;
	}

	public String getRepMbbUseRateCode() {
		return repMbbUseRateCode;
	}

	public void setRepMbbUseRateCode(String repMbbUseRateCode) {
		this.repMbbUseRateCode = repMbbUseRateCode;
	}

	public String getRepUseRefDate() {
		return repUseRefDate;
	}

	public void setRepUseRefDate(String repUseRefDate) {
		this.repUseRefDate = repUseRefDate;
	}

	public String getRepStatusCode() {
		return repStatusCode;
	}

	public void setRepStatusCode(String repStatusCode) {
		this.repStatusCode = repStatusCode;
	}

	public Date getRepSixMeasureDate() {
		return repSixMeasureDate;
	}

	public void setRepSixMeasureDate(Date repSixMeasureDate) {
		this.repSixMeasureDate = repSixMeasureDate;
	}

	public Date getRepSixExploreDate() {
		return repSixExploreDate;
	}

	public void setRepSixExploreDate(Date repSixExploreDate) {
		this.repSixExploreDate = repSixExploreDate;
	}

	public Date getRepSixDevelopDate() {
		return repSixDevelopDate;
	}

	public void setRepSixDevelopDate(Date repSixDevelopDate) {
		this.repSixDevelopDate = repSixDevelopDate;
	}

	public Date getRepSixImplementDate() {
		return repSixImplementDate;
	}

	public void setRepSixImplementDate(Date repSixImplementDate) {
		this.repSixImplementDate = repSixImplementDate;
	}

	public Date getRepStartDate() {
		return repStartDate;
	}

	public void setRepStartDate(Date repStartDate) {
		this.repStartDate = repStartDate;
	}

	public Date getRepFinishDate() {
		return repFinishDate;
	}

	public void setRepFinishDate(Date repFinishDate) {
		this.repFinishDate = repFinishDate;
	}

	public String getRepKeyword() {
		return repKeyword;
	}

	public void setRepKeyword(String repKeyword) {
		this.repKeyword = repKeyword;
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

	public String getRepApprovalCode() {
		return repApprovalCode;
	}

	public void setRepApprovalCode(String repApprovalCode) {
		this.repApprovalCode = repApprovalCode;
	}

	public String getRepUseYn() {
		return repUseYn;
	}

	public void setRepUseYn(String repUseYn) {
		this.repUseYn = repUseYn;
	}

	public String getRepMailSendYn() {
		return repMailSendYn;
	}

	public void setRepMailSendYn(String repMailSendYn) {
		this.repMailSendYn = repMailSendYn;
	}

	public Date getRepMailSendDate() {
		return repMailSendDate;
	}

	public void setRepMailSendDate(Date repMailSendDate) {
		this.repMailSendDate = repMailSendDate;
	}

	public String getRepPlaceCode() {
		return repPlaceCode;
	}

	public void setRepPlaceCode(String repPlaceCode) {
		this.repPlaceCode = repPlaceCode;
	}

	public String getRepLeaderCode() {
		return repLeaderCode;
	}

	public void setRepLeaderCode(String repLeaderCode) {
		this.repLeaderCode = repLeaderCode;
	}

	public String getRepFileYn() {
		return repFileYn;
	}

	public void setRepFileYn(String repFileYn) {
		this.repFileYn = repFileYn;
	}

	public Integer getIdx() {
		return idx;
	}

//	public void setIdx(Integer idx) {
//		this.idx = idx;
//	}
	public String getRepDivision() {
		return repDivision;
	}

//	public void setRepDivision(String repDivision) {
//		this.repDivision = repDivision;
//	}
	public String getRepType() {
		return repType;
	}

//	public void setRepType(String repType) {
//		this.repType = repType;
//	}
	public String getRepStatus() {
		return repStatus;
	}

	public List<AttachFileVO> getFileList() {
		return fileList;
	}

	public void setFileList(List<AttachFileVO> fileList) {
		this.fileList = fileList;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public List<ReportTeamVO> getRepTemMemberList() {
		return repTemMemberList;
	}

	public void setRepTemMemberList(List<ReportTeamVO> repTemMemberList) {
		this.repTemMemberList = repTemMemberList;
	}

	// public void setRepStatus(String repStatus) {
//		this.repStatus = repStatus;
//	}
	@Override
	public String toString() {
		return "ReportVO [repCode=" + repCode + ", repName=" + repName + ", repMenuCode=" + repMenuCode
				+ ", repDivisionCode=" + repDivisionCode + ", repTypeCode=" + repTypeCode + ", repSectorCode="
				+ repSectorCode + ", repProductClass=" + repProductClass + ", repLeaderBeltCode=" + repLeaderBeltCode
				+ ", repActionTypeCode=" + repActionTypeCode + ", repMbbUseRateCode=" + repMbbUseRateCode
				+ ", repUseRefDate=" + repUseRefDate + ", repStatusCode=" + repStatusCode + ", repSixMeasureDate="
				+ repSixMeasureDate + ", repSixExploreDate=" + repSixExploreDate + ", repSixDevelopDate="
				+ repSixDevelopDate + ", repSixImplementDate=" + repSixImplementDate + ", repStartDate=" + repStartDate
				+ ", repFinishDate=" + repFinishDate + ", repKeyword=" + repKeyword + ", repRegUser=" + repRegUser
				+ ", repRegDate=" + repRegDate + ", repUpdateUser=" + repUpdateUser + ", repUpdateDate=" + repUpdateDate
				+ ", repApprovalCode=" + repApprovalCode + ", repUseYn=" + repUseYn + ", repMailSendYn=" + repMailSendYn
				+ ", repMailSendDate=" + repMailSendDate + ", repPlaceCode=" + repPlaceCode + ", repLeaderCode="
				+ repLeaderCode + ", repFileYn=" + repFileYn + ", idx=" + idx + ", repDivision=" + repDivision
				+ ", repType=" + repType + ", repStatus=" + repStatus + "]";
	}

}
