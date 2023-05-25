package kr.freedi.dev.qapprove.controller;

import java.io.File;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.article.domain.ArticleVO;
import kr.freedi.dev.article.service.ArticleService;
import kr.freedi.dev.board.domain.BoardVO;
import kr.freedi.dev.board.service.BoardService;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.common.util.EncriptUtil;
import kr.freedi.dev.common.util.MapUtil;
import kr.freedi.dev.qapprove.domain.ApproveSearchVO;
import kr.freedi.dev.qapprove.domain.ApproveVO;
import kr.freedi.dev.qapprove.service.ApproveService;
import kr.freedi.dev.qproposal.domain.ProposalSearchVO;
import kr.freedi.dev.qproposal.domain.ProposalVO;
import kr.freedi.dev.qproposal.service.ProposalService;
import kr.freedi.dev.qreport.domain.ReportDetailVO;
import kr.freedi.dev.qreport.domain.ReportIndicatorVO;
import kr.freedi.dev.qreport.domain.ReportResultVO;
import kr.freedi.dev.qreport.domain.ReportSearchVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;
import kr.freedi.dev.qreport.domain.ReportVO;
import kr.freedi.dev.qreport.service.ReportService;
import kr.freedi.dev.user.domain.UserVO;

/**
 * @project : dev_default
 * @file 	: ReportController.java
 * @date	: 2023. 3. 27
 * @author	: swpark
 * @comment : 과제 - 등록
 * @history	: 
 */
