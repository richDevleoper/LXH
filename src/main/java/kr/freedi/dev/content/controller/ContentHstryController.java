package kr.freedi.dev.content.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.freedi.dev.content.domain.ContentHstryVO;
import kr.freedi.dev.content.service.ContentHstryService;

/**
 * @project : dev_default
 * @file 	: ContentHstryController.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class ContentHstryController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "contentHstryService")
	private ContentHstryService contentHstryService;
	
	@RequestMapping(value="/csl/contenthstry/selectFullList.do", method=RequestMethod.POST)
	public @ResponseBody 
	String selectFullList(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		log.debug(reqMap.toString());
		Integer contentKey = reqMap.get("contentKey") == null ? 0 : Integer.parseInt(String.valueOf(reqMap.get("contentKey")));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		ContentHstryVO contentHstryVO = new ContentHstryVO();
		contentHstryVO.setContentKey(contentKey);
		
		List<ContentHstryVO> contentHstryList = contentHstryService.selectFullList(contentHstryVO);
		resultMap.put("contentHstryList", contentHstryList);
		
		return new ObjectMapper().writeValueAsString(resultMap);
	}
	
	@RequestMapping(value="/csl/contenthstry/select.do", method=RequestMethod.POST)
	public @ResponseBody 
	String select(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		log.debug(reqMap.toString());
		Integer contentHstryKey = reqMap.get("contentHstryKey") == null ? 0 : Integer.parseInt(String.valueOf(reqMap.get("contentHstryKey")));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		ContentHstryVO contentHstryVO = new ContentHstryVO();
		contentHstryVO.setContentHstryKey(contentHstryKey);
		
		ContentHstryVO rtnVO = contentHstryService.select(contentHstryVO);
		resultMap.put("contentHstry", rtnVO);
		
		return new ObjectMapper().writeValueAsString(resultMap);
	}
}
