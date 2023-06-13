package kr.freedi.dev.qeducation.domain;

import java.util.List;

import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.common.domain.CommonVO;

public class StudentVO extends CommonVO {
	private String stdSeq;                 // 수강생 SEQ 번호
	private String comNo;                  // 사번     
	private String eduCode;                // 과정코드    
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
	private String stdTestCode;
	private String stdTestDate;
	
	private String stdDepartNm;
	private String stdJobxNm;
	private String stdPosNm;
	private String stdBeltNm;
	
	private String stdReqCnt;          	   // 교육과정신청개수
	private String stdMyCnt;              // 내가 신청한 개수(교육과정코드)
	
	private String mode;		       	
	private String idx;
	private String result;
	
	private String stdCompleteNm;
	private String stdStatusNm;
	
	private List<AttachFileVO> fileList;

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

	public String getEduCode() {
		return eduCode;
	}

	public void setEduCode(String eduCode) {
		this.eduCode = eduCode;
	}
	
	public String getStdUserId() {
		return stdUserId;
	}

	public void setStdUserId(String stdUserId) {
		this.stdUserId = stdUserId;
	}

	public String getStdName() {
		return stdName;
	}

	public void setStdName(String stdName) {
		this.stdName = stdName;
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

	public String getStdReqCnt() {
		return stdReqCnt;
	}

	public void setStdReqCnt(String stdReqCnt) {
		this.stdReqCnt = stdReqCnt;
	}

	public String getStdMyCnt() {
		return stdMyCnt;
	}

	public void setStdMyCnt(String stdMyCnt) {
		this.stdMyCnt = stdMyCnt;
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

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
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
	
	
	
	
	
}
