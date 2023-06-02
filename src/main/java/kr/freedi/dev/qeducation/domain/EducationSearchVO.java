package kr.freedi.dev.qeducation.domain;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

public class EducationSearchVO extends CommonVO {
	@ParamField
	private String searchEduName;		// 교육과정명
	@ParamField
	private String searchEduYear;		// 교육연도
	@ParamField
	private String searchbeltCode;		// 인증벨트
	@ParamField
	private String searchEduType;		// 교육유형
	@ParamField
	private String searchEduDivision;	// 상세유형
	@ParamField
	private String searchEduNumber;		// 교육차수
	@ParamField
	private String searchEduFromDt; 		// 조회기간(시작)
	@ParamField
	private String searchEduToDt; 			// 조회기간(끝)
	
	public String getSearchEduName() {
		return searchEduName;
	}
	public void setSearchEduName(String searchEduName) {
		this.searchEduName = searchEduName;
	}
	public String getSearchEduYear() {
		return searchEduYear;
	}
	public void setSearchEduYear(String searchEduYear) {
		this.searchEduYear = searchEduYear;
	}
	public String getSearchbeltCode() {
		return searchbeltCode;
	}
	public void setSearchbeltCode(String searchbeltCode) {
		this.searchbeltCode = searchbeltCode;
	}
	public String getSearchEduType() {
		return searchEduType;
	}
	public void setSearchEduType(String searchEduType) {
		this.searchEduType = searchEduType;
	}
	public String getSearchEduDivision() {
		return searchEduDivision;
	}
	public void setSearchEduDivision(String searchEduDivision) {
		this.searchEduDivision = searchEduDivision;
	}
	public String getSearchEduNumber() {
		return searchEduNumber;
	}
	public void setSearchEduNumber(String searchEduNumber) {
		this.searchEduNumber = searchEduNumber;
	}
	public String getSearchEduFromDt() {
		return searchEduFromDt;
	}
	public void setSearchEduFromDt(String searchEduFromDt) {
		this.searchEduFromDt = searchEduFromDt;
	}
	public String getSearchEduToDt() {
		return searchEduToDt;
	}
	public void setSearchEduToDt(String searchEduToDt) {
		this.searchEduToDt = searchEduToDt;
	}

	
	
}
