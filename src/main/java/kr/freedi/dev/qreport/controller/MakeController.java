package kr.freedi.dev.qreport.controller;

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

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.qreport.domain.MakeSearchVO;
import kr.freedi.dev.qreport.domain.MakeVO;
import kr.freedi.dev.qreport.service.MakeService;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.qpopup.domain.UserVO;

@Controller
@RequestMapping({"/team"})
public class MakeController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "makeService")
	private MakeService makeService;
	
	@Resource(name = "proposalIdGnrService")
	private EgovIdGnrService idGnrService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@RequestMapping({"/makelist.do"})
	public String makelist(HttpServletRequest request, ModelMap model,
		@ModelAttribute("MakeSearchVO") MakeSearchVO searchVO, 
		@ModelAttribute("MakeVO") MakeVO makeVO, 
		UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		
		CodeVO codeVO = new CodeVO(); 
		String[] arrCodeGrpIds = {"6SIG_YN", "RP_TY1", "RP_TY2", "RP_TY3", "SECTOR", "ACTTYPE", "LDRBELT", "MBBUSERT", "RESULTTY", "REP_ROLE", "WPLACE", "REP_STAT"};
		codeVO.setCodeGrpIdList(arrCodeGrpIds);
		codeVO.setActFlg("Y"); 
		List<EgovMap> allCodes = codeService.selectFullList(codeVO);		//item.codeGrpId, codeId, codeNm

		model.addAttribute("allCodes", allCodes);
		
		int countList = makeService.selectListCount(searchVO);
		//페이징 기본설정8
		searchVO.setTotalRecordCount(countList);
		
		List<MakeVO> selectCirclList = makeService.selectFullList(searchVO);
		model.addAttribute("selectCirclList", selectCirclList);
		model.addAttribute("totalCount", countList);
		
		return "app/make/MakeList";
		
	}
	
	@RequestMapping({"/makeinsert.do"})
	public String makeinsert(HttpServletRequest request, ModelMap model,
		@ModelAttribute("MakeSearchVO") MakeSearchVO searchVO, 
		@ModelAttribute("MakeVO") MakeVO makeVO, 
		UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		
		// 페이지 바인딩
		model.addAttribute("action", "/team/insertMakeInfo.do");
		
		return "app/make/MakeInsert";
		
	}
	
	@RequestMapping({"/insertMakeInfo.do"})
	public String insertMakeInfo(HttpServletRequest request, ModelMap model,
		@ModelAttribute("MakeSearchVO") MakeSearchVO searchVO, 
		@ModelAttribute("MakeVO") MakeVO makeVO, 
		UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		
		makeVO.setCirRegUser(userSession.getUserId());
		makeService.insert(makeVO);
		
		//return "app/make/MakeList";
		return "redirect:/sub.do?menuKey=70";
		
	}		
	
	@RequestMapping({"/searchstaves.do"})
	public String searchstaves(HttpServletRequest request, ModelMap model,
		@ModelAttribute("MakeSearchVO") MakeSearchVO searchVO, 
		@ModelAttribute("MakeVO") MakeVO makeVO, 
		UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		
		return "app/make/MakeInsert";
		
	}
	
	@RequestMapping({"/searchemp.do"})
	public @ResponseBody String searchemp(HttpServletRequest request,
		   @ModelAttribute("userVO") UserVO userVo,
		   @RequestParam Map<String, Object> params)throws Exception {
		
		String comDepartCode   = (String)params.get("comDepartCode");
		System.out.println("comDepartCode : " + comDepartCode);
		
		userVo.setComDepartCode(comDepartCode);
		
		return new ObjectMapper().writeValueAsString(makeService.selectEmpSearch(userVo));
	}
		

		
}
