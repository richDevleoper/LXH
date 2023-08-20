package kr.freedi.dev.article.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.freedi.dev.article.domain.ArticleCommentSearchVO;
import kr.freedi.dev.article.domain.ArticleCommentVO;
import kr.freedi.dev.article.service.ArticleCommentService;
import kr.freedi.dev.article.service.ArticleService;
import kr.freedi.dev.common.util.EncriptUtil;
import kr.freedi.dev.common.util.MapUtil;
import kr.freedi.dev.user.domain.UserVO;

@Controller
public class ArticleCommentController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String BOARD_USE_TYP_COMMENT = "COMMENT";
	
	@Resource(name = "articleCommentService")
	private ArticleCommentService articleCommentService;
	
	@Resource(name = "articleService")
	private ArticleService articleService;
	
	@RequestMapping(value = {"/csl/articlecomment/fullList.do","/articlecomment/fullList.do","/eng/articlecomment/fullList.do"})
	public @ResponseBody
	String list(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {

		log.debug(reqMap.toString());
		Integer articleKey = MapUtil.getInteger(reqMap, "articleKey");
		
		ArticleCommentVO articleCommentVO = new ArticleCommentVO();
		articleCommentVO.setArticleKey(articleKey);
		if(!StringUtils.startsWithAny(request.getRequestURI(), new String[]{"/csl"})){
			articleCommentVO.setDeleteFlg("N");
		}
		
		List<ArticleCommentVO> articleCommentList = articleCommentService.selectFullList(articleCommentVO);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("articleCommentList", articleCommentList);

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	
	@RequestMapping(value = {"/csl/articlecomment/insert.do","/articlecomment/insert.do","/eng/articlecomment/insert.do"})
	public @ResponseBody
	String insert(HttpServletRequest request,
			@ModelAttribute("articleCommentSearchVO") ArticleCommentSearchVO searchVO,
			@ModelAttribute("articleCommentVO") ArticleCommentVO articleCommentVO,
			UserVO userSession, 
			String userIp)throws Exception {

		articleCommentVO.setFrstOperId(userSession.getUserId());
		articleCommentVO.setFrstOperIp(userIp);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//권한체크
		boolean isMngr = articleCommentService.isMngr(userSession, articleCommentVO);
		boolean isUseGrpForComment = articleCommentService.isUseGrp(userSession, articleCommentVO, BOARD_USE_TYP_COMMENT);
		if(!isMngr && !isUseGrpForComment){
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "PERMISSION_DENIED");
			
			return new ObjectMapper().writeValueAsString(resultMap);
		}
		
		Integer rtnVal = articleCommentService.insert(articleCommentVO);
		if(rtnVal > 0){
			resultMap.put("isAvail", true);
		}else{
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "NOT_COMPLETE");
		}
		
		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	
	@RequestMapping(value = {"/csl/articlecomment/reply.do","/articlecomment/reply.do","/eng/articlecomment/reply.do"})
	public @ResponseBody
	String reply(HttpServletRequest request,
			@ModelAttribute("articleCommentSearchVO") ArticleCommentSearchVO searchVO,
			@ModelAttribute("articleCommentVO") ArticleCommentVO articleCommentVO,
			UserVO userSession, 
			String userIp)throws Exception {

		articleCommentVO.setFrstOperId(userSession.getUserId());
		articleCommentVO.setFrstOperIp(userIp);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//권한체크
		boolean isMngr = articleCommentService.isMngr(userSession, articleCommentVO);
		boolean isUseGrpForComment = articleCommentService.isUseGrp(userSession, articleCommentVO, BOARD_USE_TYP_COMMENT);
		
		if(!isMngr && !isUseGrpForComment){
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "PERMISSION_DENIED");
			
			return new ObjectMapper().writeValueAsString(resultMap);
		}
		
		Integer rtnVal = articleCommentService.reply(articleCommentVO);
		if(rtnVal > 0){
			resultMap.put("isAvail", true);
		}else{
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "NOT_COMPLETE");
		}
		
		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	
	@RequestMapping(value = {"/csl/articlecomment/update.do","/articlecomment/update.do","/eng/articlecomment/update.do"})
	public @ResponseBody
	String update(HttpServletRequest request,
			@ModelAttribute("articleCommentSearchVO") ArticleCommentSearchVO searchVO,
			@ModelAttribute("articleCommentVO") ArticleCommentVO articleCommentVO,
			UserVO userSession, 
			String userIp)throws Exception {

		articleCommentVO.setLastOperId(userSession.getUserId());
		articleCommentVO.setLastOperIp(userIp);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//권한체크
		boolean isMngr = articleCommentService.isMngr(userSession, articleCommentVO);
		boolean isUseGrpForComment = articleCommentService.isUseGrp(userSession, articleCommentVO, BOARD_USE_TYP_COMMENT);
		
		if(!isMngr && !isUseGrpForComment){
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "PERMISSION_DENIED");
			return new ObjectMapper().writeValueAsString(resultMap);
		}
		
		ArticleCommentVO currentVO = articleCommentService.select(articleCommentVO);
		if(currentVO == null){
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "NOT_EXIST");
			return new ObjectMapper().writeValueAsString(resultMap);
		}else{
			if(!isMngr){
				//로그인없이 쓴 댓글
				if(StringUtils.isEmpty(currentVO.getFrstOperId())){
					if(!StringUtils.equals(EncriptUtil.encript(articleCommentVO.getWriterPwd() == null ? "" : articleCommentVO.getWriterPwd()), currentVO.getWriterPwd())){
						resultMap.put("isAvail", false);
						resultMap.put("rsCode", "NOT_MATCH_PWD");
						return new ObjectMapper().writeValueAsString(resultMap);
					}
					
				//로그인해서 쓴 댓글
				}else{
					if(!StringUtils.equals(articleCommentVO.getLastOperId(), currentVO.getFrstOperId())){
						resultMap.put("isAvail", false);
						resultMap.put("rsCode", "NOT_MATCH_LOGIN");
						return new ObjectMapper().writeValueAsString(resultMap);
					}
				}
			}
		}
		
		Integer rtnVal = articleCommentService.update(articleCommentVO);
		if(rtnVal > 0){
			resultMap.put("isAvail", true);
		}else{
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "NOT_COMPLETE");
		}
		
		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	
	@RequestMapping(value = {"/csl/articlecomment/disable.do","/articlecomment/disable.do","/eng/articlecomment/disable.do"})
	public @ResponseBody
	String disable(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap,
			UserVO userSession, 
			String userIp)throws Exception {

		log.debug(reqMap.toString());
		Integer boardKey = MapUtil.getInteger(reqMap, "boardKey");
		Integer articleCommentKey = MapUtil.getInteger(reqMap, "articleCommentKey");
		String writerPwd = MapUtil.getString(reqMap,"writerPwd");
		
		ArticleCommentVO articleCommentVO = new ArticleCommentVO();
		articleCommentVO.setBoardKey(boardKey);
		articleCommentVO.setArticleCommentKey(articleCommentKey);
		articleCommentVO.setWriterPwd(writerPwd);
		articleCommentVO.setLastOperId(userSession.getUserId());
		articleCommentVO.setLastOperIp(userIp);
		articleCommentVO.setDeleteTyp(userSession.getUserTyp());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//권한체크
		boolean isMngr = articleCommentService.isMngr(userSession, articleCommentVO);
		boolean isUseGrpForComment = articleCommentService.isUseGrp(userSession, articleCommentVO, BOARD_USE_TYP_COMMENT);
		
		if(!isMngr && !isUseGrpForComment){
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "PERMISSION_DENIED");
			return new ObjectMapper().writeValueAsString(resultMap);
		}
		
		ArticleCommentVO currentVO = articleCommentService.select(articleCommentVO);
		if(currentVO == null){
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "NOT_EXIST");
			return new ObjectMapper().writeValueAsString(resultMap);
		}else{
			if(!isMngr){
				//로그인없이 쓴 댓글
				if(StringUtils.isEmpty(currentVO.getFrstOperId())){
					if(!StringUtils.equals(EncriptUtil.encript(articleCommentVO.getWriterPwd() == null ? "" : articleCommentVO.getWriterPwd()), currentVO.getWriterPwd())){
						resultMap.put("isAvail", false);
						resultMap.put("rsCode", "NOT_MATCH_PWD");
						return new ObjectMapper().writeValueAsString(resultMap);
					}
					
				//로그인해서 쓴 댓글
				}else{
					if(!StringUtils.equals(articleCommentVO.getLastOperId(), currentVO.getFrstOperId())){
						resultMap.put("isAvail", false);
						resultMap.put("rsCode", "NOT_MATCH_LOGIN");
						return new ObjectMapper().writeValueAsString(resultMap);
					}
				}
			}
		}
		
		Integer rtnVal = articleCommentService.disable(articleCommentVO);
		if(rtnVal > 0){
			resultMap.put("isAvail", true);
		}else{
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "NOT_COMPLETE");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping(value = {"/csl/articlecomment/recovery.do"})
	public @ResponseBody
	String recovery(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap,
			UserVO userSession, 
			String userIp)throws Exception {

		log.debug(reqMap.toString());
		Integer boardKey = MapUtil.getInteger(reqMap, "boardKey");
		Integer articleCommentKey = MapUtil.getInteger(reqMap, "articleCommentKey");
		
		ArticleCommentVO articleCommentVO = new ArticleCommentVO();
		articleCommentVO.setBoardKey(boardKey);
		articleCommentVO.setArticleCommentKey(articleCommentKey);
		articleCommentVO.setLastOperId(userSession.getUserId());
		articleCommentVO.setLastOperIp(userIp);
		articleCommentVO.setDeleteTyp(userSession.getUserTyp());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//권한체크
		boolean isMngr = articleCommentService.isMngr(userSession, articleCommentVO);
		boolean isUseGrpForComment = articleCommentService.isUseGrp(userSession, articleCommentVO, BOARD_USE_TYP_COMMENT);
		
		if(!isMngr && !isUseGrpForComment){
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "PERMISSION_DENIED");
			return new ObjectMapper().writeValueAsString(resultMap);
		}
		
		Integer rtnVal = articleCommentService.recovery(articleCommentVO);
		if(rtnVal > 0){
			resultMap.put("isAvail", true);
		}else{
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "NOT_COMPLETE");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping(value = {"/csl/articlecomment/delete.do"})
	public @ResponseBody
	String delete(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap,
			UserVO userSession, 
			String userIp)throws Exception {

		log.debug(reqMap.toString());
		Integer boardKey = MapUtil.getInteger(reqMap, "boardKey");
		Integer articleCommentKey = MapUtil.getInteger(reqMap, "articleCommentKey");
		
		ArticleCommentVO articleCommentVO = new ArticleCommentVO();
		articleCommentVO.setBoardKey(boardKey);
		articleCommentVO.setArticleCommentKey(articleCommentKey);
		articleCommentVO.setLastOperId(userSession.getUserId());
		articleCommentVO.setLastOperIp(userIp);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//권한체크
		boolean isMngr = articleCommentService.isMngr(userSession, articleCommentVO);
		//boolean isUseGrpForComment = articleCommentService.isUseGrp(userSession, articleCommentVO, BOARD_USE_TYP_COMMENT);
		
		if(!isMngr){
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "PERMISSION_DENIED");
			return new ObjectMapper().writeValueAsString(resultMap);
		}
		
		Integer rtnVal = articleCommentService.delete(articleCommentVO);
		if(rtnVal > 0){
			resultMap.put("isAvail", true);
		}else{
			resultMap.put("isAvail", false);
			resultMap.put("rsCode", "NOT_COMPLETE");
		}

		return new ObjectMapper().writeValueAsString(resultMap);
	}
}












