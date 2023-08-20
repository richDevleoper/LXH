package kr.freedi.dev.article.exception;

/**
 * @project : dev_default
 * @file 	: ArticleNotAllowCaseException.java
 * @date	: 2017. 2. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@SuppressWarnings("serial")
public class ArticleNotAllowCaseException extends RuntimeException {

	public ArticleNotAllowCaseException() {
	}

	public ArticleNotAllowCaseException(String s) {
		super(s);
	}
	
}
