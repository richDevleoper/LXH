package kr.freedi.dev.qeducation.controller;

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
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.qeducation.domain.EducationSearchVO;
import kr.freedi.dev.qeducation.domain.EducationVO;
import kr.freedi.dev.qeducation.domain.StudentVO;
import kr.freedi.dev.qeducation.service.StudentService;
import kr.freedi.dev.qpopup.domain.UserVO;

@Controller
@RequestMapping({"/education"})
public class StudentController {
protected Log log = LogFactory.getLog(this.getClass());
		
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "studentService")
	private StudentService studentService;
	
	@Resource(name = "proposalIdGnrService")
	private EgovIdGnrService idGnrService;
	
	@RequestMapping({"/yearplan.do"})
	public String YearPlan(HttpServletRequest request, ModelMap model,
			@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
			@ModelAttribute("EducationVO") EducationVO educationVO, 
			UserVO userSession)throws Exception {
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		
		List<EducationVO> selectYearPlanList = studentService.selectYearPlanList(searchVO);
		model.addAttribute("selectYearPlanList", selectYearPlanList);
		model.addAttribute("action", "/education/requeststd.do");
		
		return "app/education/YearPlanList";
	}
	
	@RequestMapping({"/requeststd.do"})
	public @ResponseBody String requestStd(HttpServletRequest request,
		   @ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		   @ModelAttribute("StudentVO") StudentVO studentVO,
		   @ModelAttribute("userVO") UserVO userVo,
		   @RequestParam Map<String, Object> params,
		   UserVO userSession)throws Exception {
		
		//String stdSeq   = (String)params.get("stdSeq");
		String eduCode   = (String)params.get("eduCode");
		String mode   = (String)params.get("mode");
		
		// 사용자 마스터 정보조회
		String myUserId = userSession.getUserId();
		userVo.setUserId(myUserId);
		
		//userVo.setUserId("limjinah");
		/*
		 * leejb leejbro lefthander legalteam legyun lehvirus limjaeho limjinah
		 */
		
		EgovMap resVO = studentService.selectUserInfo(userVo);
		
		String comNo = (String)resVO.get("comNo");	//사번
		String userId = (String)resVO.get("userId");	//사용자 ID
		String userName = (String)resVO.get("userName");	//이름
		String comDepartCode = (String)resVO.get("comDepartCode");	//부서코드
		String comJobx = (String)resVO.get("comJobx");	//직위 (공통코드)
		String comPosition = (String)resVO.get("comPosition");	//직책 (공통코드)
		String comCertBelt = (String)resVO.get("comCertBelt");	//CERT 벨트
		System.out.println("comNo : " + comNo);
		
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
		
		return new ObjectMapper().writeValueAsString(studentVO);
	}
	
	@RequestMapping({"/canclestd.do"})
	public @ResponseBody String cancleStd(HttpServletRequest request,
		   @ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		   @ModelAttribute("StudentVO") StudentVO studentVO,
		   @ModelAttribute("userVO") UserVO userVo,
		   @RequestParam Map<String, Object> params,
		   UserVO userSession)throws Exception {
		
		//String stdSeq   = (String)params.get("stdSeq");
		String eduCode   = (String)params.get("eduCode");
		String mode   = (String)params.get("mode");
		
		// 사용자 마스터 정보조회
		String myUserId = userSession.getUserId();
		userVo.setUserId(myUserId);
		
		EgovMap resVO = studentService.selectUserInfo(userVo);
		
		String comNo = (String)resVO.get("comNo");	//사번
		String userId = (String)resVO.get("userId");	//사용자 ID
		
		// 신청내역 가져오기
		studentVO.setStdUserId(userId);
		StudentVO stdVO = studentService.selectStdDetailInfo(studentVO);
		String stdSeq = stdVO.getStdSeq();
		
		if(stdSeq.trim().length() == 0) {
			studentVO.setResult("Y"); // 결과값
		}else {
			studentVO.setStdSeq(stdSeq);
			studentVO.setStdStatus("N");
			studentVO.setStdUpdateUser(myUserId);
			studentService.updateStdDetail(studentVO);
			
			studentVO.setResult("Y"); // 결과값
			
		}
		return new ObjectMapper().writeValueAsString(studentVO);
	}
	
	@RequestMapping({"/searchedu.do"})
	public @ResponseBody String searchedu(HttpServletRequest request,
		   @ModelAttribute("EducationVO") EducationVO educationVO,
		   @RequestParam Map<String, Object> params)throws Exception {
		
		String eduCode   = (String)params.get("eduCode");
		System.out.println("eduCode : " + eduCode);
		educationVO.setEduCode(eduCode);
		
		return new ObjectMapper().writeValueAsString(studentService.selectYearPlanInfo(educationVO));
	}
	
	@RequestMapping({"/chcekedu.do"})
	public @ResponseBody String chcekedu(HttpServletRequest request,
		   @ModelAttribute("StudentVO") StudentVO studentVO,
		   @RequestParam Map<String, Object> params,
		   UserVO userSession)throws Exception {
		
		String eduCode   = (String)params.get("eduCode");
		System.out.println("eduCode : " + eduCode);
		studentVO.setEduCode(eduCode);
		
		// 교육 신청개수
		int countList = studentService.selectLReqCount(studentVO);
		System.out.println("countList : " + countList);
		
		// 신청여부
		String myUserId = userSession.getUserId();
		studentVO.setStdUserId(myUserId);
		studentVO.setStdStatus("Y");
		
		int countList2 = studentService.selectLReqCount(studentVO);
		System.out.println("countList2 : " + countList2);
		
		studentVO.setStdReqCnt(Integer.toString(countList));
		studentVO.setStdMyCnt(Integer.toString(countList2));
		
		return new ObjectMapper().writeValueAsString(studentVO);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
