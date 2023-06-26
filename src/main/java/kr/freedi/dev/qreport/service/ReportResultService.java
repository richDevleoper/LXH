package kr.freedi.dev.qreport.service;

import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qreport.domain.ReportResultVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;


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
	
	public void insert(ReportResultVO vo) throws Exception {
		
		Integer newKey = (Integer)dao.selectOne("ReportResult.selectNextFkey");
		if(newKey==null)
			newKey = 1;
		vo.setRepResultCode(newKey);
		dao.insert("ReportResult.insert", vo);
	}
	
	public void update(ReportResultVO vo) throws Exception {
		
		dao.update("ReportResult.update", vo);
	}
	
	public void save(ReportResultVO vo) throws Exception {
		if(vo.getRepResultCode()==null) {
			this.insert(vo);
		} else {
			this.update(vo);
		}
	}
	
	public List<ReportResultVO> selectFullList(ReportResultVO vo) {
		
		return dao.selectList("ReportResult.selectFullList", vo);
	}
	
	public void delete(ReportResultVO vo) {
		
		// 과제성과
		dao.delete("ReportResult.delete", vo);  	// 결재선 지우기
	}
	
}
