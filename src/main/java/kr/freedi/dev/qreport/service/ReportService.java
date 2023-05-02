package kr.freedi.dev.qreport.service;


import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.attachfile.service.AttachFileService;
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
 * @file 	: ReportService.java
 * @date	: 2023. 3. 27.
 * @author	: swpark
 * @comment : 과제 Service 
 * @history	: 
 */
@Service("reportService")
public class ReportService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_PREFIX = "report";
	
	final String USER_TYP_MNGR = "MNGR_USER";
	

	@Resource(name = "defaultDAO")
	private DefaultDAO dao;

	@Resource(name = "reportDetailService")
	private ReportDetailService reportDetailService;
	
	@Resource(name = "reportTeamService")
	private ReportTeamService reportTeamService;
	
	@Resource(name = "reportResultService")
	private ReportResultService reportResultService;
	
	@Resource(name = "reportIndicatorService")
	private ReportIndicatorService reportIndicatorService;
	
	@Resource
	private AttachFileService attachFileService;
	
	
	
	public void insert(ReportVO reportVO) throws Exception {


		//reportVO.setRepMenuCode("REPORT"); //REPORT-과제, TEAM-분임조
		
		// report_team
		// report_detail
		// report_result
		// report_indicators
		dao.insert("Report.insert", reportVO);
		
		// 2. 팀구성 및 승인자 저장(tb_report_team)
		ReportTeamVO teamMember3 = new ReportTeamVO(); // 지도사원
		ReportTeamVO teamMember5 = new ReportTeamVO(); // 챔피언
		for (ReportTeamVO vo : reportVO.getRepTeamMemberList()) {
			vo.setRepCode(reportVO.getRepCode());
			reportTeamService.insert(vo);	
			
			if(vo.getRepTeamMemRole().equals("3"))
				teamMember3 = vo;
			else if(vo.getRepTeamMemRole().equals("5"))
				teamMember5 = vo;
		}
		
		// 1. 일정 저장(tb_report_detail)
		for (ReportDetailVO vo : reportVO.getRepDetailList()) {
			vo.setRepCode(reportVO.getRepCode());
			vo.setRepDivisionCode(reportVO.getRepDivisionCode());
			
			if(reportVO.getRepDivisionCode().equals("2")) {
				vo.setRepStepCode("7");
			}
		
			
			switch (vo.getRepStepCode()) {

			case "1": // 6시그마 첫 step
			case "7": // 일반과제
				vo.setRepStatus("1");
			case "6": // 6시그마 마지막 step				
				vo.setRepApprovalMemCode(teamMember3.getComNo());
				vo.setRepApprovalMemRole(teamMember3.getRepTeamMemRole());
				// 챔피언
				break;
			default:
				// 2,3,4,5 : 지도사원
				vo.setRepApprovalMemCode(teamMember5.getComNo());
				vo.setRepApprovalMemRole(teamMember5.getRepTeamMemRole());
				break;
			}
			if(vo.getRepPlanStartDate()!=null)
				reportDetailService.insert(vo);
		}
		
		// 3. 성과 tb_report_result 저장
		for (ReportResultVO vo : reportVO.getRepResultList()) {
			vo.setRepCode(reportVO.getRepCode());
			reportResultService.insert(vo);	
		}
		
		// 4. 주요지표 tb_report_indicator 저장
		for (ReportIndicatorVO vo : reportVO.getRepIndicatorList()) {
			vo.setRepCode(reportVO.getRepCode());
			reportIndicatorService.insert(vo);	
		}
	}
	
	public void update(ReportVO reportVO) throws Exception {

		// report_detail 저장
		// report_team 저장
		// report_result 저장
		// report_indicator 저장
		
		// 각 항목 키가 있으면 저장, 없으면 update
		// 서비스에 해당 기능 만들어서 vo 던지기.
		
		
		dao.update("Report.update", reportVO);
		
		for (ReportDetailVO vo : reportVO.getRepDetailList()) {
			reportDetailService.save(vo);
		}
		
		for (ReportTeamVO vo : reportVO.getRepTeamMemberList()) {
			reportTeamService.save(vo);	
		}
		
		for (ReportResultVO vo : reportVO.getRepResultList()) {
			reportResultService.save(vo);	
		}
		
		for (ReportIndicatorVO vo : reportVO.getRepIndicatorList()) {
			reportIndicatorService.save(vo);	
		}
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
		// 과제 팀원
		if(resultVO != null){
			
			ReportDetailVO reportDetailVO = new ReportDetailVO();
			reportDetailVO.setRepCode(reportVO.getRepCode());
			resultVO.setRepDetailList(reportDetailService.selectFullList(reportDetailVO));
			
			ReportTeamVO reportTeamVO = new ReportTeamVO();
			reportTeamVO.setRepCode(reportVO.getRepCode());
			resultVO.setRepTeamMemberList(reportTeamService.selectFullList(reportTeamVO));
			
			ReportResultVO reportResultVO = new ReportResultVO();
			reportResultVO.setRepCode(reportVO.getRepCode());
			resultVO.setRepResultList(reportResultService.selectFullList(reportResultVO));
			
			ReportIndicatorVO reportIndicatorVO = new ReportIndicatorVO();
			reportIndicatorVO.setRepCode(reportVO.getRepCode());
			resultVO.setRepIndicatorList(reportIndicatorService.selectFullList(reportIndicatorVO));
			
			AttachFileVO attachFileVO = null;
			attachFileVO = new AttachFileVO();
			attachFileVO.setFileId(ATTACH_PREFIX + "_" + reportVO.getRepCode());
			attachFileVO.setDeleteFlg("N");
			resultVO.setFileList(attachFileService.selectFullList(attachFileVO));
		}
		return resultVO;
	}
	

}
