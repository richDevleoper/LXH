package kr.freedi.dev.qapprove.service;


import java.util.Iterator;
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
import kr.freedi.dev.user.domain.UserVO;

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
		
		List<ApproveDetailVO> detail = null;
		if(retVO!=null) {
			detail = dao.selectList("ApprovalDetail.selectList", retVO);
			retVO.setDetailList(detail);
			
			// -- 이거 왜 넣는지 모르겠다 (2023.08.13 - DOS)
			ApproveVO paramVO = new ApproveVO();
			paramVO.setRefBusCode(retVO.getRefBusCode());
			paramVO.setAprovalCode(retVO.getAprovalCode()); // 결제 코드도 같이 넘겨준다(없으면 과제/제안 결재자 목록에 중복이 이뤄남)
			detail = dao.selectList("ApprovalDetail.selectList", paramVO);
			retVO.setDetailHistory(detail);	
		} 
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
		
		dao.delete("ApprovalDetail.delete", keyVO);  	// 결재선 지우기
		dao.delete("Approval.delete", keyVO);			// 결재마스터 지우기
	}
	
	public Boolean updateStatus(ApproveVO inputVO, UserVO userSession) {
		
		List<ApproveDetailVO> detail = inputVO.getDetailList();
		
		// check 하고 다 결재 되었으면 결재마스터 상태 업데이트
		Boolean apprComplete = true;  // 전원 결재여부 체크, 미결된 사람이 있으면 false, 미결 없거나(=결재 전원 완료되거나) 반려건이 있으면  true
		Boolean isRejected = false;   // 반려건 있는지 체크하고 있으면 결재완료처리하여 진행
		
		
		if(detail!=null) {
			Iterator<ApproveDetailVO> itrDetail = detail.iterator();
			ApproveDetailVO apprMember = null;
			while(itrDetail.hasNext()) {
				ApproveDetailVO tmpDetail = itrDetail.next();
				if(tmpDetail.getAprovalCode()!=null) {
					if(tmpDetail.getComNo().equals(userSession.getUserId())) {
						dao.update("ApprovalDetail.updateStatus", tmpDetail);	
					}
				}
			}
			
			ApproveVO dbVO = this.select(inputVO);
			
			List<ApproveDetailVO> approvalList = dbVO.getDetailList();
			for(int i=0; i<approvalList.size(); i++) {
				ApproveDetailVO tmpItem = approvalList.get(i);
				if(tmpItem.getAprovalStatCode() != null) {
					if(tmpItem.getAprovalStatCode().equals("2"))
						apprComplete = false;
					else if(tmpItem.getAprovalStatCode().equals("3"))
						isRejected = true;
				}
			}
			
			if(isRejected) {
				apprComplete = true; // 반려시 이후 결재 안되도록 상태 변경
			}
			
			if(apprComplete) {
				
				dao.update("Approval.updateStatus", inputVO);
			}
		}
		
		return apprComplete;
	}	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 임시 제안 2차, 3차 결재시
	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	public void insertDetailItem(ApproveDetailVO detailVO) throws Exception {
		dao.insert("ApprovalDetail.insert", detailVO);
	}
	
	public void updateApprovalState(ApproveVO approveVO) throws Exception {
		dao.insert("Approval.updateStatus", approveVO);
	}
	
	public String selectApprovalActNo(ApproveVO approveVO) throws Exception{
		return dao.selectOne("ApprovalDetail.selectApprovalActNo", approveVO);
	}
	
	public void updateApprovalActNo(ApproveVO approveVO) throws Exception{
		dao.update("Approval.updateActNo", approveVO);
	}
	
	public ApproveVO insertSelectApprovalInfo(ApproveVO masterVO) throws Exception {

		String aprovalCode = dao.selectOne("Approval.selectNextFkey");
		masterVO.setAprovalCode(aprovalCode);	
		masterVO.setAprovalState("2");
		dao.insert("Approval.insert", masterVO);
		
		for (ApproveDetailVO vo : masterVO.getDetailList()) {
			vo.setAprovalCode(aprovalCode);	//결재코드
			dao.insert("ApprovalDetail.insert", vo);
		}
		
		return masterVO;
	}
}
