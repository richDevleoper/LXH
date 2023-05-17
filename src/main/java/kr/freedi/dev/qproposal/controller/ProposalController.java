package kr.freedi.dev.qproposal.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.attachfile.service.AttachFileService;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.qapprove.domain.ApproveDetailVO;
import kr.freedi.dev.qapprove.domain.ApproveVO;
import kr.freedi.dev.qapprove.service.ApproveService;
import kr.freedi.dev.qproposal.domain.ProposalSearchVO;
import kr.freedi.dev.qproposal.domain.ProposalVO;
import kr.freedi.dev.qproposal.service.ProposalService;
import kr.freedi.dev.user.domain.UserVO;

@Controller
@RequestMapping({"/proposal"})
public class ProposalController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_TABLE_PREFIX = "TB";
	
	@Resource(name = "proposalService")
	private ProposalService proposalService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "proposalIdGnrService")
	private EgovIdGnrService idGnrService;
	
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	@Resource(name = "approveService")
	private ApproveService approveService;
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}
	
	@RequestMapping("/list.do")
	public String listView(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVo") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") ProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		if(searchVO.getSearchPropFromDate() == null && searchVO.getSearchPropToDate() == null) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			searchVO.setSearchPropToDate(df.format(calendar.getTime()));
			calendar.add(Calendar.MONTH, -1);
			searchVO.setSearchPropFromDate(df.format(calendar.getTime()));
		}
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId("PP_TY"); // 제안구분코드 조회
		List<EgovMap> typeList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PP_CT"); // 제안유형코드 조쇠
		List<EgovMap> categoryList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PP_CL"); // 제안등급코드 조회
		List<EgovMap> classList = codeService.selectFullList(codeVO);
		
		//나의 제안 조회
		List<ProposalVO> resultItems = proposalService.selectProposalMasterInfo(searchVO);
		//등급별 통계
		List<EgovMap> resultItemsCount = proposalService.selectProposalMasterInfoCount(searchVO);
		EgovMap summary = new EgovMap();
		int total = 0;         // Total Count
		summary.put("s", "0"); // S급
		summary.put("a", "0"); // A급
		summary.put("b", "0"); // B급
		summary.put("c", "0"); // C급
		summary.put("d", "0"); // D급
		summary.put("na", "0"); // 불채택
		summary.put("ev", "0"); // 등급평가중
		summary.put("ip", "0"); // 입력중
		
		if(resultItemsCount != null && resultItemsCount.size() > 0) {
			for(int index = 0; index < resultItemsCount.size(); index++) {
				EgovMap item = resultItemsCount.get(index);
				summary.put(item.get("propPropStatCode"), item.get("total"));
			}
		}
		total += Integer.parseInt(summary.get("s").toString());
		total += Integer.parseInt(summary.get("a").toString());
		total += Integer.parseInt(summary.get("b").toString());
		total += Integer.parseInt(summary.get("c").toString());
		total += Integer.parseInt(summary.get("d").toString());
		total += Integer.parseInt(summary.get("na").toString());
		total += Integer.parseInt(summary.get("ev").toString());
		total += Integer.parseInt(summary.get("ip").toString());
		summary.put("tt", total);		
		
		model.addAttribute("PP_TY_LIST", typeList);
		model.addAttribute("PP_CT_LIST", categoryList);		
		model.addAttribute("PP_CL_LIST", classList);
		model.addAttribute("PROP_LIST", resultItems);
		model.addAttribute("COUNT_S", summary.get("s").toString());
		model.addAttribute("COUNT_A", summary.get("a").toString());
		model.addAttribute("COUNT_B", summary.get("b").toString());
		model.addAttribute("COUNT_C", summary.get("c").toString());
		model.addAttribute("COUNT_D", summary.get("d").toString());
		model.addAttribute("COUNT_NA", summary.get("na").toString());
		model.addAttribute("COUNT_EV", summary.get("ev").toString());
		model.addAttribute("COUNT_IP", summary.get("ip").toString());
		model.addAttribute("COUNT_TOTAL", summary.get("tt"));
		model.addAttribute("PROP_FROM_DATE", searchVO.getSearchPropFromDate());
		model.addAttribute("PROP_TO_DATE", searchVO.getSearchPropToDate());
		model.addAttribute("PROP_TYPE_CODE", searchVO.getSearchPropTypeCode());
		model.addAttribute("PROP_CATEGORY_CODE", searchVO.getSearchPropCategoryCode());
		model.addAttribute("PROP_CLASS_CODE", searchVO.getSearchPropClassCode());
		model.addAttribute("PROP_NAME", searchVO.getSearchPropName());
		return "app/proposal/MyProposal";
	}
	
	@RequestMapping("/detail.do")
	public String detailView(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVO") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") ProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId("PP_CT"); // 제안유형코드 조쇠
		List<EgovMap> categoryList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("RESULTTY"); // 제안연간효과코드 조쇠
		List<EgovMap> yearEffectList = codeService.selectFullList(codeVO);
		
		model.addAttribute("PP_CT_LIST", categoryList);		
		model.addAttribute("PP_YE_LIST", yearEffectList);		
		
		ProposalVO resultItem = new ProposalVO();
		if(proposalVO.getPropSeq() != null) {
			//선택된 내용 검색 추가
			searchVO.setSearchPropSeq(proposalVO.getPropSeq());
			resultItem = proposalService.selectProposalDetailInfo(searchVO);
			
			AttachFileVO fileVO = new AttachFileVO();
			fileVO.setFileId("proposal_before_" + proposalVO.getPropSeq());
			List<AttachFileVO> beforeAttachFileList = attachFileService.selectFullList(fileVO); // 개선 전
			fileVO.setFileId("proposal_after_" + proposalVO.getPropSeq());
			List<AttachFileVO> afterAttachFileList = attachFileService.selectFullList(fileVO); // 개선 후
			fileVO.setFileId("proposal_attach_" + proposalVO.getPropSeq());
			List<AttachFileVO> attachFileList = attachFileService.selectFullList(fileVO); //첨부 파일
			
			resultItem.setBeforeAttachFileList(beforeAttachFileList);
			resultItem.setAfterAttachFileList(afterAttachFileList);
			resultItem.setAttachFileList(attachFileList);
			
			//결재자 정보 조회
			if(!resultItem.getPropPropStatCode().equals("IP")) {
				kr.freedi.dev.qpopup.domain.UserVO userVO = new kr.freedi.dev.qpopup.domain.UserVO();
				userVO.setComNo(resultItem.getPropApproverCode());				
				List<EgovMap> userInfo = proposalService.selectApproverUserInfo(userVO);
				
				if(userInfo != null && userInfo.size() > 0) {
					for(int index = 0; index < userInfo.size(); index++) {
						EgovMap item = userInfo.get(index);
						resultItem.setPropApprovalUser(String.valueOf(item.get("compNo")));
						resultItem.setPropApprovalName(String.valueOf(item.get("userName")));
						resultItem.setPropApprovalLevelCode(String.valueOf(item.get("comJobx")));
						resultItem.setPropApprovalLevel(String.valueOf(item.get("comJobxNm")));
						resultItem.setPropApprovalDutyCode(String.valueOf(item.get("comPosition")));
						resultItem.setPropApprovalDuty(String.valueOf(item.get("comPositionNm")));
						resultItem.setPropApprovalBeltCode(String.valueOf(item.get("comCertBelt")));
						resultItem.setPropApprovalBelt(String.valueOf(item.get("comCertBeltNm")));
						resultItem.setPropApprovalGroup(String.valueOf(item.get("deptFullName")));
						resultItem.setPropApprovalGroupCode(String.valueOf(item.get("compDepartCode")));
					}
				}
			}

			
			model.addAttribute("action", "/proposal/updateProposalInfo.do");
			model.addAttribute("crud", "U");
			model.addAttribute("propSeq", resultItem.getPropSeq());
		}else {
			int propSeq = idGnrService.getNextIntegerId();
			resultItem.setPropSeq(propSeq);
			model.addAttribute("action", "/proposal/insertProposalInfo.do");
			model.addAttribute("crud", "I");
			model.addAttribute("propSeq", propSeq);
		}
		
		model.addAttribute("PROP_INFO", resultItem);
		return "/app/proposal/MyProposalDetail";
	}
	
	@RequestMapping("/insertProposalInfo.do")
	public String insertProposalInfo(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVo") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") ProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		
		proposalVO.setPropRegUser(userSession.getUserId());
		int result = proposalService.insertProposalInfo(proposalVO);
		if(result > 0) {
			if(proposalVO.getPropTypeCode().equals("PP_TY_1")) {
				return "redirect:/sub.do?menuKey=48";
			}else {
				return "redirect:/sub.do?menuKey=49";
			}
		}
		return "redirect:/proposal/detail.do";
	}
	
	@RequestMapping("/updateProposalInfo.do")
	public String updateProposalInfo(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVo") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") ProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		
		proposalVO.setPropRegUser(userSession.getUserId());
		if(proposalVO.getPropPropStatCode() != null && proposalVO.getPropPropStatCode().equals("EV")) // 결제요청
		{
			String approvalType = proposalVO.getPropTypeCode().equals("PP_TY_1")? "6" : "7"; // 6 - 실시제안, 7 - 쪽지제안
			String refBusType = proposalVO.getPropTypeCode().equals("PP_TY_1")? "4" : "3"; // 4 - 실시제안, 3 - 쪽지제안
			ApproveVO approveVO = new ApproveVO();
			approveVO.setAprovalType(approvalType);
			approveVO.setRefBusType(refBusType);
			
			approveVO.setRefBusCode(String.valueOf(proposalVO.getPropSeq())); // 제안코드
			approveVO.setAprovalSubject(proposalVO.getPropName()); // 제안명
			approveVO.setUserId(proposalVO.getPropUser()); // 상신자
			
			ApproveDetailVO approveDetailVO = new ApproveDetailVO();
			approveDetailVO.setComNo(proposalVO.getPropApprovalUser()); // 결재자 사번
			approveDetailVO.setComDepartCode(proposalVO.getPropApprovalGroupCode()); // 결재자 부서코드
			approveDetailVO.setComJobx(proposalVO.getPropApprovalDutyCode()); //결재자 직위코드
			approveDetailVO.setComPosition(proposalVO.getPropApprovalLevelCode()); // 결재자 직책코드
			approveDetailVO.setAprovalReqComNo(proposalVO.getPropUser()); // 결재상신자 사번
			
			List<ApproveDetailVO> approveList = new ArrayList<>();
			approveList.add(approveDetailVO);
			approveVO.setDetailList(approveList);
			
			approveService.insert(approveVO); // 결재선 등록
			
			//PROP_APPROVER_CODE 결재코드
//			EgovMap param = new EgovMap();
//			param.put("approvalType", approvalType);
//			param.put("refBusType", refBusType);
//			param.put("refBusCode", String.valueOf(proposalVO.getPropSeq()));
//			
//			String approverCode = proposalService.selectApproverCode(param);
//			
//			proposalVO.setPropApproverCode(approverCode);
			
			proposalVO.setPropApproverCode(proposalVO.getPropApprovalUser()); // 결재자 사번으로 저장 - 임시
			
			// 제안심사에서 결재처리 프로세스 보완 필요
			// 1.상신자가 제안 의뢰
			// 2.결재자가 확인 후 결재 또는 반려 - 결재 및 반려 처리시 TB_PROPOSAL_DETAIL에 어떻게 어떤 상태를 변경해줄것인지
		}
		int result = proposalService.updateProposalInfo(proposalVO);
		if(result > 0) {
			if(proposalVO.getPropTypeCode().equals("PP_TY_1")) {
				return "redirect:/sub.do?menuKey=48";
			}else {
				return "redirect:/sub.do?menuKey=49";
			}
			
		}
		return "redirect:/proposal/detail.do";
	}
	
	@RequestMapping("/memolist.do")
	public String memoListView(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVo") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") ProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		if(searchVO.getSearchPropFromDate() == null && searchVO.getSearchPropToDate() == null) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			searchVO.setSearchPropToDate(df.format(calendar.getTime()));
			calendar.add(Calendar.MONTH, -1);
			searchVO.setSearchPropFromDate(df.format(calendar.getTime()));
		}
		searchVO.setSearchPropTypeCode("PP_TY_2");
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId("PP_TY"); // 제안구분코드 조회
		List<EgovMap> typeList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PP_CT"); // 제안유형코드 조쇠
		List<EgovMap> categoryList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PP_CL"); // 제안등급코드 조회
		List<EgovMap> classList = codeService.selectFullList(codeVO);
		
		//나의 제안 조회
		List<ProposalVO> resultItems = proposalService.selectProposalMasterInfo(searchVO);
		//등급별 통계
		List<EgovMap> resultItemsCount = proposalService.selectProposalMasterInfoCount(searchVO);
		EgovMap summary = new EgovMap();
		int total = 0;         // Total Count
		summary.put("s", "0"); // S급
		summary.put("a", "0"); // A급
		summary.put("b", "0"); // B급
		summary.put("c", "0"); // C급
		summary.put("d", "0"); // D급
		summary.put("na", "0"); // 불채택
		summary.put("ev", "0"); // 등급평가중
		summary.put("ip", "0"); // 입력중
		
		if(resultItemsCount != null && resultItemsCount.size() > 0) {
			for(int index = 0; index < resultItemsCount.size(); index++) {
				EgovMap item = resultItemsCount.get(index);
				summary.put(item.get("propPropStatCode"), item.get("total"));
			}
		}
		total += Integer.parseInt(summary.get("s").toString());
		total += Integer.parseInt(summary.get("a").toString());
		total += Integer.parseInt(summary.get("b").toString());
		total += Integer.parseInt(summary.get("c").toString());
		total += Integer.parseInt(summary.get("d").toString());
		total += Integer.parseInt(summary.get("na").toString());
		total += Integer.parseInt(summary.get("ev").toString());
		total += Integer.parseInt(summary.get("ip").toString());
		summary.put("tt", total);		
		
		model.addAttribute("PP_TY_LIST", typeList);
		model.addAttribute("PP_CT_LIST", categoryList);		
		model.addAttribute("PP_CL_LIST", classList);
		model.addAttribute("PROP_LIST", resultItems);
		model.addAttribute("COUNT_TOTAL", summary.get("tt"));
		model.addAttribute("PROP_FROM_DATE", searchVO.getSearchPropFromDate());
		model.addAttribute("PROP_TO_DATE", searchVO.getSearchPropToDate());
		model.addAttribute("PROP_TYPE_CODE", searchVO.getSearchPropTypeCode());
		model.addAttribute("PROP_CATEGORY_CODE", searchVO.getSearchPropCategoryCode());
		model.addAttribute("PROP_CLASS_CODE", searchVO.getSearchPropClassCode());
		model.addAttribute("PROP_NAME", searchVO.getSearchPropName());
		return "app/proposal/MyMemoProposal";
	}
	
	@RequestMapping("/memodetail.do")
	public String memoDetailView(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVO") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") ProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId("PP_CT"); // 제안유형코드 조쇠
		List<EgovMap> categoryList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("RESULTTY"); // 제안연간효과코드 조쇠
		List<EgovMap> yearEffectList = codeService.selectFullList(codeVO);
		
		model.addAttribute("PP_CT_LIST", categoryList);		
		model.addAttribute("PP_YE_LIST", yearEffectList);		
		
		ProposalVO resultItem = new ProposalVO();
		if(proposalVO.getPropSeq() != null) {
			//선택된 내용 검색 추가
			searchVO.setSearchPropSeq(proposalVO.getPropSeq());
			resultItem = proposalService.selectProposalDetailInfo(searchVO);
			//결재자 정보 조회
			if(!resultItem.getPropPropStatCode().equals("IP")) {
				kr.freedi.dev.qpopup.domain.UserVO userVO = new kr.freedi.dev.qpopup.domain.UserVO();
				userVO.setComNo(resultItem.getPropApproverCode());				
				List<EgovMap> userInfo = proposalService.selectApproverUserInfo(userVO);
				
				if(userInfo != null && userInfo.size() > 0) {
					for(int index = 0; index < userInfo.size(); index++) {
						EgovMap item = userInfo.get(index);
						resultItem.setPropApprovalUser(String.valueOf(item.get("compNo")));
						resultItem.setPropApprovalName(String.valueOf(item.get("userName")));
						resultItem.setPropApprovalLevelCode(String.valueOf(item.get("comJobx")));
						resultItem.setPropApprovalLevel(String.valueOf(item.get("comJobxNm")));
						resultItem.setPropApprovalDutyCode(String.valueOf(item.get("comPosition")));
						resultItem.setPropApprovalDuty(String.valueOf(item.get("comPositionNm")));
						resultItem.setPropApprovalBeltCode(String.valueOf(item.get("comCertBelt")));
						resultItem.setPropApprovalBelt(String.valueOf(item.get("comCertBeltNm")));
						resultItem.setPropApprovalGroup(String.valueOf(item.get("deptFullName")));
						resultItem.setPropApprovalGroupCode(String.valueOf(item.get("compDepartCode")));
					}
				}
			}
			model.addAttribute("action", "/proposal/updateProposalInfo.do");
			model.addAttribute("crud", "U");
			model.addAttribute("propSeq", resultItem.getPropSeq());
		}else {
			int propSeq = idGnrService.getNextIntegerId();
			resultItem.setPropSeq(propSeq);
			model.addAttribute("action", "/proposal/insertProposalInfo.do");
			model.addAttribute("crud", "I");
			model.addAttribute("propSeq", propSeq);
		}
		
		model.addAttribute("PROP_INFO", resultItem);
		return "/app/proposal/MyMemoProposalDetail";
	}
	
	@RequestMapping("/search.do")
	public String searchView(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVo") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") ProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		model.addAttribute("menuKey", searchVO.getMenuKey());
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId("PP_TY"); // 제안구분코드 조회
		List<EgovMap> typeList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PP_CT"); // 제안유형코드 조쇠
		List<EgovMap> categoryList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("RESULTTY"); // 제안연간효과코드 조쇠
		List<EgovMap> yearEffectList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PP_CL"); // 제안등급코드 조회
		List<EgovMap> classList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("WPLACE"); // 제안연간효과코드 조쇠
		List<EgovMap> bizPlaceList = codeService.selectFullList(codeVO);
		
		if(searchVO.getSearchPropFromDate() == null && searchVO.getSearchPropToDate() == null) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			searchVO.setSearchPropToDate(df.format(calendar.getTime()));
			calendar.add(Calendar.MONTH, -1);
			searchVO.setSearchPropFromDate(df.format(calendar.getTime()));
		}
		
		List<ProposalVO> resultItems = proposalService.selectProposalMasterInfo(searchVO);
		EgovMap resultItem = proposalService.selectListCount(searchVO);
		
		model.addAttribute("PP_TY_LIST", typeList);
		model.addAttribute("PP_CT_LIST", categoryList);		
		model.addAttribute("PP_CL_LIST", classList);
		model.addAttribute("PP_YE_LIST", yearEffectList);	
		model.addAttribute("BIZ_PLACE_LIST", bizPlaceList);
		model.addAttribute("PROP_LIST", resultItems);
		model.addAttribute("PROP_TOTAL", resultItem.get("count"));
		return "app/proposal/SearchProposalList";
	}
	
	@RequestMapping(value = "/memoProposalSearch.do", method = RequestMethod.POST)
	public @ResponseBody String memoProposalSearch(HttpServletRequest request,
			@RequestParam Map<String, Object> reqMap) throws Exception{
		//나의 제안 조회
		ProposalSearchVO searchVO = new ProposalSearchVO();
		searchVO.setSearchPropCategoryCode(String.valueOf(reqMap.get("propCategoryCode")));
		searchVO.setSearchPropName(String.valueOf(reqMap.get("propName")));
		searchVO.setCurrentPageNo(Integer.valueOf(String.valueOf(reqMap.get("currentPageNo"))));
		searchVO.setSearchPropTypeCode("PP_TY_2");
		List<ProposalVO> resultItems = proposalService.selectProposalMasterInfo(searchVO);
		EgovMap resultItem = proposalService.selectListCount(searchVO);
		
		resultItem.put("list", resultItems);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(resultItem);
		return json;
	}
}
