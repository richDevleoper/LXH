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
import kr.freedi.dev.qproposal.domain.ProposalVO;
import kr.freedi.dev.qproposal.domain.ReportProposalSearchVO;
import kr.freedi.dev.qproposal.service.ReportProposalService;
import kr.freedi.dev.user.domain.UserVO;


@Controller
@RequestMapping({"/proposal"})
public class ReportProposalController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String ATTACH_TABLE_PREFIX = "TB";
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "reportProposalService")
	private ReportProposalService reportProposalService;
	
	@InitBinder
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));
	}
	
	@RequestMapping("/report/list.do")
	public String listView(HttpServletRequest request, ModelMap model,
			@ModelAttribute("proposalVo") ProposalVO proposalVO, 
			@ModelAttribute("proposalSearchVO") ReportProposalSearchVO searchVO,
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
		codeVO.setCodeGrpId("PPS_TYP"); // 제안구분코드 조회
		List<EgovMap> typeList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PPS_CTY"); // 제안유형코드 조쇠
		List<EgovMap> categoryList = codeService.selectFullList(codeVO);
		codeVO.setCodeGrpId("PPS_CLS"); // 제안등급코드 조회
		List<EgovMap> classList = codeService.selectFullList(codeVO);
		
		//나의 제안 조회
		List<ProposalVO> resultItems = reportProposalService.selectProposalMasterInfo(searchVO);
		
		//구분별 통계
		List<EgovMap> resultItemsCount = reportProposalService.selectProposalTypeByCount(searchVO);
		//등급별 통계
//		List<EgovMap> progressCount = reportProposalService.selectProposalStateByCount(searchVO);
		EgovMap summary = new EgovMap();
		int total = 0;         // Total Count
		
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
		
//		summary.put("prg1", "0"); // 입력중
//		summary.put("prg2", "0"); // 결재진행중
//		summary.put("prg3", "0"); // 심사대기중
//		summary.put("prg4", "0"); // 심사진행중
//		summary.put("prg5", "0"); // 심사완료
//		summary.put("prg6", "0"); // 마감
//		
//		if(progressCount != null && progressCount.size() > 0) {
//			for(int index = 0; index < progressCount.size(); index++) {
//				EgovMap item = progressCount.get(index);
//				if(item.get("propPropStatCode") != null) {
//					summary.put(item.get("propPropStatCode"), item.get("total"));
//				}
//			}
//		}
		
//		int prgCount = 0;
//		prgCount += Integer.parseInt(summary.get("prg1").toString());
//		prgCount += Integer.parseInt(summary.get("prg2").toString());
//		prgCount += Integer.parseInt(summary.get("prg3").toString());
//		prgCount += Integer.parseInt(summary.get("prg4").toString());
		
//		List<EgovMap> classCount = reportProposalService.selectProposalClassByCount(searchVO);
		
		summary.put("s", "0"); // S급
		summary.put("a", "0"); // A급
		summary.put("b", "0"); // B급
		summary.put("c", "0"); // C급
		summary.put("d", "0"); // D급
		summary.put("na", "0"); // 불채택
		summary.put("prg", "0"); // 심사중
		
//		if(classCount != null && classCount.size() > 0) {
//			for(int index = 0; index < classCount.size(); index++) {
//				EgovMap item = classCount.get(index);
//				if(item.get("propEvalLvCode") != null){
//					summary.put(item.get("propEvalLvCode"), item.get("total"));
//				}
//				
//			}
//		}
		
		List<EgovMap> paymentCount = reportProposalService.selectProposalPaymentByCount(searchVO);
		summary.put("pys", "0");
		summary.put("pya", "0");
		summary.put("pyb", "0");
		summary.put("pyc", "0");
		summary.put("pyd", "0");
		summary.put("pyna", "0");
		summary.put("pyprg", "0");
		
		summary.put("pns", "0");
		summary.put("pna", "0");
		summary.put("pnb", "0");
		summary.put("pnc", "0");
		summary.put("pnd", "0");
		summary.put("pnna", "0");
		summary.put("pnprg", "0");
		
		if(paymentCount != null && paymentCount.size() > 0) {
			for(int index = 0; index < paymentCount.size(); index++) {
				EgovMap item = paymentCount.get(index);
				if(item.get("propPaymentYn") != null && item.get("propEvalLvCode") != null){
					String key = "p"+String.valueOf(item.get("propPaymentYn")).toLowerCase() + String.valueOf(item.get("propEvalLvCode")).toLowerCase();
					summary.put(key, item.get("total"));
				}
				
			}
		}
		
		
		summary.put("s", (Integer.parseInt(summary.get("pys").toString()) + Integer.parseInt(summary.get("pns").toString())));
		summary.put("a", (Integer.parseInt(summary.get("pya").toString()) + Integer.parseInt(summary.get("pna").toString())));
		summary.put("b", (Integer.parseInt(summary.get("pyb").toString()) + Integer.parseInt(summary.get("pnb").toString())));
		summary.put("c", (Integer.parseInt(summary.get("pyc").toString()) + Integer.parseInt(summary.get("pnc").toString())));
		summary.put("d", (Integer.parseInt(summary.get("pyd").toString()) + Integer.parseInt(summary.get("pnd").toString())));
		summary.put("na", (Integer.parseInt(summary.get("pyna").toString()) + Integer.parseInt(summary.get("pnna").toString())));
		summary.put("prg", (Integer.parseInt(summary.get("pyprg").toString()) + Integer.parseInt(summary.get("pnprg").toString())));
		
		
		int clsCount = 0;
		clsCount += Integer.parseInt(summary.get("s").toString());
		clsCount += Integer.parseInt(summary.get("a").toString());
		clsCount += Integer.parseInt(summary.get("b").toString());
		clsCount += Integer.parseInt(summary.get("c").toString());
		clsCount += Integer.parseInt(summary.get("d").toString());
		clsCount += Integer.parseInt(summary.get("na").toString());
		clsCount += Integer.parseInt(summary.get("prg").toString());
		
		
		int pymtYCount = 0;
		int pymtNCount = 0;
		
		pymtYCount += Integer.parseInt(summary.get("pys").toString());
		pymtYCount += Integer.parseInt(summary.get("pya").toString());
		pymtYCount += Integer.parseInt(summary.get("pyb").toString());
		pymtYCount += Integer.parseInt(summary.get("pyc").toString());
		pymtYCount += Integer.parseInt(summary.get("pyd").toString());
		pymtYCount += Integer.parseInt(summary.get("pyna").toString());
		pymtYCount += Integer.parseInt(summary.get("pyprg").toString());
		
		pymtNCount += Integer.parseInt(summary.get("pns").toString());
		pymtNCount += Integer.parseInt(summary.get("pna").toString());
		pymtNCount += Integer.parseInt(summary.get("pnb").toString());
		pymtNCount += Integer.parseInt(summary.get("pnc").toString());
		pymtNCount += Integer.parseInt(summary.get("pnd").toString());
		pymtNCount += Integer.parseInt(summary.get("pnna").toString());
		pymtNCount += Integer.parseInt(summary.get("pnprg").toString());
		
		summary.put("tt", total);
		//summary.put("prg", prgCount);
		summary.put("cls", clsCount);
		
		summary.put("pymtY", pymtYCount);
		summary.put("pymtN", pymtNCount);
		
		searchVO.setTotalRecordCount(total);
		
		model.addAttribute("TYPE_LIST", typeList);
		model.addAttribute("CATEGORY_LIST", categoryList);		
		model.addAttribute("CLASS_LIST", classList);
		model.addAttribute("PROP_LIST", resultItems);
		model.addAttribute("SUMMARY", summary);
		model.addAttribute("PROP_FROM_DATE", searchVO.getSearchPropFromDate());
		model.addAttribute("PROP_TO_DATE", searchVO.getSearchPropToDate());
		model.addAttribute("PROP_TYPE_CODE", searchVO.getSearchPropTypeCode());
		model.addAttribute("PROP_CATEGORY_CODE", searchVO.getSearchPropCategoryCode());
		model.addAttribute("PROP_CLASS_CODE", searchVO.getSearchPropClassCode());
		model.addAttribute("PROP_NAME", searchVO.getSearchPropName());
		return "app/proposal/ReportProposalList";
	}
}