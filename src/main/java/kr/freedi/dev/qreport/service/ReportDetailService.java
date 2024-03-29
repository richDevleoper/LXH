package kr.freedi.dev.qreport.service;

import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.article.domain.ArticleVO;
import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.attachfile.service.AttachFileService;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qreport.domain.ReportDetailVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

/**
 * @project : dev_default
 * @file 	: ReportTeamService.java
 * @date	: 2023. 4. 7.
 * @author	: swpark
 * @comment : 일정계획
 * @history	: 
 */
@Service("reportDetailService")
public class ReportDetailService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_PREFIX = "reportDetail";
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource
	private AttachFileService attachFileService;
	
	public void insert(ReportDetailVO vo) throws Exception {
		
		Integer newKey = (Integer)dao.selectOne("ReportDetail.selectNextFkey");
		vo.setRepSeq(newKey);
		dao.insert("ReportDetail.insert", vo);
	}
	
	public void update(ReportDetailVO vo) throws Exception {
		
		dao.update("ReportDetail.update", vo);
	}
	
	public void updateStep(ReportDetailVO vo) throws Exception {
		
		dao.update("ReportDetail.updateStep", vo);
	}
	
	public void updateApprovalMemCode(ReportDetailVO vo) throws Exception {
		
		dao.update("ReportDetail.updateApprovalMemCode", vo);
	}
	
	/** 
	 *  6시그마 다음단계 활성화
	 *  rep_code	  	과제코드
	 *  rep_step_code 	현재 스텝코드(이 값 기준 다음스텝 활성화) 
	 *  rep_status 		1로 세팅
	 *  rep_update_user 수정계정
	 **/
	public void updateStepStatus(ReportDetailVO vo) throws Exception {
		
		// TODO  이 쿼리는 결재가 승인될 때 실행된다. 
		dao.update("ReportDetail.updateStepStatus", vo);
	}
	
	
	
	
	
	public void save(ReportDetailVO vo) throws Exception {
		if(vo.getRepSeq()==null) {
			this.insert(vo);
		} else {
			this.update(vo);
		}
	}
	
	public List<ReportDetailVO> selectFullList(ReportDetailVO reportDetailVO) {
		
		List<ReportDetailVO> returnVO = dao.selectList("ReportDetail.selectFullList", reportDetailVO);
		
		//repDetailFileList
		AttachFileVO attachFileVO = null;
		for (ReportDetailVO vo : returnVO) {
			attachFileVO = new AttachFileVO();
			attachFileVO.setFileId(ATTACH_PREFIX + "_" + vo.getRepStepCode() + "_" + vo.getRepCode());	//reportDetail_7_137
			attachFileVO.setDeleteFlg("N");
			List<AttachFileVO> fileList = attachFileService.selectFullList(attachFileVO);
			vo.setRepDetailFileList(fileList);
		}
		return returnVO;
	}
	
	public int delete(ReportDetailVO reportDetailVO) {
		
		List<ReportDetailVO> savedVO = dao.selectList("ReportDetail.selectFullList", reportDetailVO);
		
		// 첨부파일 먼저 지우기
		for (ReportDetailVO vo : savedVO) {	
			attachFileService.deleteAttachFile(ATTACH_PREFIX + "_" + vo.getRepStepCode() + "_" + vo.getRepCode());
		}
		
		// 일정데이터 지우기
		return dao.delete("ReportDetail.delete", reportDetailVO);  	// 결재선 지우기
	}
	
}
