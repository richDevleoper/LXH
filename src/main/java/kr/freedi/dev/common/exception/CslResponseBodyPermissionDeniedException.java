package kr.freedi.dev.common.exception;

/**
 * @project : dev_default
 * @file 	: CslResponseBodyPermissionDeniedException.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@SuppressWarnings("serial")
public class CslResponseBodyPermissionDeniedException extends RuntimeException {

	public CslResponseBodyPermissionDeniedException() {
	}

	public CslResponseBodyPermissionDeniedException(String s) {
		super(s);
	}
	
}
