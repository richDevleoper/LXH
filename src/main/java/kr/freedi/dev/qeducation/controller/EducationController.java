package kr.freedi.dev.qeducation.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.qeducation.domain.EducationSearchVO;
import kr.freedi.dev.qeducation.domain.EducationVO;
import kr.freedi.dev.qeducation.domain.StudentVO;
import kr.freedi.dev.qeducation.excel.ExcelFunction;
import kr.freedi.dev.qeducation.service.EducationService;
import kr.freedi.dev.qeducation.service.StudentService;
import kr.freedi.dev.user.domain.UserVO;

@Controller
@RequestMapping({"/education"})
public class EducationController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "educationService")
	private EducationService educationService;
	
	@Resource(name = "studentService")
	private StudentService studentService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "proposalIdGnrService")
	private EgovIdGnrService idGnrService;
	
	// 교육계획(조회화면) 
	@RequestMapping({"/buildup.do"})
	public String BuildUp(HttpServletRequest request, ModelMap model,
		@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		@ModelAttribute("EducationVO") EducationVO educationVO, 
		UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		
		if(searchVO.getSearchEduFromDt() == null && searchVO.getSearchEduToDt() == null) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			searchVO.setSearchEduToDt(df.format(calendar.getTime()));
			calendar.add(Calendar.MONTH, -1);
			searchVO.setSearchEduFromDt(df.format(calendar.getTime()));
		}
		
		CodeVO codeVO = new CodeVO(); 
		String[] arrCodeGrpIds = {"ED_TY1", "ED_TY2", "ED_TY3"};
		
		codeVO.setCodeGrpIdList(arrCodeGrpIds);
		codeVO.setActFlg("Y"); 
		List<EgovMap> allCodes = codeService.selectFullList(codeVO);		//item.codeGrpId, codeId, codeNm

		model.addAttribute("allCodes", allCodes);
		
		int countList = educationService.selectListCount(searchVO);
		System.out.println("countList : " + countList);
		searchVO.setTotalRecordCount(countList);
		
		List<EducationVO> selectEducationList = educationService.selectEducationList(searchVO);
		model.addAttribute("selectEducationList", selectEducationList);
		model.addAttribute("totalCount", countList);
		
		return "app/education/BuildUpList";
	}
	
	// 교육계획(등록화면) 
	@RequestMapping({"/buildupinsert.do"})
	public String Buildupinsert(HttpServletRequest req, ModelMap model,
		@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		@ModelAttribute("EducationVO") EducationVO educationVO, 
		UserVO userSession)throws Exception {
		
		// 페이지 바인딩
		EducationVO eduVo = educationService.proc_educationFormHandler(req, model, searchVO, educationVO, userSession);
		
		return "app/education/BuildUpInsert";
	}
			
	@RequestMapping({"/pfmsubmit.do"})
	public String PfmSubmit(HttpServletRequest request, ModelMap model,
		@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		@ModelAttribute("EducationVO") EducationVO educationVO, 
		UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		
		if(searchVO.getSearchEduFromDt() == null && searchVO.getSearchEduToDt() == null) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			searchVO.setSearchEduToDt(df.format(calendar.getTime()));
			calendar.add(Calendar.MONTH, -1);
			searchVO.setSearchEduFromDt(df.format(calendar.getTime()));
		}
		
		CodeVO codeVO = new CodeVO(); 
		String[] arrCodeGrpIds = {"ED_TY1", "ED_TY2", "ED_TY3"};
		codeVO.setCodeGrpIdList(arrCodeGrpIds);
		codeVO.setActFlg("Y"); 
		List<EgovMap> allCodes = codeService.selectFullList(codeVO);		//item.codeGrpId, codeId, codeNm
		model.addAttribute("allCodes", allCodes);
		
		int countList = educationService.selectListCount(searchVO);
		searchVO.setTotalRecordCount(countList);
		List<EducationVO> selectEducationList = educationService.selectEducationList(searchVO);
		model.addAttribute("selectEducationList", selectEducationList);
		model.addAttribute("totalCount", countList);
		
		return "app/education/PfmSubmitList";
	}
	
	// 교육/TEST/인증 > 실적입력 > 상세화면
	@RequestMapping({"/pfmsubmitdetail.do"})
	public String pfmsubmitDetail(HttpServletRequest request, 
		ModelMap model,
		@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		@ModelAttribute("EducationVO") EducationVO educationVO, 
		@ModelAttribute("StudentVO") StudentVO studentVO,
		UserVO userSession)throws Exception {
		
		// 메뉴 & 세션 세팅
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		
		// 과정 코드 세팅
		String eduCode = educationVO.getEduCode();
		educationVO.setEduCode(eduCode);
		
		//조회
		if(eduCode != null) {
			EducationVO resVo = educationService.selectEducationMstInfo(educationVO);
			model.addAttribute("educationVO", resVo);
			
			studentVO.setEduCode(eduCode);
			int countList = studentService.selectstdCount(studentVO);
			List<StudentVO> selectStudentList = studentService.selectStudentList(studentVO);
			model.addAttribute("selectStudentList", selectStudentList);
			model.addAttribute("totalCount", countList);
		}
		model.addAttribute("studentVO", studentVO);
		
		return "app/education/pfmsubmitDetail";
	}
	
	@RequestMapping({"/insertEduInfo.do"})
	public String insertEduInfo(HttpServletRequest request, ModelMap model,
		@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		@ModelAttribute("EducationVO") EducationVO educationVO, 
		UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		educationVO.setEduRegUser(userSession.getUserId());
		educationService.insertEduInfo(educationVO);
		
		return "redirect:/sub.do?menuKey=67";
	}
	
	@RequestMapping({"/updateEduInfo.do"})
	public String updateEduInfo(HttpServletRequest request, ModelMap model,
		@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		@ModelAttribute("EducationVO") EducationVO educationVO, 
		UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		educationVO.setEduUpdateUser(userSession.getUserId());
		educationService.updateEduInfo(educationVO);
		
		return "redirect:/sub.do?menuKey=67";
	}
	
	// 실적입력 AJAX 요청 처리
	@RequestMapping({"/stdupdate.do"})
	public @ResponseBody String stdUpdate(HttpServletRequest request,
		@ModelAttribute("StudentVO") StudentVO studentVO,
		@RequestParam Map<String, Object> params,
		UserVO userSession)throws Exception {
		
		// 세션 세팅
		studentVO.setStdUpdateUser(userSession.getUserId());
		
		// REQUEST 값
		String arrSeq   = (String)params.get("arrSeq");
		String arrVal   = (String)params.get("arrVal");
		
		// REQUEST 값 분리 (다중 선택 처리)
		String[] anArrSeq = arrSeq.split(",", -1);
		String[] anArrVal = arrVal.split(",", -1);
		
		// 이수 및 합격 업데이트 처리
		if(!arrSeq.equals("")){
			for(int j=0; j<anArrSeq.length; j++){
				studentVO.setStdSeq(anArrSeq[j].trim());
				studentVO.setStdCompleteYn(anArrVal[j].trim());
				studentService.updateStdDetail(studentVO);
			}
		}
		
		return new ObjectMapper().writeValueAsString(studentVO);
		
	}
	
	// 인증관리 목록화면
	@RequestMapping({"/sigmalist.do"})
	public String SigmaList(HttpServletRequest request, ModelMap model,
		@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		@ModelAttribute("EducationVO") EducationVO educationVO, 
		UserVO userSession)throws Exception {
		
		// 메뉴 키 가져오기
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		// 세션 등록
		searchVO.setSearchUserid(userSession.getUserId());
		
		// 검색 시작일과 종료일이 Null 이면 오늘날짜를 기준으로 날짜 입력 (-1개월)
		if(searchVO.getSearchEduFromDt() == null && searchVO.getSearchEduToDt() == null) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			searchVO.setSearchCertToDt(df.format(calendar.getTime()));
			calendar.add(Calendar.MONTH, -1);
			searchVO.setSearchCertFromDt(df.format(calendar.getTime()));
		}
		
		// 코드값 세팅
		CodeVO codeVO = new CodeVO(); 
		String[] arrCodeGrpIds = {"ED_TY2"};
		codeVO.setCodeGrpIdList(arrCodeGrpIds);
		codeVO.setActFlg("Y");
		
		// 코드 쿼리 질의
		List<EgovMap> allCodes = codeService.selectFullList(codeVO);		//item.codeGrpId, codeId, codeNm
		model.addAttribute("allCodes", allCodes);

		
		String tabId = searchVO.getTabId();
		
		if("".equals(tabId) ||"null".equals(tabId) || tabId == null ) {
			searchVO.setSearchbeltCode("D000");
		}else {
			searchVO.setSearchbeltCode(tabId);
		}
		
		// 총 레코드 수 가져오기
		int countList = educationService.selectMngListCntNew(searchVO);
		searchVO.setCnt(countList);
		searchVO.setTotalRecordCount(countList);
		
		// 화면 목록 가져오기
		List<EducationVO> selectMngList = educationService.selectMngListNew(searchVO);
		searchVO.setDataList(selectMngList);
		
		model.addAttribute("selectMngList", selectMngList);
		model.addAttribute("totalCount", countList);
		
		String gb = searchVO.getSearchbeltCode();
		model.addAttribute("gb", gb);
		
		return "app/education/SigmaList";
	}
	
	@RequestMapping({"/searchmnglist.do"})
	public @ResponseBody String searchMnglist(HttpServletRequest request,
		   @ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		   @ModelAttribute("EducationVO") EducationVO educationVO, 
		   @RequestParam Map<String, Object> params,
		   UserVO userSession)throws Exception {
		
		String eduBeltCode = (String)params.get("eduBeltCode");
		System.out.println("eduBeltCode : " + eduBeltCode);

		searchVO.setSearchbeltCode(eduBeltCode); // 벨트코드
		String myUserId = userSession.getUserId();
		
		int countList = educationService.selectMngListCnt(searchVO);
		searchVO.setCnt(countList);
		
		List<EducationVO> selectMngList = educationService.selectMngList(searchVO);
		searchVO.setDataList(selectMngList);
				
		return new ObjectMapper().writeValueAsString(searchVO);
	}
	
	// 인증 대상자 인증처리 API.
	@RequestMapping({"/ajaxCertStateUpdate.do"})
	public @ResponseBody String ajaxCertStateUpdate(HttpServletRequest request,
			@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
			   @ModelAttribute("EducationVO") EducationVO educationVO, 
			   @ModelAttribute("StudentVO") StudentVO studentVO,
			   @RequestParam Map<String, Object> params,
		UserVO userSession)throws Exception {
		
		studentVO.setStdUpdateUser(userSession.getUserId());
		
		// REQUEST 값
		String arrSeq   	= (String)params.get("arrSeq");			// 인증 대상 사번
		String arrCertDate  = (String)params.get("arrCertDate");	// 인증 날짜
		String arrCertCode  = (String)params.get("arrCertCode");	// 인증 코드 (Y.인증 / N.미인증)
		
		// REQUEST 값 분리 (다중 선택 처리)
		String[] anArrSeq 		= arrSeq.split(",", -1);
		String[] anArrCertDate 	= arrCertDate.split(",", -1);
		String[] anArrCertCode 	= arrCertCode.split(",", -1);
		
		// 인증 등록 처리한다.
		if(!arrSeq.equals("")){
			for(int j=0; j<anArrSeq.length; j++){
				
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("RQ_STD_NO", anArrSeq[j].trim());				// 사번
				paramMap.put("RQ_STD_YN", anArrCertCode[j].trim());			// 인증여부
				paramMap.put("RQ_STD_DATE", anArrCertDate[j].trim());		// 인증일
				paramMap.put("RQ_REG_ID", studentVO.getStdUpdateUser()); 	// 등록코드
				
				// 인증상태 업데이트 IF - 벨트 인증
				studentService.updateCertStateUpdate(paramMap);
				
				// 테스트용 인증처리 시 사용자 벨트가 자동으로 업데이트 처리
				
			}
		}
		
		return new ObjectMapper().writeValueAsString(studentVO);
	}
	
	// TEST를 합격자가 인증 대상자인지 여부를 확인하고 인증 대상자일 경우 인증테이블에 추가한다.
	@RequestMapping({"/ajaxCheckCert.do"})
	public @ResponseBody String ajaxCheckCert(HttpServletRequest request,
			@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
			   @ModelAttribute("EducationVO") EducationVO educationVO, 
			   @ModelAttribute("StudentVO") StudentVO studentVO,
			   @RequestParam Map<String, Object> params,
		UserVO userSession)throws Exception {
		
		studentVO.setStdUpdateUser(userSession.getUserId());
		
		// REQUEST 값
		String arrSeq   	= (String)params.get("arrSeq");		// 인증 대상 사번
		String arrVal  		= (String)params.get("arrVal");		// 인증 날짜
		
		
		// REQUEST 값 분리 (다중 선택 처리)
		String[] anArrSeq 		= arrSeq.split(",", -1);
		String[] anArrVal 		= arrVal.split(",", -1);
		
		// 인증 등록 처리한다.
		if(!arrSeq.equals("")){
			for(int j=0; j<anArrSeq.length; j++){
				
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("RQ_STD_NO", anArrSeq[j].trim());				// 사번
				paramMap.put("RQ_STD_YN", anArrVal[j].trim());				// 합격여부
				paramMap.put("RQ_REG_ID", studentVO.getStdUpdateUser()); 	// 등록코드
				
				//인증결과 입력 프로시저 호출
				studentService.insertAuthMemProc(paramMap);
			}
		}
		
		return new ObjectMapper().writeValueAsString(studentVO);
	}
	
	
	// 인증 테이블 생성 원본소스 - by 최승정
