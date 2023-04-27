package kr.freedi.dev.qapprove.service;


import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.article.domain.ArticleVO;
import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.attachfile.service.AttachFileService;
import kr.freedi.dev.board.service.BoardService;
import kr.freedi.dev.board.service.BoardUseService;
import kr.freedi.dev.common.dao.DefaultDAO;
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

	public void insert(ReportVO reportVO) throws Exception {

		
		String userId = reportVO.getRepRegUser();
		
		dao.insert("Report.insert", reportVO);
		
	}
	
	public void update(ReportVO reportVO) throws Exception {

		
		String userId = reportVO.getRepUpdateUser();
		
		dao.update("Report.update", reportVO);
		
		
		
	}

	public List<ReportVO> selectList(ReportSearchVO searchVO) {
		
		return dao.selectList("Report.selectList", searchVO);
	}
	
	public int selectListCount(ReportSearchVO searchVO) {
		return (Integer) dao.selectOne("Report.selectListCount", searchVO);
	}
	
	public List<EgovMap> selectListCount2(ReportSearchVO searchVO) {
		return dao.selectList("Report.selectListCount2", searchVO); // 상태 종류별 카운트 
	}
	
	public ReportVO select(ReportVO reportVO) {
		ReportVO resultVO = (ReportVO)dao.selectOne("Report.select", reportVO);
		
		return resultVO;
	}
	
}
