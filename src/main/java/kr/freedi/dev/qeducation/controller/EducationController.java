package kr.freedi.dev.qeducation.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.qeducation.domain.EducationSearchVO;
import kr.freedi.dev.qeducation.domain.EducationVO;
import kr.freedi.dev.qeducation.domain.StudentVO;
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
		
		int countList = educationService.selectListCount(searchVO);
		System.out.println("countList : " + countList);
		
		CodeVO codeVO = new CodeVO(); 
		String[] arrCodeGrpIds = {"ED_TY1", "ED_TY2", "ED_TY3"};
		
		codeVO.setCodeGrpIdList(arrCodeGrpIds);
		codeVO.setActFlg("Y"); 
		List<EgovMap> allCodes = codeService.selectFullList(codeVO);		//item.codeGrpId, codeId, codeNm

		model.addAttribute("allCodes", allCodes);
		
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
		List<EducationVO> selectEducationList = educationService.selectEducationList(searchVO);
		model.addAttribute("selectEducationList", selectEducationList);
		model.addAttribute("totalCount", countList);
		
		return "app/education/PfmSubmitList";
	}
	
	@RequestMapping({"/pfmsubmitdetail.do"})
	public String pfmsubmitDetail(HttpServletRequest request, ModelMap model,
		@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		@ModelAttribute("EducationVO") EducationVO educationVO, 
		@ModelAttribute("StudentVO") StudentVO studentVO,
		UserVO userSession)throws Exception {
		model.addAttribute("menuKey", searchVO.getMenuKey());
		searchVO.setSearchUserid(userSession.getUserId());
		
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
		
		return "app/education/pfmsubmitDetail";
	}
	
	@RequestMapping({"/sigmalist.do"})
	public String SigmaList(HttpServletRequest request, ModelMap model,
		@ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		@ModelAttribute("EducationVO") EducationVO educationVO, 
		UserVO userSession)throws Exception {
		
		return "app/education/SigmaList";
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
	
	@RequestMapping({"/stdupdate.do"})
	public @ResponseBody String stdUpdate(HttpServletRequest request,
		@ModelAttribute("StudentVO") StudentVO studentVO,
		@RequestParam Map<String, Object> params,
		UserVO userSession)throws Exception {
		
		studentVO.setStdUpdateUser(userSession.getUserId());
		
		String arrSeq   = (String)params.get("arrSeq");
		String arrVal   = (String)params.get("arrVal");
		
		String[] anArrSeq = arrSeq.split(",", -1);
		String[] anArrVal = arrVal.split(",", -1);
		
		if(!arrSeq.equals("")){
			for(int j=0; j<anArrSeq.length; j++){
				studentVO.setStdSeq(anArrSeq[j].trim());
				studentVO.setStdCompleteYn(anArrVal[j].trim());
				studentService.updateStdDetail(studentVO);
			}
		}
		
		return new ObjectMapper().writeValueAsString(studentVO);
		
	}
		
	
	
	
}
