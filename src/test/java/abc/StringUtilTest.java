package abc;
import org.apache.commons.lang3.StringUtils;


/**
 * @project : dev_default
 * @file 	: StringUtilTest.java
 * @date	: 2017. 2. 10.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class StringUtilTest {
	public static void main(String[] args) {
		
		//String[] a = {"aa", "bb"};
		//System.out.println(StringUtils.startsWithAny("aaaaxxx", a));
		
		//String b = "ss";
		//System.out.println(StringUtils.startsWith("ssdddd", b));
		
		/*
		String a1 = "/console/link/list.do";
		String a2 = "/";
		String a3 = "/aaa";
		
		Pattern p = Pattern.compile("(/.*?)");
		Matcher m = p.matcher(a1);
		
		boolean b = false;
		while(b = m.find()){
			System.out.println(m.start() + "-" + m.group() + "-" + m.group(0));
		}
		
		System.out.println(a1.replaceAll("(/.*?)(/.*)", "$1"));
		System.out.println(a2.replaceAll("(/.*?)(/.*)", "$1"));
		System.out.println(a3.replaceAll("(/.*?)(/.*)", "$1"));
		*/
		
		String url = "/console/banner/list.do";
				
		System.out.println(StringUtils.endsWithIgnoreCase(url, ".do"));
		
	}
}


