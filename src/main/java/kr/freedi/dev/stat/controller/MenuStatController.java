package kr.freedi.dev.stat.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.stat.service.MenuStatService;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.FastDateFormat;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: MenuStatController.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class MenuStatController {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "menuStatService")
	private MenuStatService menuStatService;

	
	@RequestMapping("/csl/stat/menu.do")
	public String dateHandler(HttpServletRequest request, ModelMap model,
			@RequestParam(value="menuTyp") String statTyp,
			@RequestParam(value="statYm", defaultValue="0") Integer statYm) throws Exception {
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("menuTyp", statTyp);
		
		int cYm = this._getCurrentYm();
		int cYear = this._getCurrentYear();
		int cMonth = this._getCurrentMonth();
		
		//paramMap.put("nYm", nYm);
		paramMap.put("cYear", cYear);
		paramMap.put("cMonth", cMonth);
		paramMap.put("cYm", statYm.intValue() == 0 ? cYm : statYm);
		
		model.addAttribute("paramMap", paramMap);
		
		return "stat/csl/Menu";
	}
	
	
	@RequestMapping(value = "/csl/stat/getStatTopMenu.do")
	public @ResponseBody 
	String getStatTopMenu(HttpServletRequest request , @RequestParam Map<String, Object> reqMap)throws Exception {

		log.debug(reqMap.toString());
		String menuTyp = reqMap.get("menuTyp") == null ? "" : String.valueOf(reqMap.get("menuTyp"));
		String ym = reqMap.get("ym") == null ? "" : String.valueOf(reqMap.get("ym"));
		
		if(StringUtils.isNotEmpty(menuTyp)){
			if(StringUtils.isNotEmpty(ym)){
				return this._getJSON(8, menuStatService.getStatTopMenu(reqMap), "");
			}
		}
		return null;
	}
	
	
	@RequestMapping(value = "/csl/stat/getStatMenu.do")
	public @ResponseBody 
	String getStatMenu(HttpServletRequest request , @RequestParam Map<String, Object> reqMap)throws Exception {

		log.debug(reqMap.toString());
		String statTyp = reqMap.get("menuTyp") == null ? "" : String.valueOf(reqMap.get("menuTyp"));
		String ym = reqMap.get("ym") == null ? "" : String.valueOf(reqMap.get("ym"));
		String mnKey = reqMap.get("mnKey") == null ? "" : String.valueOf(reqMap.get("mnKey"));
		
		if(StringUtils.isNotEmpty(statTyp)){
			if(StringUtils.isNotEmpty(ym)){
				if(StringUtils.isNotEmpty(mnKey)){
					return this._getJSON(8, menuStatService.getStatMenu(reqMap), "");
				}
			}
		}
		return null;
	}
	
	
	@SuppressWarnings("unused")
	private String _getJSON(List<EgovMap> statList, String suffix) throws Exception {
		log.debug(statList);
		List<Object> dataList = new ArrayList<Object>();
		List<Object> labelList = new ArrayList<Object>();
		//List<Object> keyList = new ArrayList<Object>();
		
		String label = "";
		String key = "";
		for (EgovMap egovMap : statList) {
			key = String.valueOf(egovMap.get("menuKey"));
			label = "";
			label += String.valueOf(egovMap.get("statLabel"));
			label += "," + String.valueOf(egovMap.get("menuKey"));
			
			dataList.add(egovMap.get("statData"));
			labelList.add(label + suffix);
			//keyList.add(key);
		}
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("statSize", statList.size());
		jsonMap.put("statData", dataList);
		jsonMap.put("statLabel", labelList);
		//jsonMap.put("statKey", keyList);
		
		return new ObjectMapper().writeValueAsString(jsonMap);
	}
	
	private String _getJSON(Integer xSize, List<EgovMap> statList, String suffix) throws Exception {
		log.debug(statList);
		List<Object> dataList = new ArrayList<Object>();
		List<Object> labelList = new ArrayList<Object>();
		//List<Object> keyList = new ArrayList<Object>();
		
		String label = "";
		//String key = "";
		for (EgovMap egovMap : statList) {
			//key = String.valueOf(egovMap.get("menuKey"));
			label = "";
			label += String.valueOf(egovMap.get("statLabel"));
			label += "," + String.valueOf(egovMap.get("menuKey"));
			
			dataList.add(egovMap.get("statData"));
			labelList.add(label + suffix);
			//keyList.add(key);
		}
		
		if(xSize > 0){
			for(int i=statList.size(); i<xSize; i++){
				dataList.add("0");
				labelList.add("");
				//keyList.add("");
			}
		}
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("statSize", statList.size());
		jsonMap.put("statData", dataList);
		jsonMap.put("statLabel", labelList);
		//jsonMap.put("statKey", keyList);
		
		return new ObjectMapper().writeValueAsString(jsonMap);
	}
	
	
	private Integer _getCurrentYm(){
		Integer nYear = 0;
		Date d = new Date(System.currentTimeMillis());
		FastDateFormat fdf = FastDateFormat.getInstance("yyyyMM");
		nYear = Integer.parseInt(fdf.format(d));
		
		return nYear;
	}
	
	private Integer _getCurrentYear(){
		Integer nYear = 0;
		Date d = new Date(System.currentTimeMillis());
		FastDateFormat fdf = FastDateFormat.getInstance("yyyy");
		nYear = Integer.parseInt(fdf.format(d));
		
		return nYear;
	}
	
	private Integer _getCurrentMonth(){
		Integer nMonth = 0;
		Date d = new Date(System.currentTimeMillis());
		FastDateFormat fdf = FastDateFormat.getInstance("MM");
		nMonth = Integer.parseInt(fdf.format(d));
		
		return nMonth;
	}
	
	
	@RequestMapping(value = "/csl/setStatMenu.do")
	public @ResponseBody 
	String statmenu(HttpServletRequest request , @RequestParam Map<String, Object> reqMap)throws Exception {
		menuStatService.createNextMonthTable();
		
		return null;
	}
	
}
