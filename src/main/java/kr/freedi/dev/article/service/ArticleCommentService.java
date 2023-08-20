package kr.freedi.dev.article.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.article.domain.ArticleCommentSearchVO;
import kr.freedi.dev.article.domain.ArticleCommentVO;
import kr.freedi.dev.board.domain.BoardUseVO;
import kr.freedi.dev.board.service.BoardUseService;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.common.util.EncriptUtil;
import kr.freedi.dev.user.domain.UserVO;

/**
 * @project : dev_default
 * @file 	: ArticleCommentService.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service
public class ArticleCommentService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String USER_TYP_MNGR = "MNGR_USER";
	
	final String BOARD_USE_TYP_MANAGE = "MANAGE";
	
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;

	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;
	
	@Resource(name = "boardUseService")
	private BoardUseService boardUseService;
	
	
	public List<ArticleCommentVO> selectList(ArticleCommentSearchVO searchVO) {		
		return dao.selectList("ArticleComment.selectList", searchVO);
	}
	
	public int selectListCount(ArticleCommentSearchVO searchVO) {
		return (Integer) dao.selectOne("ArticleComment.selectListCount", searchVO);
	}
	
	public List<ArticleCommentVO> selectFullList(ArticleCommentVO articleCommentVO) {		
		return dao.selectList("ArticleComment.selectFullList", articleCommentVO);
	}

	public ArticleCommentVO select(ArticleCommentVO articleCommentVO) {
		return (ArticleCommentVO) dao.selectOne("ArticleComment.select", articleCommentVO);
	}
	
	public Integer insert(ArticleCommentVO articleCommentVO) throws Exception {
		Integer nextArticleCommentKey = (Integer)dao.selectOne("ArticleComment.selectNextKey");
		articleCommentVO.setArticleCommentKey(nextArticleCommentKey);
		articleCommentVO.setFkey(nextArticleCommentKey);
		articleCommentVO.setPkey(0);
		articleCommentVO.setOkey(0);
		articleCommentVO.setGkey(0);
		
		if(StringUtils.isNotEmpty(articleCommentVO.getWriterPwd())){
			articleCommentVO.setWriterPwd(EncriptUtil.encript(articleCommentVO.getWriterPwd()));
		}
		return (Integer)dao.insert("ArticleComment.insert", articleCommentVO);
	}
	
	public Integer reply(ArticleCommentVO articleCommentVO) throws Exception {
		Integer rtnVal = 0;
		log.debug(articleCommentVO.toString());
		
		//부모글 가져오기
		ArticleCommentVO vo = new ArticleCommentVO();
		vo.setArticleCommentKey(articleCommentVO.getPkey());
		ArticleCommentVO parentVO = this.select(vo);

		articleCommentVO.setFkey(parentVO.getFkey());
		articleCommentVO.setGkey(parentVO.getGkey() + 1);

		//set okey
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("pkey", articleCommentVO.getPkey());
		
		ArticleCommentVO maxOkeyArticleCommentVO = (ArticleCommentVO) dao.selectOne("ArticleComment.selectByMaxOkey", pMap);
		
		//부모글에 답변글이 없는 경우, 부모글의 okey+1로 세팅
		if (maxOkeyArticleCommentVO == null) {
			articleCommentVO.setOkey(parentVO.getOkey() + 1);
			
		//부모글에 답변글이 있는 경우
		} else {
			articleCommentVO.setOkey(maxOkeyArticleCommentVO.getOkey() + 1);
			
			List<ArticleCommentVO> childList = this.getChild(maxOkeyArticleCommentVO);
			//log.debug(childList.toString());
			
			if(childList != null && childList.size() > 0){
				articleCommentVO.setOkey(childList.get(childList.size()-1).getOkey() + 1);
			}
		}

		//현재 답변글 정렬키 값 이상인 레코드의 정렬키 값을 +1 증가시킴
		dao.update("ArticleComment.updateOkey", articleCommentVO);
		
		//현재 답변글 insert
		Integer nextArticleCommentKey = (Integer)dao.selectOne("ArticleComment.selectNextKey");
		articleCommentVO.setArticleCommentKey(nextArticleCommentKey);
		if(StringUtils.isNotEmpty(articleCommentVO.getWriterPwd())){
			articleCommentVO.setWriterPwd(EncriptUtil.encript(articleCommentVO.getWriterPwd()));
		}
		rtnVal += dao.insert("ArticleComment.insert", articleCommentVO);
		
		return rtnVal;
	}
	
	public Integer update(ArticleCommentVO articleCommentVO) throws Exception {
		if(StringUtils.isNotEmpty(articleCommentVO.getWriterPwd())){
			articleCommentVO.setWriterPwd(EncriptUtil.encript(articleCommentVO.getWriterPwd()));
		}
		return (Integer)dao.update("ArticleComment.update", articleCommentVO);
	}
	
	public Integer delete(ArticleCommentVO articleCommentVO) {
		Integer rtnVal = 0;
		List<ArticleCommentVO> childList = this.getChild(articleCommentVO);
		
		//log.debug(childList.toString());
		if(childList != null && childList.size() > 0){
			for(ArticleCommentVO vo : childList){
				rtnVal += dao.delete("ArticleComment.delete", vo);
			}
		}
		rtnVal += (Integer)dao.delete("ArticleComment.delete", articleCommentVO);
		
		return rtnVal;
	}
	
	public Integer disable(ArticleCommentVO articleCommentVO) throws Exception {
		Integer rtnVal = 0;
		
		List<ArticleCommentVO> childList = this.getChild(articleCommentVO);
		
		//log.debug(childList.toString());
		if(childList != null && childList.size() > 0){
			for(ArticleCommentVO vo : childList){
				vo.setLastOperId(articleCommentVO.getLastOperId());
				vo.setLastOperIp(articleCommentVO.getLastOperIp());
				vo.setDeleteTyp(articleCommentVO.getDeleteTyp());
				dao.update("ArticleComment.disable", vo);
			}
		}
		rtnVal += (Integer)dao.update("ArticleComment.disable", articleCommentVO);
		
		return rtnVal;
	}
	
	public Integer recovery(ArticleCommentVO articleCommentVO) {
		Integer rtnVal = 0;
		
		List<ArticleCommentVO> childList = this.getChild(articleCommentVO);
		
		//log.debug(childList.toString());
		
		if(childList != null && childList.size() > 0){
			for(ArticleCommentVO vo : childList){
				vo.setLastOperId(articleCommentVO.getLastOperId());
				vo.setLastOperIp(articleCommentVO.getLastOperIp());
				vo.setDeleteTyp(articleCommentVO.getDeleteTyp());
				rtnVal += dao.update("ArticleComment.recovery", vo);
			}
		}
		rtnVal += dao.update("ArticleComment.recovery", articleCommentVO);
		
		return rtnVal;
	}
	
	public Integer deleteByArticleKey(ArticleCommentVO articleCommentVO) {
		return (Integer)dao.delete("ArticleComment.deleteByArticleKey", articleCommentVO);
	}

	private List<ArticleCommentVO> getChild(ArticleCommentVO articleCommentVO){
		List<ArticleCommentVO> resultList = new ArrayList<ArticleCommentVO>();
		List<ArticleCommentVO>  childList = dao.selectList("ArticleComment.selectChildList", articleCommentVO);
		return this.makeChildList(childList, resultList);
	}
	
	private List<ArticleCommentVO> makeChildList(List<ArticleCommentVO> childList, List<ArticleCommentVO> resultList){
		if(childList != null && childList.size() > 0){
			for(ArticleCommentVO vo : childList){
				List<ArticleCommentVO>  cList = dao.selectList("ArticleComment.selectChildList", vo);
				if(cList != null && cList.size() > 0){
					this.makeChildList(cList, resultList);
				}
				resultList.add(vo);
			}
		}
		return resultList;
	}
	
	
	/**
	 * @method	: isMngr
	 * @date	: 2017. 2. 21.
	 * @author	: pdh
	 * @comment	: 게시판 댓글의 관리권한이 있는지 여부를 확인
	 * @history	: 
	 * @param	: 
	 * @return	: boolean
	 */
	public boolean isMngr(UserVO userSession, ArticleCommentVO articleCommentVO) {
		
		if(userSession == null || (userSession != null && !StringUtils.equals(userSession.getUserTyp(), USER_TYP_MNGR))){
			return false;
		}
		
		//관리권한 체크
		BoardUseVO boardUseVO = new BoardUseVO();
		boardUseVO.setAuthId(userSession.getAuthId());
		boardUseVO.setBoardKey(articleCommentVO.getBoardKey());
		boardUseVO.setUseTyp(BOARD_USE_TYP_MANAGE);
		List<EgovMap> mngrAuthIdList = boardUseService.selectFullList(boardUseVO);
		if(mngrAuthIdList != null && mngrAuthIdList.size() > 0){
			return true;
		}

		return false;
	}
	
	
	/**
	 * @method	: isUseGrp
	 * @date	: 2017. 2. 21.
	 * @author	: pdh
	 * @comment	: 댓글에 대한 사용권한이 있는 권한그룹 여부를 확인
	 * @history	: 
	 * @param	: 
	 * @return	: boolean
	 */
	public boolean isUseGrp(UserVO userSession, ArticleCommentVO articleCommentVO, String useTyp) {
		
		if(userSession == null || (userSession != null && StringUtils.isEmpty(userSession.getUserTyp()))){
			return false;
		}
		
		BoardUseVO boardUseVO = new BoardUseVO();
		//boardUseVO.setAuthId(userSession.getAuthId());
		boardUseVO.setBoardKey(articleCommentVO.getBoardKey());
		boardUseVO.setUseTyp(useTyp);
		List<EgovMap> authIdList = boardUseService.selectFullList(boardUseVO);
		if(authIdList != null && authIdList.size() > 0){
			for(EgovMap eMap : authIdList){
				if(StringUtils.equals(userSession.getAuthId(), String.valueOf(eMap.get("authId")))){
					return true;
				}
			}
		//무제한
		}else{
			return true;
		}
		
		return false;
	}
}
