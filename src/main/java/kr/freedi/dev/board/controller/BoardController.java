package kr.freedi.dev.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.board.domain.BoardSearchVO;
import kr.freedi.dev.board.domain.BoardUseVO;
import kr.freedi.dev.board.domain.BoardVO;
import kr.freedi.dev.board.service.BoardService;
import kr.freedi.dev.board.service.BoardUseService;
import kr.freedi.dev.code.domain.CodeGrpVO;
import kr.freedi.dev.code.service.CodeGrpService;
import kr.freedi.dev.menu.service.MenuService;
import kr.freedi.dev.user.domain.UserAuthVO;
import kr.freedi.dev.user.domain.UserVO;
import kr.freedi.dev.user.service.UserAuthService;

/**
 * @project : dev_default
 * @file 	: BoardController.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class BoardController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	private final String USER_TYP_MNGR = "MNGR_USER"; //관리자
	private final String USER_TYP_GENR = "GENR_USER"; //개인회원
	private final String USER_TYP_CORP = "CORP_USER"; //기업회원
	
	private final String BOARD_USE_TYP_MANAGE = "MANAGE";
	private final String BOARD_USE_TYP_VIEW = "VIEW";
	private final String BOARD_USE_TYP_WRITE = "WRITE";
	private final String BOARD_USE_TYP_REPLY = "REPLY";
	private final String BOARD_USE_TYP_COMMENT = "COMMENT";
	
	//private final String MENU_TYP_DEF = "DEF";
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Resource(name = "boardUseService")
	private BoardUseService boardUseService;
	
	@Resource(name = "userAuthService")
	private UserAuthService userAuthService;
	
	@Resource(name="codeGrpService")
	private CodeGrpService codeGrpService;
	
	@Resource(name="menuService")
	private MenuService menuService;
	
	@RequestMapping("/csl/board/list.do")
	public String listHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("boardSearchVO") BoardSearchVO searchVO) throws Exception {

		List<EgovMap> boardList = boardService.selectList(searchVO);
		model.addAttribute("boardList", boardList);
		searchVO.setTotalRecordCount(boardService.selectListCount(searchVO));
		
		//menuList
		//List<MenuVO> menuList = menuService.getActTreeList(MENU_TYP_DEF);
		//model.addAttribute("treeMenuList", menuList);
		
		return "board/csl/List";
	}

	@RequestMapping("/csl/board/insertForm.do")
	public String insertFormHandler(HttpServletRequest request, ModelMap model,
			@ModelAttribute("boardSearchVO") BoardSearchVO searchVO) throws Exception {
		
		BoardVO boardVO = new BoardVO();

		//기본세팅
		boardVO.setBoardTyp("basic");
		
		boardVO.setActFlg("Y");
		boardVO.setCatgrFlg("N");
		boardVO.setNoticeFlg("N");
		boardVO.setReplyFlg("N");
		boardVO.setCommentFlg("N");
		boardVO.setWysiwygFlg("Y");
		boardVO.setSearchFlg("N");
		boardVO.setRssFlg("N");
		boardVO.setSecretFlg("N");
		boardVO.setViewPrdFlg("N");
		boardVO.setAttachFlg("Y");
		boardVO.setAttachCnt(5);
		boardVO.setAttachSiz(10);
		boardVO.setNewPrd(3);
		boardVO.setPageRows(10);
		boardVO.setPageCols(10);
		
		model.addAttribute("boardVO", boardVO);

		//권한그룹 목록, 정렬(관리자,일반회원,기업회원)을 위해 각각 가져와서 add
		List<EgovMap> userAuthList = new ArrayList<EgovMap>();
		UserAuthVO userAuthVO = new UserAuthVO();
		userAuthVO.setActFlg("Y");
		userAuthVO.setUserGrp(USER_TYP_MNGR);
		userAuthList.addAll(userAuthService.selectFullList(userAuthVO));
		userAuthVO.setUserGrp(USER_TYP_GENR);
		userAuthList.addAll(userAuthService.selectFullList(userAuthVO));
		userAuthVO.setUserGrp(USER_TYP_CORP);
		userAuthList.addAll(userAuthService.selectFullList(userAuthVO));
		model.addAttribute("userAuthList", userAuthList);
		
		//선택가능한 게시판 카테고리 
		CodeGrpVO codeGrpVO = new CodeGrpVO();
		codeGrpVO.setAttr("BOARD");
		model.addAttribute("codeGrpList", codeGrpService.selectFullList(codeGrpVO));
		
		model.addAttribute("action", "insert.do");

		return "board/csl/Form";
	}

	@RequestMapping("/csl/board/insert.do")
	public String insertHandler(HttpServletRequest request,
			@ModelAttribute("boardVO") BoardVO boardVO,
			@ModelAttribute("boardSearchVO") BoardSearchVO searchVO,
			@RequestParam(value = "mngAuthIdList", required = false) String[] mngAuthIdList,
			@RequestParam(value = "viewAuthIdList", required = false) String[] viewAuthIdList,
			@RequestParam(value = "writeAuthIdList", required = false) String[] writeAuthIdList,
			@RequestParam(value = "replyAuthIdList", required = false) String[] replyAuthIdList,
			@RequestParam(value = "commentAuthIdList", required = false) String[] commentAuthIdList,
			UserVO userSession) throws Exception {

		boardVO.setFrstOperId(userSession.getUserId()); //등록자 아이디
		
		boardService.insert(boardVO, mngAuthIdList, viewAuthIdList, writeAuthIdList, replyAuthIdList, commentAuthIdList);
		
		return "redirect:list.do?" + searchVO.getParam();
	}

	@RequestMapping("/csl/board/updateForm.do")
	public String updateFormHandler(HttpServletRequest request, ModelMap model,			
			@ModelAttribute("boardVO") BoardVO boardVO,
			@ModelAttribute("boardSearchVO") BoardSearchVO searchVO) throws Exception {

		model.addAttribute("boardVO", boardService.select(boardVO));
		
		//권한그룹 목록, 정렬(관리자,일반회원,기업회원)을 위해 각각 가져와서 add
		List<EgovMap> userAuthList = new ArrayList<EgovMap>();
		UserAuthVO userAuthVO = new UserAuthVO();
		userAuthVO.setActFlg("Y");
		userAuthVO.setUserGrp(USER_TYP_MNGR);
		userAuthList.addAll(userAuthService.selectFullList(userAuthVO));
		userAuthVO.setUserGrp(USER_TYP_GENR);
		userAuthList.addAll(userAuthService.selectFullList(userAuthVO));
		userAuthVO.setUserGrp(USER_TYP_CORP);
		userAuthList.addAll(userAuthService.selectFullList(userAuthVO));
		model.addAttribute("userAuthList", userAuthList);
		
		//게시판 사용권한 목록
		BoardUseVO boardUseVO = new BoardUseVO();
		boardUseVO.setBoardKey(boardVO.getBoardKey());
		
		boardUseVO.setUseTyp(BOARD_USE_TYP_MANAGE);
		model.addAttribute("mngAuthIdList", boardUseService.selectFullList(boardUseVO));
		
		boardUseVO.setUseTyp(BOARD_USE_TYP_VIEW);
		model.addAttribute("viewAuthIdList", boardUseService.selectFullList(boardUseVO));
		
		boardUseVO.setUseTyp(BOARD_USE_TYP_WRITE);
		model.addAttribute("writeAuthIdList", boardUseService.selectFullList(boardUseVO));
		
		boardUseVO.setUseTyp(BOARD_USE_TYP_REPLY);
		model.addAttribute("replyAuthIdList", boardUseService.selectFullList(boardUseVO));
		
		boardUseVO.setUseTyp(BOARD_USE_TYP_COMMENT);
		model.addAttribute("commentAuthIdList", boardUseService.selectFullList(boardUseVO));
		
		//선택가능한 게시판 카테고리 
		CodeGrpVO codeGrpVO = new CodeGrpVO();
		codeGrpVO.setAttr("BOARD");
		model.addAttribute("codeGrpList", codeGrpService.selectFullList(codeGrpVO));
		
		model.addAttribute("action", "update.do");
		
		return "board/csl/Form";
	}

	@RequestMapping("/csl/board/update.do")
	public String updateHandler(HttpServletRequest request,
			@ModelAttribute("boardVO") BoardVO boardVO,
			@ModelAttribute("boardSearchVO") BoardSearchVO searchVO,
			@RequestParam(value = "mngAuthIdList", required = false) String[] mngAuthIdList,
			@RequestParam(value = "viewAuthIdList", required = false) String[] viewAuthIdList,
			@RequestParam(value = "writeAuthIdList", required = false) String[] writeAuthIdList,
			@RequestParam(value = "replyAuthIdList", required = false) String[] replyAuthIdList,
			@RequestParam(value = "commentAuthIdList", required = false) String[] commentAuthIdList,
			UserVO userSession) throws Exception {

		boardVO.setLastOperId(userSession.getUserId());
		
		boardService.update(boardVO, mngAuthIdList, viewAuthIdList, writeAuthIdList, replyAuthIdList, commentAuthIdList);
		
		return "redirect:updateForm.do?boardKey=" + boardVO.getBoardKey() + "&" + searchVO.getParam();
	}

	@RequestMapping("/csl/board/delete.do")
	public String deleteHandler(HttpServletRequest request,
			@ModelAttribute("boardVO") BoardVO boardVO,
			@ModelAttribute("boardSearchVO") BoardSearchVO searchVO) throws Exception {

		boardService.delete(boardVO);
		
		return "redirect:list.do?" + searchVO.getParam();
	}
	
	@RequestMapping(value = "/csl/board/actList.do")
	public @ResponseBody
	String actTreeList(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {

		log.debug(reqMap.toString());
		
		BoardVO boardVO = new BoardVO();
		boardVO.setActFlg("Y");
		
		List<BoardVO> boardList = boardService.selectFullList(boardVO);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("boardActList", boardList);
		
		return new ObjectMapper().writeValueAsString(resultMap);
	}
}
