package kr.freedi.dev.common.view;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @project : dev_default
 * @file 	: JxlsExcelView.java
 * @date	: 2017. 4. 3.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class JxlsExcelView extends AbstractExcelView{
	
	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 엑셀 템플릿 파일명
		String src = getServletContext().getRealPath("/") + File.separator + propertiesService.getString("template.jxls.path") + File.separator + String.valueOf(request.getAttribute("templateName"));
		// 실제 다운로드할 파일명
		String dest = String.valueOf(request.getAttribute("downloadName"));
		// 데이터소스
		model.put("itemList", request.getAttribute("itemList"));
		// title
		model.put("title", request.getAttribute("title"));
		
		XLSTransformer transformer = new XLSTransformer();
		HSSFWorkbook resultWorkbook = (HSSFWorkbook)transformer.transformXLS(new FileInputStream(src), model);

		String userAgent = request.getHeader("User-Agent");

		StringBuffer contentDisposition = new StringBuffer();
		contentDisposition.append("attachment;fileName=\"");
		
		// 파일명 한글 깨짐방지
		if (userAgent.indexOf("MSIE 5.5") > -1) { // MS IE 5.5 이하
			contentDisposition.append(URLEncoder.encode(dest, "UTF-8"));
		}else if(userAgent.indexOf("MSIE") > -1) { // MS IE (보통은 6.x 이상 가정)
			contentDisposition.append(URLEncoder.encode(dest, "UTF-8"));
		}else{ // 모질라나 오페라
			contentDisposition.append(new String(dest.getBytes("UTF-8"), "8859_1"));
		}
		contentDisposition.append("\";");
		
		response.setContentType("application/x-msexcel;");
		response.setHeader("Content-Disposition", contentDisposition.toString());
		resultWorkbook.write(response.getOutputStream());
	}
}
