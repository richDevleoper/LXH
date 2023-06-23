package kr.freedi.dev.qeducation.controller;

import java.util.List;
import java.util.Map;
import java.util.Objects;

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

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.qeducation.domain.EducationSearchVO;
import kr.freedi.dev.qeducation.domain.EducationVO;
import kr.freedi.dev.qeducation.domain.MyEducationVO;
import kr.freedi.dev.qeducation.domain.StudentVO;
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
		studentVO.setComNo(myUserId);
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
		
		/* 1. 교육활동 */
		educationVO.setEduBeltCode(eduBeltCode); // 벨트코드
		String myUserId = userSession.getUserId();
		educationVO.setComNo(myUserId);
		
		List<EducationVO> selectMyBeltEduList = educationService.selectMyBeltEduist(educationVO);
		educationVO.setMyList(selectMyBeltEduList);
		
		/* 2. 과제활동 현황 */
		myEducationVO.setLeaderBeltCode(eduBeltCode);
		myEducationVO.setComNo(myUserId);
		
		List<MyEducationVO> selectMyReportList = educationService.selectMyReportList(myEducationVO);
		educationVO.setReportList(selectMyReportList);
		
		return new ObjectMapper().writeValueAsString(educationVO);
	}
	
	@RequestMapping({"/myedulist.do"})
	public String MyEduList(HttpServletRequest request, ModelMap model,
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
		studentVO.setComNo(myUserId);
		
		return "app/education/MyEduList";
	}
	
	//교육신청 전 체크
	@RequestMapping({"/chcekedu.do"})
	public @ResponseBody String chcekedu(HttpServletRequest request,
		   @ModelAttribute("StudentVO") StudentVO studentVO,
		   @RequestParam Map<String, Object> params,
		   UserVO userSession)throws Exception {
		
		String eduCode   = (String)params.get("eduCode");
		studentVO.setEduCode(eduCode);
		studentVO.setStdStatus("Y");
		// 교육 신청개수
		int countList = studentService.selectLReqCount(studentVO);
		
		// 신청여부
		String myUserId = userSession.getUserId();
		if("".equals(myUserId) || myUserId == null){
			studentVO.setResult("S"); // 결과값
		}else {
			studentVO.setComNo(myUserId);
			studentVO.setStdStatus("Y");
			
			int countList2 = studentService.selectLReqCount(studentVO);
			studentVO.setStdReqCnt(Integer.toString(countList));
			studentVO.setStdMyCnt(Integer.toString(countList2));
			studentVO.setResult("Y"); // 결과값
		}
		
		return new ObjectMapper().writeValueAsString(studentVO);
	}
	
	//교육신청
	@RequestMapping({"/requeststd.do"})
	public @ResponseBody String requestStd(HttpServletRequest request,
		   @ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		   @ModelAttribute("StudentVO") StudentVO studentVO,
		   @ModelAttribute("userVO") UserVO userVo,
		   @RequestParam Map<String, Object> params,
		   UserVO userSession)throws Exception {
		
		String eduCode   = (String)params.get("eduCode");
		String mode   = (String)params.get("mode");
		
		// 사용자 마스터 정보조회
		String myUserId = userSession.getUserId();
		//String myUserId = "FB2621";
		
		if("".equals(myUserId) || myUserId == null) {
			studentVO.setResult("S"); // 결과값
		}else {
			studentVO.setComNo(myUserId);
			StudentVO resVO = studentService.selectUserInfo(studentVO);
			
			String comNo = (String)resVO.getComNo();					//사번
			String userId = (String)resVO.getUserId();					//사용자 ID
			String userName = (String)resVO.getUserName();				//이름
			String comDepartCode = (String)resVO.getComDepartCode();	//부서코드
			String comJobx = (String)resVO.getComJobx();				//직위 (공통코드)
			String comPosition = (String)resVO.getComPosition();		//직책 (공통코드)
			String comCertBelt = (String)resVO.getComCertBelt();		//CERT 벨트
			
			// 수강생 정보 세팅
			studentVO.setEduCode(eduCode);
			studentVO.setComNo(comNo);
			studentVO.setStdUserId(userId);
			studentVO.setStdName(userName);
			studentVO.setStdDepart(comDepartCode);
			studentVO.setStdJbox(comJobx);
			studentVO.setStdPosition(comPosition);
			studentVO.setStdBeltCode(comCertBelt);
			studentVO.setStdStatus(mode);
			
			//신청
			studentVO.setStdRegUser(myUserId);
			studentService.insertStdDetail(studentVO);
			studentVO.setResult("Y"); // 결과값
		}
		
		return new ObjectMapper().writeValueAsString(studentVO);
	}
	
	//교육취소
	@RequestMapping({"/canclestd.do"})
	public @ResponseBody String cancleStd(HttpServletRequest request,
		   @ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		   @ModelAttribute("StudentVO") StudentVO studentVO,
		   @ModelAttribute("userVO") UserVO userVo,
		   @RequestParam Map<String, Object> params,
		   UserVO userSession)throws Exception {
		
		String eduCode   = (String)params.get("eduCode");
		String mode   = (String)params.get("mode");
		
		// 사용자 마스터 정보조회
		String myUserId = userSession.getUserId();
		//String myUserId = "FB2621";
		
		if("".equals(myUserId) || myUserId == null) {
			studentVO.setResult("S"); // 결과값
		}else {
			// 신청내역 가져오기
			studentVO.setComNo(myUserId);
			studentVO.setStdStatus("Y");
			StudentVO stdVO = studentService.selectStdDetailInfo(studentVO);
			
			String stdSeq = "";
			if (!Objects.isNull(stdVO) ){
				stdSeq = stdVO.getStdSeq();
			}
			
			if(stdSeq.trim().length() == 0) {
				studentVO.setResult("N"); // 결과값
			}else {
				studentVO.setEduCode(eduCode);
				studentVO.setStdSeq(stdSeq);
				studentVO.setStdStatus("N");
				studentVO.setStdReapplyYn(mode);
				studentVO.setStdUpdateUser(myUserId);
				studentService.updateStdDetail(studentVO);
				
				studentVO.setResult("Y"); // 결과값
				
			}
		}
		
		return new ObjectMapper().writeValueAsString(studentVO);
	}
	
	//교육 재신청
	@RequestMapping({"/reofferstd.do"})
	public @ResponseBody String reofferStd(HttpServletRequest request,
		   @ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		   @ModelAttribute("StudentVO") StudentVO studentVO,
		   @ModelAttribute("userVO") UserVO userVo,
		   @RequestParam Map<String, Object> params,
		   UserVO userSession)throws Exception {
		
		String eduCode   = (String)params.get("eduCode");
		String stdSeq   = (String)params.get("stdSeq");
		String mode   = (String)params.get("mode");
		
		// 사용자 마스터 정보조회
		String myUserId = userSession.getUserId();
		//String myUserId = "FB2621";
		
		if("".equals(myUserId) || myUserId == null) {
			studentVO.setResult("S"); // 결과값
		}else {
			// 수강생 정보 세팅
			studentVO.setEduCode(eduCode);
			studentVO.setStdSeq(stdSeq);
			studentVO.setComNo(myUserId);
			studentVO.setStdStatus(mode);
			studentVO.setStdReapplyYn(mode);
			
			//신청
			studentVO.setStdUpdateUser(myUserId);
			studentService.updateStdDetail(studentVO);
			studentVO.setResult("Y"); // 결과값
		}
		
		return new ObjectMapper().writeValueAsString(studentVO);
	}
	
	
	
	
}
