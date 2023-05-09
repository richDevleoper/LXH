package kr.freedi.dev.qproposal.service;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qproposal.domain.ProposalSearchVo;

@Service("proposalService")
public class ProposalService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_PREFIX = "proposal";
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;

	public EgovMap selectListCount(ProposalSearchVo searchVO) {
		// TODO Auto-generated method stub
		return dao.selectOne("Proposal.selectListCount", searchVO);
	}
}
