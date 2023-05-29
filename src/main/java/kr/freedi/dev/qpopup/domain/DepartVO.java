package kr.freedi.dev.qpopup.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.freedi.dev.attachfile.domain.AttachFileVO;

public class DepartVO {

	private String deptCode;        // 부서코드
	private String deptName;        // 부서명
	private String deptUperCode;    // 상위부서
	private String deptSortOrder;   // 정렬순서
	private String deptLevel;       // 부서레벨
	private String deptStateCode;   // 부서상태코드 (D=delete, I=insert, U=update)
	private String comCode;         // 회사코드
	private String deptLv1Code;     // LV1부서코드
	private String deptLv2Code;     // LV2부서코드
	private String deptLv3Code;     // LV3부서코드
	private String deptLv4Code;     // LV4부서코드
	private String deptLv1Name;     // LV1부서명
	private String deptLv2Name;     // LV2부서명
	private String deptLv3Name;     // LV3부서명
	private String deptLv4Name;     // LV4부서명
	private Date regDate;         // 등록일 (YYYY-MM-DD HH:MM:SS)z
	private Date updateDate;      // 수정일 (YYYY-MM-DD HH:MM:SS)
	private String comNo;
	
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
	public String getDeptUperCode() {
		return deptUperCode;
	}
	public void setDeptUperCode(String deptUperCode) {
		this.deptUperCode = deptUperCode;
	}
	public String getDeptSortOrder() {
		return deptSortOrder;
	}
	public void setDeptSortOrder(String deptSortOrder) {
		this.deptSortOrder = deptSortOrder;
	}
	public String getDeptLevel() {
		return deptLevel;
	}
	public void setDeptLevel(String deptLevel) {
		this.deptLevel = deptLevel;
	}
	public String getDeptStateCode() {
		return deptStateCode;
	}
	public void setDeptStateCode(String deptStateCode) {
		this.deptStateCode = deptStateCode;
	}
	public String getComCode() {
		return comCode;
	}
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}
	public String getDeptLv1Code() {
		return deptLv1Code;
	}
	public void setDeptLv1Code(String deptLv1Code) {
		this.deptLv1Code = deptLv1Code;
	}
	public String getDeptLv2Code() {
		return deptLv2Code;
	}
	public void setDeptLv2Code(String deptLv2Code) {
		this.deptLv2Code = deptLv2Code;
	}
	public String getDeptLv3Code() {
		return deptLv3Code;
	}
	public void setDeptLv3Code(String deptLv3Code) {
		this.deptLv3Code = deptLv3Code;
	}
	public String getDeptLv4Code() {
		return deptLv4Code;
	}
	public void setDeptLv4Code(String deptLv4Code) {
		this.deptLv4Code = deptLv4Code;
	}
	public String getDeptLv1Name() {
		return deptLv1Name;
	}
	public void setDeptLv1Name(String deptLv1Name) {
		this.deptLv1Name = deptLv1Name;
	}
	public String getDeptLv2Name() {
		return deptLv2Name;
	}
	public void setDeptLv2Name(String deptLv2Name) {
		this.deptLv2Name = deptLv2Name;
	}
	public String getDeptLv3Name() {
		return deptLv3Name;
	}
	public void setDeptLv3Name(String deptLv3Name) {
		this.deptLv3Name = deptLv3Name;
	}
	public String getDeptLv4Name() {
		return deptLv4Name;
	}
	public void setDeptLv4Name(String deptLv4Name) {
		this.deptLv4Name = deptLv4Name;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getComNo() {
		return comNo;
	}
	public void setComNo(String comNo) {
		this.comNo = comNo;
	}
	
	@Override
	public String toString() {
		return "DepartVO [deptCode=" + deptCode + ", deptName=" + deptName + ", deptUperCode=" + deptUperCode
				+ ", deptSortOrder=" + deptSortOrder + ", deptLevel=" + deptLevel + ", deptStateCode=" + deptStateCode
				+ ", comCode=" + comCode + ", deptLv1Code=" + deptLv1Code + ", deptLv2Code=" + deptLv2Code
				+ ", deptLv3Code=" + deptLv3Code + ", deptLv4Code=" + deptLv4Code + ", deptLv1Name=" + deptLv1Name
				+ ", deptLv2Name=" + deptLv2Name + ", deptLv3Name=" + deptLv3Name + ", deptLv4Name=" + deptLv4Name
				+ ", regDate=" + regDate + ", updateDate=" + updateDate + ", comNo=" + comNo + "]";
	}
}
