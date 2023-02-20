package kr.freedi.dev.common.domain;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLDecoder;
import java.net.URLEncoder;

import kr.freedi.dev.common.annotation.ParamField;
import kr.freedi.dev.common.annotation.ParamToggleField;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @project : dev_default
 * @file 	: CommonVO.java
 * @date	: 2017. 2. 8.
 * @author	: 
 * @comment :  
 * @history	: 
 */
public class CommonVO extends PaginationInfo {

	@ParamField
	private Integer menuKey;
	
	@ParamField
	private String searchUserid;
	
	@ParamField
	@ParamToggleField
	private String orderBy;
	
	@ParamField
	private int currentPageNo;
	
	@ParamField
	@ParamToggleField
	private int recordCountPerPage;
	
	public CommonVO(){
		this.setCurrentPageNo(1);
		this.setRecordCountPerPage(10);
		super.setPageSize(10);
	}

	public Integer getMenuKey() {
		return menuKey;
	}
	
	public void setMenuKey(Integer menuKey) {
		this.menuKey = menuKey;
	}
	
	public String getSearchUserid() {
		return searchUserid;
	}

	public void setSearchUserid(String searchUserid) {
		this.searchUserid = searchUserid;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	
	@Override
	public int getCurrentPageNo() {
		return currentPageNo;
	}

	@Override
	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	@Override
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	@Override
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getParam() throws ArrayIndexOutOfBoundsException, IllegalArgumentException, SecurityException, IllegalAccessException, NoSuchMethodException, InvocationTargetException, UnsupportedEncodingException {
		return getParameter(this.getClass(), true);
	}
	
	public String getParamWithoutToggle() throws ArrayIndexOutOfBoundsException, IllegalArgumentException, SecurityException, IllegalAccessException, NoSuchMethodException, InvocationTargetException, UnsupportedEncodingException {
		return getParameter(this.getClass(), false);
	}

	public String getSuperParam() throws ArrayIndexOutOfBoundsException, IllegalArgumentException, SecurityException, IllegalAccessException, NoSuchMethodException, InvocationTargetException, UnsupportedEncodingException {
		return getParameter(this.getClass().getSuperclass(), true);
	}
	
	public String getSuperParamWithoutToggle() throws ArrayIndexOutOfBoundsException, IllegalArgumentException, SecurityException, IllegalAccessException, NoSuchMethodException, InvocationTargetException, UnsupportedEncodingException {
		return getParameter(this.getClass().getSuperclass(), false);
	}
	
	public String getParameter(Class<?> c, boolean toggle)
			throws IllegalArgumentException, IllegalAccessException, ArrayIndexOutOfBoundsException, SecurityException, NoSuchMethodException, InvocationTargetException, UnsupportedEncodingException {

		//Class<?> paramClass = this.getClass();
		StringBuffer param = new StringBuffer();
		param = _makeParam(param, c, toggle);

		if(param.length() == 0) {
			return "";
		}

		String parameter = param.toString();

		// 끝 문자 & 제거
		if(StringUtils.right(parameter, 1).equals("&")) {
			parameter = parameter.substring(0, param.length()-1);
		}

		return parameter;
	}

	private StringBuffer _makeParam(StringBuffer param, Class<?> c, boolean toggle) throws IllegalArgumentException,
			IllegalAccessException, SecurityException, NoSuchMethodException, ArrayIndexOutOfBoundsException, InvocationTargetException, UnsupportedEncodingException {

		Field[] fields = c.getDeclaredFields();
		for (Field f : fields) {

			ParamField paramField = f.getAnnotation(ParamField.class);
			ParamToggleField paramToggleField = f.getAnnotation(ParamToggleField.class);
			
			boolean isExcept = false;
			if(!toggle && paramToggleField != null){
				isExcept = true;
			}

			/*boolean isExcept = false;
			for (String eParam : exceptParams) {
				if (eParam.equals(f.getName())) {
					isExcept = true;
				}
			}*/
			
			String getMethodName = "get"+ f.getName().substring(0,1).toUpperCase() + f.getName().substring(1);
			Method getMethod = c.getMethod(getMethodName);
			
			//if (!isExcept && (a != null || f.getName().equals("currentPageNo") || f.getName().equals("recordCountPerPage"))
			if (!isExcept 
					&& paramField != null
					&& getMethod.invoke(this) != null
					&& StringUtils.isNotEmpty(String.valueOf(getMethod.invoke(this)))) {
				param.append(f.getName() + "=" + URLEncoder.encode(String.valueOf((Object) getMethod.invoke(this)), "UTF-8") + "&");
			}
			
		}

		if (c.getSuperclass() != null)
			param = _makeParam(param, c.getSuperclass(), toggle);

		return param;

	}

	public String getHiddenTag() throws Exception {
		
		StringBuffer tag = new StringBuffer();
		
		String parameter = getParam();
		
		String[] params = parameter.split("\\&");
		for (String p : params) {
			String[] f = p.split("\\=");
			tag.append("<input type='hidden' name='"+f[0]+"' id='"+f[0]+"' value=\""+URLDecoder.decode(f[1], "UTF-8")+"\" /> \n");
		}
		return tag.toString();
	}
	
	public String getHiddenTagWithoutToggle() throws Exception {
		
		StringBuffer tag = new StringBuffer();
		
		String parameter = getParamWithoutToggle();
		
		String[] params = parameter.split("\\&");
		for (String p : params) {
			String[] f = p.split("\\=");
			tag.append("<input type='hidden' name='"+f[0]+"' id='"+f[0]+"' value=\""+URLDecoder.decode(f[1], "UTF-8")+"\" /> \n");
		}
		return tag.toString();
	}
	
	public String getSuperHiddenTag() throws Exception {
		
		StringBuffer tag = new StringBuffer();
		
		String parameter = getSuperParam();
		
		String[] params = parameter.split("\\&");
		for (String p : params) {
			String[] f = p.split("\\=");
			tag.append("<input type='hidden' name='"+f[0]+"' id='"+f[0]+"' value=\""+URLDecoder.decode(f[1], "UTF-8")+"\" /> \n");
		}
		return tag.toString();
	}
	
	public String getSuperHiddenTagWithoutToggle() throws Exception {
		
		StringBuffer tag = new StringBuffer();
		
		String parameter = getSuperParamWithoutToggle();
		
		String[] params = parameter.split("\\&");
		for (String p : params) {
			String[] f = p.split("\\=");
			tag.append("<input type='hidden' name='"+f[0]+"' id='"+f[0]+"' value=\""+URLDecoder.decode(f[1], "UTF-8")+"\" /> \n");
		}
		return tag.toString();
	}
	
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this);
	}

}
