package kr.freedi.dev.qproposal.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qproposal.domain.ProposalVO;
import kr.freedi.dev.qproposal.domain.ReportProposalSearchVO;

@Service("reportProposalService")
public class ReportProposalService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_PREFIX = "proposal";
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;

	public List<ProposalVO> selectProposalMasterInfo(ReportProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectList("ReportProposal.selectProposalMasterInfo", searchVO);
	}

	public List<EgovMap> selectProposalStateByCount(ReportProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectList("ReportProposal.selectProposalStateByCount", searchVO);
	}

	public List<EgovMap> selectProposalClassByCount(ReportProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectList("ReportProposal.selectProposalClassByCount", searchVO);
	}
	
	public List<EgovMap> selectProposalTypeByCount(ReportProposalSearchVO searchVO) {
		return dao.selectList("ReportProposal.selectProposalTypeByCount", searchVO);
	}
	
	public List<EgovMap> selectProposalPaymentByCount(ReportProposalSearchVO searchVO) {
		return dao.selectList("ReportProposal.selectProposalPaymentByCount", searchVO);
	}
}
