package kr.freedi.dev.code.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: CodeVO.java
 * @author	: pdh
 * @date	: 2017/2/1 20:4:55
 * @history	:
 * @comment	:
 */

public class CodeVO {

	private String codeGrpId;
	private String codeId;
	private String codeNm;
	private String attr1;
	private String attr2;
	private String attr3;
	private Integer viewOrd;
	private String actFlg;
	private String frstOperId;
	private Date frstOperDt;
	private String lastOperId;
	private Date lastOperDt;
	
	private String[] codeGrpIdList;

	public CodeVO(){
	}


	public String getCodeGrpId(){
		return codeGrpId;
	}
	public void setCodeGrpId(String codeGrpId){
		this.codeGrpId = codeGrpId;
	}

	public String getCodeId(){
		return codeId;
	}
	public void setCodeId(String codeId){
		this.codeId = codeId;
	}

	public String getCodeNm(){
		return codeNm;
	}
	public void setCodeNm(String codeNm){
		this.codeNm = codeNm;
	}

	public String getAttr1(){
		return attr1;
	}
	public void setAttr1(String attr1){
		this.attr1 = attr1;
	}

	public String getAttr2(){
		return attr2;
	}
	public void setAttr2(String attr2){
		this.attr2 = attr2;
	}

	public String getAttr3(){
		return attr3;
	}
	public void setAttr3(String attr3){
		this.attr3 = attr3;
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

	public Integer getViewOrd() {
		return viewOrd;
	}

	public void setViewOrd(Integer viewOrd) {
		this.viewOrd = viewOrd;
	}




	public String[] getCodeGrpIdList() {
		return codeGrpIdList;
	}


	public void setCodeGrpIdList(String[] codeGrpIdList) {
		this.codeGrpIdList = codeGrpIdList;
	}


	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
