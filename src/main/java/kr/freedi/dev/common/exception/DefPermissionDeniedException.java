package kr.freedi.dev.common.exception;

/**
 * @project : dev_default
 * @file 	: DefPermissionDeniedException.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@SuppressWarnings("serial")
public class DefPermissionDeniedException extends RuntimeException {

	public DefPermissionDeniedException() {
	}

	public DefPermissionDeniedException(String s) {
		super(s);
	}
	
}
