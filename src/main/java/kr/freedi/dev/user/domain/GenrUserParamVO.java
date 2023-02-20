package kr.freedi.dev.user.domain;

import org.apache.commons.lang3.StringUtils;

/**
 * @project : dev_default
 * @file 	: GenrUserParamVO.java
 * @date	: 2017. 2. 17.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class GenrUserParamVO {

	private String tel1;
	private String tel2;
	private String tel3;
	private String mob1;
	private String mob2;
	private String mob3;
	
	
	public String getTel(){
		if(StringUtils.isNotEmpty(tel1) && StringUtils.isNotEmpty(tel2) &&	StringUtils.isNotEmpty(tel3)){
			return tel1 + "-" + tel2 + "-" + tel3;
		}else{
			return null;
		}
	}
	public void setTel(String tel){
		if(StringUtils.isNotEmpty(tel)){
			String[] tels = StringUtils.split(tel, "-");
			if(tels.length == 3){
				tel1 = tels[0];
				tel2 = tels[1];
				tel3 = tels[2];
			}
		}
	}
	
	public String getMob(){
		if(StringUtils.isNotEmpty(mob1) && StringUtils.isNotEmpty(mob2) &&	StringUtils.isNotEmpty(mob3)){
			return mob1 + "-" + mob2 + "-" + mob3;
		}else{
			return null;
		}
	}
	public void setMob(String mob){
		if(StringUtils.isNotEmpty(mob)){
			String[] mobs = StringUtils.split(mob, "-");
			if(mobs.length == 3){
				mob1 = mobs[0];
				mob2 = mobs[1];
				mob3 = mobs[2];
			}
		}
	}
	
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getMob1() {
		return mob1;
	}
	public void setMob1(String mob1) {
		this.mob1 = mob1;
	}
	public String getMob2() {
		return mob2;
	}
	public void setMob2(String mob2) {
		this.mob2 = mob2;
	}
	public String getMob3() {
		return mob3;
	}
	public void setMob3(String mob3) {
		this.mob3 = mob3;
	}
}


