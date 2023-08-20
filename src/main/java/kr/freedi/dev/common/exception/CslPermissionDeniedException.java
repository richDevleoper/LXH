package kr.freedi.dev.common.exception;

/**
 * @project : dev_default
 * @file 	: CslPermissionDeniedException.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@SuppressWarnings("serial")
public class CslPermissionDeniedException extends RuntimeException {

	public CslPermissionDeniedException() {
	}

	public CslPermissionDeniedException(String s) {
		super(s);
	}
	
}
