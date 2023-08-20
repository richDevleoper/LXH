package kr.freedi.dev.board.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @project	: default
 * @file	: BoardUseVO.java
 * @author	: pdh
 * @date	: 2017/2/1 16:14:54
 * @history	:
 * @comment	:
 */

public class BoardUseVO {

	private String authId;
	private Integer boardKey;
	private String useTyp;

	public BoardUseVO(){
	}


	public String getAuthId(){
		return authId;
	}
	public void setAuthId(String authId){
		this.authId = authId;
	}

	public Integer getBoardKey(){
		return boardKey;
	}
	public void setBoardKey(Integer boardKey){
		this.boardKey = boardKey;
	}

	public String getUseTyp(){
		return useTyp;
	}
	public void setUseTyp(String useTyp){
		this.useTyp = useTyp;
	}


	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

}
