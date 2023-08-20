package kr.freedi.dev.qreport.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.freedi.dev.attachfile.domain.AttachFileVO;

public class ReportIndicatorVO {

	private Integer repIndiCode;
	private Integer repCode;
	private String repIndiPyItem;
	private String repIndiPyUnit;
	private String repIndiPyBefore;
	private String repIndiPyGoal;
	private String repIndiKpiItem;
	private String repIndiKpiUnit;
	private String repIndiKpiBefore;
	private String repIndiKpiGoal;
	private String repIndiRegUser;
	private Date repIndiRegDate;
	private String repIndiUpdateUser;
	private Date repIndiUpdateDate;
	
	public Integer getRepIndiCode() {
		return repIndiCode;
	}
	public void setRepIndiCode(Integer repIndiCode) {
		this.repIndiCode = repIndiCode;
	}
	public Integer getRepCode() {
		return repCode;
	}
	public void setRepCode(Integer repCode) {
		this.repCode = repCode;
	}
	public String getRepIndiPyItem() {
		return repIndiPyItem;
	}
	public void setRepIndiPyItem(String repIndiPyItem) {
		this.repIndiPyItem = repIndiPyItem;
	}
	public String getRepIndiPyUnit() {
		return repIndiPyUnit;
	}
	public void setRepIndiPyUnit(String repIndiPyUnit) {
		this.repIndiPyUnit = repIndiPyUnit;
	}
	public String getRepIndiPyBefore() {
		return repIndiPyBefore;
	}
	public void setRepIndiPyBefore(String repIndiPyBefore) {
		this.repIndiPyBefore = repIndiPyBefore;
	}
	public String getRepIndiPyGoal() {
		return repIndiPyGoal;
	}
	public void setRepIndiPyGoal(String repIndiPyGoal) {
		this.repIndiPyGoal = repIndiPyGoal;
	}
	public String getRepIndiKpiItem() {
		return repIndiKpiItem;
	}
	public void setRepIndiKpiItem(String repIndiKpiItem) {
		this.repIndiKpiItem = repIndiKpiItem;
	}
	public String getRepIndiKpiUnit() {
		return repIndiKpiUnit;
	}
	public void setRepIndiKpiUnit(String repIndiKpiUnit) {
		this.repIndiKpiUnit = repIndiKpiUnit;
	}
	public String getRepIndiKpiBefore() {
		return repIndiKpiBefore;
	}
	public void setRepIndiKpiBefore(String repIndiKpiBefore) {
		this.repIndiKpiBefore = repIndiKpiBefore;
	}
	public String getRepIndiKpiGoal() {
		return repIndiKpiGoal;
	}
	public void setRepIndiKpiGoal(String repIndiKpiGoal) {
		this.repIndiKpiGoal = repIndiKpiGoal;
	}
	public String getRepIndiRegUser() {
		return repIndiRegUser;
	}
	public void setRepIndiRegUser(String repIndiRegUser) {
		this.repIndiRegUser = repIndiRegUser;
	}
	public Date getRepIndiRegDate() {
		return repIndiRegDate;
	}
	public void setRepIndiRegDate(Date repIndiRegDate) {
		this.repIndiRegDate = repIndiRegDate;
	}
	public String getRepIndiUpdateUser() {
		return repIndiUpdateUser;
	}
	public void setRepIndiUpdateUser(String repIndiUpdateUser) {
		this.repIndiUpdateUser = repIndiUpdateUser;
	}
	public Date getRepIndiUpdateDate() {
		return repIndiUpdateDate;
	}
	public void setRepIndiUpdateDate(Date repIndiUpdateDate) {
		this.repIndiUpdateDate = repIndiUpdateDate;
	}
	@Override
	public String toString() {
		return "ReportIndicatorVO [repIndiCode=" + repIndiCode + ", repCode=" + repCode + ", repIndiPyItem="
				+ repIndiPyItem + ", repIndiPyUnit=" + repIndiPyUnit + ", repIndiPyBefore=" + repIndiPyBefore
				+ ", repIndiPyGoal=" + repIndiPyGoal + ", repIndiKpiItem=" + repIndiKpiItem + ", repIndiKpiUnit="
				+ repIndiKpiUnit + ", repIndiKpiBefore=" + repIndiKpiBefore + ", repIndiKpiGoal=" + repIndiKpiGoal
				+ ", repIndiRegUser=" + repIndiRegUser + ", repIndiRegDate=" + repIndiRegDate + ", repIndiUpdateUser="
				+ repIndiUpdateUser + ", repIndiUpdateDate=" + repIndiUpdateDate + "]";
	}
}
