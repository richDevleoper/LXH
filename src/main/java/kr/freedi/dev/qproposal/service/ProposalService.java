package kr.freedi.dev.qproposal.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qproposal.domain.ProposalSearchVO;
import kr.freedi.dev.qproposal.domain.ProposalVO;

@Service("proposalService")
public class ProposalService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_PREFIX = "proposal";
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;

	public EgovMap selectListCount(ProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectOne("Proposal.selectListCount", searchVO);
	}

	public List<ProposalVO> selectProposalMasterInfo(ProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectList("Proposal.selectProposalMasterInfo", searchVO);
	}
	
	public List<EgovMap> selectProposalMasterInfoCount(ProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectList("Proposal.selectProposalMasterInfoCount", searchVO);
	}
	
	public ProposalVO selectProposalDetailInfo(ProposalSearchVO searchVO) {
		return dao.selectOne("Proposal.selectProposalDetailInfo", searchVO);
	}
	
	public int insertProposalInfo(ProposalVO proposalVO) {
		// TODO Auto-generated method stub
		return dao.insert("Proposal.insertProposalInfo", proposalVO);
	}
	
	public int updateProposalInfo(ProposalVO proposalVO) {
		return dao.update("Proposal.updateProposalInfo", proposalVO);
	}
}
