package kr.freedi.dev.qeducation.domain;

import java.util.List;

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
	
	private String searchStdName;
	private String searchStdDepart;
	private String searchStdPosition;
	private String searchCertFromDt;
	private String searchCertToDt;
	
	private String stdCertDate;
	private String tabId;
	
	private List<EducationVO> dataList;
	private int cnt;
	
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
	public String getSearchStdName() {
		return searchStdName;
	}
	public void setSearchStdName(String searchStdName) {
		this.searchStdName = searchStdName;
	}
	public String getSearchStdDepart() {
		return searchStdDepart;
	}
	public void setSearchStdDepart(String searchStdDepart) {
		this.searchStdDepart = searchStdDepart;
	}
	public String getSearchStdPosition() {
		return searchStdPosition;
	}
	public void setSearchStdPosition(String searchStdPosition) {
		this.searchStdPosition = searchStdPosition;
	}
	public String getSearchCertFromDt() {
		return searchCertFromDt;
	}
	public void setSearchCertFromDt(String searchCertFromDt) {
		this.searchCertFromDt = searchCertFromDt;
	}
	public String getSearchCertToDt() {
		return searchCertToDt;
	}
	public void setSearchCertToDt(String searchCertToDt) {
		this.searchCertToDt = searchCertToDt;
	}
	public List<EducationVO> getDataList() {
		return dataList;
	}
	public void setDataList(List<EducationVO> dataList) {
		this.dataList = dataList;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getStdCertDate() {
		return stdCertDate;
	}
	public void setStdCertDate(String stdCertDate) {
		this.stdCertDate = stdCertDate;
	}
	public String getTabId() {
		return tabId;
	}
	public void setTabId(String tabId) {
		this.tabId = tabId;
	}

	
	
}
