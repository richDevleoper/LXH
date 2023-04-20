package kr.freedi.dev.qreport.service;

import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qreport.domain.ReportDetailVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

/**
 * @project : dev_default
 * @file 	: ReportTeamService.java
 * @date	: 2023. 4. 7.
 * @author	: swpark
 * @comment : 일정계획
 * @history	: 
 */
@Service("reportDetailService")
public class ReportDetailService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	public void insert(ReportDetailVO vo) throws Exception {
		
		Integer newKey = (Integer)dao.selectOne("ReportDetail.selectNextFkey");
		vo.setRepSeq(newKey);
		dao.insert("ReportDetail.insert", vo);
	}
	
	public void update(ReportDetailVO vo) throws Exception {
		
		dao.update("ReportDetail.update", vo);
	}
	
	public void save(ReportDetailVO vo) throws Exception {
		if(vo.getRepSeq()==null) {
			this.insert(vo);
		} else {
			this.update(vo);
		}
	}
	
	public List<ReportDetailVO> selectFullList(ReportDetailVO reportDetailVO) {
		
		return dao.selectList("ReportDetail.selectFullList", reportDetailVO);
	}
	
}
