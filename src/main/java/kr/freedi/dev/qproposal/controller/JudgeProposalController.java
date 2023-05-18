package kr.freedi.dev.qproposal.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.code.service.CodeService;
import kr.freedi.dev.qproposal.domain.ProposalSearchVO;
import kr.freedi.dev.qproposal.domain.ProposalVO;
import kr.freedi.dev.qproposal.service.JudgeProposalService;
import kr.freedi.dev.user.domain.UserVO;

@Controller
@RequestMapping({"/proposal"})
public class JudgeProposalController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_TABLE_PREFIX = "TB";
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "judgeProposalService")
	private JudgeProposalService judgeProposalService;
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}
	
	@RequestMapping("/judge/list.do")
	public String listView(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVo") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") ProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		model.addAttribute("menuKey", searchVO.getMenuKey());
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId("PPS_TYP"); // 제안구분코드 조회
		List<EgovMap> typeList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PPS_CTY"); // 제안유형코드 조쇠
		List<EgovMap> categoryList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("RESULTTY"); // 제안연간효과코드 조쇠
		List<EgovMap> yearEffectList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PPS_CLS"); // 제안등급코드 조회
		List<EgovMap> classList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("WPLACE"); // 제안연간효과코드 조쇠
		List<EgovMap> bizPlaceList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PPS_PRG"); // 제안연간효과코드 조쇠
		List<EgovMap> progressList = codeService.selectFullList(codeVO);
		
		if(searchVO.getSearchPropFromDate() == null && searchVO.getSearchPropToDate() == null) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			searchVO.setSearchPropToDate(df.format(calendar.getTime()));
			calendar.add(Calendar.MONTH, -1);
			searchVO.setSearchPropFromDate(df.format(calendar.getTime()));
		}
		
		searchVO.setIsAdmin("T"); //제안 관리 파라미터, 입력중인 항목 보여줄 필요가 없을것 같음
		List<ProposalVO> resultItems = judgeProposalService.selectProposalMasterInfo(searchVO);
		//구분별 통계
		List<EgovMap> resultItemsCount = judgeProposalService.selectProposalTypeByCount(searchVO);
		EgovMap summary = new EgovMap();
		int total = 0;
		summary.put("ppsTyp1", "0");
		summary.put("ppsTyp2", "0");
		
		if(resultItemsCount != null && resultItemsCount.size() > 0) {
			for(int index = 0; index < resultItemsCount.size(); index++) {
				EgovMap item = resultItemsCount.get(index);
				summary.put(item.get("propTypeCode"), item.get("total"));
			}
		}
		
		total += Integer.parseInt(summary.get("ppsTyp1").toString());
		total += Integer.parseInt(summary.get("ppsTyp2").toString());
		summary.put("tt", total);
		
		model.addAttribute("TYPE_LIST", typeList);
		model.addAttribute("CATEGORY_LIST", categoryList);		
		model.addAttribute("CLASS_LIST", classList);
		model.addAttribute("YEAR_EFFECT_LIST", yearEffectList);	
		model.addAttribute("BIZ_PLACE_LIST", bizPlaceList);
		model.addAttribute("PROGRESS_LIST", progressList);
		model.addAttribute("SUMMARY", summary);
		model.addAttribute("PROP_LIST", resultItems);		
		
		return "app/proposal/JudgeProposal";
	}
	
	@RequestMapping("/judge/detail.do")
	public String detailView(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVO") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") ProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		searchVO.setSearchPropSeq(proposalVO.getPropSeq());
		ProposalVO resultItem = judgeProposalService.selectProposalDetailInfo(searchVO);
		
		//결재자 정보 조회
		if(!resultItem.getPropPropStatCode().equals("PRG_1")) {
			kr.freedi.dev.qpopup.domain.UserVO userVO = new kr.freedi.dev.qpopup.domain.UserVO();
			userVO.setComNo(resultItem.getPropApproverCode());				
			List<EgovMap> userInfo = judgeProposalService.selectApproverUserInfo(userVO);
			
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
		
		model.addAttribute("propSeq", resultItem.getPropSeq());
		model.addAttribute("crud", "R");
		model.addAttribute("PROP_INFO", resultItem);
		return "app/proposal/JudgeProposalDetail";
	}
	
	@RequestMapping("/judge/memodetail.do")
	public String memoDetailView(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVO") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") ProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		searchVO.setSearchPropSeq(proposalVO.getPropSeq());
		ProposalVO resultItem = judgeProposalService.selectProposalDetailInfo(searchVO);
		
		//결재자 정보 조회
		if(!resultItem.getPropPropStatCode().equals("PRG_1")) {
			kr.freedi.dev.qpopup.domain.UserVO userVO = new kr.freedi.dev.qpopup.domain.UserVO();
			userVO.setComNo(resultItem.getPropApproverCode());				
			List<EgovMap> userInfo = judgeProposalService.selectApproverUserInfo(userVO);
			
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
		
		model.addAttribute("propSeq", resultItem.getPropSeq());
		model.addAttribute("crud", "R");
		model.addAttribute("PROP_INFO", resultItem);
		return "app/proposal/JudgeMemoProposalDetail";
	}
}
