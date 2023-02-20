package kr.freedi.dev.code.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: CodegrpVO.java
 * @author	: pdh
 * @date	: 2017/2/1 16:12:2
 * @history	:
 * @comment	:
 */

public class CodeGrpVO {

	private String codeGrpId;
	private String codeGrpNm;
	private String attr;
	private String actFlg;
	private String frstOperId;
	private Date frstOperDt;
	private String lastOperId;
	private Date lastOperDt;

	public CodeGrpVO(){
	}


	public String getCodeGrpId(){
		return codeGrpId;
	}
	public void setCodeGrpId(String codeGrpId){
		this.codeGrpId = codeGrpId;
	}

	public String getCodeGrpNm() {
		return codeGrpNm;
	}
	public void setCodeGrpNm(String codeGrpNm) {
		this.codeGrpNm = codeGrpNm;
	}

	public String getActFlg(){
		return actFlg;
	}
	public void setActFlg(String actFlg){
		this.actFlg = actFlg;
	}

	public String getFrstOperId(){
		return frstOperId;
	}
	public void setFrstOperId(String frstOperId){
		this.frstOperId = frstOperId;
	}

	public Date getFrstOperDt(){
		return frstOperDt;
	}
	public void setFrstOperDt(Date frstOperDt){
		this.frstOperDt = frstOperDt;
	}

	public String getLastOperId(){
		return lastOperId;
	}
	public void setLastOperId(String lastOperId){
		this.lastOperId = lastOperId;
	}

	public Date getLastOperDt(){
		return lastOperDt;
	}
	public void setLastOperDt(Date lastOperDt){
		this.lastOperDt = lastOperDt;
	}
	public String getAttr() {
		return attr;
	}
	public void setAttr(String attr) {
		this.attr = attr;
	}

	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}


}
