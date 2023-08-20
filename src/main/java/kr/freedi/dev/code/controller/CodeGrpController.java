package kr.freedi.dev.code.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.code.domain.CodeGrpSearchVO;
import kr.freedi.dev.code.domain.CodeGrpVO;
import kr.freedi.dev.code.service.CodeGrpService;
import kr.freedi.dev.user.domain.UserVO;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * @project : dev_default
 * @file 	: CodeGrpController.java
 * @date	: 2017. 2. 13.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class CodeGrpController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "codeGrpService")
	private CodeGrpService codeGrpService;
	
	
	private String getPath(HttpServletRequest request, String fileName) {
		if(StringUtils.startsWith(request.getRequestURI(), "/csl")){
			return "code/csl/" + fileName;
		}else{
			return "code/def/" + fileName;
		}
	}
	
	@RequestMapping("/csl/codegrp/list.do")
	public String list(HttpServletRequest request, ModelMap model,
			@ModelAttribute("codeGrpSearchVO") CodeGrpSearchVO searchVO) throws Exception {
		
		List<EgovMap> codeGrpList = codeGrpService.selectList(searchVO);
		
		model.addAttribute("codeGrpList", codeGrpList);
		searchVO.setTotalRecordCount(codeGrpService.selectListCount(searchVO));
		
		return this.getPath(request, "List");
	}
	
	@RequestMapping("/csl/codegrp/insertForm.do")
	public String insertForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("codeGrpSearchVO") CodeGrpSearchVO searchVO) throws Exception {
		
		CodeGrpVO codeGrpVO = new CodeGrpVO();
		codeGrpVO.setActFlg("Y"); //활성여부=활성
		
		model.addAttribute("codeGrpVO", codeGrpVO);
		model.addAttribute("action", "insert.do");
		
		return this.getPath(request, "Form");
	}

	@RequestMapping("/csl/codegrp/insert.do")
	public String insert(HttpServletRequest request,
			UserVO userSession,
			@ModelAttribute("codeGrpVO") CodeGrpVO codeGrpVO,
			@ModelAttribute("codeGrpSearchVO") CodeGrpSearchVO searchVO) throws Exception {

		codeGrpVO.setFrstOperId(userSession.getUserId());
		codeGrpService.insert(codeGrpVO);
		
		//return "redirect:list.do?" + searchVO.getParam();
		return "redirect:updateForm.do?codeGrpId=" + codeGrpVO.getCodeGrpId() + "&" + searchVO.getParam();
	}

	@RequestMapping("/csl/codegrp/updateForm.do")
	public String updateForm(HttpServletRequest request, ModelMap model,			
			@ModelAttribute("codeGrpSearchVO") CodeGrpSearchVO searchVO,
			@ModelAttribute("codeGrpVO") CodeGrpVO codeGrpVO) throws Exception {

		CodeGrpVO vo = codeGrpService.select(codeGrpVO);
		
		model.addAttribute("codeGrpVO", vo);
		model.addAttribute("action", "update.do");
		
		//CodeVO codeVO = new CodeVO();
		//codeVO.setCodeGrpId(codeGrpId);
		//model.addAttribute("codeList", codeService.selectFullList(codeVO));
		
		return this.getPath(request, "Form");
	}

	@RequestMapping("/csl/codegrp/update.do")
	public String update(HttpServletRequest request,
			UserVO userSession,
			@ModelAttribute("codeGrpVO") CodeGrpVO codeGrpVO,
			@ModelAttribute("codeGrpSearchVO") CodeGrpSearchVO searchVO) throws Exception {

		codeGrpVO.setLastOperId(userSession.getUserId());
		codeGrpService.update(codeGrpVO);
		
		return "redirect:updateForm.do?codeGrpId=" + codeGrpVO.getCodeGrpId() + "&" + searchVO.getParam();
	}

	@RequestMapping("/csl/codegrp/delete.do")
	public String delete(HttpServletRequest request,
			@ModelAttribute("codeGrpSearchVO") CodeGrpSearchVO searchVO,
			@ModelAttribute("codeGrpVO") CodeGrpVO codeGrpVO) throws Exception {

		codeGrpService.delete(codeGrpVO);
		
		return "redirect:list.do?" + searchVO.getParam();
	}
	
	@RequestMapping(value="/csl/codegrp/checkCodeGrpId.do", method=RequestMethod.POST)
	public @ResponseBody 
	String checkCodeGrpId(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		log.debug(reqMap.toString());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		CodeGrpVO codeGrpVO = new CodeGrpVO();
		codeGrpVO.setCodeGrpId(String.valueOf(reqMap.get("codeGrpId")).toUpperCase());
		
		codeGrpVO = codeGrpService.select(codeGrpVO);
		
		if(codeGrpVO != null){
			resultMap.put("isAvail", "false");
		}else{
			resultMap.put("isAvail", "true");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(resultMap);
		
		return json;
	}
	
}
