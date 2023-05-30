package kr.freedi.dev.qproposal.domain;

import java.util.List;

import kr.freedi.dev.attachfile.domain.AttachFileVO;

public class ProposalVO {

	private Integer propSeq;
	private String propName;
	private String propCategoryCode;
	private String propTypeCode;
	private String propProblem;
	private String propImprovementCont;
	private String propBenefit;
	private String propYearEffect;
	private String propYearEffectCode;
	private String propRelMemoYn;
	private String propRelMemoCode;
	private String propRelMemoCodeName;
	private String propGroupName;
	private String propBeltCode;
	private String propBizPlaceCode;
	private String propCircleCode;
	private String propApproverCode;
	private String propPropStatCode;
	private String propEvalLvCode;
	private String propEvalScore;
	private String propEffectScore;
	private String propSubsidy;
	private String propPaymentYn;
	private String propPaymentDate;
	private String propDate;
	private String propPracticeCompDate;
	private String propUser;
	private String propRegDate;
	private String propRegUser;
	
	private String propCategoryCodeName;
	private String propTypeCodeName;
	private String propYearEffectCodeName;
	private String propPropStatCodeName;
	private String propEvalLvCodeName;
	private String propPaymentYnName;
	
	private String propUserName;
	private String propApproverName;
	private String propCircleName;
	
	private Integer idx;
	
	private List<AttachFileVO> beforeAttachFileList;
	private List<AttachFileVO> afterAttachFileList;
	private List<AttachFileVO> attachFileList;
	
	private String propApprovalName;
	private String propApprovalUser;
	private String propApprovalLevelCode;
	private String propApprovalLevel;
	private String propApprovalDutyCode;
	private String propApprovalDuty;
	private String propApprovalBeltCode;
	private String propApprovalBelt;
	private String propApprovalGroup;
	private String propApprovalGroupCode;
	
	//////////////////////////////////////////////////////////////////////////////////
	// 마감
	//////////////////////////////////////////////////////////////////////////////////
	private List<EvalProposalVO> evalProposalList;

	public Integer getPropSeq() {
		return propSeq;
	}

	public void setPropSeq(Integer propSeq) {
		this.propSeq = propSeq;
	}

	public String getPropName() {
		return propName;
	}

	public void setPropName(String propName) {
		this.propName = propName;
	}

	public String getPropCategoryCode() {
		return propCategoryCode;
	}

	public void setPropCategoryCode(String propCategoryCode) {
		this.propCategoryCode = propCategoryCode;
	}

	public String getPropTypeCode() {
		return propTypeCode;
	}

	public void setPropTypeCode(String propTypeCode) {
		this.propTypeCode = propTypeCode;
	}

	public String getPropProblem() {
		return propProblem;
	}

	public void setPropProblem(String propProblem) {
		this.propProblem = propProblem;
	}

	public String getPropImprovementCont() {
		return propImprovementCont;
	}

	public void setPropImprovementCont(String propImprovementCont) {
		this.propImprovementCont = propImprovementCont;
	}

	public String getPropBenefit() {
		return propBenefit;
	}

	public void setPropBenefit(String propBenefit) {
		this.propBenefit = propBenefit;
	}

	public String getPropYearEffect() {
		return propYearEffect;
	}

	public void setPropYearEffect(String propYearEffect) {
		this.propYearEffect = propYearEffect;
	}

	public String getPropYearEffectCode() {
		return propYearEffectCode;
	}

	public void setPropYearEffectCode(String propYearEffectCode) {
		this.propYearEffectCode = propYearEffectCode;
	}

	public String getPropRelMemoYn() {
		return propRelMemoYn;
	}

	public void setPropRelMemoYn(String propRelMemoYn) {
		this.propRelMemoYn = propRelMemoYn;
	}

	public String getPropRelMemoCode() {
		return propRelMemoCode;
	}

	public void setPropRelMemoCode(String propRelMemoCode) {
		this.propRelMemoCode = propRelMemoCode;
	}

	public String getPropRelMemoCodeName() {
		return propRelMemoCodeName;
	}

