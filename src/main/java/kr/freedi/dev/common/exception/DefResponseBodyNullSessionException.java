package kr.freedi.dev.common.exception;

/**
 * @project : dev_default
 * @file 	: DefResponseBodyNullSessionException.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@SuppressWarnings("serial")
public class DefResponseBodyNullSessionException extends RuntimeException {

	public DefResponseBodyNullSessionException() {
	}

	public DefResponseBodyNullSessionException(String s) {
		super(s);
	}
	
}