package kr.freedi.dev.attachfile.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.freedi.dev.attachfile.domain.AttachFileVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

/**
 * @project : dev_default
 * @file 	: AttachFileDownloadView.java
 * @date	: 2017. 4. 5.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */

public class AttachFileDownloadView extends AbstractView {

	protected Log log = LogFactory.getLog(this.getClass());
	
	public static final String NAME = "attachFileDownloadView";
	public static final String MODELNAME = "attachFileDownloadModel";
	private static final byte[] buf = new byte[1024];

	
	public AttachFileDownloadView() {
		setContentType("application/octet-stream");
	}
	
	@Override
	protected void renderMergedOutputModel(@SuppressWarnings("rawtypes") Map model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Object obj = model.get(MODELNAME);		
		response.setContentType(getContentType());
		
		if(obj != null && obj.getClass().isArray()) {
			AttachFileVO[] attachFileVOs = (AttachFileVO[])obj;
			setResponseHeader(request, response, "all.zip", -1);
			
			try{
				OutputStream out = response.getOutputStream();
				ZipOutputStream zipOs = new ZipOutputStream(out, Charset.forName("UTF-8"));

				for (int i = 0; i < attachFileVOs.length; i++) {
					FileInputStream in = new FileInputStream(attachFileVOs[i].getFilePath());
					zipOs.putNextEntry(new ZipEntry(attachFileVOs[i].getFileNm()));
					
					int data;
					while ((data = in.read(buf)) > 0) {
						zipOs.write(buf, 0, data);
					}
					
					zipOs.closeEntry();
					
					in.close();
				}

				zipOs.close();
				out.close();
			}catch(Exception e){
				log.error(e.getMessage());
			}
			
		}else{
			AttachFileVO attachFileVO = (AttachFileVO)obj;
			File file = new File(attachFileVO.getFilePath());
			
			setResponseHeader(request, response, attachFileVO.getFileNm(), (int)file.length());			
			OutputStream out = response.getOutputStream();			
			FileInputStream fin = new FileInputStream(file);
			
			try {
				FileCopyUtils.copy(fin, out);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			finally {
				fin.close();
			}
		}
	}
	
	private void setResponseHeader(HttpServletRequest request, HttpServletResponse response, String fileName, int contentLength) throws UnsupportedEncodingException, IOException {
		String browser = this.getBrowser(request);
		
		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;
		
		if(fileName == null) {
			fileName = "NotFoundFile";
		}
		
		if(contentLength != -1){
			response.setContentLength(contentLength);
		}
		
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < fileName.length(); i++) {
				char c = fileName.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = "\"" + sb.toString() + "\"";
		} else {
			//throw new RuntimeException("Not supported browser");
			throw new IOException("Not supported browser");
		}
		
		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

		if ("Opera".equals(browser)){
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
	}
	
    private String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1 || header.indexOf("Trident") > -1) {
            return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        }
        return "Firefox";
    }
}