//	@RequestMapping({"/mngupdate.do"})
//	public @ResponseBody String mngupdate(HttpServletRequest request,
//			@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
//			   @ModelAttribute("EducationVO") EducationVO educationVO, 
//			   @ModelAttribute("StudentVO") StudentVO studentVO,
//			   @RequestParam Map<String, Object> params,
//		UserVO userSession)throws Exception {
//		
//		studentVO.setStdUpdateUser(userSession.getUserId());
//		studentVO.setCudUpdateUser(userSession.getUserId());
//		
//		String gb   = (String)params.get("gb");
//		String arrSeq   = (String)params.get("arrSeq");
//		String arrComNo   = (String)params.get("arrComNo");
//		String arrEduCode   = (String)params.get("arrEduCode");
//		String arrCertDate   = (String)params.get("arrCertDate");
//		String arrCertCode   = (String)params.get("arrCertCode");
//		String arrTestDate   = (String)params.get("arrTestDate");
//		String arrTestCode   = (String)params.get("arrTestCode");
//			
//		String[] anArrSeq = arrSeq.split(",", -1);
//		String[] anArrComNo = arrComNo.split(",", -1);
//		String[] anArrEduCode = arrEduCode.split(",", -1);
//		String[] anCertDate = arrCertDate.split(",", -1);
//		String[] anCertCode = arrCertCode.split(",", -1);
//		
//		String[] anTestDate = null;
//		String[] anTestCode = null;
//		
//		if("04".equals(gb)) {
//			anTestDate = arrTestDate.split(",", -1);
//			anTestCode = arrTestCode.split(",", -1);
//		}
//		
//		if(!arrSeq.equals("")){
//			for(int j=0; j<anArrSeq.length; j++){
//				if(anArrSeq[j].trim().length() > 0) {
//					studentVO.setStdSeq(anArrSeq[j].trim());
//					
//					// 사용자 정보
//					String tComNo = anArrComNo[j].trim();
//					
//					
//					if(tComNo.length() > 0) {
//						studentVO.setComNo(tComNo);
//						StudentVO resVO = studentService.selectUserInfo(studentVO);
//						
//						String comNo = (String)resVO.getComNo();					//사번
//						String userId = (String)resVO.getUserId();					//사용자 ID
//						String userName = (String)resVO.getUserName();				//이름
//						String comDepartCode = (String)resVO.getComDepartCode();	//부서코드
//						String comDepartName = (String)resVO.getStdDepartNm();
//						
//						String comJobx = (String)resVO.getComJobx();				//직위 (공통코드)
//						String comPosition = (String)resVO.getComPosition();		//직책 (공통코드)
//						String comCertBelt = (String)resVO.getComCertBelt();		//CERT 벨트
//						
//						studentVO.setComNo(comNo);
//						studentVO.setComDepartCode(comDepartCode);
//						studentVO.setCudBeforeBeltCode(comCertBelt);		// 이전벨트코드	
//						studentVO.setCudAfterBeltCode(comCertBelt);			// 인증벨트코드
//						studentVO.setCudDepart(comDepartName);
//						studentVO.setComJobx(comJobx);
//						studentVO.setComPosition(comPosition);
//						studentVO.setCudTeamName(comDepartName);
//						studentVO.setCudUserName(userName);
//						studentVO.setCudBelongName(comDepartName);
//						
//					}
//					
//					// 교육정보
//					String tEduCode = anArrEduCode[j].trim();
//					studentVO.setCudEduCode(tEduCode);
//					
//					if(tEduCode.length() > 0) {
//						educationVO.setEduCode(tEduCode);
//						EducationVO eduVO = studentService.selectYearPlanInfo(educationVO);
//						
//						String eduName = (String)eduVO.getEduName();	
//						String classTypeName = (String)eduVO.getEduClassTypeName();
//						String classDivisionName = (String)eduVO.getEduClassDivisionName();
//						String eduNumber = (String)eduVO.getEduNumber();	
//						
//						String tHistory = eduNumber + "차 " + classTypeName;
//						
//						studentVO.setCudCertHistory(tHistory);
//					}
//					
//					
//					studentVO.setStdCertDate(anCertDate[j].trim());
//					studentVO.setStdCertCode(anCertCode[j].trim());
//					
//					studentVO.setCudCertDate(anCertDate[j].trim());
//					studentVO.setCudCertStatus(anCertCode[j].trim());
//					
//					if("04".equals(gb)) {
//						studentVO.setStdTestDate(anTestDate[j].trim());
//						studentVO.setStdTestCode(anTestCode[j].trim());
//					}
//				}
//				
//				studentService.insertCertDetail(studentVO);
//				studentService.updateStdDetail(studentVO);
//			}
//		}
//		
//		return new ObjectMapper().writeValueAsString(studentVO);
//		
//	}
	
	@RequestMapping({"/excelstdpfm.do"})
	public @ResponseBody void excelStdPfm(HttpServletRequest request, HttpServletResponse response, 
		   @ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		   @ModelAttribute("EducationVO") EducationVO educationVO, 
		   @ModelAttribute("StudentVO") StudentVO studentVO,
		   UserVO userSession){
		
		try {
			String[] colIdArr = {"IDX", "EDU_YEAR", "EDU_BELTCODE_NAME", "EDU_CLASS_TYPE_NAME", "EDU_CLASS_DIVISION_NAME", "EDU_NUMBER", "EDU_NAME", "EDU_DATE", "ET"};
			String[] colNameArr = {"NO", "교육연도", "벨트", "교육유형", "상세유형", "교육차수", "교육과정명", "교육일정", "정원/신청"};
			
			String fileName = "실적입력 교육_" + getCurrentDate() + getCurrentTime() + ".xlsx";
			List<HashMap<String,Object>> selectEducationList = educationService.selectEducationExcel(searchVO);
			
			ExcelFunction.excelWriter(request, response, selectEducationList, fileName, colIdArr, colNameArr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping({"/excelbuild.do"})
	public @ResponseBody void excelBuild(HttpServletRequest request, HttpServletResponse response, 
		   @ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		   @ModelAttribute("EducationVO") EducationVO educationVO, 
		   @ModelAttribute("StudentVO") StudentVO studentVO,
		   UserVO userSession){
		
		try {
			String[] colIdArr = {"IDX", "EDU_YEAR", "EDU_BELTCODE_NAME", "EDU_CLASS_TYPE_NAME", "EDU_CLASS_DIVISION_NAME", "EDU_NUMBER", "EDU_NAME", "EDU_DATE", "EDU_FIXED"};
			String[] colNameArr = {"NO", "교육연도", "벨트", "교육유형", "상세유형", "교육차수", "교육과정명", "교육일정", "정원"};
			
			String fileName = "교육과정_" + getCurrentDate() + getCurrentTime() + ".xlsx";
			List<HashMap<String,Object>> selectEducationList = educationService.selectEducationExcel(searchVO);
			
			ExcelFunction.excelWriter(request, response, selectEducationList, fileName, colIdArr, colNameArr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
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
			searchVO.setSearchbeltCode("D000");
		}else {
			searchVO.setSearchbeltCode(tabId);
		}
		
		try {
			String[] colIdArr = null;
			String[] colNameArr = null;
			
			if("D002".equals(tabId)) {
				colIdArr = new String[]{"IDX", "STD_NAME", "STD_USERID", "MNG_TIT", "STD_DEPART_NM", "STD_JOBX_NM", "STD_POS_NM", "STD_CERT_DATE", "STD_CERT_NM", "STD_TEST_DATE", "STD_TEST_NM"};
				colNameArr = new String[]{"NO", "성명", "사번", "1차 교육 / 2차 통계 / 3차 과제Test", "조직", "직위", "직책", "인증일", "인증여부", "자질평가일", "합격여부"};
			}else {
				colIdArr = new String[]{"IDX", "STD_NAME", "STD_USERID", "MNG_TIT", "STD_DEPART_NM", "STD_JOBX_NM", "STD_POS_NM", "STD_CERT_DATE", "STD_CERT_NM"};
				colNameArr = new String[]{"NO", "성명", "사번", "1차 교육 / 2차 통계 / 3차 과제Test", "조직", "직위", "직책", "인증일", "인증여부"};
			}
			
			String fileName = "인증관리_" + getCurrentDate() + getCurrentTime() + ".xlsx";
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
