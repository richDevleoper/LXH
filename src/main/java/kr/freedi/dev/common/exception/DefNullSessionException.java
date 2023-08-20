package kr.freedi.dev.common.exception;

/**
 * @project : dev_default
 * @file 	: DefNullSessionException.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@SuppressWarnings("serial")
public class DefNullSessionException extends RuntimeException {

	public DefNullSessionException() {
	}

	public DefNullSessionException(String s) {
		super(s);
	}
	
}