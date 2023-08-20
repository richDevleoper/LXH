package abc;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @project : dev_default
 * @file 	: RegextTest.java
 * @date	: 2017. 2. 20.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class RegextTest {

	//private String moduleDir = "banner";
	
	public String getPath(String request, String fileName) {
		return request.replaceAll("(/.+/)(banner).*", "$1");
	}
	
	@SuppressWarnings("unused")
	public static void main(String[] args) {
		RegextTest rt = new RegextTest();
		
		String s1 = "/console/banner/list.do";
		String s2 = "/banner/list.do";
		String s3 = "/eng/banner/list.do";
		
		
		String r1 = "";
		String r2 = "";
		String r3 = "";
		String r4 = "";
		
		r1 = s1.replaceAll("(.*)((/)(banner)(/))(.*)", "$1\n$2\n$3\n$4\n$5\n$6");
		
		r2 = s2.replaceAll("(.*)((/)(banner)(/))(.*)", "$1\n$2\n$3\n$4\n$5\n$6");
		r3 = s3.replaceAll("(.*)((/)(banner)(/))(.*)", "$1\n$2\n$3\n$4\n$5\n$6");
		
		//System.out.println(s1.replaceAll("(/.*)?((/)(banner)/)(.*)", "$4$1/List"));
		//System.out.println(s2.replaceAll("(/.*)?((/)(banner)/)(.*)", "$4$1/List"));
		//System.out.println(s3.replaceAll("(/.*)?((/)(banner)/)(.*)", "$4$1/List"));
		//System.out.println(s2.replaceAll("(/.*)((/)(banner)/)(.*)", "$4$1"));
		//System.out.println(s3.replaceAll("(/.*)((/)(banner)/)(.*)", "$4$1"));
		
		
		//System.out.println(r1);
		//System.out.println("------------------------");
		//System.out.println(r2);
		//System.out.println("------------------------");
		//System.out.println(r3);
		
		
		//System.out.println(rt.getPath("/console/banner/list.do", "List"));
		//System.out.println(rt.getPath("/banner/list.do", "List"));
		//System.out.println(rt.getPath("/eng/banner/list.do", "List"));
		
		String t1 = "K_010000000000";
		String t2 = "K_010100000000";
		String t3 = "K_010102000000";
		//System.out.println(t1.replaceAll("[0]{1,}$", ""));
		//System.out.println(t2.replaceAll("[0]{1,}$", ""));
		//System.out.println(t3.replaceAll("[0]{1,}$", ""));

		String u1 = "http://127.0.0.1/csl/111/222/q.do";
		String u2 = "http://127.0.0.1:8080/csl/111/222/q.do";
		String u3 = "https://127.0.0.1/csl/111/222/q.do";
		String u4 = "http://aa.test.com/csl/111/222/q.do";
		String u5 = "http://aa.test.com:8080/csl/111/222/q.do";
		String u6 = "https://aa.test.com/csl/111/222/q.do";
		
		System.out.println(u1.replaceFirst("^(https?):\\/\\/([^:\\/\\s]+)(:([^\\/]*))?", ""));
		System.out.println(u2.replaceFirst("^(https?):\\/\\/([^:\\/\\s]+)(:([^\\/]*))?", ""));
		System.out.println(u3.replaceFirst("^(https?):\\/\\/([^:\\/\\s]+)(:([^\\/]*))?", ""));
		System.out.println(u4.replaceFirst("^(https?):\\/\\/([^:\\/\\s]+)(:([^\\/]*))?", ""));
		System.out.println(u5.replaceFirst("^(https?):\\/\\/([^:\\/\\s]+)(:([^\\/]*))?", ""));
		System.out.println(u6.replaceFirst("^(https?):\\/\\/([^:\\/\\s]+)(:([^\\/]*))?", ""));
		
		
		String testurl = "https://test.tistory.com:8888/qr/aaa/ddd.html?abc=def&amp;ddd=fgf#sharp";
		Pattern urlPattern = Pattern.compile("^(https?):\\/\\/([^:\\/\\s]+)(:([^\\/]*))?((\\/[^\\s/\\/]+)*)?\\/([^#\\s\\?]*)(\\?([^#\\s]*))?(#(\\w*))?$");

		Matcher mc = urlPattern.matcher(testurl);
		   
		   if(mc.matches()){
		   	   for(int i=0; i<=mc.groupCount(); i++)
				   System.out.println("group("+i+") = "+mc.group(i));
		   }
		   else 
			   System.out.println("not found");
		}

}


