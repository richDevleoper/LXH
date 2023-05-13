package kr.freedi.dev.qpopup.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.freedi.dev.article.domain.ArticleVO;
import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.attachfile.service.AttachFileService;
import kr.freedi.dev.board.service.BoardService;
import kr.freedi.dev.board.service.BoardUseService;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qpopup.domain.UserVO;
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
 * @file 	: ReportService.java
 * @date	: 2023. 3. 27.
 * @author	: swpark
 * @comment : 과제 Service 
 * @history	: 
 */
@Service("qPopupService")
public class QPopupService {

	protected Log log = LogFactory.getLog(this.getClass());
	

	@Resource(name = "defaultDAO")
	private DefaultDAO dao;

	public List<EgovMap> select(UserVO userVO) {
		
		return dao.selectList("Users.selectList", userVO); 
	}
	
//	public void insert(ReportVO reportVO) throws Exception {
//
//		Integer repCode = (Integer)dao.selectOne("Report.selectNextFkey");
//		reportVO.setRepCode(repCode);
//		reportVO.setRepMenuCode("REPORT"); //REPORT-과제, TEAM-분임조
//		
//		dao.insert("Report.insert", reportVO);
//	}
//	
//	public void update(ReportVO reportVO) throws Exception {
//
//		dao.update("Report.update", reportVO);
//	}
//
//	public List<ReportVO> selectList(ReportSearchVO searchVO) {
//		
//		return dao.selectList("Report.selectList", searchVO);
//	}
//	
//	public int selectListCount(ReportSearchVO searchVO) {
//		return (Integer) dao.selectOne("Report.selectListCount", searchVO);
//	}	
}