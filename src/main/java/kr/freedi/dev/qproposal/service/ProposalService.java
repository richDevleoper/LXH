package kr.freedi.dev.qproposal.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qpopup.domain.UserVO;
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
	
	public List<EgovMap> selectProposalStateByCount(ProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectList("Proposal.selectProposalStateByCount", searchVO);
	}
	
	public List<EgovMap> selectProposalClassByCount(ProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectList("Proposal.selectProposalClassByCount", searchVO);
	}

	public List<ProposalVO> selectProposalMasterInfo(ProposalSearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.selectList("Proposal.selectProposalMasterInfo", searchVO);
	}
	
	public ProposalVO selectProposalDetailInfo(ProposalSearchVO searchVO) {
		return dao.selectOne("Proposal.selectProposalDetailInfo", searchVO);
	}
	
	public int insertProposalInfo(ProposalVO proposalVO) {
		// TODO Auto-generated method stub
		System.out.println("프로포살 ... ==>"+proposalVO.toString());
		return dao.insert("Proposal.insertProposalInfo", proposalVO);
	}
	
	public int updateProposalInfo(ProposalVO proposalVO) {
		return dao.update("Proposal.updateProposalInfo", proposalVO);
	}
	
	public List<ProposalVO> selectProposalMasterInfoWithOutPaging(ProposalSearchVO searchVO) {
		return dao.selectList("Proposal.selectProposalMasterInfoWithOutPaging", searchVO);
	}
	
	public String selectApproverCode(EgovMap param) {
		return dao.selectOne("Proposal.selectApproverCode", param);
	}
	
	public List<EgovMap> selectApproverUserInfo(UserVO userVO){
		return dao.selectList("Users.selectList", userVO);
	}
	
	public List<EgovMap> selectCircleInfo(Map<String, Object> reqMap) {
		return dao.selectList("Proposal.selectCircleInfo", reqMap);
	}
	public String selectProposalEmail(String comNo) {
		return dao.selectOne("Proposal.selectProposalEmail", comNo);
	}
}
