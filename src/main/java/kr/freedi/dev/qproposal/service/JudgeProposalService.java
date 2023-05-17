package kr.freedi.dev.qproposal.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qpopup.domain.UserVO;
import kr.freedi.dev.qproposal.domain.ProposalSearchVO;
import kr.freedi.dev.qproposal.domain.ProposalVO;

@Service("judgeProposalService")
public class JudgeProposalService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_PREFIX = "proposal";
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	public List<ProposalVO> selectProposalMasterInfo(ProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectList("Proposal.selectProposalMasterInfo", searchVO);
	}
	
	public EgovMap selectListCount(ProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectOne("Proposal.selectListCount", searchVO);
	}

	public List<EgovMap> selectProposalTypeByCount(ProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectList("Proposal.selectProposalTypeByCount", searchVO);
	}

	public ProposalVO selectProposalDetailInfo(ProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectOne("Proposal.selectProposalDetailInfo", searchVO);
	}

	public List<EgovMap> selectApproverUserInfo(UserVO userVO) {
		// TODO Auto-generated method stub
		return dao.selectList("Users.selectList", userVO);
	}
}
