package kr.freedi.dev.code.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.user.domain.UserVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: CodeController.java
 * @date	: 2017. 2. 13.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */

@Controller
public class CodeController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	
	/* code ************************************************************************************/
	@RequestMapping(value="/csl/code/checkCodeId.do", method=RequestMethod.POST)
	public @ResponseBody 
	String checkCodeId(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		log.debug(reqMap.toString());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId(String.valueOf(reqMap.get("codeGrpId")).toUpperCase());
		codeVO.setCodeId(String.valueOf(reqMap.get("codeId")).toUpperCase());
		
		codeVO = codeService.select(codeVO);
		
		if(codeVO != null){
			resultMap.put("isAvail", "false");
		}else{
			resultMap.put("isAvail", "true");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(resultMap);
		
		return json;
	}
	
	@RequestMapping(value="/csl/code/selectFullListByCodeGrpId.do", method=RequestMethod.POST)
	public @ResponseBody 
	String fullListByCodeGrpId(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		log.debug(reqMap.toString());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId(String.valueOf(reqMap.get("codeGrpId")));
		
		List<EgovMap> codeList = codeService.selectFullList(codeVO);
		
		if(codeList != null){
			for(EgovMap eMap : codeList){
				if(eMap.get("attr1") == null){eMap.put("attr1", "");}
				if(eMap.get("attr2") == null){eMap.put("attr2", "");}
				if(eMap.get("attr3") == null){eMap.put("attr3", "");}
			}
			
			resultMap.put("codeCnt", codeList.size());
			resultMap.put("codeList", codeList);
		}else{
			resultMap.put("codeCnt", 0);
			resultMap.put("codeList", null);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(resultMap);
		
		log.debug(json.toString());
		
		return json;
	}
	
	@RequestMapping(value="/csl/code/insert.do", method=RequestMethod.POST)
	public @ResponseBody 
	String insert(HttpServletRequest request,
			UserVO userSession,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		log.debug(reqMap.toString());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId(String.valueOf(reqMap.get("codeGrpId")));
		codeVO.setCodeId(String.valueOf(reqMap.get("codeId")));
		codeVO.setCodeNm(String.valueOf(reqMap.get("codeNm")));
		codeVO.setAttr1(String.valueOf(reqMap.get("attr1")));
		codeVO.setAttr2(String.valueOf(reqMap.get("attr2")));
		codeVO.setAttr3(String.valueOf(reqMap.get("attr3")));
		codeVO.setViewOrd(Integer.parseInt(String.valueOf(reqMap.get("viewOrd"))));
		codeVO.setActFlg(String.valueOf(reqMap.get("actFlg")));
		codeVO.setFrstOperId(userSession.getUserId());
		
		if(codeService.insert(codeVO) > 0){
			resultMap.put("isInsert", "true");
		}else{
			resultMap.put("isInsert", "false");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(resultMap);
		
		log.debug(json.toString());
		
		return json;
	}
	
	@RequestMapping(value="/csl/code/update.do", method=RequestMethod.POST)
	public @ResponseBody 
	String update(HttpServletRequest request,
			UserVO userSession,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		log.debug(reqMap.toString());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId(String.valueOf(reqMap.get("codeGrpId")));
		codeVO.setCodeId(String.valueOf(reqMap.get("codeId")));
		codeVO.setCodeNm(String.valueOf(reqMap.get("codeNm")));
		codeVO.setAttr1(String.valueOf(reqMap.get("attr1")));
		codeVO.setAttr2(String.valueOf(reqMap.get("attr2")));
		codeVO.setAttr3(String.valueOf(reqMap.get("attr3")));
		codeVO.setViewOrd(Integer.parseInt(String.valueOf(reqMap.get("viewOrd"))));
		codeVO.setActFlg(String.valueOf(reqMap.get("actFlg")));
		codeVO.setLastOperId(userSession.getUserId());
		
		if(codeService.update(codeVO) > 0){
			resultMap.put("isUpdate", "true");
		}else{
			resultMap.put("isUpdate", "false");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(resultMap);
		
		log.debug(json.toString());
		
		return json;
	}
	
	@RequestMapping(value="/csl/code/delete.do", method=RequestMethod.POST)
	public @ResponseBody 
	String delete(HttpServletRequest request,
			UserVO userSession,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		log.debug(reqMap.toString());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId(String.valueOf(reqMap.get("codeGrpId")));
		codeVO.setCodeId(String.valueOf(reqMap.get("codeId")));
		
		if(codeService.delete(codeVO) > 0){
			resultMap.put("isDelete", "true");
		}else{
			resultMap.put("isDelete", "false");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(resultMap);
		
		log.debug(json.toString());
		
		return json;
	}
}


