package kr.freedi.dev.index.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.FastDateFormat;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.article.domain.ArticleVO;
import kr.freedi.dev.article.service.ArticleService;
import kr.freedi.dev.banner.domain.BannerVO;
import kr.freedi.dev.banner.service.IBannerService;
import kr.freedi.dev.board.domain.BoardVO;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.common.domain.CommonVO;
import kr.freedi.dev.common.exception.NotExistPageException;
import kr.freedi.dev.index.domain.SearchAllVO;
import kr.freedi.dev.link.domain.LinkVO;
import kr.freedi.dev.link.service.ILinkService;
import kr.freedi.dev.menu.domain.MenuVO;
import kr.freedi.dev.menu.service.IMenuService;
import kr.freedi.dev.popup.domain.PopupVO;
import kr.freedi.dev.popup.service.IPopupService;
import kr.freedi.dev.qproposal.domain.ProposalSearchVO;
import kr.freedi.dev.qproposal.domain.ProposalVO;
import kr.freedi.dev.qproposal.service.ProposalService;
import kr.freedi.dev.qreport.domain.ReportSearchVO;
import kr.freedi.dev.qreport.domain.ReportVO;
import kr.freedi.dev.qreport.service.ReportService;
import kr.freedi.dev.user.domain.UserVO;

/**
 * @project : dev_default
 * @file : SearchController.java
 * @date : 2023. 6. 29.
 * @author : pdh
 * @comment :
 * @history :
 */
@Controller
@RequestMapping({"/search"})
public class SearchController {

	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;

	@Resource(name = "bannerService")
	private IBannerService bannerService;

	@Resource(name = "linkService")
	private ILinkService linkService;

	@Resource(name = "popupService")
	private IPopupService popupService;

	@Resource(name = "articleService")
	private ArticleService articleService;

	@Resource(name = "menuService")
	private IMenuService menuService;

	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "reportService")
	private ReportService reportService;
	
	@Resource(name = "proposalService")
	private ProposalService proposalService;
	

	@RequestMapping("/index.do")
	public String handler_searchReport(HttpServletRequest request, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO, 
			UserVO userSession)throws Exception {

		searchVO.setMenuCode("REPORT");  // 과제 or 분임조과제 구분
		searchVO.setSearchUserid(userSession.getUserId());
		List<EgovMap> countList = reportService.selectFullListCount(searchVO);
		
		int totalCount = 0;
		for (EgovMap egovMap : countList) {
			
			String codeNm = (String)egovMap.get("repDivisionCode");
			BigDecimal currVal = (BigDecimal)egovMap.get("cnt");
			totalCount = totalCount + currVal.intValue();
		}
		model.addAttribute("countList", countList);
		
		//페이징 기본설정
		searchVO.setTotalRecordCount(totalCount);
		
		List<ReportVO> reportList = reportService.selectFullList(searchVO);
		model.addAttribute("reportList", reportList);
		model.addAttribute("totalCount", totalCount);
		
		return "search/index";
	}
	
	
	@RequestMapping("/team.do")
	public String handler_searchTeam(HttpServletRequest request, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO,
			UserVO userSession) {

		searchVO.setMenuCode("TEAM");  // 과제 or 분임조과제 구분
		searchVO.setSearchUserid(userSession.getUserId());
		List<EgovMap> countList = reportService.selectFullListCount(searchVO);
		
		int totalCount = 0;
		for (EgovMap egovMap : countList) {
			
			String codeNm = (String)egovMap.get("repDivisionCode");
			BigDecimal currVal = (BigDecimal)egovMap.get("cnt");
			totalCount = totalCount + currVal.intValue();
		}
		model.addAttribute("countList", countList);
		
		//페이징 기본설정
		searchVO.setTotalRecordCount(totalCount);
		
		List<ReportVO> reportList = reportService.selectFullList(searchVO);
		model.addAttribute("reportList", reportList);
		model.addAttribute("totalCount", totalCount);
		
		return "search/team";
	}
	
	@RequestMapping("/props.do")
	public String handler_searchProposal(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVo") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") ProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		/*CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId("PPS_TYP"); // 제안구분코드 조회
		List<EgovMap> typeList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PPS_CTY"); // 제안유형코드 조쇠
		List<EgovMap> categoryList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("RESULTTY"); // 제안연간효과코드 조쇠
		List<EgovMap> yearEffectList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PPS_CLS"); // 제안등급코드 조회
		List<EgovMap> classList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("WPLACE"); // 제안연간효과코드 조쇠
		List<EgovMap> bizPlaceList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PPS_PRG"); // 제안연간효과코드 조쇠
		List<EgovMap> progressList = codeService.selectFullList(codeVO);*/
		
		/*if(searchVO.getSearchPropFromDate() == null && searchVO.getSearchPropToDate() == null) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			searchVO.setSearchPropToDate(df.format(calendar.getTime()));
			calendar.add(Calendar.MONTH, -1);
			searchVO.setSearchPropFromDate(df.format(calendar.getTime()));
		}*/
		
		List<ProposalVO> resultItems = proposalService.selectProposalMasterInfo(searchVO);
		EgovMap resultItem = proposalService.selectListCount(searchVO);
		
		searchVO.setTotalRecordCount(Integer.parseInt(String.valueOf(resultItem.get("count"))));
		
