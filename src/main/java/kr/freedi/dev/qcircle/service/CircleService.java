package kr.freedi.dev.qcircle.service;

import javax.annotation.Resource;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qcircle.domain.CircleVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;

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
@Service("circleService")
public class CircleService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	
//	public void save(ReportTeamVO teamVO) throws Exception {
//		if(teamVO.getRepTeamCode()==null) {
//			this.insert(teamVO);
//		} else {
//			this.update(teamVO);
//		}
//	}
//	
//	public void insert(ReportTeamVO teamVO) throws Exception {
//		
//		if(teamVO.getComNo()!=null && !teamVO.getComNo().isEmpty()) {
//			Integer teamCode = (Integer)dao.selectOne("ReportTeam.selectNextFkey");
//			teamVO.setRepTeamCode(teamCode);
//			dao.insert("ReportTeam.insert", teamVO);
//		}
//	}
//	
//	public void update(ReportTeamVO teamVO) throws Exception {
//		
//		dao.update("ReportTeam.update", teamVO);
//	}
//	
//	public List<ReportTeamVO> selectFullList(ReportTeamVO reportTeamVO) {
//		
//		return dao.selectList("ReportTeam.selectFullList", reportTeamVO);
//	}
	
	public CircleVO select(ReportTeamVO teamVO) throws Exception {
		
		return dao.selectOne("Circle.select");
	}
	
	public CircleVO findCircleInfo(ReportTeamVO vo) throws Exception {
	
		return dao.selectOne("Circle.findCircleInfo", vo);
	}
	
}
