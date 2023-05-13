package kr.freedi.dev.qapprove.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.freedi.dev.attachfile.domain.AttachFileVO;

public class ApproveVO {

	private String aprovalCode;
	private String actRegNo;
	private String actAprovalNo;
	private String aprovalType;
	private String aprovalState;
	private String aprovalSubject;
	private String userId;
	private Date draftingDate;
	private String draftingComment;
	
	private Integer idx;
	private String aprovalTypeNm;
	private Date aprovalDate;
	private String aprovalStateNm;
	
	public String getAprovalCode() {
		return aprovalCode;
	}
	public void setAprovalCode(String aprovalCode) {
		this.aprovalCode = aprovalCode;
	}
	public String getActRegNo() {
		return actRegNo;
	}
	public void setActRegNo(String actRegNo) {
		this.actRegNo = actRegNo;
	}
	public String getActAprovalNo() {
		return actAprovalNo;
	}
	public void setActAprovalNo(String actAprovalNo) {
		this.actAprovalNo = actAprovalNo;
	}
	public String getAprovalType() {
		return aprovalType;
	}
	public void setAprovalType(String aprovalType) {
		this.aprovalType = aprovalType;
	}
	public String getAprovalState() {
		return aprovalState;
	}
	public void setAprovalState(String aprovalState) {
		this.aprovalState = aprovalState;
	}
	public String getAprovalSubject() {
		return aprovalSubject;
	}
	public void setAprovalSubject(String aprovalSubject) {
		this.aprovalSubject = aprovalSubject;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getDraftingDate() {
		return draftingDate;
	}
	public void setDraftingDate(Date draftingDate) {
		this.draftingDate = draftingDate;
	}
	public String getDraftingComment() {
		return draftingComment;
	}
	public void setDraftingComment(String draftingComment) {
		this.draftingComment = draftingComment;
	}
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	public String getAprovalTypeNm() {
		return aprovalTypeNm;
	}
	public void setAprovalTypeNm(String aprovalTypeNm) {
		this.aprovalTypeNm = aprovalTypeNm;
	}
	public Date getAprovalDate() {
		return aprovalDate;
	}
	public void setAprovalDate(Date aprovalDate) {
		this.aprovalDate = aprovalDate;
	}
	public String getAprovalStateNm() {
		return aprovalStateNm;
	}
	public void setAprovalStateNm(String aprovalStateNm) {
		this.aprovalStateNm = aprovalStateNm;
	}
	@Override
	public String toString() {
		return "ApproveVO [aprovalCode=" + aprovalCode + ", actRegNo=" + actRegNo + ", actAprovalNo=" + actAprovalNo
				+ ", aprovalType=" + aprovalType + ", aprovalState=" + aprovalState + ", aprovalSubject="
				+ aprovalSubject + ", userId=" + userId + ", draftingDate=" + draftingDate + ", draftingComment="
				+ draftingComment + ", idx=" + idx + ", aprovalTypeNm=" + aprovalTypeNm + ", aprovalDate=" + aprovalDate
				+ ", aprovalStateNm=" + aprovalStateNm + "]";
	}	
}