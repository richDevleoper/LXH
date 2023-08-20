package kr.freedi.dev.article.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.article.domain.ArticleVO;
import kr.freedi.dev.article.service.ArticleService;
import kr.freedi.dev.board.domain.BoardVO;
import kr.freedi.dev.board.service.BoardService;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.common.util.EncriptUtil;
import kr.freedi.dev.common.util.MapUtil;
import kr.freedi.dev.user.domain.UserVO;

/**
 * @project : dev_default
 * @file 	: ArticleController.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class ArticleController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_TABLE_PREFIX = "TB";
	
	final String BOARD_USE_TYP_MANAGE = "MANAGE";
	final String BOARD_USE_TYP_VIEW = "VIEW";
	final String BOARD_USE_TYP_WRITE = "WRITE";
	final String BOARD_USE_TYP_REPLY = "REPLY";
	final String BOARD_USE_TYP_COMMENT = "COMMENT";
	
	final String ARTICLE_ORDERBY_RECENTLY = "RECENTLY";
	final String ARTICLE_ORDERBY_HIERARCHY = "HIERARCHY";
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Resource(name = "articleService")
	private ArticleService articleService;
	
	//@Resource(name = "articleCommentService")
	//private ArticleCommentService articleCommentService;
	
	@Resource(name = "articleIdGnrService")
	private EgovIdGnrService idGnrService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}
	
	private String getPath(HttpServletRequest request, String fileName, String boardTyp) {

		File jspFile = null;
		if(StringUtils.startsWith(request.getRequestURI(), "/csl")){
			jspFile = new File(request.getServletContext().getRealPath("/") + "/WEB-INF/jsp/article/csl/" + boardTyp + "/" + fileName + ".jsp");
			if(jspFile.isFile()){
				return "article/csl/" + boardTyp + "/" + fileName;
			}else{
				return "article/csl/" + fileName;
			}
		
		}else if(StringUtils.startsWith(request.getRequestURI(), "/eng")){
			jspFile = new File(request.getServletContext().getRealPath("/") + "/WEB-INF/jsp/article/eng/" + boardTyp + "/" + fileName + ".jsp");
			if(jspFile.isFile()){
				return "article/eng/" + boardTyp + "/" + fileName;
			}else{
				return "article/eng/" + fileName;
			}
		}else{
			jspFile = new File(request.getServletContext().getRealPath("/") + "/WEB-INF/jsp/article/def/" + boardTyp + "/" + fileName + ".jsp");
			if(jspFile.isFile()){
				return "article/def/" + boardTyp + "/" + fileName;
			}else{
				return "article/def/" + fileName;
			}
		}

	}

	@RequestMapping({"/csl/article/list.do", "/article/list.do", "/eng/article/list.do"})
	public String list(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleVO") ArticleVO articleVO,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		log.debug(searchVO.toString());
		
		//권한체크
		//boolean isMngr = articleService.isMngr(userSession, articleVO);
		
		//게시판설정
		BoardVO pBoardVO = new BoardVO();
		pBoardVO.setBoardKey(searchVO.getBoardKey());
		BoardVO boardVO = boardService.select(pBoardVO);
		model.addAttribute("boardVO", boardVO);
		
		//orderby 설정
		if(StringUtils.equals(boardVO.getReplyFlg(), "Y")){
			searchVO.setOrderByTyp(ARTICLE_ORDERBY_HIERARCHY);
		}else{
			searchVO.setOrderByTyp(ARTICLE_ORDERBY_RECENTLY);
		}

		//페이징 기본설정
		searchVO.setRecordCountPerPage(boardVO.getPageRows());
		searchVO.setPageSize(boardVO.getPageCols());

		//csl에서만 삭제된 글 보임
		if(!StringUtils.startsWithAny(request.getRequestURI(), new String[]{"/csl"})){
			searchVO.setSearchDeleteFlg("N"); //select deleteFlg=N
			searchVO.setSearchViewPrdFlg("Y"); //select compare {viewStartDt, viewEndDt} and sysdate
		}
		
		//게시물목록
		List<ArticleVO> articleList = articleService.selectList(searchVO);
		model.addAttribute("articleList", articleList);
		model.addAttribute("nowDt", new Date());

		//게시물수
		searchVO.setTotalRecordCount(articleService.selectArticleListCount(searchVO));
		
		//공지글목록, /csl에서만 삭제된 공지글 보임
		articleVO.setNoticeFlg("Y");
		if(!StringUtils.startsWithAny(request.getRequestURI(), new String[]{"/csl"})){
			articleVO.setDeleteFlg("N");
			
			Date today = new Date();
			articleVO.setViewStartDt(today);
			articleVO.setViewEndDt(today);
		}
		
		List<ArticleVO> noticeList = articleService.selectFullList(articleVO);
		model.addAttribute("noticeList", noticeList);

		//카테고리정보
		if(StringUtils.equals(boardVO.getCatgrFlg(), "Y")){
			CodeVO codeVO = new CodeVO();
			codeVO.setCodeGrpId(boardVO.getCatgrId());
			codeVO.setActFlg("Y");
			model.addAttribute("catgrList", codeService.selectFullList(codeVO));
		}
		
		//권한정보
		model.addAttribute("isMngr", articleService.isMngr(userSession, articleVO));
		model.addAttribute("isUseGrpForWrite", articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_WRITE));
		model.addAttribute("isUseGrpForComment", articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_COMMENT));

		return this.getPath(request, "List", boardVO.getBoardTyp());

	}
	
	
	@RequestMapping({ "/csl/article/view.do", "/article/view.do", "/eng/article/view.do"})
	public String view(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleVO") ArticleVO articleVO,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession) throws Exception {
		
		//권한체크
		boolean isMngr = articleService.isMngr(userSession, articleVO);
		boolean isUseGrpForView = articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_VIEW);
		if(!isMngr && !isUseGrpForView){
			//throw new ArticlePermissionDeniedException();
			return getPath(request, "ExcpPermissionDenied", "exception");
		}
		
		//게시판설정
		BoardVO pBoardVO = new BoardVO();
		pBoardVO.setBoardKey(searchVO.getBoardKey());
		BoardVO boardVO = boardService.select(pBoardVO);
		model.addAttribute("boardVO", boardVO);
		
		//orderby 설정
		if(StringUtils.equals(boardVO.getReplyFlg(), "Y")){
			searchVO.setOrderByTyp(ARTICLE_ORDERBY_HIERARCHY);
		}else{
			searchVO.setOrderByTyp(ARTICLE_ORDERBY_RECENTLY);
		}

		//페이징 기본설정
		searchVO.setRecordCountPerPage(boardVO.getPageRows());
		searchVO.setPageSize(boardVO.getPageCols());

		//csl에서만 삭제된 글 보임
		if(!StringUtils.startsWithAny(request.getRequestURI(), new String[]{"/csl"})){
			searchVO.setSearchDeleteFlg("N"); //select deleteFlg=N
			searchVO.setSearchViewPrdFlg("Y"); //select compare {viewStartDt, viewEndDt} and sysdate
		}
		
		//게시물목록
		List<ArticleVO> articleList = articleService.selectList(searchVO);
		model.addAttribute("articleList", articleList);
		model.addAttribute("nowDt", new Date());

		//게시물수
		searchVO.setTotalRecordCount(articleService.selectArticleListCount(searchVO));
		
		//공지글목록, /csl에서만 삭제된 공지글 보임
		articleVO.setNoticeFlg("Y");
		if(!StringUtils.startsWithAny(request.getRequestURI(), new String[]{"/csl"})){
			articleVO.setDeleteFlg("N");
			
			Date today = new Date();
			articleVO.setViewStartDt(today);
			articleVO.setViewEndDt(today);
		}
		
		List<ArticleVO> noticeList = articleService.selectFullList(articleVO);
		model.addAttribute("noticeList", noticeList);
		
		//게시물정보
		ArticleVO rsltVO = articleService.select(articleVO);
		
		//삭제된, 비활성, 존재하지않는, 게시기간에 해당하지않는... 게시물 체크
		if(StringUtils.startsWithAny(request.getRequestURI(), new String[]{"/csl"})){
			if(rsltVO == null){
				return getPath(request, "ExcpNotExist", "exception");
			}
		}else{
			if(rsltVO == null){
				return getPath(request, "ExcpNotExist", "exception");
			}else{
				Date today = new Date();
				Date viewStartDt = rsltVO.getViewStartDt();
				Date viewEndDt = rsltVO.getViewEndDt();
				
				if(StringUtils.equals(rsltVO.getDeleteFlg(), "Y")
						|| (viewStartDt != null && today.compareTo(viewStartDt) < 0)
						|| (viewEndDt != null && today.compareTo(viewEndDt) > 0)){
					return getPath(request, "ExcpNotExist", "exception");	
				}
			}
		}
		
		model.addAttribute("articleVO", rsltVO);
		
		//조회수+
		@SuppressWarnings("unchecked")
		List<Integer> viewArticleKeys = request.getSession().getAttribute("viewArticleKeys") == null ? new ArrayList<Integer>() : (ArrayList<Integer>)request.getSession().getAttribute("viewArticleKeys");
		if(viewArticleKeys.indexOf(articleVO.getArticleKey()) < 0){
			articleService.updateViewCnt(articleVO);
			viewArticleKeys.add(articleVO.getArticleKey());
			request.getSession().setAttribute("viewArticleKeys", viewArticleKeys);
		}
		
		//카테고리정보
		if(StringUtils.equals(boardVO.getCatgrFlg(), "Y")){
			CodeVO codeVO = new CodeVO();
			codeVO.setCodeGrpId(boardVO.getCatgrId());
			codeVO.setActFlg("Y");
			model.addAttribute("catgrList", codeService.selectFullList(codeVO));
		}
		
		//권한정보
		model.addAttribute("isMngr", articleService.isMngr(userSession, articleVO));
		model.addAttribute("isUseGrpForWrite", articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_WRITE));
		model.addAttribute("isUseGrpForReply", articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_REPLY));
		model.addAttribute("isUseGrpForComment", articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_COMMENT));

		//첨부파일목록
		//List<JFileDetails> fileList = service.getAttachFiles(ATTACH_TABLE_PREFIX + "_ARTICLE_" + articleVO.getArticleKey());
		//model.addAttribute("attachFileList", fileList);
		
		return getPath(request, "View", boardVO.getBoardTyp());
	}
	
	
	@RequestMapping({"/csl/article/insertForm.do", "/article/insertForm.do", "/eng/article/insertForm.do"})
	public String insertForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleVO") ArticleVO articleVO,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {

		//권한체크
		boolean isMngr = articleService.isMngr(userSession, articleVO);
		boolean isUseGrpForWrite = articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_WRITE);
		if(!isMngr && !isUseGrpForWrite){
			//throw new ArticlePermissionDeniedException();
			return getPath(request, "ExcpPermissionDenied", "exception");
		}
		
		//게시판설정
		BoardVO pBoardVO = new BoardVO();
		pBoardVO.setBoardKey(searchVO.getBoardKey());
		BoardVO boardVO = boardService.select(pBoardVO);
		model.addAttribute("boardVO", boardVO);

		//폼 기본세팅
		articleVO.setArticleKey(idGnrService.getNextIntegerId());
		articleVO.setWriter(userSession.getUserNm());
		articleVO.setNoticeFlg("N");
		model.addAttribute("articleVO", articleVO);

		//카테고리정보
		if(StringUtils.equals(boardVO.getCatgrFlg(), "Y")){
			CodeVO codeVO = new CodeVO();
			codeVO.setCodeGrpId(boardVO.getCatgrId());
			codeVO.setActFlg("Y");
			model.addAttribute("catgrList", codeService.selectFullList(codeVO));
		}
		
		//권한정보
		model.addAttribute("isMngr", articleService.isMngr(userSession, articleVO));
		model.addAttribute("isUseGrpForWrite", articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_WRITE));
		
		//set submit action
		model.addAttribute("action", "insert.do");

		return getPath(request, "Form", boardVO.getBoardTyp());
	}

	@RequestMapping({"/csl/article/insert.do", "/article/insert.do", "/eng/article/insert.do"})
	public String insert(HttpServletRequest request,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("articleVO") ArticleVO articleVO, 
			UserVO userSession, 
			String userIp) throws Exception {

		//권한체크
		boolean isMngr = articleService.isMngr(userSession, articleVO);
		boolean isUseGrpForWrite = articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_WRITE);
		if(!isMngr && !isUseGrpForWrite){
			//throw new ArticlePermissionDeniedException();
			return getPath(request, "ExcpPermissionDenied", "exception");
		}
		
		//기본값 체크
		if(StringUtils.isEmpty(articleVO.getNoticeFlg())){
			articleVO.setNoticeFlg("N");
		}
		if(StringUtils.isEmpty(articleVO.getSecretFlg())){
			articleVO.setSecretFlg("N");
		}
		
		//사용자정보 세팅
		articleVO.setFrstOperId(userSession.getUserId());
		articleVO.setFrstOperIp(userIp);
		
		//insert article
		articleService.insert(articleVO);

		return "redirect:list.do?" + searchVO.getParam();
	}

	
	@RequestMapping({"/csl/article/updateForm.do", "/article/updateForm.do", "/eng/article/updateForm.do"})
	public String updateForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleVO") ArticleVO articleVO, 
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {

		//권한체크
		boolean isMngr = articleService.isMngr(userSession, articleVO);
		boolean isUseGrpForWrite = articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_WRITE);
		if(!isMngr && !isUseGrpForWrite){
			//throw new ArticlePermissionDeniedException();
			return getPath(request, "ExcpPermissionDenied", "exception");
		}

		//게시판설정
		BoardVO pBoardVO = new BoardVO();
		pBoardVO.setBoardKey(searchVO.getBoardKey());
		BoardVO boardVO = boardService.select(pBoardVO);
		model.addAttribute("boardVO", boardVO);
		
		//게시물
		ArticleVO tArticleVO = new ArticleVO();
		tArticleVO = articleService.select(articleVO);
		model.addAttribute("articleVO", tArticleVO);
		
		if(!isMngr){
			//로그인없이 쓴 글
			if(StringUtils.isEmpty(tArticleVO.getFrstOperId())){
				if(StringUtils.isEmpty(searchVO.getSearchWriterPwd())){
					model.addAttribute("cmd", "update");
					model.addAttribute("cause", "empty");
					model.addAttribute("action", "updateForm.do");
					return getPath(request, "PwdCheckForm", boardVO.getBoardTyp());
					
				}else{
					if(!StringUtils.equals(EncriptUtil.encript(searchVO.getSearchWriterPwd()), tArticleVO.getWriterPwd())){
						model.addAttribute("cmd", "update");
						model.addAttribute("cause", "wrong");
						model.addAttribute("action", "updateForm.do");
						return getPath(request, "PwdCheckForm", boardVO.getBoardTyp());
					}
				}
				
			//로그인해서 쓴글
			}else{
				if(userSession.isLoginUser()){
					if(!StringUtils.equals(userSession.getUserId(), tArticleVO.getFrstOperId())){
						return getPath(request, "ExcpIncorrectUser", "exception");
					}
				}else{
					request.getSession().setAttribute("destinationAfterLogin", request.getHeader("referer"));
					return getPath(request, "ExcpNotLoginUser", "exception");
				}
			}
		}
		
		//수정권한 획득 
		userSession.setCurrentArticleVO(tArticleVO);

		//카테고리정보
		if(StringUtils.equals(boardVO.getCatgrFlg(), "Y")){
			CodeVO codeVO = new CodeVO();
			codeVO.setCodeGrpId(boardVO.getCatgrId());
			codeVO.setActFlg("Y");
			model.addAttribute("catgrList", codeService.selectFullList(codeVO));
		}
		
		//set submit action
		model.addAttribute("action", "update.do");

		return getPath(request, "Form", boardVO.getBoardTyp());
	}

	@RequestMapping({"/csl/article/update.do", "/article/update.do", "/eng/article/update.do"})
	public String update(HttpServletRequest request,
			@ModelAttribute("articleVO") ArticleVO articleVO,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession,
			String userIp) throws Exception {

		//권한체크
		boolean isMngr = articleService.isMngr(userSession, articleVO);
		boolean isUseGrpForWrite = articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_WRITE);
		if(!isMngr && !isUseGrpForWrite){
			//throw new ArticlePermissionDeniedException();
			return getPath(request, "ExcpPermissionDenied", "exception");
		}else{
			//수정권한 획득시 추가한 userSession의 articleVO와 비교
			if(userSession.getCurrentArticleVO() == null){
				//throw new ArticlePermissionDeniedException();
				return getPath(request, "ExcpPermissionDenied", "exception");
			}else{
				log.debug("currentArticleVO.getArticleKey()=" + articleVO.getArticleKey());
				log.debug("userSession.getCurrentArticleVO().getArticleKey()=" + userSession.getCurrentArticleVO().getArticleKey());
				if(!articleVO.getArticleKey().equals(userSession.getCurrentArticleVO().getArticleKey())){
					//throw new ArticlePermissionDeniedException();
					return getPath(request, "ExcpPermissionDenied", "exception");
				}
			}
		}
		
		//기본값 체크
		if(StringUtils.isEmpty(articleVO.getNoticeFlg())){
			articleVO.setNoticeFlg("N");
		}
		if(StringUtils.isEmpty(articleVO.getSecretFlg())){
			articleVO.setSecretFlg("N");
		}

		//사용자정보 세팅
		articleVO.setLastOperId(userSession.getUserId());
		articleVO.setLastOperIp(userIp);
		
		// 게시물 수정
		articleService.update(articleVO);

		return "redirect:view.do?articleKey=" + articleVO.getArticleKey() + "&" + searchVO.getParam();
	}
	
	
	@RequestMapping({ "/csl/article/replyForm.do", "/article/replyForm.do", "/eng/article/replyForm.do" })
	public String replyForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("articleVO") ArticleVO articleVO,
			UserVO userSession) throws Exception {

		//권한체크
		boolean isMngr = articleService.isMngr(userSession, articleVO);
		boolean isUseGrpForReply = articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_REPLY);
		if(!isMngr && !isUseGrpForReply){
			//throw new ArticlePermissionDeniedException();
			return getPath(request, "ExcpPermissionDenied", "exception");
		}
		
		//게시판설정
		BoardVO pBoardVO = new BoardVO();
		pBoardVO.setBoardKey(searchVO.getBoardKey());
		BoardVO boardVO = boardService.select(pBoardVO);
		model.addAttribute("boardVO", boardVO);

		//부모글
		ArticleVO parentVO = articleService.select(articleVO);
		model.addAttribute("parentVO", parentVO);

		//새글세팅
		articleVO.setArticleKey(idGnrService.getNextIntegerId());
		articleVO.setBoardKey(articleVO.getBoardKey());
		articleVO.setPkey(parentVO.getArticleKey());
		articleVO.setWriter(userSession.getUserNm());
		model.addAttribute("articleVO", articleVO);

		//카테고리정보
		if(StringUtils.equals(boardVO.getCatgrFlg(), "Y")){
			CodeVO codeVO = new CodeVO();
			codeVO.setCodeGrpId(boardVO.getCatgrId());
			codeVO.setActFlg("Y");
			model.addAttribute("catgrList", codeService.selectFullList(codeVO));
		}
		
		//set submit action
		model.addAttribute("action", "reply.do");

		return getPath(request, "ReplyForm", boardVO.getBoardTyp());

	}

	@RequestMapping({ "/csl/article/reply.do", "/article/reply.do", "/eng/article/reply.do" })
	public String replyHanlder(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("articleVO") ArticleVO articleVO, 
			UserVO userSession, 
			String userIp) throws Exception {

		//권한체크
		boolean isMngr = articleService.isMngr(userSession, articleVO);
		boolean isUseGrpForReply = articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_REPLY);
		if(!isMngr && !isUseGrpForReply){
			//throw new ArticlePermissionDeniedException();
			return getPath(request, "ExcpPermissionDenied", "exception");
		}
		
		//기본값 체크
		if(StringUtils.isEmpty(articleVO.getNoticeFlg())){
			articleVO.setNoticeFlg("N");
		}

		//사용자정보 세팅
		articleVO.setFrstOperId(userSession.getUserId());
		articleVO.setFrstOperIp(userIp);
		
		//insert article
		articleService.reply(articleVO);

		return "redirect:list.do?" + searchVO.getParam();
	}
	
	
	@RequestMapping({"/csl/article/pwdCheckForm.do", "/article/pwdCheckForm.do", "/eng/article/pwdCheckForm.do"})
	public String pwdCheckForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("articleVO") ArticleVO articleVO,
			UserVO userSession) {

		//게시판설정
		BoardVO pBoardVO = new BoardVO();
		pBoardVO.setBoardKey(searchVO.getBoardKey());
		BoardVO boardVO = boardService.select(pBoardVO);
		model.addAttribute("boardVO", boardVO);

		return getPath(request, "WritePwdForm", boardVO.getBoardTyp());
	}

	
	@RequestMapping({"/csl/article/delete.do"})
	public String delete(HttpServletRequest request,
			@ModelAttribute("articleVO") ArticleVO articleVO, 
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {

		//권한체크
		boolean isMngr = articleService.isMngr(userSession, articleVO);
		if(!isMngr){
			//throw new ArticlePermissionDeniedException();
			return getPath(request, "ExcpPermissionDenied", "exception");
		}

		//게시물삭제
		articleService.delete(articleVO);

		return "redirect:list.do?" + searchVO.getParam();
	}

	
	@RequestMapping({ "/csl/article/disable.do", "/article/disable.do", "/eng/article/disable.do"})
	public String disable(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleVO") ArticleVO articleVO, 
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			UserVO userSession,
			String userIp)throws Exception {

		//권한체크
		boolean isMngr = articleService.isMngr(userSession, articleVO);
		boolean isUseGrpForWrite = articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_WRITE);
		if(!isMngr && !isUseGrpForWrite){
			//throw new ArticlePermissionDeniedException();
			return getPath(request, "ExcpPermissionDenied", "exception");
		}
		
		//게시판설정
		BoardVO pBoardVO = new BoardVO();
		pBoardVO.setBoardKey(searchVO.getBoardKey());
		BoardVO boardVO = boardService.select(pBoardVO);
		model.addAttribute("boardVO", boardVO);
		
		//게시물
		ArticleVO tArticleVO = new ArticleVO();
		tArticleVO = articleService.select(articleVO);
		model.addAttribute("articleVO", tArticleVO);
		
		if(!isMngr){
			//로그인없이 쓴 글
			if(StringUtils.isEmpty(tArticleVO.getFrstOperId())){
				if(StringUtils.isEmpty(searchVO.getSearchWriterPwd())){
					model.addAttribute("cmd", "delete");
					model.addAttribute("cause", "empty");
					model.addAttribute("action", "disable.do");
					return getPath(request, "PwdCheckForm", boardVO.getBoardTyp());
					
				}else{
					if(!StringUtils.equals(EncriptUtil.encript(searchVO.getSearchWriterPwd()), tArticleVO.getWriterPwd())){
						model.addAttribute("cmd", "delete");
						model.addAttribute("cause", "wrong");
						model.addAttribute("action", "disable.do");
						return getPath(request, "PwdCheckForm", boardVO.getBoardTyp());
					}
				}
				
			//로그인해서 쓴글
			}else{
				if(userSession.isLoginUser()){
					if(!StringUtils.equals(userSession.getUserId(), tArticleVO.getFrstOperId())){
						return getPath(request, "ExcpIncorrectUser", "exception");
					}
				}else{
					request.getSession().setAttribute("destinationAfterLogin", request.getHeader("referer"));
					return getPath(request, "ExcpNotLoginUser", "exception");
				}
			}
		}
		
		articleVO.setLastOperId(userSession.getUserId());
		articleVO.setLastOperIp(userIp);
		articleVO.setDeleteTyp(userSession.getUserTyp());
		
		articleService.disable(articleVO);

		return "redirect:view.do?articleKey=" + articleVO.getArticleKey() + "&" + searchVO.getParam();
	}

	@RequestMapping({ "/csl/article/recovery.do"})
	public String recovery(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleVO") ArticleVO articleVO, 
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			UserVO userSession,
			String userIp)throws Exception {

		//권한체크
		boolean isMngr = articleService.isMngr(userSession, articleVO);
		boolean isUseGrpForWrite = articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_WRITE);
		if(!isMngr && isUseGrpForWrite){
			//throw new ArticlePermissionDeniedException();
			return getPath(request, "ExcpPermissionDenied", "exception");
		}
		
		//게시판설정
		BoardVO pBoardVO = new BoardVO();
		pBoardVO.setBoardKey(searchVO.getBoardKey());
		BoardVO boardVO = boardService.select(pBoardVO);
		model.addAttribute("boardVO", boardVO);
		
		//게시물
		ArticleVO tArticleVO = new ArticleVO();
		tArticleVO = articleService.select(articleVO);
		model.addAttribute("articleVO", tArticleVO);
		
		if(!isMngr){
			//로그인없이 쓴 글
			if(StringUtils.isEmpty(tArticleVO.getFrstOperId())){
				if(StringUtils.isEmpty(searchVO.getSearchWriterPwd())){
					model.addAttribute("cmd", "delete");
					model.addAttribute("cause", "empty");
					return getPath(request, "PwdCheckForm", boardVO.getBoardTyp());
					
				}else{
					if(!StringUtils.equals(searchVO.getSearchWriterPwd(), tArticleVO.getWriterPwd())){
						model.addAttribute("cmd", "delete");
						model.addAttribute("cause", "wrong");
						return getPath(request, "PwdCheckForm", boardVO.getBoardTyp());
					}
				}
				
			//로그인해서 쓴글
			}else{
				if(userSession.isLoginUser()){
					if(!StringUtils.equals(userSession.getUserId(), tArticleVO.getFrstOperId())){
						return getPath(request, "ExcpIncorrectUser", "exception");
					}
				}else{
					request.getSession().setAttribute("destinationAfterLogin", request.getHeader("referer"));
					return getPath(request, "ExcpNotLoginUser", "exception");
				}
			}
		}
		
		articleVO.setLastOperId(userSession.getUserId());
		articleVO.setLastOperIp(userIp);
		articleVO.setDeleteTyp(userSession.getUserTyp());
		
		articleService.recovery(articleVO);

		return "redirect:view.do?articleKey=" + articleVO.getArticleKey() + "&" + searchVO.getParam();
	}

	@RequestMapping(value = "/csl/article/move.do")
	public @ResponseBody
	String move(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {

		Integer newBoardKey = MapUtil.getInteger(reqMap, "newBoardKey");
		Integer articleKey = MapUtil.getInteger(reqMap, "articleKey");
		
		Integer rtnVal = articleService.move(newBoardKey, articleKey);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(rtnVal > 0){
			resultMap.put("isAvail", "true");
		}else{
			resultMap.put("isAvail", "false");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@Deprecated
	@RequestMapping({ "/csl/article/moveForm.doxx"})
	public String moveForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("articleVO") ArticleVO articleVO, 
			UserVO userSession) {

		//권한체크
		boolean isMngr = articleService.isMngr(userSession, articleVO);
		if(!isMngr){
			//throw new ArticlePermissionDeniedException();
			return getPath(request, "ExcpPermissionDenied", "exception");
		}
		
		//최상위글체크(하위글도 같이 이동되야 하니까~)
		ArticleVO pArticleVO = articleService.select(articleVO);
		if(pArticleVO.getGkey() != 0){
			//throw new ArticleNotAllowCaseException();
			return getPath(request, "ExcpNotAllowCase", "exception");
		}
		
		
		BoardVO pBoardVO = new BoardVO();
		pBoardVO.setBoardKey(searchVO.getBoardKey());
		BoardVO boardVO = boardService.select(pBoardVO);
		boardVO.setActFlg("Y");

		//게시판목록(활성만)
		model.addAttribute("boardList", boardService.selectFullList(boardVO));

		return getPath(request, "MoveForm", boardVO.getBoardTyp());
	}

	@Deprecated
	@RequestMapping({ "/csl/article/move.doxx"})
	public String move(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("articleVO") ArticleVO articleVO,
			@RequestParam(value = "newBoardKey", required = true) Integer newBoardKey,
			UserVO userSession) throws Exception {

		//권한체크
		boolean isMngr = articleService.isMngr(userSession, articleVO);
		if(!isMngr){
			//throw new ArticlePermissionDeniedException();
			return getPath(request, "ExcpPermissionDenied", "exception");
		}
		
		//최상위글체크(하위글도 같이 이동되야 하니까~)
		ArticleVO pArticleVO = articleService.select(articleVO);
		if(pArticleVO.getGkey() != 0){
			//throw new ArticleNotAllowCaseException();
			return getPath(request, "ExcpNotAllowCase", "exception");
		}

		//게시물이동
		articleService.move(newBoardKey, articleVO.getArticleKey());

		return "redirect:list.do?" + searchVO.getParam();
	}
	
	@RequestMapping({ "/article/bigdata.do"})
	public String handler_Bigdata(HttpServletRequest request, ModelMap model) throws Exception {

		return "/app/community/redBigdata";
	}	
}
