package kr.freedi.dev.common.util;

import java.util.Map;

/**
 * @project : dev_default
 * @file 	: MapUtil.java
 * @date	: 2017. 3. 17.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class MapUtil {

	public static String getString(Map<String, Object> map, String key){
		String result = "";
		if(map != null && map.get(key) != null){
			result = String.valueOf(map.get(key)) == null ? "" : String.valueOf(map.get(key)); 
		}
		return result;
	}
	
	public static Integer getInteger(Map<String, Object> map, String key){
		Integer result = 0;
		if(map != null && map.get(key) != null){
			result = String.valueOf(map.get(key)) == null ? 0 : Integer.parseInt(String.valueOf(map.get(key))); 
		}
		return result;
	}
}
