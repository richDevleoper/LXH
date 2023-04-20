package kr.freedi.dev.qreport.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.freedi.dev.attachfile.domain.AttachFileVO;

public class ReportResultVO {

	private Integer repResultCode;
	private Integer repCode;
	private String repResultTypeCode;		// 타입코드
	private String repResultType;	        // 타입명
	private String repResultWithinYear;
	private String repResultYear;
	private String repResultCalLogic; 		// 
	
	private String repResultRegUser;
	private Date repResultRegDate;
	private String repResultUpdateUser;
	private Date repResultUpdateDate;
	
	public Integer getRepResultCode() {
		return repResultCode;
	}
	public void setRepResultCode(Integer repResultCode) {
		this.repResultCode = repResultCode;
	}
	public Integer getRepCode() {
		return repCode;
	}
	public void setRepCode(Integer repCode) {
		this.repCode = repCode;
	}
	public String getRepResultTypeCode() {
		return repResultTypeCode;
	}
	public void setRepResultTypeCode(String repResultTypeCode) {
		this.repResultTypeCode = repResultTypeCode;
	}
	public String getRepResultType() {
		return repResultType;
	}
	public void setRepResultType(String repResultType) {
		this.repResultType = repResultType;
	}
	public String getRepResultWithinYear() {
		return repResultWithinYear;
	}
	public void setRepResultWithinYear(String repResultWithinYear) {
		this.repResultWithinYear = repResultWithinYear;
	}
	public String getRepResultYear() {
		return repResultYear;
	}
	public void setRepResultYear(String repResultYear) {
		this.repResultYear = repResultYear;
	}
	public String getRepResultCalLogic() {
		return repResultCalLogic;
	}
	public void setRepResultCalLogic(String repResultCalLogic) {
		this.repResultCalLogic = repResultCalLogic;
	}
	public String getRepResultRegUser() {
		return repResultRegUser;
	}
	public void setRepResultRegUser(String repResultRegUser) {
		this.repResultRegUser = repResultRegUser;
	}
	public Date getRepResultRegDate() {
		return repResultRegDate;
	}
	public void setRepResultRegDate(Date repResultRegDate) {
		this.repResultRegDate = repResultRegDate;
	}
	public String getRepResultUpdateUser() {
		return repResultUpdateUser;
	}
	public void setRepResultUpdateUser(String repResultUpdateUser) {
		this.repResultUpdateUser = repResultUpdateUser;
	}
	public Date getRepResultUpdateDate() {
		return repResultUpdateDate;
	}
	public void setRepResultUpdateDate(Date repResultUpdateDate) {
		this.repResultUpdateDate = repResultUpdateDate;
	}
	@Override
	public String toString() {
		return "ReportResultVO [repResultCode=" + repResultCode + ", repCode=" + repCode + ", repResultTypeCode="
				+ repResultTypeCode + ", repResultType=" + repResultType + ", repResultWithinYear="
				+ repResultWithinYear + ", repResultYear=" + repResultYear + ", repResultCalLogic=" + repResultCalLogic
				+ ", repResultRegUser=" + repResultRegUser + ", repResultRegDate=" + repResultRegDate
				+ ", repResultUpdateUser=" + repResultUpdateUser + ", repResultUpdateDate=" + repResultUpdateDate + "]";
	}
	
}
