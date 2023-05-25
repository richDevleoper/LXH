package kr.freedi.dev.qapprove.service;


import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.article.domain.ArticleVO;
import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.attachfile.service.AttachFileService;
import kr.freedi.dev.board.service.BoardService;
import kr.freedi.dev.board.service.BoardUseService;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qapprove.domain.ApproveDetailVO;
import kr.freedi.dev.qapprove.domain.ApproveSearchVO;
import kr.freedi.dev.qapprove.domain.ApproveVO;
import kr.freedi.dev.qreport.domain.ReportDetailVO;
import kr.freedi.dev.qreport.domain.ReportIndicatorVO;
import kr.freedi.dev.qreport.domain.ReportResultVO;
import kr.freedi.dev.qreport.domain.ReportSearchVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;
import kr.freedi.dev.qreport.domain.ReportVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;




/**
 * @project : dev_default
 * @file 	: ApproveService.java
 * @date	: 2023. 4. 27.
 * @author	: swpark
 * @comment : 과제 Service 
 * @history	: 
 */
@Service("approveService")
public class ApproveService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_PREFIX = "apprv";
	
	final String USER_TYP_MNGR = "INTF_USER";
	

	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	
	public List<ApproveVO> selectList(ApproveSearchVO searchVO) {
		
		return dao.selectList("Approval.selectList", searchVO);
	}
	
	public List<EgovMap> selectListCount(ApproveSearchVO searchVO) {
		return dao.selectList("Approval.selectListCount", searchVO); // 상태 종류별 카운트 
	}
	
	public ApproveVO select(ApproveVO vo) {
		
		ApproveVO retVO = (ApproveVO)dao.selectOne("Approval.select", vo);
		
		List<ApproveDetailVO> detail = dao.selectList("ApprovalDetail.selectList", retVO);
		retVO.setDetailList(detail);
		
		return retVO;
	}

	public List<ApproveVO> selectMyRequestList(ApproveSearchVO searchVO) {
		
		return dao.selectList("Approval.selectMyRequestList", searchVO);
	}
	
	public List<EgovMap> selectMyRequestListCount(ApproveSearchVO searchVO) {
		return dao.selectList("Approval.selectMyRequestListCount", searchVO); // 상태 종류별 카운트 
	}
	
	public void insert(ApproveVO masterVO) throws Exception {

		String aprovalCode = dao.selectOne("Approval.selectNextFkey");
		masterVO.setAprovalCode(aprovalCode);	
		masterVO.setAprovalState("2");
		dao.insert("Approval.insert", masterVO);
		
		for (ApproveDetailVO vo : masterVO.getDetailList()) {
			vo.setAprovalCode(aprovalCode);	//결재코드
			dao.insert("ApprovalDetail.insert", vo);
		}
	}
	/***
	 * 결재상신한 것을 취소할 때 사용
	 * @param vo aprovalCode, aprovalType, refBusCode, refBusSubCode
	 * @throws Exception
	 */
	public void cancelApprove(ApproveVO vo) throws Exception {
		
		vo = this.select(vo);
		
		ApproveVO keyVO = new ApproveVO();
		keyVO.setAprovalCode(vo.getAprovalCode());
		
		dao.delete("Approval.delete", keyVO);
		dao.delete("ApprovalDetail.delete", keyVO);
	}
	
	public void updateStatus(ApproveVO vo) {
		
		dao.update("ApprovalDetail.updateStatus", vo.getDetailList().get(0));
		
		// TODO 전원 결재여부 체크하고 마스터도 업데이트할 것
		
		// Drop인 경우 마스터도 Drop 처리		
		dao.update("Approval.updateStatus", vo);
	}
		
}