	public void setPropRelMemoCodeName(String propRelMemoCodeName) {
		this.propRelMemoCodeName = propRelMemoCodeName;
	}

	public String getPropGroupName() {
		return propGroupName;
	}

	public void setPropGroupName(String propGroupName) {
		this.propGroupName = propGroupName;
	}

	public String getPropBeltCode() {
		return propBeltCode;
	}

	public void setPropBeltCode(String propBeltCode) {
		this.propBeltCode = propBeltCode;
	}

	public String getPropBizPlaceCode() {
		return propBizPlaceCode;
	}

	public void setPropBizPlaceCode(String propBizPlaceCode) {
		this.propBizPlaceCode = propBizPlaceCode;
	}

	public String getPropCircleCode() {
		return propCircleCode;
	}

	public void setPropCircleCode(String propCircleCode) {
		this.propCircleCode = propCircleCode;
	}

	public String getPropApproverCode() {
		return propApproverCode;
	}

	public void setPropApproverCode(String propApproverCode) {
		this.propApproverCode = propApproverCode;
	}

	public String getPropPropStatCode() {
		return propPropStatCode;
	}

	public void setPropPropStatCode(String propPropStatCode) {
		this.propPropStatCode = propPropStatCode;
	}

	public String getPropEvalLvCode() {
		return propEvalLvCode;
	}

	public void setPropEvalLvCode(String propEvalLvCode) {
		this.propEvalLvCode = propEvalLvCode;
	}

	public String getPropEvalScore() {
		return propEvalScore;
	}

	public void setPropEvalScore(String propEvalScore) {
		this.propEvalScore = propEvalScore;
	}

	public String getPropEffectScore() {
		return propEffectScore;
	}

	public void setPropEffectScore(String propEffectScore) {
		this.propEffectScore = propEffectScore;
	}

	public String getPropSubsidy() {
		return propSubsidy;
	}

	public void setPropSubsidy(String propSubsidy) {
		this.propSubsidy = propSubsidy;
	}

	public String getPropPaymentYn() {
		return propPaymentYn;
	}

	public void setPropPaymentYn(String propPaymentYn) {
		this.propPaymentYn = propPaymentYn;
	}

	public String getPropPaymentDate() {
		return propPaymentDate;
	}

	public void setPropPaymentDate(String propPaymentDate) {
		this.propPaymentDate = propPaymentDate;
	}

	public String getPropDate() {
		return propDate;
	}

	public void setPropDate(String propDate) {
		this.propDate = propDate;
	}

	public String getPropPracticeCompDate() {
		return propPracticeCompDate;
	}

	public void setPropPracticeCompDate(String propPracticeCompDate) {
		this.propPracticeCompDate = propPracticeCompDate;
	}

	public String getPropUser() {
		return propUser;
	}

	public void setPropUser(String propUser) {
		this.propUser = propUser;
	}

	public String getPropRegDate() {
		return propRegDate;
	}

	public void setPropRegDate(String propRegDate) {
		this.propRegDate = propRegDate;
	}

	public String getPropRegUser() {
		return propRegUser;
	}

	public void setPropRegUser(String propRegUser) {
		this.propRegUser = propRegUser;
	}

	public String getPropCategoryCodeName() {
		return propCategoryCodeName;
	}

	public void setPropCategoryCodeName(String propCategoryCodeName) {
		this.propCategoryCodeName = propCategoryCodeName;
	}

	public String getPropTypeCodeName() {
		return propTypeCodeName;
	}

	public void setPropTypeCodeName(String propTypeCodeName) {
		this.propTypeCodeName = propTypeCodeName;
	}

	public String getPropYearEffectCodeName() {
		return propYearEffectCodeName;
	}

	public void setPropYearEffectCodeName(String propYearEffectCodeName) {
		this.propYearEffectCodeName = propYearEffectCodeName;
	}

	public String getPropPropStatCodeName() {
		return propPropStatCodeName;
	}

	public void setPropPropStatCodeName(String propPropStatCodeName) {
		this.propPropStatCodeName = propPropStatCodeName;
	}

	public String getPropEvalLvCodeName() {
		return propEvalLvCodeName;
	}

