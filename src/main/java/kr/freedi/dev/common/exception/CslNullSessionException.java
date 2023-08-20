package kr.freedi.dev.common.exception;

/**
 * @project : dev_default
 * @file 	: CslNullSessionException.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@SuppressWarnings("serial")
public class CslNullSessionException extends RuntimeException {

	public CslNullSessionException() {
	}

	public CslNullSessionException(String s) {
		super(s);
	}
	
}