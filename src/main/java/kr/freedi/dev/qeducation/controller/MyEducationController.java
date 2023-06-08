package kr.freedi.dev.qeducation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.qeducation.domain.EducationSearchVO;
import kr.freedi.dev.qeducation.domain.EducationVO;
import kr.freedi.dev.qeducation.domain.MyEducationVO;
import kr.freedi.dev.qeducation.domain.StudentVO;
import kr.freedi.dev.qeducation.excel.ExcelFunction;
import kr.freedi.dev.qeducation.service.EducationService;
import kr.freedi.dev.qeducation.service.StudentService;
import kr.freedi.dev.user.domain.UserVO;

@Controller
@RequestMapping({"/education"})
public class MyEducationController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "educationService")
	private EducationService educationService;
	
	@Resource(name = "studentService")
	private StudentService studentService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@RequestMapping({"/mystatus.do"})
	public String MyStatus(HttpServletRequest request, ModelMap model,
		@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		@ModelAttribute("EducationVO") EducationVO educationVO, 
		@ModelAttribute("StudentVO") StudentVO studentVO,
		UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		CodeVO codeVO = new CodeVO(); 
		String[] arrCodeGrpIds = {"ED_TY2"};
		codeVO.setCodeGrpIdList(arrCodeGrpIds);
		codeVO.setActFlg("Y"); 
		List<EgovMap> allCodes = codeService.selectFullList(codeVO);		//item.codeGrpId, codeId, codeNm
		model.addAttribute("allCodes", allCodes);
		
		
		String myUserId = userSession.getUserId();
		//studentVO.setStdUserId("limjinah");
		studentVO.setStdUserId(myUserId);
		Map<String, Object> selectMyStatistics = educationService.selectMyStatistics(studentVO);
		model.addAttribute("selectMyStatistics", selectMyStatistics);
		
		return "app/education/MyStatusList";
	}
	
	@RequestMapping({"/searchmyedu.do"})
	public @ResponseBody String searchMyEdu(HttpServletRequest request,
		   @ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		   @ModelAttribute("EducationVO") EducationVO educationVO, 
		   @ModelAttribute("MyEducationVO") MyEducationVO myEducationVO, 
		   @RequestParam Map<String, Object> params,
		   UserVO userSession)throws Exception {
		
		String eduBeltCode = (String)params.get("eduBeltCode");
		System.out.println("eduBeltCode : " + eduBeltCode);
		
		String leaderBeltCode = (String)params.get("leaderBeltCode");
		System.out.println("leaderBeltCode : " + leaderBeltCode);
		
		/* 1. 교육활동 */
		educationVO.setEduBeltCode(eduBeltCode); // 벨트코드
		String myUserId = userSession.getUserId();
		educationVO.setEduRegUser(myUserId);
		//educationVO.setStdUserId("limjinah");
		
		List<EducationVO> selectMyBeltEduList = educationService.selectMyBeltEduist(educationVO);
		educationVO.setMyList(selectMyBeltEduList);
		
		/* 2. 과제활동 현황 */
		myEducationVO.setLeaderBeltCode(leaderBeltCode);
		//myEducationVO.setRepUserId("budwns");
		myEducationVO.setRepUserId(myUserId);
		
		List<MyEducationVO> selectMyReportList = educationService.selectMyReportList(myEducationVO);
		educationVO.setReportList(selectMyReportList);
		
		return new ObjectMapper().writeValueAsString(educationVO);
	}
	
	@RequestMapping({"/excelmnglist.do"})
	public @ResponseBody void excelMngList(HttpServletRequest request, HttpServletResponse response, 
		   @ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		   @ModelAttribute("EducationVO") EducationVO educationVO, 
		   @ModelAttribute("StudentVO") StudentVO studentVO,
		   UserVO userSession){
		
		String tabId = searchVO.getTabId();
		System.out.println("tabId : " + tabId);
		
		if("".equals(tabId) ||"null".equals(tabId) || tabId == null ) {
			searchVO.setSearchbeltCode("01");
		}else {
			searchVO.setSearchbeltCode(tabId);
		}
		
		try {
			String[] colIdArr = null;
			String[] colNameArr = null;
			
			if("04".equals(tabId)) {
				colIdArr = new String[]{"IDX", "STD_NAME", "STD_USERID", "MNG_TIT", "STD_DEPART_NM", "STD_JOBX_NM", "STD_POS_NM", "STD_CERT_DATE", "STD_CERT_NM", "STD_TEST_DATE", "STD_TEST_NM"};
				colNameArr = new String[]{"NO", "성명", "사번", "1차 교육 / 2차 통계 / 3차 과제Test", "조직", "직위", "직책", "인증일", "인증여부", "자질평가일", "합격여부"};
			}else {
				colIdArr = new String[]{"IDX", "STD_NAME", "STD_USERID", "MNG_TIT", "STD_DEPART_NM", "STD_JOBX_NM", "STD_POS_NM", "STD_CERT_DATE", "STD_CERT_NM"};
				colNameArr = new String[]{"NO", "성명", "사번", "1차 교육 / 2차 통계 / 3차 과제Test", "조직", "직위", "직책", "인증일", "인증여부"};
			}
			
			String fileName = "교육과정_" + getCurrentDate() + getCurrentTime() + ".xlsx";
			List<HashMap<String,Object>> selectMngListExcel = educationService.selectMngListExcel(searchVO);
			
			ExcelFunction.excelWriter(request, response, selectMngListExcel, fileName, colIdArr, colNameArr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * <pre>
	 * 현재 날짜 얻어오기.
	 * 형식: YYYYMMDD
	 * </pre>
	 * @return 8자리 날짜표기 문자열
	 */
	public static String getCurrentDate() {

		// 캘린더 인스턴스 얻어오기
		java.util.Calendar currentdate = java.util.Calendar.getInstance();

		int currentYear  = currentdate.get(java.util.Calendar.YEAR);         // 년
		int currentMonth = currentdate.get(java.util.Calendar.MONTH) + 1;    // 월
		int currentDay   = currentdate.get(java.util.Calendar.DAY_OF_MONTH); // 일

		String getYear   = Integer.toString(currentYear).substring(0,4);
		String getMonth  = currentMonth < 10 ? "0" + Integer.toString(currentMonth) : Integer.toString(currentMonth);
		String getDay    = currentDay   < 10 ? "0" + Integer.toString(currentDay)   : Integer.toString(currentDay);

		return getYear+getMonth+getDay;

	}
	
	/**
	 * <pre>
	 * 현재 시간 얻어오기.
	 * 형식: HHMMSS
	 * </pre>
	 * @return 6자리 시간표기 문자열
	 */
	public static String getCurrentTime() {

		// 캘린더 인스턴스 얻어오기
		java.util.Calendar currentdate = java.util.Calendar.getInstance();

		int currentHour  = currentdate.get(java.util.Calendar.HOUR_OF_DAY);  // 시간
		int currentMinute= currentdate.get(java.util.Calendar.MINUTE);       // 분
		int currentSecond= currentdate.get(java.util.Calendar.SECOND);       // 초

		String getHour   = currentHour  < 10 ? "0" + Integer.toString(currentHour)  : Integer.toString(currentHour);
		String getMinute = currentMinute< 10 ? "0" + Integer.toString(currentMinute): Integer.toString(currentMinute);
		String getSecond = currentSecond< 10 ? "0" + Integer.toString(currentSecond): Integer.toString(currentSecond);

		return getHour+getMinute+getSecond;

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
