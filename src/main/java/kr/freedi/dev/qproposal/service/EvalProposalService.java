package kr.freedi.dev.qproposal.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qproposal.domain.EvalProposalSearchVO;
import kr.freedi.dev.qproposal.domain.EvalProposalVO;
import kr.freedi.dev.qproposal.domain.ProposalVO;

@Service("evalProposalService")
public class EvalProposalService {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_PREFIX = "proposal";
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;

	public List<ProposalVO> selectEvalForClassProposalMasterInfo(EvalProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectList("EvalProposal.selectEvalForClassPoposalMasterInfo", searchVO);
	}

	public EgovMap selectForClassListCount(EvalProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectOne("EvalProposal.selectForClassListCount", searchVO);
	}

	public int updatePropEvalLvCode(EvalProposalVO param) {
		// TODO Auto-generated method stub
		return dao.update("EvalProposal.updatePropEvalLvCode", param);
	}

	public List<ProposalVO> selectEvalForPaymentProposalMasterInfo(EvalProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectList("EvalProposal.selectEvalForPaymentProposalMasterInfo", searchVO);
	}

	public EgovMap selectForPaymentListCount(EvalProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectOne("EvalProposal.selectForPaymentListCount", searchVO);
	}
	
	public int updatePropPaymentInfo(EvalProposalVO param) {
		// TODO Auto-generated method stub
		return dao.update("EvalProposal.updatePropPaymentInfo", param);
	}

}
