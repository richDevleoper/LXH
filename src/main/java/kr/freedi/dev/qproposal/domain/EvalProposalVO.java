package kr.freedi.dev.qproposal.domain;

import java.io.Serializable;

public class EvalProposalVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int propSeq;
	private String propEvalLvCode;
	private String propEvalScore;
	
	private String propSubsidy;
	private String propPaymentYn;
	
	public int getPropSeq() {
		return propSeq;
	}
	public void setPropSeq(int propSeq) {
		this.propSeq = propSeq;
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
}
