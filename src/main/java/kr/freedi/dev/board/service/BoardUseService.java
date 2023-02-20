package kr.freedi.dev.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.board.domain.BoardUseVO;
import kr.freedi.dev.common.dao.DefaultDAO;

/**
 * @project : dev_default
 * @file 	: BoardUseService.java
 * @date	: 2017. 2. 20.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service
public class BoardUseService {

	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	
	/**
	 * @method	: selectFullList
	 * @date	: 2017. 2. 20.
	 * @author	: pdh
	 * @comment	: set condition [authId, boardKey, useTyp]
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public List<EgovMap> selectFullList(BoardUseVO boardUseVO) {		
		return dao.selectList("BoardUse.selectFullList", boardUseVO);
	}
	
	public void insert(BoardUseVO boardUseVO) {
		dao.insert("BoardUse.insert", boardUseVO);
	}
	
	public void deleteByAuthId(BoardUseVO boardUseVO) {
		dao.delete("BoardUse.deleteByAuthId", boardUseVO);
	}
	
	public void deleteByBoardKey(BoardUseVO boardUseVO) {
		dao.delete("BoardUse.deleteByBoardKey", boardUseVO);
	}
	
	public void deleteByAuthIdAndBoardKeyAndUseTyp(BoardUseVO boardUseVO) {
		dao.delete("BoardUse.deleteByAuthIdAndBoardKeyAndUseTyp", boardUseVO);
	}
}