	public void setPropEvalLvCodeName(String propEvalLvCodeName) {
		this.propEvalLvCodeName = propEvalLvCodeName;
	}

	public String getPropPaymentYnName() {
		return propPaymentYnName;
	}

	public void setPropPaymentYnName(String propPaymentYnName) {
		this.propPaymentYnName = propPaymentYnName;
	}

	public String getPropUserName() {
		return propUserName;
	}

	public void setPropUserName(String propUserName) {
		this.propUserName = propUserName;
	}

	public String getPropApproverName() {
		return propApproverName;
	}

	public void setPropApproverName(String propApproverName) {
		this.propApproverName = propApproverName;
	}

	public String getPropCircleName() {
		return propCircleName;
	}

	public void setPropCircleName(String propCircleName) {
		this.propCircleName = propCircleName;
	}

	public Integer getIdx() {
		return idx;
	}

	public void setIdx(Integer idx) {
		this.idx = idx;
	}

	public List<AttachFileVO> getBeforeAttachFileList() {
		return beforeAttachFileList;
	}

	public void setBeforeAttachFileList(List<AttachFileVO> beforeAttachFileList) {
		this.beforeAttachFileList = beforeAttachFileList;
	}

	public List<AttachFileVO> getAfterAttachFileList() {
		return afterAttachFileList;
	}

	public void setAfterAttachFileList(List<AttachFileVO> afterAttachFileList) {
		this.afterAttachFileList = afterAttachFileList;
	}

	public List<AttachFileVO> getAttachFileList() {
		return attachFileList;
	}

	public void setAttachFileList(List<AttachFileVO> attachFileList) {
		this.attachFileList = attachFileList;
	}

	public String getPropApprovalName() {
		return propApprovalName;
	}

	public void setPropApprovalName(String propApprovalName) {
		this.propApprovalName = propApprovalName;
	}

	public String getPropApprovalUser() {
		return propApprovalUser;
	}

	public void setPropApprovalUser(String propApprovalUser) {
		this.propApprovalUser = propApprovalUser;
	}

	public String getPropApprovalLevelCode() {
		return propApprovalLevelCode;
	}

	public void setPropApprovalLevelCode(String propApprovalLevelCode) {
		this.propApprovalLevelCode = propApprovalLevelCode;
	}

	public String getPropApprovalLevel() {
		return propApprovalLevel;
	}

	public void setPropApprovalLevel(String propApprovalLevel) {
		this.propApprovalLevel = propApprovalLevel;
	}

	public String getPropApprovalDutyCode() {
		return propApprovalDutyCode;
	}

	public void setPropApprovalDutyCode(String propApprovalDutyCode) {
		this.propApprovalDutyCode = propApprovalDutyCode;
	}

	public String getPropApprovalDuty() {
		return propApprovalDuty;
	}

	public void setPropApprovalDuty(String propApprovalDuty) {
		this.propApprovalDuty = propApprovalDuty;
	}

	public String getPropApprovalBeltCode() {
		return propApprovalBeltCode;
	}

	public void setPropApprovalBeltCode(String propApprovalBeltCode) {
		this.propApprovalBeltCode = propApprovalBeltCode;
	}

	public String getPropApprovalBelt() {
		return propApprovalBelt;
	}

	public void setPropApprovalBelt(String propApprovalBelt) {
		this.propApprovalBelt = propApprovalBelt;
	}

	public String getPropApprovalGroup() {
		return propApprovalGroup;
	}

	public void setPropApprovalGroup(String propApprovalGroup) {
		this.propApprovalGroup = propApprovalGroup;
	}

	public String getPropApprovalGroupCode() {
		return propApprovalGroupCode;
	}

	public void setPropApprovalGroupCode(String propApprovalGroupCode) {
		this.propApprovalGroupCode = propApprovalGroupCode;
	}

	public List<EvalProposalVO> getEvalProposalList() {
		return evalProposalList;
	}

	public void setEvalProposalList(List<EvalProposalVO> evalProposalList) {
		this.evalProposalList = evalProposalList;
	}
}
