package kr.freedi.dev.user.domain;

import org.apache.commons.lang3.StringUtils;

/**
 * @project : dev_default
 * @file 	: CorpUserParamVO.java
 * @date	: 2017. 2. 17.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class CorpUserParamVO {

	private String chrTel1;
	private String chrTel2;
	private String chrTel3;
	private String chrMob1;
	private String chrMob2;
	private String chrMob3;
	private String chrFax1;
	private String chrFax2;
	private String chrFax3;
	
	private String corpTel1;
	private String corpTel2;
	private String corpTel3;
	private String corpMob1;
	private String corpMob2;
	private String corpMob3;
	private String corpFax1;
	private String corpFax2;
	private String corpFax3;
	
	private String corpId1;
	private String corpId2;
	private String corpId3;
	
	
	public String getChrTel(){
		if(StringUtils.isNotEmpty(chrTel1) && StringUtils.isNotEmpty(chrTel2) &&	StringUtils.isNotEmpty(chrTel3)){
			return chrTel1 + "-" + chrTel2 + "-" + chrTel3;
		}else{
			return null;
		}
	}
	public void setChrTel(String tel){
		if(StringUtils.isNotEmpty(tel)){
			String[] chrTels = StringUtils.split(tel, "-");
			if(chrTels.length == 3){
				chrTel1 = chrTels[0];
				chrTel2 = chrTels[1];
				chrTel3 = chrTels[2];
			}
		}
	}
	
	public String getChrMob(){
		if(StringUtils.isNotEmpty(chrMob1) && StringUtils.isNotEmpty(chrMob2) &&	StringUtils.isNotEmpty(chrMob3)){
			return chrMob1 + "-" + chrMob2 + "-" + chrMob3;
		}else{
			return null;
		}
	}
	public void setChrMob(String mob){
		if(StringUtils.isNotEmpty(mob)){
			String[] chrMobs = StringUtils.split(mob, "-");
			if(chrMobs.length == 3){
				chrMob1 = chrMobs[0];
				chrMob2 = chrMobs[1];
				chrMob3 = chrMobs[2];
			}
		}
	}
	
	public String getChrFax(){
		if(StringUtils.isNotEmpty(chrFax1) && StringUtils.isNotEmpty(chrFax2) &&	StringUtils.isNotEmpty(chrFax3)){
			return chrFax1 + "-" + chrFax2 + "-" + chrFax3;
		}else{
			return null;
		}
	}
	public void setChrFax(String mob){
		if(StringUtils.isNotEmpty(mob)){
			String[] chrFaxs = StringUtils.split(mob, "-");
			if(chrFaxs.length == 3){
				chrFax1 = chrFaxs[0];
				chrFax2 = chrFaxs[1];
				chrFax3 = chrFaxs[2];
			}
		}
	}
	
	public String getCorpTel(){
		if(StringUtils.isNotEmpty(corpTel1) && StringUtils.isNotEmpty(corpTel2) &&	StringUtils.isNotEmpty(corpTel3)){
			return corpTel1 + "-" + corpTel2 + "-" + corpTel3;
		}else{
			return null;
		}
	}
	public void setCorpTel(String tel){
		if(StringUtils.isNotEmpty(tel)){
			String[] corpTels = StringUtils.split(tel, "-");
			if(corpTels.length == 3){
				corpTel1 = corpTels[0];
				corpTel2 = corpTels[1];
				corpTel3 = corpTels[2];
			}
		}
	}
	
	public String getCorpMob(){
		if(StringUtils.isNotEmpty(corpMob1) && StringUtils.isNotEmpty(corpMob2) &&	StringUtils.isNotEmpty(corpMob3)){
			return corpMob1 + "-" + corpMob2 + "-" + corpMob3;
		}else{
			return null;
		}
	}
	public void setCorpMob(String mob){
		if(StringUtils.isNotEmpty(mob)){
			String[] corpMobs = StringUtils.split(mob, "-");
			if(corpMobs.length == 3){
				corpMob1 = corpMobs[0];
				corpMob2 = corpMobs[1];
				corpMob3 = corpMobs[2];
			}
		}
	}
	
	public String getCorpFax(){
		if(StringUtils.isNotEmpty(corpFax1) && StringUtils.isNotEmpty(corpFax2) &&	StringUtils.isNotEmpty(corpFax3)){
			return corpFax1 + "-" + corpFax2 + "-" + corpFax3;
		}else{
			return null;
		}
	}
	public void setCorpFax(String mob){
		if(StringUtils.isNotEmpty(mob)){
			String[] corpFaxs = StringUtils.split(mob, "-");
			if(corpFaxs.length == 3){
				corpFax1 = corpFaxs[0];
				corpFax2 = corpFaxs[1];
				corpFax3 = corpFaxs[2];
			}
		}
	}
	
	public String getCorpId() {

		if(StringUtils.isNotEmpty(corpId1) && StringUtils.isNotEmpty(corpId2) && StringUtils.isNotEmpty(corpId3)) {
			return corpId1 + "-" + corpId2 + "-" + corpId3;
		}else{
			return null;
		}
	}

	public void setCorpId(String corpId) {
		if(StringUtils.isNotEmpty(corpId)){
			String[] corpIds = StringUtils.split(corpId, "-");
			if (corpIds.length == 3) {
				corpId1 = corpIds[0];
				corpId2 = corpIds[1];
				corpId3 = corpIds[2];
			}
		}
	}
	
	public String getChrTel1() {
		return chrTel1;
	}
	public void setChrTel1(String chrTel1) {
		this.chrTel1 = chrTel1;
	}
	public String getChrTel2() {
		return chrTel2;
	}
	public void setChrTel2(String chrTel2) {
		this.chrTel2 = chrTel2;
	}
	public String getChrTel3() {
		return chrTel3;
	}
	public void setChrTel3(String chrTel3) {
		this.chrTel3 = chrTel3;
	}
	public String getChrMob1() {
		return chrMob1;
	}
	public void setChrMob1(String chrMob1) {
		this.chrMob1 = chrMob1;
	}
	public String getChrMob2() {
		return chrMob2;
	}
	public void setChrMob2(String chrMob2) {
		this.chrMob2 = chrMob2;
	}
	public String getChrMob3() {
		return chrMob3;
	}
	public void setChrMob3(String chrMob3) {
		this.chrMob3 = chrMob3;
	}
	public String getChrFax1() {
		return chrFax1;
	}
	public void setChrFax1(String chrFax1) {
		this.chrFax1 = chrFax1;
	}
	public String getChrFax2() {
		return chrFax2;
	}
	public void setChrFax2(String chrFax2) {
		this.chrFax2 = chrFax2;
	}
	public String getChrFax3() {
		return chrFax3;
	}
	public void setChrFax3(String chrFax3) {
		this.chrFax3 = chrFax3;
	}
	public String getCorpTel1() {
		return corpTel1;
	}
	public void setCorpTel1(String corpTel1) {
		this.corpTel1 = corpTel1;
	}
	public String getCorpTel2() {
		return corpTel2;
	}
	public void setCorpTel2(String corpTel2) {
		this.corpTel2 = corpTel2;
	}
	public String getCorpTel3() {
		return corpTel3;
	}
	public void setCorpTel3(String corpTel3) {
		this.corpTel3 = corpTel3;
	}
	public String getCorpMob1() {
		return corpMob1;
	}
	public void setCorpMob1(String corpMob1) {
		this.corpMob1 = corpMob1;
	}
	public String getCorpMob2() {
		return corpMob2;
	}
	public void setCorpMob2(String corpMob2) {
		this.corpMob2 = corpMob2;
	}
	public String getCorpMob3() {
		return corpMob3;
	}
	public void setCorpMob3(String corpMob3) {
		this.corpMob3 = corpMob3;
	}
	public String getCorpFax1() {
		return corpFax1;
	}
	public void setCorpFax1(String corpFax1) {
		this.corpFax1 = corpFax1;
	}
	public String getCorpFax2() {
		return corpFax2;
	}
	public void setCorpFax2(String corpFax2) {
		this.corpFax2 = corpFax2;
	}
	public String getCorpFax3() {
		return corpFax3;
	}
	public void setCorpFax3(String corpFax3) {
		this.corpFax3 = corpFax3;
	}
	public String getCorpId1() {
		return corpId1;
	}
	public void setCorpId1(String corpId1) {
		this.corpId1 = corpId1;
	}
	public String getCorpId2() {
		return corpId2;
	}
	public void setCorpId2(String corpId2) {
		this.corpId2 = corpId2;
	}
	public String getCorpId3() {
		return corpId3;
	}
	public void setCorpId3(String corpId3) {
		this.corpId3 = corpId3;
	}
}


