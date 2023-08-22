package kr.freedi.dev.qeducation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.attachfile.service.AttachFileService;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qeducation.domain.EducationSearchVO;
import kr.freedi.dev.qeducation.domain.EducationVO;
import kr.freedi.dev.qeducation.domain.StudentVO;
import kr.freedi.dev.qpopup.domain.UserVO;

@Service("studentService")
public class StudentService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_PREFIX = "education";
	
	@Resource(name = "proposalIdGnrService")
	private EgovIdGnrService idGnrService;
	
	@Resource
	private AttachFileService attachFileService;
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	public int selectstdCount(StudentVO studentVO) {
		return (Integer) dao.selectOne("Student.selectstdCount", studentVO);
	}
	
	public List<StudentVO> selectStudentList(StudentVO studentVO) {
		return dao.selectList("Student.selectStudentList", studentVO);
	}
	
	public List<HashMap<String,Object>> selectExcelStudentList(StudentVO studentVO) {
		return dao.selectList("Student.selectStudentExcelList", studentVO);
	}
	
	public List<EducationVO> selectYearPlanList(EducationSearchVO searchVO) {
		return dao.selectList("Education.selectYearPlanList", searchVO);
	}
	
	public EducationVO selectYearPlanInfo(EducationVO educationVO) {
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
	
	public int selectLReqCount(StudentVO studentVO) {
		return (Integer) dao.selectOne("Student.selectLReqCount", studentVO);
	}
	
	public StudentVO selectUserInfo(StudentVO studentVO) {
		return dao.selectOne("Student.selectUserInfo", studentVO); 
	}
	
	public StudentVO selectStdDetailInfo(StudentVO studentVO) {
		return dao.selectOne("Student.selectStdDetailInfo", studentVO); 
	}
	
	public void insertStdDetail(StudentVO studentVO) throws Exception {
		int stdSeq = idGnrService.getNextIntegerId();
		studentVO.setStdSeq(Integer.toString(stdSeq));
		dao.insert("Student.insertStdDetail", studentVO);
	}
	
	public void updateStdDetail(StudentVO studentVO) throws Exception {
		dao.insert("Student.updateStdDetail", studentVO);
	}
	
	// 교육 및 테스트  신청가능여부 체크 프로시저
	public Map<String, Object> checkReqbtn(Map<String, Object> paramMap){
		//List<HashMap<String, Object>> resultMap = dao.selectList("Student.checkReqbtnPROC", paramMap);
		//System.out.println(paramMap);
		dao.selectOne("Student.checkReqbtnPROC", paramMap); 
		return paramMap;
	}
	
	// 인증결과를 등록하는 쿼리
	public void insertCertDetail(StudentVO studentVO) throws Exception {
		int cudSeq = idGnrService.getNextIntegerId();
		studentVO.setSeq(Integer.toString(cudSeq));
		dao.insert("Student.insertCertDetail", studentVO);
	}
	
	// 테스트 합격 시 인증여부를 판별해서 인증 테이블 등록하는 프로시저 IF
	public void insertAuthMemProc(Map<String, Object> paramMap){
		//List<HashMap<String, Object>> resultMap = dao.selectList("Student.checkReqbtnPROC", paramMap);
		//System.out.println(paramMap);
		dao.selectOne("Student.insertCertMem", paramMap); 
	}
	
	// 인증 상태변경 IF
	public void updateCertStateUpdate(Map<String, Object> paramMap) {
		//dao.insert("Student.updateCertMem", paramMap);
		dao.insert("Student.updateCertStatusUpdate", paramMap);
	}
	
	// 과제 및 테스트 이수 결과 로그 저장 
	public void insertEduComplateLog(Map<String, Object> paramMap) throws Exception {
		dao.insert("Student.insertEduComplateLog", paramMap);
	}
}
