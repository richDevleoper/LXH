package kr.freedi.dev.stat.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import kr.freedi.dev.stat.service.StatService;

/**
 * @project : dev_default
 * @file 	: StatController.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class StatController {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "statService")
	private StatService statService;
	
	
	@RequestMapping("/csl/stat/siteVisit.do")
	public String defSite(HttpServletRequest request, ModelMap model,
			@RequestParam(value="statTyp") String statTyp,
			@RequestParam(value="statYear", defaultValue="0") Integer statYear) throws Exception {
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("statTyp", statTyp);
		
		int nYear = this._getCurrentYear();
		paramMap.put("nYear", nYear);
		paramMap.put("statYear", statYear.intValue() == 0 ? nYear : statYear);
		
		model.addAttribute("paramMap", paramMap);
		
		return "stat/csl/SiteVisit";
	}
	
	@RequestMapping("/csl/stat/siteLang.do")
	public String defSiteLang(HttpServletRequest request, ModelMap model,
			@RequestParam(value="statTyp") String statTyp,
			@RequestParam(value="statYear", defaultValue="0") Integer statYear) throws Exception {
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("statTyp", statTyp);
		
		int nYear = this._getCurrentYear();
		paramMap.put("nYear", nYear);
		paramMap.put("statYear", statYear.intValue() == 0 ? nYear : statYear);
		
		model.addAttribute("paramMap", paramMap);
		
		return "stat/csl/SiteLang";
	}
	
	@RequestMapping("/csl/stat/siteCntry.do")
	public String defSiteCntry(HttpServletRequest request, ModelMap model,
			@RequestParam(value="statTyp") String statTyp,
			@RequestParam(value="statYear", defaultValue="0") Integer statYear) throws Exception {
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("statTyp", statTyp);
		
		int nYear = this._getCurrentYear();
		paramMap.put("nYear", nYear);
		paramMap.put("statYear", statYear.intValue() == 0 ? nYear : statYear);
		
		model.addAttribute("paramMap", paramMap);
		
		return "stat/csl/SiteCntry";
	}
	
	@RequestMapping(value = "/csl/stat/selectCount.do")
	public @ResponseBody 
	String selectCount(HttpServletRequest request, @RequestParam Map<String, Object> reqMap)throws Exception {
		log.debug(reqMap.toString());
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		String statTyp = reqMap.get("statTyp") == null ? "" : String.valueOf(reqMap.get("statTyp"));
		String year = reqMap.get("year") == null ? "" : String.valueOf(reqMap.get("year"));
		//String month = reqMap.get("month") == null ? "" : String.valueOf(reqMap.get("month"));
		//String date = reqMap.get("date") == null ? "" : String.valueOf(reqMap.get("date"));
		
		if(StringUtils.isNotEmpty(statTyp)){
			if(StringUtils.isEmpty(year)){
				jsonMap.put("cnt", statService.selectCountAll(reqMap));
			}else{
				jsonMap.put("cnt", statService.selectCountByTable(reqMap));
			}
		}else{
			jsonMap.put("cnt", 0);
		}
		
		//return JSONObject.fromObject(jsonMap).toString();
		return new ObjectMapper().writeValueAsString(jsonMap);
	}
	
	@RequestMapping(value = "/csl/stat/getStatAll.do")
	public @ResponseBody 
	String getStatAll(HttpServletRequest request , @RequestParam Map<String, Object> reqMap)throws Exception {

		log.debug(reqMap.toString());
		return this.getJSON(2, statService.getStatAll(reqMap), "");
	}
	
	@RequestMapping(value = "/csl/stat/getStatLang.do")
	public @ResponseBody 
	String getStatLang(HttpServletRequest request , @RequestParam Map<String, Object> reqMap)throws Exception {

		log.debug(reqMap.toString());
		return this.getJSON(24, statService.getStatLang(reqMap), "");
	}
	
	@RequestMapping(value = "/csl/stat/getStatCntry.do")
	public @ResponseBody 
	String getStatCntry(HttpServletRequest request , @RequestParam Map<String, Object> reqMap)throws Exception {

		log.debug(reqMap.toString());
		return this.getJSON(24, statService.getStatCntry(reqMap), "");
	}
	
	@RequestMapping(value = "/csl/stat/getStat.do")
	public @ResponseBody 
	String getStat(HttpServletRequest request , @RequestParam Map<String, Object> reqMap)throws Exception {

		log.debug(reqMap.toString());
		String statTyp = reqMap.get("statTyp") == null ? "" : String.valueOf(reqMap.get("statTyp"));
		String year = reqMap.get("year") == null ? "" : String.valueOf(reqMap.get("year"));
		String month = reqMap.get("month") == null ? "" : String.valueOf(reqMap.get("month"));
		String date = reqMap.get("date") == null ? "" : String.valueOf(reqMap.get("date"));
		String hour = reqMap.get("hour") == null ? "" : String.valueOf(reqMap.get("hour"));
		
		//String statLang = reqMap.get("statLang") == null ? "" : String.valueOf(reqMap.get("statLang"));
		//String statCntry = reqMap.get("statCntry") == null ? "" : String.valueOf(reqMap.get("statCntry"));
		
		if(StringUtils.isNotEmpty(statTyp)){
			if(StringUtils.isNotEmpty(year)){
				if(StringUtils.isNotEmpty(month)){
					if(StringUtils.isNotEmpty(date)){
						if(StringUtils.isNotEmpty(hour)){
							return this.getJSON(statService.getStatMinute(reqMap), "분");
						}else{
							return this.getJSON(statService.getStatHour(reqMap), "시");
						}
					}else{
						return this.getJSON(statService.getStatDate(reqMap), "일");
					}
				}else{
					return this.getJSON(statService.getStatMonth(reqMap), "월");
				}
			}else{
				return this.getJSON(6, statService.getStatYear(reqMap), "년");
			}
		}
		
		return null;
	}
	
	private String getJSON(List<EgovMap> statList, String suffix) throws Exception {
		log.debug(statList.toString());
		List<Object> dataList = new ArrayList<Object>();
		List<Object> labelList = new ArrayList<Object>();
		
		String label = "";
		for (EgovMap egovMap : statList) {
			label = String.valueOf(egovMap.get("statLabel"));
			
			dataList.add(egovMap.get("statData"));
			labelList.add(label + suffix);
		}
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("statSize", statList.size());
		jsonMap.put("statData", dataList);
		jsonMap.put("statLabel", labelList);
		
		return new ObjectMapper().writeValueAsString(jsonMap);
	}
	
	private String getJSON(Integer xSize, List<EgovMap> statList, String suffix) throws Exception {
		log.debug(statList.toString());
		List<Object> dataList = new ArrayList<Object>();
		List<Object> labelList = new ArrayList<Object>();
		
		String label = "";
		for (EgovMap egovMap : statList) {
			dataList.add(egovMap.get("statData"));
			label = String.valueOf(egovMap.get("statLabel"));
			labelList.add(label + suffix);
		}
		
		if(xSize > 0){
			for(int i=statList.size(); i<xSize; i++){
				dataList.add("0");
				labelList.add("");
			}
		}
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("statSize", statList.size());
		jsonMap.put("statData", dataList);
		jsonMap.put("statLabel", labelList);
		
		return new ObjectMapper().writeValueAsString(jsonMap);
	}
	
	private Integer _getCurrentYear(){
		Integer nYear = 0;
		Date d = new Date(System.currentTimeMillis());
		FastDateFormat fdf = FastDateFormat.getInstance("yyyy");
		nYear = Integer.parseInt(fdf.format(d));
		
		return nYear;
	}
	
	
	@SuppressWarnings("unused")
	private Integer _getCurrentMonth(){
		Integer nMonth = 0;
		Date d = new Date(System.currentTimeMillis());
		FastDateFormat fdf = FastDateFormat.getInstance("MM");
		nMonth = Integer.parseInt(fdf.format(d));
		
		return nMonth;
	}
	
	@RequestMapping(value = "/csl/setStat.do")
	public @ResponseBody 
	String setStat(HttpServletRequest request , @RequestParam Map<String, Object> reqMap)throws Exception {

		statService.createNextYearTable();
		return null;
	}
}
