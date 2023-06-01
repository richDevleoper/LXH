package kr.freedi.dev.qeducation.domain;

import java.util.List;

import kr.freedi.dev.attachfile.domain.AttachFileVO;

public class EducationVO {
	
	private String eduCode;             // 과정코드
	private String eduName;             // 과정명
	private String eduClass;            // 교육과정
	private String eduClassType;        // 교육형태(교육유형)
	private String eduClassDivision;    // 교육구분(상세유형)
	private String eduClassTarget;      // 교육대상(대상자)
	private String eduClassIntro;       // 과정소개(교육방식)
	private String eduClassSummary;     // 과정개요(이수기준)
	private String eduCost;             // 교육비용
	private String eduInstanceYn;       // 고용보험적용여부
	private String eduDemoUrl;          // 과정맛보기URL
	private String edContentsUrl;       // 과정컨텐츠URL
	private String eduEssentialType;    // 필수구분
	private String eduCompany;          // 교육주관회사
	private String eduComClassCode;     // 교육주관사과정코드
	private String eduClassExternalYn;  // 외부교육여부
	private String eduCompleteScore;    // 교육이수점수
	private String eduCompleteTime;     // 교육이수시간
	private String eduUseYn;            // 사용여부
	private String eduRegUser;          // 등록자
	private String eduRegDate;          // 등록일
	private String eduUpdateUser;       // 수정자
	private String eduUpdateDate;       // 최근수정일시
	
	private String regDate;
	private String updateDate;
	
	private String eduYear; 	      	// 교육연도
	private String eduBeltCode;       	// 벨트
	private String eduNumber;       	// 교육차수
	private String eduDate;       		// 교육일정
	private String eduDate2;
	private String eduFixed;       		// 교육정원
	private String eduItem;       		// 준비사항
	private String eduFileCode;       	// 파일첨부 키
	private String eduClassTypeName;  
	private String eduClassDivisionName;  
	private String eduBeltCodeName;  
	private String tsdCnt;
	
	private String eduCode01;
	private String eduName01;
	private String eduCode02;
	private String eduName02;
	private String eduCode03;
	private String eduName03;
	private String eduCode04;
	private String eduName04;
	
	
	private String mode;		       	
	private String idx;
	
	private List<AttachFileVO> fileList;
	
