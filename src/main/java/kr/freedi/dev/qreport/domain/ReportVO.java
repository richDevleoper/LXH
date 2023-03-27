package kr.freedi.dev.qreport.domain;

public class ReportVO {
	private String repName;
	private String repDivisionCode;
	private String repTypeCode;



	public String getRepName() {
		return repName;
	}

	public void setRepName(String repName) {
		this.repName = repName;
	}

	public String getRepDivisionCode() {
		return repDivisionCode;
	}

	public void setRepDivisionCode(String repDevisionCode) {
		this.repDivisionCode = repDevisionCode;
	}
	public String getRepTypeCode() {
		return repTypeCode;
	}

	public void setRepTypeCode(String repTypeCode) {
		this.repTypeCode = repTypeCode;
	}

	@Override
	public String toString() {
		return "ReportVO [repName=" + repName + ", repDivisionCode=" + repDivisionCode + "]";
	}
}
