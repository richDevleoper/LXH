package kr.freedi.dev.qreport.service;

import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qreport.domain.ReportResultVO;
import kr.freedi.dev.qreport.domain.ReportVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: ReportTeamService.java
 * @date	: 2023. 4. 7.
 * @author	: swpark
 * @comment : 과제 성과 VO
 * @history	: 
 */
@Service("reportResultService")
public class ReportResultService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	public void insert(ReportVO reportVO) throws Exception {

//		Integer repCode = (Integer)dao.selectOne("Report.selectNextFkey");
//		reportVO.setRepCode(repCode);
//		reportVO.setRepMenuCode("REPORT"); //REPORT-과제, TEAM-분임조
//		
//		dao.insert("Report.insert", reportVO);
	}
	
	public List<ReportResultVO> selectFullList(ReportResultVO reportTeamVO) {
		
		return dao.selectList("ReportResult.selectFullList", reportTeamVO);
	}
	
}
