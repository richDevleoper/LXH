package kr.freedi.dev.qeducation.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.attachfile.service.AttachFileService;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qeducation.domain.EducationSearchVO;
import kr.freedi.dev.qeducation.domain.EducationVO;
import kr.freedi.dev.user.domain.UserVO;

@Service("educationService")
public class EducationService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_PREFIX = "education";
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource(name = "proposalIdGnrService")
	private EgovIdGnrService idGnrService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource
	private AttachFileService attachFileService;
	
	public int selectListCount(EducationSearchVO searchVO) {
		return (Integer) dao.selectOne("Education.selectEducationMstCount", searchVO);
	}
	
	public List<EducationVO> selectEducationList(EducationSearchVO searchVO) {
		return dao.selectList("Education.selectEducationMstList", searchVO);
	}
	
	public void insertEduInfo(EducationVO educationVO) throws Exception {
		int eduCode = idGnrService.getNextIntegerId();
		educationVO.setEduCode(Integer.toString(eduCode));
		dao.insert("Education.insertEducationMst", educationVO);
	}
	
	public void updateEduInfo(EducationVO educationVO) throws Exception {
		dao.insert("Education.updateEducationMst", educationVO);
	}
	
	public EducationVO proc_educationFormHandler(HttpServletRequest req, ModelMap model,
		   @ModelAttribute("EducationSearchVO") EducationSearchVO searchVO, 
		   @ModelAttribute("EducationVO") EducationVO educationVO, 
		   UserVO userSession)throws Exception {
		ArticleSearchVO aSearchVO = new ArticleSearchVO();
		aSearchVO.setMenuKey(searchVO.getMenuKey());
		return this.proc_educationFormHandler(req, model, aSearchVO, educationVO, userSession);
	}
	
	public EducationVO proc_educationFormHandler(HttpServletRequest req, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("EducationVO") EducationVO educationVO, 
			UserVO userSession) throws Exception {
		EducationVO eduVo = new EducationVO();
		
		// 메뉴키
		model.addAttribute("menuKey", searchVO.getMenuKey());
		/*********
		 * 1. 기초코드 바인딩
		 * *******/		
		CodeVO codeVO = new CodeVO(); 
		String[] arrCodeGrpIds = {"ED_TY1", "ED_TY2", "ED_TY3"};
		
		codeVO.setCodeGrpIdList(arrCodeGrpIds);
		codeVO.setActFlg("Y"); 
		List<EgovMap> allCodes = codeService.selectFullList(codeVO);		//item.codeGrpId, codeId, codeNm

		model.addAttribute("allCodes", allCodes);
		
		String eduCode = educationVO.getEduCode();
		//조회
		if(eduCode != null) {
			eduVo =this.select(educationVO);
			educationVO.setMode("U");
			model.addAttribute("educationVO", eduVo);
			model.addAttribute("action", "/education/updateEduInfo.do");
		//신규	
		}else{
			educationVO.setMode("I");
			model.addAttribute("educationVO", educationVO);
			int fileCode = idGnrService.getNextIntegerId();
			educationVO.setEduFileCode(Integer.toString(fileCode));
			model.addAttribute("action", "/education/insertEduInfo.do");
		}
		
		
		
		
		return eduVo;
	}
	
	
	public EducationVO select(EducationVO educationVO) {
		EducationVO resultVO = (EducationVO)dao.selectOne("Education.selectEducationMstInfo", educationVO);
		if(resultVO != null){
			AttachFileVO attachFileVO = null;
			attachFileVO = new AttachFileVO();
			attachFileVO.setFileId(ATTACH_PREFIX + "_" + resultVO.getEduFileCode());
			attachFileVO.setDeleteFlg("N");
			resultVO.setFileList(attachFileService.selectFullList(attachFileVO));
		}
		return resultVO;
	}
	
	
	public EducationVO selectEducationMstInfo(EducationVO educationVO) {
		return dao.selectOne("Education.selectEducationMstInfo", educationVO); 
	}
	
	
	
}
