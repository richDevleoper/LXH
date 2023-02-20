package kr.freedi.dev.article.exception;

/**
 * @project : dev_default
 * @file 	: ArticlePermissionDeniedException.java
 * @date	: 2017. 2. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@SuppressWarnings("serial")
public class ArticlePermissionDeniedException extends RuntimeException {

	public ArticlePermissionDeniedException() {
	}

	public ArticlePermissionDeniedException(String s) {
		super(s);
	}
	
}