@Controller
@RequestMapping({"/apprv"})
public class ApproveController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_TABLE_PREFIX = "TB";
	
	@Resource(name = "approveService")
	private ApproveService service;
	
	@Resource(name = "reportService")
	private ReportService reportService;
	
	@Resource(name = "proposalService")
	private ProposalService proposalService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}
	

	// 과제 - 리스트
	@RequestMapping({"/list.do"})
	public String handler_list(HttpServletRequest request, ModelMap model,
			@ModelAttribute("approveVO") ApproveVO approveVO,
			@ModelAttribute("approveSearchVO") ApproveSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		List<EgovMap> countList = service.selectListCount(searchVO);
		
		int totalCount = 0;
		for (EgovMap egovMap : countList) {
			BigDecimal currVal = (BigDecimal)egovMap.get("cnt");
			totalCount = totalCount + currVal.intValue();
			String codeNm = (String)egovMap.get("aprovalState");
			if(codeNm!=null) {
				model.addAttribute("count_"+codeNm, currVal.intValue());
			}
		}
		
		//페이징 기본설정8
		searchVO.setTotalRecordCount(totalCount);
		
		model.addAttribute("approveList", service.selectList(searchVO));
		model.addAttribute("totalCount", totalCount);
	
		// 검색조건 DDL 세팅
		CodeVO codeVO = new CodeVO(); 
		codeVO.setCodeGrpId("APR_TYPE");
		codeVO.setActFlg("Y"); 
		model.addAttribute("searchTypeCd", codeService.selectFullList(codeVO));
		
		codeVO.setCodeGrpId("APR_STAT");
		codeVO.setActFlg("Y"); 
		model.addAttribute("searchStatusCd", codeService.selectFullList(codeVO));
		
		return "app/approve/List";
	}

	
	// 과제 - 뷰페이지
	@RequestMapping({"/apprForm.do"})
	public String view(HttpServletRequest req, ModelMap model,
			@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO,
			@ModelAttribute("approveVO") ApproveVO approveVO, 
			UserVO userSession) throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		model.addAttribute("action", "/apprv/updateStatus.do");
		// TODO 결재건 종류에 따른 서브페이지 로딩하기.(조건문 분기하기)
		ApproveVO savedVO = service.select(approveVO);
		
		if("1|2".indexOf(savedVO.getRefBusType())>-1) {
			// TODO 과제/분임조과제 페이지 이동
			ReportVO reportVO = new ReportVO();
			reportVO.setRepCode(Integer.parseInt(savedVO.getRefBusCode())); // 임시로  결재번호를 과제번호로 쓰고 있음. 쿼리 등 다 정리 필요함. (결재프로세스 정립이 안되었음)
			ReportVO dbReportVO = reportService.proc_reportFormHandler(req, model, searchVO, reportVO, userSession);
			model.addAttribute("reportVO", dbReportVO);
			model.addAttribute("approveVO", savedVO);
			return "app/approve/ApprForm"; // 과제 페이지
		} else if("3|4".indexOf(savedVO.getRefBusType()) > -1) {
			ProposalSearchVO searchProposalVO = new ProposalSearchVO();
			searchProposalVO.setSearchPropSeq(Integer.valueOf(savedVO.getRefBusCode()));
			ProposalVO proposalVO = proposalService.selectProposalDetailInfo(searchProposalVO);
			model.addAttribute("proposalVO", proposalVO);		
			return "app/approve/ApprForm"; // 과제 페이지
			//return "redirect:apprv/list.do?menuKey=73"; // 과제 페이지
		} else {
			return "redirect:apprv/list.do?menuKey=73";
		}		
	}  
	
	@RequestMapping({"/updateStatus.do"})
	public String save(HttpServletRequest req, ModelMap model,
			@ModelAttribute("approveVO") ApproveVO approveVO,
			UserVO userSession, 
			String userIp) throws Exception {
		
		//ApproveVO savedVO = service.select(approveVO);
		//approveVO.setDetailList(savedVO.getDetailList());  //form에 없는 detailList 조회
		
		// 결재 갱신
		service.updateStatus(approveVO);
		
		
		/**************
		 * 업무 상태 변경
		 **************/
		// 과제/분임조 
		if("1,2".indexOf(approveVO.getRefBusType())>-1) {
			
			// 상태 업데이트를위한 reportvo 파라메터 셋팅
			ReportVO reportVO = new ReportVO();
			reportVO.setRepCode(Integer.parseInt(approveVO.getRefBusCode()));
			reportVO.setRepUpdateUser(userSession.getUserId());
			
			// 과제등록(과제/분임조)
			if("1,2".indexOf(approveVO.getAprovalType())>-1) {
				// (rep_code, rep_status_code)
				if(approveVO.getAprovalState().equals("4")) {	//승인
					// OK : 6시그마 ; 3(진행중), 일반 ; 6(완료)
					reportVO.setRepStatusCode("3");
				} else if(approveVO.getAprovalState().equals("3")) { // Drop
					// DROP : 5
					reportVO.setRepStatusCode("5");
				}
				reportService.updateStatus(reportVO);	
			} else if (approveVO.getAprovalType().equals("3")) {
				// 6시그마
				
				reportService.update6SigmaStepNext(reportVO);
			}
			
		}
		return "redirect:/sub.do?menuKey=73";
	}
	
	@RequestMapping({"/updateForm.do"})
	public String updateForm(HttpServletRequest request, ModelMap model,
			@ModelAttribute("reportVO") ReportVO reportVO,
			@ModelAttribute("reportSearchVO") ReportSearchVO searchVO, 
			UserVO userSession)throws Exception {

		
		//Integer paramRepCode = reportVO.getRepCode();
		ReportVO tReportVO = new ReportVO();
		//tReportVO = reportService.select(reportVO);
		
		if(tReportVO.getRepStatusCode().equals("1")) {
			return "redirect:./insertForm.do?menuKey="+searchVO.getMenuKey()+"&repCode="+reportVO.getRepCode();
		} else {
			model.addAttribute("reportVO", tReportVO);
			
			return "redirect:./updateForm.do?menuKey="+searchVO.getMenuKey()+"&repCode="+reportVO.getRepCode();
		}
	}
	
	@RequestMapping({"/ReqList.do"})
	public String handler_reqList(HttpServletRequest request, ModelMap model,
			@ModelAttribute("approveVO") ApproveVO approveVO,
			@ModelAttribute("approveSearchVO") ApproveSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		

		List<EgovMap> countList = service.selectMyRequestListCount(searchVO);
		
		int totalCount = 0;
		for (EgovMap egovMap : countList) {
			BigDecimal currVal = (BigDecimal)egovMap.get("cnt");
			totalCount = totalCount + currVal.intValue();
			String codeNm = (String)egovMap.get("aprovalState");
			if(codeNm!=null) {
				model.addAttribute("count_"+codeNm, currVal.intValue());
			}
		}

		//페이징 기본설정
		searchVO.setTotalRecordCount(totalCount);
		searchVO.setSearchUserId(userSession.getUserId());
		
		// 검색조건 DDL 세팅
		CodeVO codeVO = new CodeVO(); 
		codeVO.setCodeGrpId("APR_TYPE");
		codeVO.setActFlg("Y"); 
		model.addAttribute("searchTypeCd", codeService.selectFullList(codeVO));
		
		codeVO.setCodeGrpId("APR_STAT");
		codeVO.setActFlg("Y"); 
		model.addAttribute("searchStatusCd", codeService.selectFullList(codeVO));
		
		List<ApproveVO> approveList = service.selectMyRequestList(searchVO);
		model.addAttribute("approveList", approveList);
		model.addAttribute("totalCount", totalCount);
		
		return "app/approve/ReqList";
	}
	
	@RequestMapping({"/ReqViewReport.do"})
	public String handler_reqViewReport(HttpServletRequest request, ModelMap model,
			@ModelAttribute("approveVO") ApproveVO approveVO,
			@ModelAttribute("approveSearchVO") ApproveSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());

		return "app/approve/ReqViewReport";
	}
  
	@RequestMapping({"/ReqViewProps.do"})
	public String handler_reqViewPropose(HttpServletRequest request, ModelMap model,
			@ModelAttribute("approveVO") ApproveVO approveVO,
			@ModelAttribute("approveSearchVO") ApproveSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());

		return "app/approve/ReqViewProps";
	}
}

