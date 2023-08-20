package kr.freedi.dev.common.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.lang3.StringUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * @project : default
 * @file 	: StringShortUrlTag.java
 * @author	: LimChaeHyun
 * @date	: 2014. 1. 25. 오후 12:47:54
 * @history	:
 * 
 * @comment : 
 * 
 * 
 * 
 */
@SuppressWarnings("serial")
public class StringShortUrlTag extends TagSupport{
	
	private String url;
	private final String BITLY_LOGINKEY = "o_3jc6unto8m";
	private final String BITLY_APIKEY = "R_5ccf73e219819fdd7c48d8bbaca61f4b";
	
	@Override
	public int doStartTag() throws JspException {
		
		try{
			pageContext.getOut().println(getShortUrl(url));
		}catch(Exception ex){
			throw new JspException("JspException 발생 :" + ex.getMessage());
		}
		return SKIP_BODY;
	}
	
	/**
	 * <pre>
	 * 단축 URL 리턴
	 * </pre>
	 * @method Name : getShortUrl
	 * @parameter Type : TwitterController
	 * @return Type : String
	 * @author : LimChaeHyun
	 */
	private String getShortUrl(String url){
		
		if(StringUtils.isEmpty(url)){
			return "";
		}
		
		String shortUrl = "";
		
		StringBuffer sb = new StringBuffer();
		sb.append("http://api.bit.ly/v3/shorten");
		sb.append("?login=" + BITLY_LOGINKEY);
		sb.append("&apiKey=" + BITLY_APIKEY);
		sb.append("&format=xml");
		sb.append("&longUrl=" + url);
		System.out.println(sb.toString());
		try{
			
			DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			Document doc = docBuilder.parse(sb.toString());
			doc.setDocumentURI(sb.toString());
			
			NodeList nodeList = doc.getDocumentElement().getChildNodes();
			
			if(nodeList!=null && nodeList.getLength()>0){
				for(int i = 0; i < nodeList.getLength(); i++){
					Node node = nodeList.item(i);
					if(StringUtils.equals(node.getNodeName(), "data")){
						NodeList lastList = node.getChildNodes();
						if(lastList!=null && lastList.getLength()>0){
							for(int n = 0; n < lastList.getLength(); n++){
								Node last = lastList.item(n);
								if(StringUtils.equals(last.getNodeName(), "url")){
									shortUrl = last.getTextContent();
									break;
								}
							}
						}
					}
				}
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return shortUrl;
	}
	
	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	
}
