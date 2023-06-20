package kr.freedi.dev.qkpi.domain;

import java.util.Date;
import java.util.List;

import com.google.gson.JsonObject;

public class KpiManageVO {
	private String idx;
	private String stdSeq;
	private String comNo;
	private String kudYear;
	private String kudChkTypeCode;
	private String kudDepart;
	private String kudJobx;
	private String kudPosition;
	private String kudTeamName;
	private String kudUserName;
	private String kudBelongName;
	private String kudPart;
	private String kudPlace;
	private String kudUserIdentity;
	private Date kudJoinDate;
	private String kudLastDegree;
	private String kudRegUser;
	private Date kudRegDate;
	private String kudUpdateUser;
	private Date kudUpdateDate;
	private String kudIdx;
	private String kudCertBelt;
	private String comDepartCode;
	private String kudJimu;

	public String getStdSeq() {
		return stdSeq;
	}

	public String getComNo() {
		return comNo;
	}

	public String getKudYear() {
		return kudYear;
	}

	public String getKudChkTypeCode() {
		return kudChkTypeCode;
	}

	public String getKudDepart() {
		return kudDepart;
	}

	public String getKudJobx() {
		return kudJobx;
	}

	public String getKudPosition() {
		return kudPosition;
	}

	public String getKudTeamName() {
		return kudTeamName;
	}

	public String getKudUserName() {
		return kudUserName;
	}

	public String getKudBelongName() {
		return kudBelongName;
	}

	public String getKudPart() {
		return kudPart;
	}

	public String getKudPlace() {
		return kudPlace;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getKudUserIdentity() {
		return kudUserIdentity;
	}

	public Date getKudJoinDate() {
		return kudJoinDate;
	}

	public String getKudLastDegree() {
		return kudLastDegree;
	}

	public String getKudRegUser() {
		return kudRegUser;
	}

	public Date getKudRegDate() {
		return kudRegDate;
	}

	public String getKudUpdateUser() {
		return kudUpdateUser;
	}

	public Date getKudUpdateDate() {
		return kudUpdateDate;
	}

	public String getKudIdx() {
		return kudIdx;
	}

	public void setStdSeq(String stdSeq) {
		this.stdSeq = stdSeq;
	}

	public void setComNo(String comNo) {
		this.comNo = comNo;
	}

	public void setKudYear(String kudYear) {
		this.kudYear = kudYear;
	}

	public void setKudChkTypeCode(String kudChkTypeCode) {
		this.kudChkTypeCode = kudChkTypeCode;
	}

	public void setKudDepart(String kudDepart) {
		this.kudDepart = kudDepart;
	}

	public void setKudJobx(String kudJobx) {
		this.kudJobx = kudJobx;
	}

	public void setKudPosition(String kudPosition) {
		this.kudPosition = kudPosition;
	}

	public void setKudTeamName(String kudTeamName) {
		this.kudTeamName = kudTeamName;
	}

	public void setKudUserName(String kudUserName) {
		this.kudUserName = kudUserName;
	}

	public void setKudBelongName(String kudBelongName) {
		this.kudBelongName = kudBelongName;
	}

	public void setKudPart(String kudPart) {
		this.kudPart = kudPart;
	}

	public void setKudPlace(String kudPlace) {
		this.kudPlace = kudPlace;
	}

	public void setKudUserIdentity(String kudUserIdentity) {
		this.kudUserIdentity = kudUserIdentity;
	}

	public void setKudJoinDate(Date kudJoinDate) {
		this.kudJoinDate = kudJoinDate;
	}

	public void setKudLastDegree(String kudLastDegree) {
		this.kudLastDegree = kudLastDegree;
	}

	public void setKudRegUser(String kudRegUser) {
		this.kudRegUser = kudRegUser;
	}

	public void setKudRegDate(Date kudRegDate) {
		this.kudRegDate = kudRegDate;
	}

	public void setKudUpdateUser(String kudUpdateUser) {
		this.kudUpdateUser = kudUpdateUser;
	}

	public void setKudUpdateDate(Date kudUpdateDate) {
		this.kudUpdateDate = kudUpdateDate;
	}

	public void setKudIdx(String kudIdx) {
		this.kudIdx = kudIdx;
	}


	
	public String getKudCertBelt() {
		return kudCertBelt;
	}

	public void setKudCertBelt(String kudCertBelt) {
		this.kudCertBelt = kudCertBelt;
	}

	public String getComDepartCode() {
		return comDepartCode;
	}

	public void setComDepartCode(String comDepartCode) {
		this.comDepartCode = comDepartCode;
	}

	public String getKudJimu() {
		return kudJimu;
	}

	public void setKudJimu(String kudJimu) {
		this.kudJimu = kudJimu;
	}

	@Override
	public String toString() {
		return "KpiManageVO [idx=" + idx + ", stdSeq=" + stdSeq + ", comNo=" + comNo + ", kudYear=" + kudYear
				+ ", kudChkTypeCode=" + kudChkTypeCode + ", kudDepart=" + kudDepart + ", kudJobx=" + kudJobx
				+ ", kudPosition=" + kudPosition + ", kudTeamName=" + kudTeamName + ", kudUserName=" + kudUserName
				+ ", kudBelongName=" + kudBelongName + ", kudPart=" + kudPart + ", kudPlace=" + kudPlace
				+ ", kudUserIdentity=" + kudUserIdentity + ", kudJoinDate=" + kudJoinDate + ", kudLastDegree="
				+ kudLastDegree + ", kudRegUser=" + kudRegUser + ", kudRegDate=" + kudRegDate + ", kudUpdateUser="
				+ kudUpdateUser + ", kudUpdateDate=" + kudUpdateDate + ", kudIdx=" + kudIdx + ", kudCertBelt="
				+ kudCertBelt + "]";
	}

}
