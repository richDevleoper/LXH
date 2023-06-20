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
	private String eduQuater;       	// 분기
	
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
	
	private String stdSeq;                 // 수강생 SEQ 번호
	private String comNo;                  // 사번    
	private String stdName;                // 성명  
	private String stdUserId;              // UserId    
	private String stdDepart;              // 부서     
	private String stdJbox;                // 직위     
	private String stdPosition;            // 직책     
	private String stdBeltCode;            // 소속벨트코드 
	private String stdStatus;              // 신청상태(Y: 신청 / N: 취소) 
	private String stdCompleteYn;          // 이수여부 
	private String stdCertCode;            // 인증여부 
	private String stdCertDate;            // 인증일 
	private String stdReapplyYn;           // 재신청여부 
	private String stdRegUser;             // 등록자 
	private String stdRegDate;             // 등록일 
	private String stdUpdateUser;          // 수정자 
	private String stdUpdateDate;          // 수정일 
	
	private String stdDepartNm;
	private String stdJobxNm;
	private String stdPosNm;
	private String stdBeltNm;
	private String stdCompleteNm;
	private String stdStatusNm;
	
	private String stdTestCode;
	private String stdTestDate;
	
	private String mngTit;
	
	private String mode;		       	
	private String idx;
	
	private List<AttachFileVO> fileList;
	private List<EducationVO> myList;
	private List<MyEducationVO> reportList;
	
	private String comCertBelt;
	
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
		
	public String getEduQuater() {
		return eduQuater;
	}
	public void setEduQuater(String eduQuater) {
		this.eduQuater = eduQuater;
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
	
	
	public String getStdSeq() {
		return stdSeq;
	}
	public void setStdSeq(String stdSeq) {
		this.stdSeq = stdSeq;
	}
	public String getComNo() {
		return comNo;
	}
	public void setComNo(String comNo) {
		this.comNo = comNo;
	}
	public String getStdName() {
		return stdName;
	}
	public void setStdName(String stdName) {
		this.stdName = stdName;
	}
	public String getStdUserId() {
		return stdUserId;
	}
	public void setStdUserId(String stdUserId) {
		this.stdUserId = stdUserId;
	}
	public String getStdDepart() {
		return stdDepart;
	}
	public void setStdDepart(String stdDepart) {
		this.stdDepart = stdDepart;
	}
	public String getStdJbox() {
		return stdJbox;
	}
	public void setStdJbox(String stdJbox) {
		this.stdJbox = stdJbox;
	}
	public String getStdPosition() {
		return stdPosition;
	}
	public void setStdPosition(String stdPosition) {
		this.stdPosition = stdPosition;
	}
	public String getStdBeltCode() {
		return stdBeltCode;
	}
	public void setStdBeltCode(String stdBeltCode) {
		this.stdBeltCode = stdBeltCode;
	}
	public String getStdStatus() {
		return stdStatus;
	}
	public void setStdStatus(String stdStatus) {
		this.stdStatus = stdStatus;
	}
	public String getStdCompleteYn() {
		return stdCompleteYn;
	}
	public void setStdCompleteYn(String stdCompleteYn) {
		this.stdCompleteYn = stdCompleteYn;
	}
	public String getStdCertCode() {
		return stdCertCode;
	}
	public void setStdCertCode(String stdCertCode) {
		this.stdCertCode = stdCertCode;
	}
	public String getStdCertDate() {
		return stdCertDate;
	}
	public void setStdCertDate(String stdCertDate) {
		this.stdCertDate = stdCertDate;
	}
	public String getStdReapplyYn() {
		return stdReapplyYn;
	}
	public void setStdReapplyYn(String stdReapplyYn) {
		this.stdReapplyYn = stdReapplyYn;
	}
	public String getStdRegUser() {
		return stdRegUser;
	}
	public void setStdRegUser(String stdRegUser) {
		this.stdRegUser = stdRegUser;
	}
	public String getStdRegDate() {
		return stdRegDate;
	}
	public void setStdRegDate(String stdRegDate) {
		this.stdRegDate = stdRegDate;
	}
	public String getStdUpdateUser() {
		return stdUpdateUser;
	}
	public void setStdUpdateUser(String stdUpdateUser) {
		this.stdUpdateUser = stdUpdateUser;
	}
	public String getStdUpdateDate() {
		return stdUpdateDate;
	}
	public void setStdUpdateDate(String stdUpdateDate) {
		this.stdUpdateDate = stdUpdateDate;
	}
	public String getStdDepartNm() {
		return stdDepartNm;
	}
	public void setStdDepartNm(String stdDepartNm) {
		this.stdDepartNm = stdDepartNm;
	}
	public String getStdJobxNm() {
		return stdJobxNm;
	}
	public void setStdJobxNm(String stdJobxNm) {
		this.stdJobxNm = stdJobxNm;
	}
	public String getStdPosNm() {
		return stdPosNm;
	}
	public void setStdPosNm(String stdPosNm) {
		this.stdPosNm = stdPosNm;
	}
	public String getStdBeltNm() {
		return stdBeltNm;
	}
	public void setStdBeltNm(String stdBeltNm) {
		this.stdBeltNm = stdBeltNm;
	}
	public String getStdCompleteNm() {
		return stdCompleteNm;
	}
	public void setStdCompleteNm(String stdCompleteNm) {
		this.stdCompleteNm = stdCompleteNm;
	}
	public String getStdStatusNm() {
		return stdStatusNm;
	}
	public void setStdStatusNm(String stdStatusNm) {
		this.stdStatusNm = stdStatusNm;
	}
	
	public String getStdTestCode() {
		return stdTestCode;
	}
	public void setStdTestCode(String stdTestCode) {
		this.stdTestCode = stdTestCode;
	}
	public String getStdTestDate() {
		return stdTestDate;
	}
	public void setStdTestDate(String stdTestDate) {
		this.stdTestDate = stdTestDate;
	}
	
	public String getMngTit() {
		return mngTit;
	}
	public void setMngTit(String mngTit) {
		this.mngTit = mngTit;
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
	public List<EducationVO> getMyList() {
		return myList;
	}
	public void setMyList(List<EducationVO> myList) {
		this.myList = myList;
	}
	public List<MyEducationVO> getReportList() {
		return reportList;
	}
	public void setReportList(List<MyEducationVO> reportList) {
		this.reportList = reportList;
	}
	public String getComCertBelt() {
		return comCertBelt;
	}
	public void setComCertBelt(String comCertBelt) {
		this.comCertBelt = comCertBelt;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
