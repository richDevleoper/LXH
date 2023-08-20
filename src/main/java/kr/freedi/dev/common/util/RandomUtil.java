package kr.freedi.dev.common.util;

import java.util.Random;

/**
 * @project : dev_default
 * @file 	: RandomUtil.java
 * @date	: 2017. 3. 17.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class RandomUtil {

	public static String getNumeric(Integer size){
		Random rnd = new Random();
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<size; i++){
			sb.append((rnd.nextInt(10)));
		}
		
		return sb.toString();
	}
	
	public static String getCapitalLetter(Integer size){
		Random rnd = new Random();
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<size; i++){
			sb.append((char)((int)(rnd.nextInt(26))+65));
		}
		
		return sb.toString();
	}
	
	public static String getSmallLetter(Integer size){
		Random rnd = new Random();
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<size; i++){
			sb.append((char)((int)(rnd.nextInt(26))+97));
		}
		
		return sb.toString();
	}
	
	public static String getAlphabet(Integer size){
		Random rnd = new Random();
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<size; i++){
	    	int r = rnd.nextInt(52);
	    	if(r > 25 && r < 32){
	    		i--;
	    		continue;
	    	}
	        sb.append((char)((int)(r)+65));
		}
		
		return sb.toString();
	}
	
	public static String getAlphabetAndNumeric(Integer size){
		Random rnd = new Random();
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<size; i++){
		    if(rnd.nextBoolean()){
		    	int r = rnd.nextInt(52);
		    	if(r > 25 && r < 32){
		    		i--;
		    		continue;
		    	}
		        sb.append((char)((int)(r)+65));
		    }else{
		    	sb.append((rnd.nextInt(10)));
 
		    }
		}
		
		return sb.toString();
	}
	
	public static String getString(Integer size){
		Random rnd = new Random();
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<size; i++){
		    if(rnd.nextBoolean()){
		        sb.append((char)((int)(rnd.nextInt(52))+65));
		    }else{
		    	sb.append((rnd.nextInt(10)));
 
		    }
		}
		
		return sb.toString();
	}
}


