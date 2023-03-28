package kr.freedi.dev.qreport.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.freedi.dev.article.domain.ArticleCommentVO;
import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.article.domain.ArticleVO;
import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.attachfile.service.AttachFileService;
import kr.freedi.dev.board.domain.BoardUseVO;
import kr.freedi.dev.board.domain.BoardVO;
import kr.freedi.dev.board.service.BoardService;
import kr.freedi.dev.board.service.BoardUseService;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.common.util.EncriptUtil;
import kr.freedi.dev.menu.service.IMenuService;
import kr.freedi.dev.qreport.domain.ReportSearchVO;
import kr.freedi.dev.qreport.domain.ReportVO;
import kr.freedi.dev.user.domain.UserVO;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * @project : dev_default
 * @file 	: ReportService.java
 * @date	: 2023. 3. 27.
 * @author	: swpark
 * @comment : 과제 Service 
 * @history	: 
 */
@Service("reportService")
public class ReportService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_PREFIX = "report";
	
	final String USER_TYP_MNGR = "MNGR_USER";
	
//	final String BOARD_USE_TYP_MANAGE = "MANAGE";
//	final String BOARD_USE_TYP_VIEW = "VIEW";
//	final String BOARD_USE_TYP_WRITE = "WRITE";
//	final String BOARD_USE_TYP_REPLY = "REPLY";
//	final String BOARD_USE_TYP_COMMENT = "COMMENT";
//	
//	final String WRITE_SUB_TYP_WRITE = "WRITE";
//	final String WRITE_SUB_TYP_MODIFY = "MODIFY";
//	final String WRITE_SUB_TYP_DELETE = "DELETE";
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Resource(name = "boardUseService")
	private BoardUseService boardUseService;
	
	
	
	
	public void insert(ReportVO reportVO) throws Exception {

		Integer repCode = (Integer)dao.selectOne("Report.selectNextFkey");
		reportVO.setRepCode(repCode);
		reportVO.setRepMenuCode("REPORT"); //REPORT-과제, TEAM-분임조
		
		dao.insert("Report.insert", reportVO);
	}

	public List<ReportVO> selectList(ReportSearchVO searchVO) {
		
		return dao.selectList("Article.selectList", searchVO);
	}
	
	
	//@Autowired
	//private JFileService service;
//	@Resource
//	private AttachFileService attachFileService;
//	
//	@Resource(name = "menuService")
//	private IMenuService menuService;
//	
//	