//		model.addAttribute("TYPE_LIST", typeList);
//		model.addAttribute("CATEGORY_LIST", categoryList);		
//		model.addAttribute("CLASS_LIST", classList);
//		model.addAttribute("YEAR_EFFECT_LIST", yearEffectList);	
//		model.addAttribute("BIZ_PLACE_LIST", bizPlaceList);
//		model.addAttribute("PROGRESS_LIST", progressList);
		model.addAttribute("PROP_LIST", resultItems);
		model.addAttribute("PROP_TOTAL", resultItem.get("count"));
		return "search/props";
	}

	
	@RequestMapping("/board.do")
	public String handler_searchCommunity(HttpServletRequest request, ModelMap model,
			@ModelAttribute("articleVO") ArticleVO articleVO,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
			UserVO userSession)throws Exception {
		
		log.debug(searchVO.toString());
		
		//권한체크
		//boolean isMngr = articleService.isMngr(userSession, articleVO);
		
		//게시판설정
//		BoardVO pBoardVO = new BoardVO();
//		pBoardVO.setBoardKey(searchVO.getBoardKey());
//		BoardVO boardVO = boardService.select(pBoardVO);
//		model.addAttribute("boardVO", boardVO);
		
		//orderby 설정
		searchVO.setOrderByTyp("RECENTLY");
		

		//페이징 기본설정
		//searchVO.setRecordCountPerPage(boardVO.getPageRows());
		//searchVO.setPageSize(boardVO.getPageCols());
		
		//게시물목록
		List<ArticleVO> articleList = articleService.selectList(searchVO);
		model.addAttribute("articleList", articleList);
		//model.addAttribute("nowDt", new Date());

		//게시물수
		int articleCount = articleService.selectArticleListCount(searchVO);
		searchVO.setTotalRecordCount(articleCount);
		model.addAttribute("articleCount", articleCount);
		
//		List<ArticleVO> noticeList = articleService.selectFullList(articleVO);
//		model.addAttribute("noticeList", noticeList);

		
		//권한정보
//		model.addAttribute("isMngr", articleService.isMngr(userSession, articleVO));
//		model.addAttribute("isUseGrpForWrite", articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_WRITE));
//		model.addAttribute("isUseGrpForComment", articleService.isUseGrp(userSession, articleVO, BOARD_USE_TYP_COMMENT));

		
		return "search/board";
	}


	private String getEncodUrl(String url) throws UnsupportedEncodingException {
		String result = "";
		String[] tmp = url.split("&");

		String param = "";
		String value = "";
		for (int i = 0; i < tmp.length; i++) {
			if (StringUtils.startsWith(tmp[i], "searchClass")) {
				String[] target = String.valueOf(tmp[i]).split("=");
				param = target[0];
				if (target.length > 1) {
					value = target[1];
				}
				result += "&" + param + "=" + URLEncoder.encode(String.valueOf(value), "UTF-8");
			} else {
				if (i == 0) {
					result += tmp[i];
				} else {
					result += "&" + tmp[i];
				}
			}
		}

		return result;
	}
}
