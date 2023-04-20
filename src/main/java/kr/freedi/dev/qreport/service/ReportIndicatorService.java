package kr.freedi.dev.qreport.service;

import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qreport.domain.ReportIndicatorVO;
import kr.freedi.dev.qreport.domain.ReportResultVO;
import kr.freedi.dev.qreport.domain.ReportVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: ReportTeamService.java
 * @date	: 2023. 4. 6.
 * @author	: swpark
 * @comment : 과제 멤버 Service 
 * @history	: 
 */
@Service("reportIndicatorService")
public class ReportIndicatorService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	
	public void insert(ReportIndicatorVO vo) throws Exception {
		
		Integer newKey = (Integer)dao.selectOne("ReportIndicator.selectNextFkey");
		vo.setRepIndiCode(newKey);
		dao.insert("ReportIndicator.insert", vo);
	}
	
	public void update(ReportIndicatorVO vo) throws Exception {
		
		dao.update("ReportIndicator.update", vo);
	}
	
	public void save(ReportIndicatorVO vo) throws Exception {
		if(vo.getRepIndiCode()==null) {
			this.insert(vo);
		} else {
			this.update(vo);
		}
	}
	
	public List<ReportIndicatorVO> selectFullList(ReportIndicatorVO reportIndicatorVO) {
		
		return dao.selectList("ReportIndicator.selectFullList", reportIndicatorVO);
	}
	
}
