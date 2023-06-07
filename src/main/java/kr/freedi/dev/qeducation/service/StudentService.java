package kr.freedi.dev.qeducation.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
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
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	public int selectstdCount(StudentVO studentVO) {
		return (Integer) dao.selectOne("Student.selectstdCount", studentVO);
	}
	
	public List<StudentVO> selectStudentList(StudentVO studentVO) {
		return dao.selectList("Student.selectStudentList", studentVO);
	}
	
	public List<EducationVO> selectYearPlanList(EducationSearchVO searchVO) {
		return dao.selectList("Education.selectYearPlanList", searchVO);
	}
	
	public EgovMap selectYearPlanInfo(EducationVO educationVO) {
		return dao.selectOne("Education.selectYearPlanInfo", educationVO); 
	}
	
	public int selectLReqCount(StudentVO studentVO) {
		return (Integer) dao.selectOne("Student.selectLReqCount", studentVO);
	}
	
	public EgovMap selectUserInfo(UserVO userVO) {
		return dao.selectOne("Student.selectUserInfo", userVO); 
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
	
	
}