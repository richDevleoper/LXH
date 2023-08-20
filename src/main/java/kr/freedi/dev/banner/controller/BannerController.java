package kr.freedi.dev.banner.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.banner.domain.BannerSearchVO;
import kr.freedi.dev.banner.domain.BannerVO;
import kr.freedi.dev.banner.service.IBannerService;
import kr.freedi.dev.user.domain.UserVO;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.FastDateFormat;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * @project : dev_default
 * @file 	: BannerController.java
 * @date	: 2017. 2. 10.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class BannerController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "bannerService")
	private IBannerService bannerService;
	
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}
	
	private String getPath(HttpServletRequest request, String fileName) {
		if(StringUtils.startsWith(request.getRequestURI(), "/csl")){
			return "banner/csl/" + fileName;
		}else{
			return "banner/def/" + fileName;
		}
	}
	
	@RequestMapping({"/csl/banner/list.do","/banner/list.do"})
	public String list(HttpServletRequest request, ModelMap model,
			@ModelAttribute("bannerSearchVO") BannerSearchVO searchVO) throws Exception {
		
		if(!StringUtils.startsWithAny(request.getRequestURI(), new String[]{"/csl"})){
			searchVO.setSearchPbsh("Y");
		}
		
		List<EgovMap> bannerList = bannerService.selectList(searchVO);
		searchVO.setTotalRecordCount(bannerService.selectListCount(searchVO));
		
		model.addAttribute("bannerList", bannerList);

		return this.getPath(request, "List");
	}

	@RequestMapping("/csl/banner/insertForm.do")
	public String insertForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("bannerSearchVO") BannerSearchVO searchVO) throws Exception {
		
		BannerVO banerVO = new BannerVO();
		banerVO.setActFlg("Y"); // 활성여부=활성
		banerVO.setPeriodFlg("N"); // 기간제한=없음
		banerVO.setTargetTyp("NEW"); // 타겟=새창
		
		model.addAttribute("bannerVO", banerVO);
		model.addAttribute("action", "insert.do");

		return this.getPath(request, "Form");
	}

	@RequestMapping("/csl/banner/insert.do")
	public String insert(MultipartHttpServletRequest mrequest, HttpServletRequest request,
			@ModelAttribute("bannerVO") BannerVO bannerVO,
			@ModelAttribute("bannerSearchVO") BannerSearchVO searchVO,
			UserVO userSession) throws Exception {

		bannerVO.setFrstOperId(userSession.getUserId()); //등록자 아이디
		
		bannerService.insert(bannerVO, mrequest, "file");
		
		return "redirect:list.do?" + searchVO.getParam();
	}

	@RequestMapping("/csl/banner/updateForm.do")
	public String updateForm(HttpServletRequest request, ModelMap model,			
			@ModelAttribute("bannerVO") BannerVO banerVO,
			@ModelAttribute("bannerSearchVO") BannerSearchVO searchVO) throws Exception {

		model.addAttribute("bannerVO", bannerService.select(banerVO));
		model.addAttribute("action", "update.do");
		
		return this.getPath(request, "Form");
	}

	@RequestMapping("/csl/banner/update.do")
	public String update(MultipartHttpServletRequest mrequest, HttpServletRequest request,
			@ModelAttribute("bannerVO") BannerVO bannerVO,
			@ModelAttribute("bannerSearchVO") BannerSearchVO searchVO, 
			UserVO userSession) throws Exception {

		bannerVO.setLastOperId(userSession.getUserId());
		bannerService.update(bannerVO, mrequest, "file");
		
		return "redirect:updateForm.do?bannerKey=" + bannerVO.getBannerKey() + "&" + searchVO.getParam();
	}

	@RequestMapping("/csl/banner/delete.do")
	public String delete(HttpServletRequest request,
			@ModelAttribute("bannerVO") BannerVO bannerVO,
			@ModelAttribute("bannerSearchVO") BannerSearchVO searchVO) throws Exception {

		bannerService.delete(bannerVO);
		
		return "redirect:list.do?" + searchVO.getParam();
	}
	
	@RequestMapping(value="/csl/banner/deleteFile.do", method=RequestMethod.POST)
	public @ResponseBody 
	String deleteFile(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap)throws Exception {
		
		log.debug(reqMap.toString());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		BannerVO bannerVO = new BannerVO();
		bannerVO.setBannerKey(Integer.parseInt(String.valueOf(reqMap.get("bannerKey"))));
		
		if(bannerService.deleteFile(bannerVO) > 0){
			resultMap.put("isDelete", "true");
		}else{
			resultMap.put("isDelete", "false");		
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(resultMap);
		return json;
	}
	
	@RequestMapping({"/csl/banner/excel.do"})
	public String excel(HttpServletRequest request, 
			ModelMap model, 
			@ModelAttribute("bannerSearchVO") BannerSearchVO searchVO) throws Exception {

		FastDateFormat fdf = FastDateFormat.getInstance("yyyyMMdd");
		String today = fdf.format(Calendar.getInstance());
		
		searchVO.setCurrentPageNo(1);
		searchVO.setPageSize(bannerService.selectListCount(searchVO));
		
		List<EgovMap> bannerList = bannerService.selectList(searchVO);
		
		request.setAttribute("itemList", bannerList);
		request.setAttribute("title", "banner_" + today);
		request.setAttribute("templateName", "banner.xls");
		request.setAttribute("downloadName", "banner_" + today + ".xls");
		return "jxlsExcelView";
	}
}
