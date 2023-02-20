package kr.freedi.dev.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import twitter4j.Twitter;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.OAuthAuthorization;
import twitter4j.conf.Configuration;
import twitter4j.conf.ConfigurationBuilder;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class TwitterController {
	
	@Autowired
	private EgovPropertyService propertyService;
	
	private TwitterFactory factory = null;
	private AccessToken accessToken = null;
	
	private void init(){
		
		String ConsumerKey = propertyService.getString("twit_consumerKey");
		String ConsumerSecret = propertyService.getString("twit_consumerSecret");
		String AccessToken = propertyService.getString("twit_accessToken");
		String AccessSecret = propertyService.getString("twit_accessTokenSecret");
		
		try{
			
			ConfigurationBuilder builder = new ConfigurationBuilder();
			builder.setOAuthConsumerKey(ConsumerKey);
			builder.setOAuthConsumerSecret(ConsumerSecret);
			
			Configuration config = builder.build();
			OAuthAuthorization oauth = new OAuthAuthorization(config);
			oauth.setOAuthConsumer(ConsumerKey, ConsumerSecret);
			factory = new TwitterFactory(config);
			accessToken = new AccessToken(AccessToken, AccessSecret);
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	
	@RequestMapping("/twitter/writeForm.do")
	public void writeForm(){}
	
	@RequestMapping("/twitter/write.do")
	public String write(HttpServletRequest request, @RequestParam(required = true, value = "title")String title, @RequestParam(required = false, value = "url")String url, ModelMap model){
		String result = "failed";
		
		if(StringUtils.isNotEmpty(title)){
			init();
			
			try {
				
				Twitter twitter = factory.getInstance(accessToken);
				twitter.updateStatus(StringUtils.isEmpty(url) ? title : title + " " + getShortUrl(url));
				result = "success";
			} catch (Exception e) {
				result = e.getMessage();
				System.out.println(result);
			}
		}
		
		model.addAttribute("result", result);
		return "twitter/result";
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
		sb.append("?login=" + propertyService.getString("bitly_loginKey"));
		sb.append("&apiKey=" + propertyService.getString("bitly_apiKey"));
		sb.append("&format=xml");
		sb.append("&longUrl=" + url);
		
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
}
