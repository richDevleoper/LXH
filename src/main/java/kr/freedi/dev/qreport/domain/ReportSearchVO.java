package kr.freedi.dev.qreport.domain;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.domain.CommonVO;

/**
 * @project : dev_default
 * @file 	: ArticleSearchVO.java
 * @date	: 2017. 2. 20.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class ReportSearchVO extends CommonVO {

	
	@ParamField
	private String searchRepName;	//과제명
	
	@ParamField
	private String searchDivision;	// 6Sig Full Process 여부
	
	@ParamField
	private String searchType;		// 과제유형
	
	@ParamField
	private String searchStatus;	// 진행현황 status_code
	
	@ParamField
	private String searchDepart; // 부서
	
	private String searchDepartName; // 부서명
	
	
	private String menuCode;		// 과제/10+ or 분임조과제 구분
	
	private String searchSectorCode;	// 부문

	private String searchPlaceCode; // 사업장
	
	private String searchActionTypeCode; // 활동분야
	
	private String searchLeaderBeltCode; // 과제리더벨트
	
	private String searchTeamMemberType;
	
	private String searchTeamMemberName;
	
	private String searchUseRefDate; // 활용률 반영년도
	
	private String searchFromDt; // 조회기간(시작)
	
	private String searchToDt; // 조회기간(끝)
	
	//searchUserid() // 로그인
	
	//private String loginUserId;		// 로그인ID(세션)
	
	private String orderByTyp;

	public String getSearchRepName() {
		return searchRepName;
	}

	public void setSearchRepName(String searchRepName) {
		this.searchRepName = searchRepName;
	}

	public String getSearchDivision() {
		return searchDivision;
	}

	public void setSearchDivision(String searchDivision) {
		this.searchDivision = searchDivision;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchStatus() {
		return searchStatus;
	}

	public void setSearchStatus(String searchStatus) {
		this.searchStatus = searchStatus;
	}

	public String getOrderByTyp() {
		return orderByTyp;
	}

	public void setOrderByTyp(String orderByTyp) {
		this.orderByTyp = orderByTyp;
	}

	public String getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	public String getSearchSectorCode() {
		return searchSectorCode;
	}

	public void setSearchSectorCode(String searchSectorCode) {
		this.searchSectorCode = searchSectorCode;
	}

	public String getSearchPlaceCode() {
		return searchPlaceCode;
	}

	public void setSearchPlaceCode(String searchPlaceCode) {
		this.searchPlaceCode = searchPlaceCode;
	}

	public String getSearchActionTypeCode() {
		return searchActionTypeCode;
	}

	public void setSearchActionTypeCode(String searchActionTypeCode) {
		this.searchActionTypeCode = searchActionTypeCode;
	}

	public String getSearchLeaderBeltCode() {
		return searchLeaderBeltCode;
	}

	public void setSearchLeaderBeltCode(String searchLeaderBeltCode) {
		this.searchLeaderBeltCode = searchLeaderBeltCode;
	}

	public String getSearchFromDt() {
		return searchFromDt;
	}

	public void setSearchFromDt(String searchFromDt) {
		this.searchFromDt = searchFromDt;
	}

	public String getSearchToDt() {
		return searchToDt;
	}

	public void setSearchToDt(String searchToDt) {
		this.searchToDt = searchToDt;
	}

	public String getSearchTeamMemberType() {
		return searchTeamMemberType;
	}

	public void setSearchTeamMemberType(String searchTeamMemberType) {
		this.searchTeamMemberType = searchTeamMemberType;
	}

	public String getSearchTeamMemberName() {
		return searchTeamMemberName;
	}

	public void setSearchTeamMemberName(String searchTeamMemberName) {
		this.searchTeamMemberName = searchTeamMemberName;
	}

	public String getSearchDepart() {
		return searchDepart;
	}
	
	public void setSearchDepart(String searchDepart) {
		this.searchDepart = searchDepart;
	}

	public String getSearchDepartName() {
		return searchDepartName;
	}

	public void setSearchDepartName(String searchDepartName) {
		this.searchDepartName = searchDepartName;
	}

	public String getSearchUseRefDate() {
		return searchUseRefDate;
	}

	public void setSearchUseRefDate(String searchUseRefDate) {
		this.searchUseRefDate = searchUseRefDate;
	}

	@Override
	public String toString() {
		return "ReportSearchVO [searchRepName=" + searchRepName + ", searchDivision=" + searchDivision + ", searchType="
				+ searchType + ", searchStatus=" + searchStatus + ", searchDepart=" + searchDepart
				+ ", searchDepartName=" + searchDepartName + ", menuCode=" + menuCode + ", searchSectorCode="
				+ searchSectorCode + ", searchPlaceCode=" + searchPlaceCode + ", searchActionTypeCode="
				+ searchActionTypeCode + ", searchLeaderBeltCode=" + searchLeaderBeltCode + ", searchTeamMemberType="
				+ searchTeamMemberType + ", searchTeamMemberName=" + searchTeamMemberName + ", searchUseRefDate="
				+ searchUseRefDate + ", searchFromDt=" + searchFromDt + ", searchToDt=" + searchToDt + ", orderByTyp="
				+ orderByTyp + "]";
	}
	
}
