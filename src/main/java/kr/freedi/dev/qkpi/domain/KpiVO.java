package kr.freedi.dev.qkpi.domain;

import java.util.Date;
import java.util.List;

import com.google.gson.JsonObject;

public class KpiVO {
	
	private String deptCode;
	private String deptName;
	private Date updateDate;
	private Date regDate;
	private String kmYear;
	private String kmGbUserCnt;
	private String kmBbUserCnt;
	private String kmMbbUserCnt;
	private String kmBbuUserCnt;
	private String kmMbbManageCnt;
	private String kudIdx;
	
	public String getDeptCode() {
		return deptCode;
	}
	public String getDeptName() {
		return deptName;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public Date getRegDate() {
		return regDate;
	}
	public String getKmYear() {
		return kmYear;
	}
	public String getKmGbUserCnt() {
		return kmGbUserCnt;
	}
	public String getKmBbUserCnt() {
		return kmBbUserCnt;
	}
	public String getKmMbbUserCnt() {
		return kmMbbUserCnt;
	}
	public String getKmBbuUserCnt() {
		return kmBbuUserCnt;
	}
	public String getKmMbbManageCnt() {
		return kmMbbManageCnt;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public void setKmYear(String kmYear) {
		this.kmYear = kmYear;
	}
	public void setKmGbUserCnt(String kmGbUserCnt) {
		this.kmGbUserCnt = kmGbUserCnt;
	}
	public void setKmBbUserCnt(String kmBbUserCnt) {
		this.kmBbUserCnt = kmBbUserCnt;
	}
	public void setKmMbbUserCnt(String kmMbbUserCnt) {
		this.kmMbbUserCnt = kmMbbUserCnt;
	}
	public void setKmBbuUserCnt(String kmBbuUserCnt) {
		this.kmBbuUserCnt = kmBbuUserCnt;
	}
	public void setKmMbbManageCnt(String kmMbbManageCnt) {
		this.kmMbbManageCnt = kmMbbManageCnt;
	}
	public String getKudIdx() {
		return kudIdx;
	}
	public void setKudIdx(String kudIdx) {
		this.kudIdx = kudIdx;
	}
	@Override
	public String toString() {
		return "KpiVO [deptCode=" + deptCode + ", deptName=" + deptName + ", updateDate=" + updateDate + ", regDate="
				+ regDate + ", kmYear=" + kmYear + ", kmGbUserCnt=" + kmGbUserCnt + ", kmBbUserCnt=" + kmBbUserCnt
				+ ", kmMbbUserCnt=" + kmMbbUserCnt + ", kmBbuUserCnt=" + kmBbuUserCnt + ", kmMbbManageCnt="
				+ kmMbbManageCnt + ", kudIdx=" + kudIdx + "]";
	}
}
