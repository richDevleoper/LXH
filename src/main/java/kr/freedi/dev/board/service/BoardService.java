package kr.freedi.dev.board.service;

import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.article.domain.ArticleVO;
import kr.freedi.dev.article.service.ArticleService;
import kr.freedi.dev.board.domain.BoardSearchVO;
import kr.freedi.dev.board.domain.BoardUseVO;
import kr.freedi.dev.board.domain.BoardVO;
import kr.freedi.dev.common.dao.DefaultDAO;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: BoardService.java
 * @date	: 2017. 2. 20.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service("boardService")
public class BoardService {

	private final String BOARD_USE_TYP_MANAGE = "MANAGE";
	private final String BOARD_USE_TYP_VIEW = "VIEW";
	private final String BOARD_USE_TYP_WRITE = "WRITE";
	private final String BOARD_USE_TYP_REPLY = "REPLY";
	private final String BOARD_USE_TYP_COMMENT = "COMMENT";
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource(name="boardUseService")
	private BoardUseService boardUseService;
	
	@Resource(name="articleService")
	private ArticleService articleService;

	
	public int selectListCount(BoardSearchVO searchVO) {
		return (Integer) dao.selectOne("Board.selectListCount", searchVO);
	}
	
	public List<EgovMap> selectList(BoardSearchVO searchVO) {		
		return dao.selectList("Board.selectList", searchVO);
	}
	
	/**
	 * @method	: selectFullList
	 * @date	: 2017. 2. 20.
	 * @author	: pdh
	 * @comment	: set condition [actFlg]
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public List<BoardVO> selectFullList(BoardVO boardVO) {
		return dao.selectList("Board.selectFullList");
	}

	public int selectMaxKey() {
		return (Integer) dao.selectOne("Board.selectMaxKey");
	}
	
	public void insert(BoardVO boardVO, String[] mngAuthIdList, String[] viewAuthIdList, String[] writeAuthIdList, String[] replyAuthIdList, String[] commentAuthIdList) {

		boardVO.setBoardKey(this.selectMaxKey());
		dao.insert("Board.insert", boardVO);
		
		this.updateBoardUse(boardVO, mngAuthIdList, viewAuthIdList, writeAuthIdList, replyAuthIdList, commentAuthIdList);
	}

	public BoardVO select(BoardVO boardVO) {
		return (BoardVO) dao.selectOne("Board.select", boardVO);
	}

	public void update(BoardVO boardVO, String[] mngAuthIdList, String[] viewAuthIdList, String[] writeAuthIdList, String[] replyAuthIdList, String[] commentAuthIdList) {
		
		dao.update("Board.update", boardVO);
		
		this.updateBoardUse(boardVO, mngAuthIdList, viewAuthIdList, writeAuthIdList, replyAuthIdList, commentAuthIdList);
	}

	public void delete(BoardVO boardVO) {
		
		dao.delete("Board.delete", boardVO);
		
		BoardUseVO boardUseVO = new BoardUseVO();
		boardUseVO.setBoardKey(boardVO.getBoardKey());
		boardUseService.deleteByBoardKey(boardUseVO);
		
		//delete article(with comment, attachFile)
		ArticleVO articleVO = new ArticleVO();
		articleVO.setBoardKey(boardVO.getBoardKey());
		articleService.deleteByBoardKey(articleVO);
	}

	private void updateBoardUse(BoardVO boardVO, String[] mngAuthIdList, String[] viewAuthIdList, String[] writeAuthIdList, String[] replyAuthIdList, String[] commentAuthIdList){

		BoardUseVO boardUseVO = new BoardUseVO();
		boardUseVO.setBoardKey(boardVO.getBoardKey());
		
		//기존정보 삭제
		boardUseService.deleteByBoardKey(boardUseVO);
		
		//관리권한
		if(mngAuthIdList != null && mngAuthIdList.length > 0) {
			boardUseVO.setUseTyp(BOARD_USE_TYP_MANAGE);
			for (String authId : mngAuthIdList) {
				boardUseVO.setAuthId(authId);
				boardUseService.insert(boardUseVO);
			}
		}
		
		//보기권한
		if(viewAuthIdList != null && viewAuthIdList.length > 0) {
			boardUseVO.setUseTyp(BOARD_USE_TYP_VIEW);
			for (String authId : viewAuthIdList) {
				boardUseVO.setAuthId(authId);
				boardUseService.insert(boardUseVO);
			}
		}
		
		//쓰기권한
		if(writeAuthIdList != null && writeAuthIdList.length > 0) {
			boardUseVO.setUseTyp(BOARD_USE_TYP_WRITE);
			for (String authId : writeAuthIdList) {
				boardUseVO.setAuthId(authId);
				boardUseService.insert(boardUseVO);
			}
		}
		
		//답변권한
		if(replyAuthIdList != null && replyAuthIdList.length > 0) {
			boardUseVO.setUseTyp(BOARD_USE_TYP_REPLY);
			for (String authId : replyAuthIdList) {
				boardUseVO.setAuthId(authId);
				boardUseService.insert(boardUseVO);
			}
		}
		
		//댓글권한
		if(commentAuthIdList != null && commentAuthIdList.length > 0) {
			boardUseVO.setUseTyp(BOARD_USE_TYP_COMMENT);
			for (String authId : commentAuthIdList) {
				boardUseVO.setAuthId(authId);
				boardUseService.insert(boardUseVO);
			}
		}
	}
}