//	
//	public List<ArticleVO> selectListWithoutFileList(ArticleSearchVO searchVO) {
//		return dao.selectList("Article.selectList", searchVO);
//	}
//	
//	public List<ArticleVO> selectRecentListWithoutFileList(ArticleSearchVO searchVO) {
//		return dao.selectList("Article.selectRecentList", searchVO);
//	}
//
//	public int selectArticleListCount(ArticleSearchVO searchVO) {
//		return (Integer) dao.selectOne("Article.selectListCount", searchVO);
//	}
//
//	public List<ArticleVO> selectFullList(ArticleVO articleVO) {
//		List<ArticleVO> resultList =  dao.selectList("Article.selectFullList", articleVO);
//		//첨부파일목록
//		AttachFileVO attachFileVO = null;
//		for (ArticleVO vo : resultList) {
//			attachFileVO = new AttachFileVO();
//			attachFileVO.setFileId(ATTACH_PREFIX + "_" + + vo.getArticleKey());
//			attachFileVO.setDeleteFlg("N");
//			List<AttachFileVO> fileList = attachFileService.selectFullList(attachFileVO);
//			vo.setFileList(fileList);
//		}
//		return resultList;
//	}
//	
//	public List<ArticleVO> selectFullListWithoutFileList(ArticleVO articleVO) {
//		return dao.selectList("Article.selectFullList", articleVO);
//	}
//	
//	public ArticleVO select(ArticleVO articleVO) {
//		ArticleVO resultVO = (ArticleVO)dao.selectOne("Article.select", articleVO);
//		//첨부파일
//		if(resultVO != null){
//			AttachFileVO attachFileVO = new AttachFileVO();
//			attachFileVO.setFileId(ATTACH_PREFIX + "_" + + resultVO.getArticleKey());
//			attachFileVO.setDeleteFlg("N");
//			resultVO.setFileList(attachFileService.selectFullList(attachFileVO));
//		}
//		return resultVO;
//	}
//	
//	public ArticleVO selectWithoutFileList(ArticleVO articleVO) {
//		ArticleVO resultVO = (ArticleVO)dao.selectOne("Article.select", articleVO);
//		return resultVO;
//	}
//	
//	public ArticleVO selectRootWithoutFileList(ArticleVO articleVO) {
//		ArticleVO resultVO = (ArticleVO)dao.selectOne("Article.selectRoot", articleVO);
//		return resultVO;
//	}
//
//
//	public void reply(ArticleVO articleVO) throws Exception {
//		
//		log.debug(articleVO.toString());
//		
//		//부모글 가져오기
//		ArticleVO vo = new ArticleVO();
//		vo.setArticleKey(articleVO.getPkey());
//		ArticleVO parentVO = this.select(vo);
//
//		articleVO.setFkey(parentVO.getFkey());
//		articleVO.setGkey(parentVO.getGkey() + 1);
//
//		//set okey
//		Map<String, Object> pMap = new HashMap<String, Object>();
//		pMap.put("pkey", articleVO.getPkey());
//		
//		ArticleVO maxOkeyArticleVO = (ArticleVO) dao.selectOne("Article.selectByMaxOkey", pMap);
//		
//		//부모글에 답변글이 없는 경우, 부모글의 okey+1로 세팅
//		if (maxOkeyArticleVO == null) {
//			articleVO.setOkey(parentVO.getOkey() + 1);
//			
//		//부모글에 답변글이 있는 경우
//		} else {
//			articleVO.setOkey(maxOkeyArticleVO.getOkey() + 1);
//			
//			List<ArticleVO> childList = this.getChild(maxOkeyArticleVO);
//			//log.debug(childList.toString());
//			
//			if(childList != null && childList.size() > 0){
//				articleVO.setOkey(childList.get(childList.size()-1).getOkey() + 1);
//			}
//		}
//
//		//현재 답변글 정렬키 값 이상인 레코드의 정렬키 값을 +1 증가시킴
//		dao.update("Article.updateOkey", articleVO);
//		
//		//현재 답변글 insert
//		if(StringUtils.isNotEmpty(articleVO.getWriterPwd())){
//			articleVO.setWriterPwd(EncriptUtil.encript(articleVO.getWriterPwd()));
//		}
//		dao.insert("Article.insert", articleVO);
//	}
//
//	public void update(ArticleVO articleVO) throws Exception {
//		if(StringUtils.isNotEmpty(articleVO.getWriterPwd())){
//			articleVO.setWriterPwd(EncriptUtil.encript(articleVO.getWriterPwd()));
//		}
//		dao.update("Article.update", articleVO);
//	}
//
//	public void delete(ArticleVO articleVO) {
//
//		List<ArticleVO> childList = this.getChild(articleVO);
//		
//		//log.debug(childList.toString());
//		String fileId = "";
//		
//		if(childList != null && childList.size() > 0){
//			for(ArticleVO vo : childList){
//				dao.delete("Article.delete", vo);
//				
//				//첨부파일 삭제
//				fileId = ATTACH_PREFIX + "_" + vo.getArticleKey();
//				attachFileService.deleteAttachFile(fileId);
//				
//				//댓글삭제
//				ArticleCommentVO articleCommentVO = new ArticleCommentVO();
//				articleCommentVO.setArticleCommentKey(vo.getArticleKey());
//				//articleCommentService.deleteByArticleKey(articleCommentVO);
//				
//			}
//		}
//		dao.delete("Article.delete", articleVO);
//		
//		//첨부파일 삭제
//		fileId = ATTACH_PREFIX + "_" + articleVO.getArticleKey();
//		attachFileService.deleteAttachFile(fileId);
//		
//		//댓글삭제
//		ArticleCommentVO articleCommentVO = new ArticleCommentVO();
//		articleCommentVO.setArticleCommentKey(articleVO.getArticleKey());
//		//articleCommentService.deleteByArticleKey(articleCommentVO);
//	}
//	
//	public void deleteByBoardKey(ArticleVO articleVO) {
//
//		List<ArticleVO> fullList = this.selectFullListWithoutFileList(articleVO);
//		log.debug(articleVO);
//		
//		String fileId = "";
//		
//		if(fullList != null && fullList.size() > 0){
//			for(ArticleVO vo : fullList){
//				dao.delete("Article.delete", vo);
//				
//				//첨부파일 삭제
//				fileId = ATTACH_PREFIX + "_" + vo.getArticleKey();
//				attachFileService.deleteAttachFile(fileId);
//				
//				//댓글삭제
//				ArticleCommentVO articleCommentVO = new ArticleCommentVO();
//				articleCommentVO.setArticleCommentKey(vo.getArticleKey());
//				//articleCommentService.deleteByArticleKey(articleCommentVO);
//			}
//		}
//	}
//
//	public void updateViewCnt(ArticleVO articleVO) {
//		dao.update("Article.updateViewCnt", articleVO);
//	}
//
//	public void disable(ArticleVO articleVO) {
//
//		List<ArticleVO> childList = this.getChild(articleVO);
//		
//		//log.debug(childList.toString());
//		AttachFileVO attachFileVO = new AttachFileVO();
//		
//		if(childList != null && childList.size() > 0){
//			for(ArticleVO vo : childList){
//				vo.setLastOperId(articleVO.getLastOperId());
//				vo.setLastOperIp(articleVO.getLastOperIp());
//				vo.setDeleteTyp(articleVO.getDeleteTyp());
//				dao.update("Article.disable", vo);
//				
//				//첨부파일 비활성
//				attachFileVO.setFileId(ATTACH_PREFIX + "_" + vo.getArticleKey());
//				attachFileVO.setDeleteFlg("Y");
//				attachFileService.updateDeleteFlgByFileId(attachFileVO);
//			}
//		}
//		dao.update("Article.disable", articleVO);
//		
//		//첨부파일 비활성
//		attachFileVO.setFileId(ATTACH_PREFIX + "_" + articleVO.getArticleKey());
//		attachFileVO.setDeleteFlg("Y");
//		attachFileService.updateDeleteFlgByFileId(attachFileVO);
//	}
//
//	public void recovery(ArticleVO articleVO) {
//
//		List<ArticleVO> childList = this.getChild(articleVO);
//		
//		//log.debug(childList.toString());
//		
//		if(childList != null && childList.size() > 0){
//			for(ArticleVO vo : childList){
//				vo.setLastOperId(articleVO.getLastOperId());
//				vo.setLastOperIp(articleVO.getLastOperIp());
//				vo.setDeleteTyp(articleVO.getDeleteTyp());
//				dao.update("Article.recovery", vo);
//			}
//		}
//		dao.update("Article.recovery", articleVO);
//	}
//	
//	public Integer move(Integer newBoardKey, Integer articleKey) {
//
//		Integer rtnVal = 0;
//		
//		ArticleVO vo = new ArticleVO();
//		vo.setArticleKey(articleKey);
//		ArticleVO articleVO = select(vo);
//
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("newBoardKey", newBoardKey);
//		param.put("oldBoardKey", articleVO.getBoardKey());
//		param.put("fkey", articleVO.getFkey());
//
//		rtnVal = (Integer)dao.update("Article.move", param);
//		
//		return rtnVal;
//	}
//	
//	private List<ArticleVO> getChild(ArticleVO articleVO){
//		List<ArticleVO> resultList = new ArrayList<ArticleVO>();
//		List<ArticleVO>  childList = dao.selectList("Article.selectChildList", articleVO);
//		return this.makeChildList(childList, resultList);
//	}
//	
//	private List<ArticleVO> makeChildList(List<ArticleVO> childList, List<ArticleVO> resultList){
//		if(childList != null && childList.size() > 0){
//			for(ArticleVO vo : childList){
//				List<ArticleVO>  cList = dao.selectList("Article.selectChildList", vo);
//				if(cList != null && cList.size() > 0){
//					this.makeChildList(cList, resultList);
//				}
//				resultList.add(vo);
//			}
//		}
//		return resultList;
//	}
//	
//	/**
//	 * @method	: isMngr
//	 * @date	: 2017. 2. 21.
//	 * @author	: pdh
//	 * @comment	: 게시판의 관리권한이 있는지 여부를 확인
//	 * @history	: 
//	 * @param	: 
//	 * @return	: boolean
//	 */
//	public boolean isMngr(UserVO userSession, ArticleVO articleVO) {
//		
//		if(userSession == null || (userSession != null && !StringUtils.equals(userSession.getUserTyp(), USER_TYP_MNGR))){
//			return false;
//		}
//		
//		//관리권한 체크
//		BoardUseVO boardUseVO = new BoardUseVO();
//		boardUseVO.setAuthId(userSession.getAuthId());
//		boardUseVO.setBoardKey(articleVO.getBoardKey());
//		boardUseVO.setUseTyp(BOARD_USE_TYP_MANAGE);
//		List<EgovMap> mngrAuthIdList = boardUseService.selectFullList(boardUseVO);
//		if(mngrAuthIdList != null && mngrAuthIdList.size() > 0){
//			return true;
//		}
//
//		return false;
//	}
//	
//	
//	/**
//	 * @method	: isUseGrp
//	 * @date	: 2017. 2. 21.
//	 * @author	: pdh
//	 * @comment	: 각 기능(조회, 글쓰기, 답변, 댓글)에 대한 사용권한이 있는 권한그룹 여부를 확인
//	 * @history	: 
//	 * @param	: 
//	 * @return	: boolean
//	 */
//	public boolean isUseGrp(UserVO userSession, ArticleVO articleVO, String useTyp) {
//		
//		if(userSession == null || (userSession != null && StringUtils.isEmpty(userSession.getUserTyp()))){
//			return false;
//		}
//		
//		BoardUseVO boardUseVO = new BoardUseVO();
//		//boardUseVO.setAuthId(userSession.getAuthId());
//		boardUseVO.setBoardKey(articleVO.getBoardKey());
//		boardUseVO.setUseTyp(useTyp);
//		List<EgovMap> authIdList = boardUseService.selectFullList(boardUseVO);
//		if(authIdList != null && authIdList.size() > 0){
//			for(EgovMap eMap : authIdList){
//				if(StringUtils.equals(userSession.getAuthId(), String.valueOf(eMap.get("authId")))){
//					return true;
//				}
//			}
//		//무제한
//		}else{
//			return true;
//		}
//		
//		return false;
//	}
//	
//	/**
//	 * @method	: canUse
//	 * @date	: 2017. 2. 21.
//	 * @author	: pdh
//	 * @comment	: 각 기능(조회, 글쓰기, 답변, 댓글)에 대한 사용할 수 있는지 여부를 확인(Deprecated)
//	 * @history	: 
//	 * @param	: 
//	 * @return	: boolean
//	 */
//	@Deprecated
//	public boolean canUse(UserVO userSession, ArticleVO pArticleVO, String useTyp, String useSubTyp, String pWriterPwd) {
//		
//		ArticleVO articleVO = new ArticleVO();
//		articleVO = this.select(pArticleVO);
//		
//		BoardVO pBoardVO = new BoardVO();
//		pBoardVO.setBoardKey(articleVO.getBoardKey());
//		
//		BoardVO boardVO = boardService.select(pBoardVO);
//
//		//답변기능 사용여부 체크
//		if(StringUtils.equals(useTyp, "REPLY")){
//			if(!StringUtils.equals(boardVO.getReplyFlg(), "Y")){
//				return false;
//			}
//		}
//		
//		//댓글기능 사용여부 체크 -> commentService 분리로 삭제
//		//if(StringUtils.equals(useTyp, "COMMENT")){
//		//	if(!StringUtils.equals(boardVO.getCommentFlg(), "Y")){
//		//		return false;
//		//	}
//		//}
//		
//		
//		//해당 기능을 사용할 수 있는 권한그룹인지 체크
//		if(!this.isUseGrp(userSession, articleVO, useTyp)){
//			return false; 
//		}
//		
//		
//		if(StringUtils.equals(useTyp, "VIEW")){
//			
//			//비밀글 기능 추가시 추가 구현
//			return true;
//			
//		}else if(StringUtils.equals(useTyp, "WRITE")){
//			
//			if(StringUtils.equals(useSubTyp, WRITE_SUB_TYP_WRITE)){
//				return true;
//			}else if(StringUtils.equals(useSubTyp, WRITE_SUB_TYP_MODIFY)){
//				//로그인없이 작성한 게시물
//				if(StringUtils.isEmpty(articleVO.getFrstOperId())){
//					if(StringUtils.equals(articleVO.getWriterPwd(), pWriterPwd)){
//						return true;
//					}else{
//						return false;
//					}
//					
//				//로그인하여 작성한 게시물
//				}else{
//					if(StringUtils.equals(userSession.getUserId(), articleVO.getFrstOperId())){
//						return true;
//						
//					//로그인정보가 없더라도 비밀번호로 가능 여부 확인
//					}else{
//						if(StringUtils.equals(articleVO.getWriterPwd(), pWriterPwd)){
//							return true;
//						}else{
//							return false;
//						}
//					}
//				}
//			}else if(StringUtils.equals(useSubTyp, WRITE_SUB_TYP_DELETE)){
//				//로그인없이 작성한 게시물
//				if(StringUtils.isEmpty(articleVO.getFrstOperId())){
//					if(StringUtils.equals(articleVO.getWriterPwd(), pWriterPwd)){
//						return true;
//					}else{
//						return false;
//					}
//					
//				//로그인하여 작성한 게시물
//				}else{
//					if(StringUtils.equals(userSession.getUserId(), articleVO.getFrstOperId())){
//						return true;
//					
//					//로그인정보가 없더라도 비밀번호로 가능 여부 확인
//					}else{
//						if(StringUtils.equals(articleVO.getWriterPwd(), pWriterPwd)){
//							return true;
//						}else{
//							return false;
//						}
//					}
//				}
//			}
//			
//		}else if(StringUtils.equals(useTyp, "REPLY")){
//			return true;
//		}
//		
//		return false;
//	}
}
