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
	
	public ApproveVO select(ApproveVO vo) {
		
		return (ApproveVO)dao.selectOne("Approval.select", vo);
	}

	public void insert(ApproveVO masterVO) throws Exception {

		String aprovalCode = dao.selectOne("Approval.selectNextFkey");
		masterVO.setAprovalCode(aprovalCode);		
		dao.insert("Approval.insert", masterVO);
		
		for (ApproveDetailVO vo : masterVO.getDetailList()) {
			vo.setAprovalCode(aprovalCode);	//결재코드
			vo.setAprovalStatCode("2");	// 미결
			dao.insert("ApprovalDetail.insert", vo);
		}
	}
		
}
