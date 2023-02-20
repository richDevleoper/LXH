package kr.freedi.dev.common.exception;


@SuppressWarnings("serial")
public class NotExistPageException extends RuntimeException {
	/**
	 * 
	 */
	public NotExistPageException() {
	}
	
	public NotExistPageException(String s) {
		super(s);
	}
	
}
