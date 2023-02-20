package abc;

import java.util.Date;

import org.apache.commons.lang3.time.FastDateFormat;

/**
 * @project : dev_default
 * @file 	: DefautTest.java
 * @date	: 2017. 2. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class DefautTest {

	public static void main(String[] args) {
		
		Date d = new Date(System.currentTimeMillis());
		FastDateFormat fdf = FastDateFormat.getInstance("yyyyMMddHHmmss");
		
		long l = Long.parseLong(fdf.format(d));
		
		System.out.println(l);
		
		System.out.println(System.currentTimeMillis());
	}
}


