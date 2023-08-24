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
import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.attachfile.service.AttachFileService;
import kr.freedi.dev.board.domain.BoardVO;
import kr.freedi.dev.board.service.BoardService;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.common.util.EncriptUtil;
import kr.freedi.dev.common.util.MapUtil;
import kr.freedi.dev.qapprove.domain.ApproveDetailVO;
import kr.freedi.dev.qapprove.domain.ApproveSearchVO;
import kr.freedi.dev.qapprove.domain.ApproveVO;
import kr.freedi.dev.qapprove.service.ApproveService;
import kr.freedi.dev.qcircle.domain.CircleVO;
import kr.freedi.dev.qcircle.service.CircleService;
import kr.freedi.dev.qproposal.domain.ProposalSearchVO;
import kr.freedi.dev.qproposal.domain.ProposalVO;
import kr.freedi.dev.qproposal.service.ProposalService;
import kr.freedi.dev.qreport.domain.ReportDetailVO;
import kr.freedi.dev.qreport.domain.ReportIndicatorVO;
import kr.freedi.dev.qreport.domain.ReportResultVO;
import kr.freedi.dev.qreport.domain.ReportSearchVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;
import kr.freedi.dev.qreport.domain.ReportVO;
import kr.freedi.dev.qreport.service.ReportDetailService;
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
	
	@Resource(name = "reportDetailService")
	private ReportDetailService reportDetailService;
	
	@Resource(name = "proposalService")
	private ProposalService proposalService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	@Resource(name = "circleService")
	private CircleService circleService;
	
	
	
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
		
		// 조회조건 설정
		searchVO.setSearchUserId(userSession.getUserId());

		// 건수 조회
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
		
		//페이징 기본설정
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
			if(savedVO.getRefBusType().equals("2")) {
				// 분임조 과제이면 분임조 정보 가져오기
				ReportTeamVO memberVO = new ReportTeamVO();
				memberVO.setComNo(dbReportVO.getRepRegUser());
				
				CircleVO circleVO = circleService.findCircleInfo(memberVO);
				model.addAttribute("circleVO", circleVO);
			}
			return "app/approve/ApprForm"; // 과제 페이지
		} else if("3|4".indexOf(savedVO.getRefBusType()) > -1) { // 제안 결제 상세화면 처리
			
			ProposalSearchVO searchProposalVO = new ProposalSearchVO();
			searchProposalVO.setSearchPropSeq(Integer.valueOf(savedVO.getRefBusCode()));
			
			ProposalVO proposalVO = proposalService.selectProposalDetailInfo(searchProposalVO);

			// 첨부파일 로딩
			AttachFileVO fileVO = new AttachFileVO();
			fileVO.setFileId("proposal_before_" + proposalVO.getPropSeq());
			List<AttachFileVO> beforeAttachFileList = attachFileService.selectFullList(fileVO); // 개선 전
			fileVO.setFileId("proposal_after_" + proposalVO.getPropSeq());
			List<AttachFileVO> afterAttachFileList = attachFileService.selectFullList(fileVO); // 개선 후
			fileVO.setFileId("proposal_attach_" + proposalVO.getPropSeq());
			List<AttachFileVO> attachFileList = attachFileService.selectFullList(fileVO); //첨부 파일
			
			proposalVO.setBeforeAttachFileList(beforeAttachFileList);
			proposalVO.setAfterAttachFileList(afterAttachFileList);
			proposalVO.setAttachFileList(attachFileList);
			
			// 사용자 VO
			kr.freedi.dev.qpopup.domain.UserVO userVO = new kr.freedi.dev.qpopup.domain.UserVO();
			userVO.setComNo(proposalVO.getPropApproverCode());				
			List<EgovMap> userInfo = proposalService.selectApproverUserInfo(userVO);
			
			if(userInfo != null && userInfo.size() > 0) {
				for(int index = 0; index < userInfo.size(); index++) {
					EgovMap item = userInfo.get(index);
					proposalVO.setPropApprovalUser(String.valueOf(item.get("comNo")));
					proposalVO.setPropApprovalName(String.valueOf(item.get("userName")));
					proposalVO.setPropApprovalLevelCode(String.valueOf(item.get("comJobx")));
					proposalVO.setPropApprovalLevel(String.valueOf(item.get("comJobxNm")));
					proposalVO.setPropApprovalDutyCode(String.valueOf(item.get("comPosition")));
					proposalVO.setPropApprovalDuty(String.valueOf(item.get("comPositionNm")));
					proposalVO.setPropApprovalBeltCode(String.valueOf(item.get("comCertBelt")));
					proposalVO.setPropApprovalBelt(String.valueOf(item.get("comCertBeltNm")));
					proposalVO.setPropApprovalGroup(String.valueOf(item.get("deptFullName")));
					proposalVO.setPropApprovalGroupCode(String.valueOf(item.get("comDepartCode")));
				}
			}

			
			
			model.addAttribute("proposalVO", proposalVO);
			model.addAttribute("approveVO", savedVO);
			model.addAttribute("sessionCompNo", userSession.getIntfUserVO().getComNo());
			return "app/approve/ApprFormPropose"; // 제안 페이지
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
		
		ApproveVO dbApproveVO = service.select(approveVO);
		// 결재자별 상태 저장(approvalDetail) 아직 결재하지 않은 결재자가 있는지 체크 (있으면 업무상태 변경하지 않음)
		Boolean apprComplete = service.updateStatus(approveVO, userSession);
		if(apprComplete) {  // 모든 결재자가 결재가 완료되었으면
			
		

			/**************
			 * 업무 상태 변경 
			 * code_grp_id='REP_STAT'; (reportVO.repStatusCode)
				1	임시저장
				2	선정중
				3	선정완료
				4	진행중(On)
				5	진행중(Off)
				6	Drop
				7	완료
				8	반려
				9	DROP결재중
			 **************/
			// 과제/분임조 
			
			
			System.out.println("approveVO.getRefBusType()" + approveVO.getRefBusType());
			if("1,2".indexOf(approveVO.getRefBusType())>-1) {  //과제등록시
				
				// 상태 업데이트를위한 reportvo 파라메터 셋팅
				ReportVO reportVO = new ReportVO();
				reportVO.setRepCode(Integer.parseInt(approveVO.getRefBusCode()));
				reportVO.setRepUpdateUser(userSession.getUserId());
				
				if("1".indexOf(approveVO.getAprovalType())>-1) {    // 과제등록(과제/분임조)
					// (rep_code, rep_status_code)
					if(approveVO.getAprovalState().equals("4")) {	//승인
						// OK : 6시그마 ; 3(진행중), 일반 ; 6(완료)  code_grp_id='REP_STAT'
						reportVO.setRepStatusCode("3");	// 선정완료
						ReportDetailVO detailVO = new ReportDetailVO();
						detailVO.setRepCode(reportVO.getRepCode());
						detailVO.setRepStepCode("1");
						detailVO.setRepStatus("1");
						detailVO.setRepUpdateUser(userSession.getUserId());
						reportDetailService.updateStepStatus(detailVO);
						
					} else if(approveVO.getAprovalState().equals("3")) { // 반려
						// 반려 상태로 변경
						reportVO.setRepStatusCode("8");
					}
					reportService.updateStatus(reportVO);
				} else if (approveVO.getAprovalType().equals("3")) {  // 6시그마 단계별 승인
				
					if(approveVO.getAprovalState().equals("4")) {	//승인
						//일단 여기 타는게 맞고
						reportService.update6SigmaStepNext(reportVO);
						ReportDetailVO detailVO = new ReportDetailVO();
						detailVO.setRepCode(reportVO.getRepCode());
					}else if(approveVO.getAprovalState().equals("3")) { // 반려
						//reportService.update6SigmaStepBefore(reportVO);
						reportVO.setRepStatusCode("10"); // 반려(6SIG)
						reportService.updateStatus(reportVO);
					}
				} else if(approveVO.getAprovalType().equals("2")) {  // Drop결재건 승인시
					
					if(approveVO.getAprovalState().equals("4")) {	//승인
						// OK : 6시그마 ; 3(진행중), 일반 ; 6(완료)  code_grp_id='REP_STAT'
						reportVO.setRepStatusCode("6");	// 과제상태 Drop 저장
					} else if(approveVO.getAprovalState().equals("3")) { // 반려
						// DROP : 6
						reportVO.setRepStatusCode("4"); // 과제상태 진행중(On) 으로 
					}
					reportService.updateStatus(reportVO);
				}
				
			} else {
				// 제안 결재 승인시
				// 제안마스터의 PROP_PROP_STAT_CODE 값을 3으로 바꿔주기
				ProposalSearchVO searchProposalVO = new ProposalSearchVO();
				searchProposalVO.setSearchPropSeq(Integer.valueOf(approveVO.getRefBusCode()));
				ProposalVO proposalVO = proposalService.selectProposalDetailInfo(searchProposalVO);
				if(proposalVO.getPropTypeCode().equals("PPS_TYP_1")) {
					if(approveVO.getAprovalState().equals("3")) {
						proposalVO.setPropPropStatCode("PRG_6");
						proposalVO.setPropEvalLvCode("NA");
					}else {
						int size = approveVO.getDetailList().size();
						if(size > 0 && approveVO.getDetailList().get(size-1) != null) {
							ApproveDetailVO detailItem = approveVO.getDetailList().get(size-1);
							//1차 평가 후 70점 이상인경우 2차 평가 결재 승인으로 넘어감 (제안 진행 단계 변하지 않음)
							if(Integer.parseInt(detailItem.getScoreTotal()) < 70 ) {
								proposalVO.setPropEvalLvCode("D");
								proposalVO.setPropEvalScore(detailItem.getScoreTotal());
								proposalVO.setPropPropStatCode("PRG_4"); // 70점 미만으로 등급평가 마감 (비용지급 처리 전)
							}else if(Integer.parseInt(detailItem.getScoreTotal()) >= 70 && Integer.parseInt(detailItem.getScoreTotal()) < 80) {
								//70점 이상으로 2차 평가 진행
								proposalVO.setPropEvalLvCode("C");
								proposalVO.setPropEvalScore(detailItem.getScoreTotal());
								proposalVO.setPropPropStatCode("PRG_4");
							}else if(Integer.parseInt(detailItem.getScoreTotal()) >= 80 && Integer.parseInt(detailItem.getScoreTotal()) < 90) {
								//70점 이상으로 2차 평가 진행
								proposalVO.setPropEvalLvCode("B");
								proposalVO.setPropEvalScore(detailItem.getScoreTotal());
								proposalVO.setPropPropStatCode("PRG_4");							
							}else if(Integer.parseInt(detailItem.getScoreTotal()) >= 90 && Integer.parseInt(detailItem.getScoreTotal()) < 95) {
								proposalVO.setPropEvalLvCode("A");
								proposalVO.setPropEvalScore(detailItem.getScoreTotal());
								proposalVO.setPropPropStatCode("PRG_4");							
							}else if(Integer.parseInt(detailItem.getScoreTotal()) >= 95) {
								proposalVO.setPropEvalLvCode("S");
								proposalVO.setPropEvalScore(detailItem.getScoreTotal());
								proposalVO.setPropPropStatCode("PRG_4");								
							}
						}				
					}			
					proposalVO.setPropRegUser(userSession.getUserId());						
				}else {
					proposalVO.setPropPropStatCode("PRG_6");		
				}
				proposalService.updateProposalInfo(proposalVO);
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
		
		searchVO.setSearchRegUserId(userSession.getUserId());

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
	
	
	/***
	 * 결재의뢰함 리스트 >> 뷰페이지 링크
	 * 결재 타입에 따라 뷰페이지 유형을 달리한다.
	 * ***/
	@RequestMapping({"/viewApprv.do"})
	public String handler_viewApprv(HttpServletRequest request, ModelMap model,
			@ModelAttribute("approveVO") ApproveVO approveVO,
			@ModelAttribute("approveSearchVO") ApproveSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		
		
		approveVO = service.select(approveVO);
		System.out.println(approveVO);
		
		String strParam = "menuKey="+searchVO.getMenuKey()+"&aprovalCode="+approveVO.getAprovalCode();
		
		if("1,2".indexOf(approveVO.getRefBusType())>-1) {
			return "redirect:ReqViewReport.do?"+strParam;	
		} else {
			return "redirect:ReqViewProps.do?"+strParam;
		}
	}
	
	/***
	 * 결재의뢰함 리스트 >> 뷰페이지 링크 >> 과제 뷰페이지
	 * ***/
	@RequestMapping({"/ReqViewReport.do"})
	public String handler_reqViewReport(HttpServletRequest request, ModelMap model,
			@ModelAttribute("approveVO") ApproveVO approveVO,
			@ModelAttribute("approveSearchVO") ApproveSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		ApproveVO savedVO = service.select(approveVO);
		
		if("1,2".indexOf(savedVO.getRefBusType())>-1) {
			// TODO 과제/분임조과제 페이지 이동
			ReportVO reportVO = new ReportVO();
			reportVO.setRepCode(Integer.parseInt(savedVO.getRefBusCode())); // 임시로  결재번호를 과제번호로 쓰고 있음. 쿼리 등 다 정리 필요함. (결재프로세스 정립이 안되었음)
			ReportVO dbReportVO = reportService.select(reportVO);
			model.addAttribute("reportVO", dbReportVO);
			model.addAttribute("approveVO", savedVO);
			return "app/approve/ReqViewReport";
		} else {
			return "redirect:list.do";
		} 
		
	}
	/***
	 * 결재의뢰함 리스트 >> 뷰페이지 링크 >> 제안 뷰페이지
	 * ***/
	@RequestMapping({"/ReqViewProps.do"})
	public String handler_reqViewPropose(HttpServletRequest request, ModelMap model,
			@ModelAttribute("approveVO") ApproveVO approveVO,
			@ModelAttribute("approveSearchVO") ApproveSearchVO searchVO,
			UserVO userSession)throws Exception {
		
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		ApproveVO savedVO = service.select(approveVO);
		
		if("3,4".indexOf(savedVO.getRefBusType())>-1) {
			

			
			// TODO 제안 페이지 이동
			ProposalSearchVO searchProposalVO = new ProposalSearchVO();
			searchProposalVO.setSearchPropSeq(Integer.valueOf(savedVO.getRefBusCode()));
			
			ProposalVO proposalVO = proposalService.selectProposalDetailInfo(searchProposalVO);
			// 첨부파일 로딩
			
			AttachFileVO fileVO = new AttachFileVO();
			
			fileVO.setFileId("proposal_before_" + proposalVO.getPropSeq());
			List<AttachFileVO> beforeAttachFileList = attachFileService.selectFullList(fileVO); // 개선 전
			
			fileVO.setFileId("proposal_after_" + proposalVO.getPropSeq());
			List<AttachFileVO> afterAttachFileList = attachFileService.selectFullList(fileVO); // 개선 후
			
			fileVO.setFileId("proposal_attach_" + proposalVO.getPropSeq());
			List<AttachFileVO> attachFileList = attachFileService.selectFullList(fileVO); //첨부 파일
			
			proposalVO.setBeforeAttachFileList(beforeAttachFileList);
			proposalVO.setAfterAttachFileList(afterAttachFileList);
			proposalVO.setAttachFileList(attachFileList);
			
			// 사용자 VO
			kr.freedi.dev.qpopup.domain.UserVO userVO = new kr.freedi.dev.qpopup.domain.UserVO();
			userVO.setComNo(proposalVO.getPropApproverCode());				
			List<EgovMap> userInfo = proposalService.selectApproverUserInfo(userVO);
			
			if(userInfo != null && userInfo.size() > 0) {
				for(int index = 0; index < userInfo.size(); index++) {
					EgovMap item = userInfo.get(index);
					proposalVO.setPropApprovalUser(String.valueOf(item.get("comNo")));
					proposalVO.setPropApprovalName(String.valueOf(item.get("userName")));
					proposalVO.setPropApprovalLevelCode(String.valueOf(item.get("comJobx")));
					proposalVO.setPropApprovalLevel(String.valueOf(item.get("comJobxNm")));
					proposalVO.setPropApprovalDutyCode(String.valueOf(item.get("comPosition")));
					proposalVO.setPropApprovalDuty(String.valueOf(item.get("comPositionNm")));
					proposalVO.setPropApprovalBeltCode(String.valueOf(item.get("comCertBelt")));
					proposalVO.setPropApprovalBelt(String.valueOf(item.get("comCertBeltNm")));
					proposalVO.setPropApprovalGroup(String.valueOf(item.get("deptFullName")));
					proposalVO.setPropApprovalGroupCode(String.valueOf(item.get("comDepartCode")));
				}
			}

			
			model.addAttribute("proposalVO", proposalVO);
			model.addAttribute("approveVO", savedVO);
			model.addAttribute("sessionCompNo", userSession.getIntfUserVO().getComNo());
			return "app/approve/ReqViewProps";
		} else {
			return "redirect:list.do";
		} 
	}
	
	
	/**
	 * 제안 결재 (2차, 3차)
	 * */
	@RequestMapping({"/approveProposalReq.do"})
	public @ResponseBody String approveProposalReq(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap, UserVO userSession) throws Exception{
		ApproveDetailVO approveDetailVo = new ApproveDetailVO();
		approveDetailVo.setComNo(String.valueOf(reqMap.get("propApprovalUser")));
		approveDetailVo.setComDepartCode(String.valueOf(reqMap.get("propApprovalGroupCode")));
		approveDetailVo.setComJobx(String.valueOf(reqMap.get("propApprovalLevelCode")));
		approveDetailVo.setComPosition(String.valueOf(reqMap.get("propApprovalDutyCode")));
		approveDetailVo.setAprovalReqComNo(String.valueOf(reqMap.get("propUser")));
		approveDetailVo.setAprovalCode(String.valueOf(reqMap.get("aprovalCode")));
		
		service.insertDetailItem(approveDetailVo);
		
		/////////////////////////////////////////////////////////////////////////////////////
		//
		/////////////////////////////////////////////////////////////////////////////////////
		ApproveVO approveVo = new ApproveVO();
		approveVo.setAprovalCode(String.valueOf(reqMap.get("aprovalCode")));
		approveVo.setAprovalState("2"); // 현재로선 2차승인, 3차승인을 위해 원위치로 돌릴수 밖에 없음
		String actAprovalNo = service.selectApprovalActNo(approveVo);
		approveVo.setActAprovalNo(actAprovalNo);
		service.updateApprovalState(approveVo);
		service.updateApprovalActNo(approveVo);
		
		ObjectMapper mapper = new ObjectMapper();
		EgovMap resultItem = new EgovMap();
		resultItem.put("RESULT", "SUCCESS");
		String json = mapper.writeValueAsString(resultItem);
		return json;
	}

}

