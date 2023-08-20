package kr.freedi.dev.common.exception;

/**
 * @project : dev_default
 * @file 	: CslResponseBodyNullSessionException.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@SuppressWarnings("serial")
public class CslResponseBodyNullSessionException extends RuntimeException {

	public CslResponseBodyNullSessionException() {
	}

	public CslResponseBodyNullSessionException(String s) {
		super(s);
	}
	
}