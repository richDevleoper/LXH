package kr.freedi.dev.common.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.fdl.property.EgovPropertyService;
import kr.freedi.dev.common.domain.FileVO;
import kr.freedi.dev.common.service.FileService;

/**
 * @project : dev_default
 * @file 	: SmartEditorFileController.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Controller
public class SmartEditorFileController {

	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "fileService")
	private FileService fileService;

	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;

	
	private String getPath(HttpServletRequest request, String fileName) {
		return "editor/smarteditor" + request.getRequestURI().replaceAll("(/.*?)(/.*)", "$1") + "/" + fileName;
	}
	
	@RequestMapping({ "/csl/editor/smarteditor/uploadForm.do", "/def/editor/smarteditor/uploadForm.do" })
	public String imageUploadForm(HttpServletRequest request, Model model, 
			String uploadKey, 
			String callbackUploadHandlerName) throws Exception {

		model.addAttribute("uploadKey", uploadKey);
		model.addAttribute("callbackUploadHandlerName", callbackUploadHandlerName);

		return this.getPath(request, "UploadForm");
	}

	@RequestMapping({"/csl/editor/smarteditor/upload.do", "/def/editor/smarteditor/upload.do"})
	public @ResponseBody 
		String smartEditorUpload(MultipartHttpServletRequest mrequest, HttpServletResponse response, 
				String pathProp, 
				String sizeProp,
				String subDir, 
				String inputName) throws Exception {

		HashMap<String, Object> uploadFileMap = new HashMap<String, Object>();
		FileVO uploadFile = null;

		try {
			log.debug("pathProp="+pathProp);
			log.debug("sizeProp="+sizeProp);
			log.debug("subDir="+subDir);
			log.debug("inputName="+inputName);
			
			String uploadPath = propertiesService.getString("file.default.path");
			Integer limitSize = propertiesService.getInt("file.default.size");
			
			
			if (pathProp != null && pathProp.length() > 0) {
				uploadPath = propertiesService.getString(pathProp);
			}
			
			if (sizeProp != null && sizeProp.length() > 0) {
				limitSize = propertiesService.getInt(sizeProp);
			}

			// 파일업로드
			uploadFile = fileService.upload(mrequest, uploadPath, inputName, limitSize, subDir, "");
			log.debug(uploadFile.toString());

			if(uploadFile != null){
				uploadFileMap.put("fileName", uploadFile.getFileName());
				uploadFileMap.put("serverFileName", uploadFile.getServerFileName());
				uploadFileMap.put("relativePath", uploadFile.getRelativePath());
				uploadFileMap.put("fileType", uploadFile.getFileType());
				uploadFileMap.put("fileExt", uploadFile.getFileExt());
				uploadFileMap.put("fileSize", uploadFile.getFileSize());
				uploadFileMap.put("imageWidth", uploadFile.getImageWidth());
				uploadFileMap.put("imageHeight", uploadFile.getImageHeight());

				uploadFileMap.put("rsltCd", "0000");
				uploadFileMap.put("rsltMsg", "");
			}
			
			//else{
			//	uploadFileMap.put("rsltCd", "0010");
			//	uploadFileMap.put("rsltMsg", "uploadFile is null");
			//}

		} catch (Exception e) {
			uploadFileMap.put("rsltCd", "0020");
			uploadFileMap.put("rsltMsg", "exception");
			e.printStackTrace();
		}

		// Json형식으로 문자열 변환
		//return JSONObject.fromObject(uploadFileMap).toString();
		return new ObjectMapper().writeValueAsString(uploadFileMap);
	}
}
