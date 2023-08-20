package kr.freedi.dev.common.exception;

/**
 * @project : dev_default
 * @file 	: CustomCommonException.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@SuppressWarnings("serial")
public class CustomCommonException extends RuntimeException {

	public CustomCommonException() {
	}

	public CustomCommonException(String s) {
		super(s);
	}
	
}