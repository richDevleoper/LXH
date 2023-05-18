package kr.freedi.dev.qproposal.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import kr.freedi.dev.qproposal.domain.EvalProposalSearchVO;
import kr.freedi.dev.qproposal.domain.EvalProposalVO;
import kr.freedi.dev.qproposal.domain.ProposalVO;
import kr.freedi.dev.qproposal.service.EvalProposalService;
import kr.freedi.dev.user.domain.UserVO;

@Controller
@RequestMapping({"/proposal"})
public class EvalProposalController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_TABLE_PREFIX = "TB";
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "evalProposalService")
	private EvalProposalService evalProposalService;
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}
	
	@RequestMapping("/eval/classlist.do")
	public String ClassListView(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVo") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") EvalProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId("PPS_TYP"); // 제안구분코드 조회
		List<EgovMap> typeList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PPS_CTY"); // 제안유형코드 조쇠
		List<EgovMap> categoryList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PPS_CLS"); // 제안등급코드 조회
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
		
		List<ProposalVO> resultItems = evalProposalService.selectEvalForClassProposalMasterInfo(searchVO);
		EgovMap resultItem = evalProposalService.selectListCount(searchVO);
		
		model.addAttribute("TYPE_LIST", typeList);
		model.addAttribute("CATEGORY_LIST", categoryList);		
		model.addAttribute("CLASS_LIST", classList);
		model.addAttribute("BIZ_PLACE_LIST", bizPlaceList);
		model.addAttribute("PROP_LIST", resultItems);
		model.addAttribute("PROP_TOTAL", resultItem.get("count"));
		
		return "app/proposal/EvalClassProposal";
	}
	
	@RequestMapping("/eval/paymentlist.do")
	public String PaymentListView(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVo") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") EvalProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		model.addAttribute("menuKey", searchVO.getMenuKey());
		
		return "app/proposal/EvalPaymentProposal";
	}
	
	@RequestMapping("/eval/procclass.do")
	public void/*@ResponseBody String*/ procEvalClass(HttpServletResponse response, HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVo") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") EvalProposalSearchVO searchVO,
			UserVO userSession) throws Exception{
		
		if(proposalVO != null && proposalVO.getEvalProposalList() != null && proposalVO.getEvalProposalList().size() > 0) {
			
			List<EvalProposalVO> evalProposalList = proposalVO.getEvalProposalList();
			for(int index = 0; index < evalProposalList.size(); index++) {
				EvalProposalVO item = evalProposalList.get(index);
				
				evalProposalService.updatePropEvalLvCode(item);
			}			
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등급평가 마감 완료.'); parent.onclick_search();</script>");
			out.flush();			
		}else{
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등급평가 항목을 선택해 주세요.'); parent.onclick_search();</script>");
			out.flush();			
		}

//		return "<script>alert('등급평가 마감 완료.'); onclick_search();</script>";
	}
}