	public String getEduCode() {
		return eduCode;
	}
	public void setEduCode(String eduCode) {
		this.eduCode = eduCode;
	}
	public String getEduName() {
		return eduName;
	}
	public void setEduName(String eduName) {
		this.eduName = eduName;
	}
	public String getEduClass() {
		return eduClass;
	}
	public void setEduClass(String eduClass) {
		this.eduClass = eduClass;
	}
	public String getEduClassType() {
		return eduClassType;
	}
	public void setEduClassType(String eduClassType) {
		this.eduClassType = eduClassType;
	}
	public String getEduClassDivision() {
		return eduClassDivision;
	}
	public void setEduClassDivision(String eduClassDivision) {
		this.eduClassDivision = eduClassDivision;
	}
	public String getEduClassTarget() {
		return eduClassTarget;
	}
	public void setEduClassTarget(String eduClassTarget) {
		this.eduClassTarget = eduClassTarget;
	}
	public String getEduClassIntro() {
		return eduClassIntro;
	}
	public void setEduClassIntro(String eduClassIntro) {
		this.eduClassIntro = eduClassIntro;
	}
	public String getEduClassSummary() {
		return eduClassSummary;
	}
	public void setEduClassSummary(String eduClassSummary) {
		this.eduClassSummary = eduClassSummary;
	}
	public String getEduCost() {
		return eduCost;
	}
	public void setEduCost(String eduCost) {
		this.eduCost = eduCost;
	}
	public String getEduInstanceYn() {
		return eduInstanceYn;
	}
	public void setEduInstanceYn(String eduInstanceYn) {
		this.eduInstanceYn = eduInstanceYn;
	}
	public String getEduDemoUrl() {
		return eduDemoUrl;
	}
	public void setEduDemoUrl(String eduDemoUrl) {
		this.eduDemoUrl = eduDemoUrl;
	}
	public String getEdContentsUrl() {
		return edContentsUrl;
	}
	public void setEdContentsUrl(String edContentsUrl) {
		this.edContentsUrl = edContentsUrl;
	}
	public String getEduEssentialType() {
		return eduEssentialType;
	}
	public void setEduEssentialType(String eduEssentialType) {
		this.eduEssentialType = eduEssentialType;
	}
	public String getEduCompany() {
		return eduCompany;
	}
	public void setEduCompany(String eduCompany) {
		this.eduCompany = eduCompany;
	}
	public String getEduComClassCode() {
		return eduComClassCode;
	}
	public void setEduComClassCode(String eduComClassCode) {
		this.eduComClassCode = eduComClassCode;
	}
	public String getEduClassExternalYn() {
		return eduClassExternalYn;
	}
	public void setEduClassExternalYn(String eduClassExternalYn) {
		this.eduClassExternalYn = eduClassExternalYn;
	}
	public String getEduCompleteScore() {
		return eduCompleteScore;
	}
	public void setEduCompleteScore(String eduCompleteScore) {
		this.eduCompleteScore = eduCompleteScore;
	}
	public String getEduCompleteTime() {
		return eduCompleteTime;
	}
	public void setEduCompleteTime(String eduCompleteTime) {
		this.eduCompleteTime = eduCompleteTime;
	}
	public String getEduUseYn() {
		return eduUseYn;
	}
	public void setEduUseYn(String eduUseYn) {
		this.eduUseYn = eduUseYn;
	}
	public String getEduRegUser() {
		return eduRegUser;
	}
	public void setEduRegUser(String eduRegUser) {
		this.eduRegUser = eduRegUser;
	}
	public String getEduRegDate() {
		return eduRegDate;
	}
	public void setEduRegDate(String eduRegDate) {
		this.eduRegDate = eduRegDate;
	}
	public String getEduUpdateUser() {
		return eduUpdateUser;
	}
	public void setEduUpdateUser(String eduUpdateUser) {
		this.eduUpdateUser = eduUpdateUser;
	}
	public String getEduUpdateDate() {
		return eduUpdateDate;
	}
	public void setEduUpdateDate(String eduUpdateDate) {
		this.eduUpdateDate = eduUpdateDate;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getEduYear() {
		return eduYear;
	}
	public void setEduYear(String eduYear) {
		this.eduYear = eduYear;
	}
	public String getEduBeltCode() {
		return eduBeltCode;
	}
	public void setEduBeltCode(String eduBeltCode) {
		this.eduBeltCode = eduBeltCode;
	}
	public String getEduNumber() {
		return eduNumber;
	}
	public void setEduNumber(String eduNumber) {
		this.eduNumber = eduNumber;
	}
	public String getEduDate() {
		return eduDate;
	}
	public void setEduDate(String eduDate) {
		this.eduDate = eduDate;
	}
	public String getEduDate2() {
		return eduDate2;
	}
	public void setEduDate2(String eduDate2) {
		this.eduDate2 = eduDate2;
	}
	public String getEduFixed() {
		return eduFixed;
	}
	public void setEduFixed(String eduFixed) {
		this.eduFixed = eduFixed;
	}
	public String getEduItem() {
		return eduItem;
	}
	public void setEduItem(String eduItem) {
		this.eduItem = eduItem;
	}
	public String getEduFileCode() {
		return eduFileCode;
	}
	public void setEduFileCode(String eduFileCode) {
		this.eduFileCode = eduFileCode;
	}
		
	public String getEduClassTypeName() {
		return eduClassTypeName;
	}
	public void setEduClassTypeName(String eduClassTypeName) {
		this.eduClassTypeName = eduClassTypeName;
	}
	public String getEduClassDivisionName() {
		return eduClassDivisionName;
	}
	public void setEduClassDivisionName(String eduClassDivisionName) {
		this.eduClassDivisionName = eduClassDivisionName;
	}
	public String getEduBeltCodeName() {
		return eduBeltCodeName;
	}
	public void setEduBeltCodeName(String eduBeltCodeName) {
		this.eduBeltCodeName = eduBeltCodeName;
	}
	public String getTsdCnt() {
		return tsdCnt;
	}
	public void setTsdCnt(String tsdCnt) {
		this.tsdCnt = tsdCnt;
	}
	
	public String getEduCode01() {
		return eduCode01;
	}
	public void setEduCode01(String eduCode01) {
		this.eduCode01 = eduCode01;
	}
	public String getEduName01() {
		return eduName01;
	}
	public void setEduName01(String eduName01) {
		this.eduName01 = eduName01;
	}
	public String getEduCode02() {
		return eduCode02;
	}
	public void setEduCode02(String eduCode02) {
		this.eduCode02 = eduCode02;
	}
	public String getEduName02() {
		return eduName02;
	}
	public void setEduName02(String eduName02) {
		this.eduName02 = eduName02;
	}
	public String getEduCode03() {
		return eduCode03;
	}
	public void setEduCode03(String eduCode03) {
		this.eduCode03 = eduCode03;
	}
	public String getEduName03() {
		return eduName03;
	}
	public void setEduName03(String eduName03) {
		this.eduName03 = eduName03;
	}
	public String getEduCode04() {
		return eduCode04;
	}
	public void setEduCode04(String eduCode04) {
		this.eduCode04 = eduCode04;
	}
	public String getEduName04() {
		return eduName04;
	}
	public void setEduName04(String eduName04) {
		this.eduName04 = eduName04;
	}
	
	
	
	
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public List<AttachFileVO> getFileList() {
		return fileList;
	}
	public void setFileList(List<AttachFileVO> fileList) {
		this.fileList = fileList;
	}
	
	
	
	//준비사항
	//직책
	//인증일
	//인증여부
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
