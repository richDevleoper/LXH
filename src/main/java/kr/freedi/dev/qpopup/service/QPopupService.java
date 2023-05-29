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
import kr.freedi.dev.qpopup.domain.DepartVO;
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
 * @file 	: QPopupService.java
 * @date	: 2023. 3. 27.
 * @author	: swpark
 * @comment : 팝업 검색 
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
	
	public List<EgovMap> selectList(DepartVO departVO) {
		
		return dao.selectList("Depart.selectList", departVO); 
	}
		
}
