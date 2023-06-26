package kr.freedi.dev.qreport.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.freedi.dev.article.service.ArticleCommentService;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qpopup.domain.UserVO;
import kr.freedi.dev.qreport.domain.ReportDetailVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;
import kr.freedi.dev.qreport.domain.ReportVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file : ReportTeamService.java
 * @date : 2023. 4. 6.
 * @author : swpark
 * @comment : 과제 멤버 Service
 * @history :
 */
@Service("reportTeamService")
public class ReportTeamService {

	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "defaultDAO")
	private DefaultDAO dao;

	public void save(ReportTeamVO teamVO) throws Exception {
		if (teamVO.getRepTeamCode() == null) {
			this.insert(teamVO);
		} else {
			this.update(teamVO);
		}
	}

	public void insert(ReportTeamVO teamVO) throws Exception {

		if (teamVO.getComNo() != null && !teamVO.getComNo().isEmpty()) {
			Integer teamCode = (Integer) dao.selectOne("ReportTeam.selectNextFkey");
			if (teamCode == null)
				teamCode = 1;
			teamVO.setRepTeamCode(teamCode);
			dao.insert("ReportTeam.insert", teamVO);
		}
	}

	public void update(ReportTeamVO teamVO) throws Exception {

		dao.update("ReportTeam.update", teamVO);
	}

	public List<ReportTeamVO> selectFullList(ReportTeamVO reportTeamVO) {

		return dao.selectList("ReportTeam.selectFullList", reportTeamVO);
	}

	public List<ReportTeamVO> selectCircleFullList(ReportTeamVO reportTeamVO) {

		return dao.selectList("ReportTeam.selectCircleFullList", reportTeamVO);
	}

	public ReportTeamVO selectCircleInfo(ReportTeamVO teamVO) throws Exception {

		return null;
	}

	public void delete(ReportTeamVO reportTeamVO) {

		// 팀원정보 삭제
		dao.delete("ReportTeam.delete", reportTeamVO); // 결재선 지우기
	}

}
