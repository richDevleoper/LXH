package kr.freedi.dev.common.taglib;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang3.StringUtils;

@SuppressWarnings("serial")
public class StringAbbrTag extends TagSupport{
	
	private String tail = "...";
	private int length = 8;
	private String text;
	
	public int doStartTag() throws JspException {
        
		try {
			pageContext.getOut().println(getFormattedText());
		} catch(IOException ex) {
			throw new JspException("JspException 발생 :" + ex.getMessage());
		}      
	        
		return SKIP_BODY;        
	}
	    
	private String getFormattedText() throws JspException {
	        
		String evaluatedText = text;
		if (length <= 0) {
			return evaluatedText;
		}
		
		if (evaluatedText.length() > length) {
			return replaceTag(evaluatedText.substring(0, length)) + tail;
		}
	        
	    return evaluatedText;
	}
	    
	/**
	 * <pre>
     * 입력값을 HTML 태그에서 사용가능한 코드값으로 변환하여 돌려준다.
     * </pre>
     * @param str
     * @return
     */
	public static String replaceTag(String str) {
		if(StringUtils.isEmpty(str)){
			return "";
		}
		
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("'", "&#39;");
		str = str.replaceAll("\"", "&quot;");
		str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        
        return str;
    }

	public String getTail() {
		return tail;
	}

	public void setTail(String tail) {
		this.tail = tail;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
}
