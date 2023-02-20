package kr.freedi.dev.attachfile.controller;

import java.io.File;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.attachfile.service.AttachFileService;
import kr.freedi.dev.attachfile.view.AttachFileDownloadView;
import kr.freedi.dev.common.util.MapUtil;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @project : offset
 * @file 	: AttachFileController.java
 * @date	: 2017. 4. 3.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */

@Controller
public class AttachFileController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String NOT_ALLOW_VIEW = "/WEB-INF/jsp/common/error/Error.jsp";
	
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;
	
	
	@SuppressWarnings("unused")
	private String getPath(HttpServletRequest request) {
		if(StringUtils.startsWith(request.getRequestURI(), "/csl")){
			return "/csl/attachfile/";
		}else if(StringUtils.startsWith(request.getRequestURI(), "/blog")){
			return "/blog/attachfile/";
		}else{
			return "/attachfile/";
		}
	}
	
    @RequestMapping(value={"/csl/attachfile/uploadForm.do","/attachfile/uploadForm.do","/eng/attachfile/uploadForm.do"})
    public String uploadForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	if(!this.isAllowReferrer(request)){
    		return "common/error/Error";
    	}
 
		if(StringUtils.startsWith(request.getRequestURI(), "/csl")){
			return "attachfile/csl/UploadForm";
		}else if(StringUtils.startsWith(request.getRequestURI(), "/blog")){
			return "attachfile/blog/UploadForm";
		}else{
			return "/attachfile/def/UploadForm";
		}
    	//return "attachfile/UploadForm";   
    }
	
    @RequestMapping(value={"/csl/attachfile/upload.do","/attachfile/upload.do","/eng/attachfile/upload.do"}, method = RequestMethod.POST)
    public @ResponseBody 
    String post(MultipartHttpServletRequest mrequest, HttpServletRequest request, HttpServletResponse response) throws Exception {
 
    	if(!this.isAllowReferrer(request)){
    		return "common/error/Error";
    	}
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	List<AttachFileVO> uploadList = new LinkedList<AttachFileVO>();
    	
    	AttachFileVO attachFileVO = new AttachFileVO();
    	attachFileVO.setFileId(request.getParameter("fileId"));
    	attachFileVO.setFileGrp(request.getParameter("fileGrp"));
    	
    	MultipartFile multipartFile = mrequest.getFile("files[]");
    	
    	AttachFileVO resultVO = attachFileService.uploadAttachFile(multipartFile, attachFileVO);
    	//resultVO.setDeleteUrl(this.getPath(request) + "deleteFile.do?fileMsk=" + resultVO.getFileMsk());
    	
    	uploadList.add(resultVO);
    	resultMap.put("files", uploadList);
    	
        return new ObjectMapper().writeValueAsString(resultMap);        
    }
    
    @RequestMapping(value={"/csl/attachfile/list.do","/attachfile/list.do","/eng/attachfile/list.do"}, method = RequestMethod.GET)
    public @ResponseBody 
    String get(HttpServletRequest request, HttpServletResponse response) throws Exception {
 
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	AttachFileVO attachFileVO = new AttachFileVO();
    	attachFileVO.setFileId(request.getParameter("fileId"));
    	List<AttachFileVO> uploadList = attachFileService.selectFullList(attachFileVO);
    	
    	resultMap.put("files", uploadList);
    	
        return new ObjectMapper().writeValueAsString(resultMap);        
    }
    
    @RequestMapping(value={"/csl/attachfile/delete.do","/attachfile/delete.do","/eng/attachfile/delete.do"}, method = RequestMethod.DELETE)
    public @ResponseBody 
    String delete(HttpServletRequest request, HttpServletResponse response,
    		@RequestParam Map<String, Object> reqMap) throws Exception {
 
    	
    	attachFileService.deleteAttachFile(MapUtil.getString(reqMap, "fileId"), MapUtil.getInteger(reqMap, "fileSeq"));
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("result", "success");
    	
    	return new ObjectMapper().writeValueAsString(resultMap);
    }
    
    @RequestMapping(value={"/csl/attachfile/deleteByFileMsk.do","/attachfile/deleteByFileMsk.do","/eng/attachfile/deleteByFileMsk.do"}, method = RequestMethod.DELETE)
    public @ResponseBody 
    String deleteByFileMsk(HttpServletRequest request, HttpServletResponse response,
    		@RequestParam Map<String, Object> reqMap) throws Exception {
 
    	attachFileService.deleteAttachFileByFileMsk(String.valueOf(reqMap.get("fileMsk")));
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("result", "success");
    	
    	return new ObjectMapper().writeValueAsString(resultMap);
    }
    
	@RequestMapping({"/csl/attachfile/downloadFile.do","/attachfile/downloadFile.do","/eng/attachfile/downloadFile.do"})
	public ModelAndView downloadFile(HttpServletRequest request, 
			@ModelAttribute AttachFileVO attachFileVO) {
		
    	if(!this.isAllowReferrer(request)){
    		return new ModelAndView(NOT_ALLOW_VIEW);
    	}
    	
		AttachFileVO resultVO = attachFileService.select(attachFileVO);
		resultVO.setFilePath(attachFileService.getFileDownloadFilePath(propertiesService.getString("attachfile.path.dir"), resultVO.getFileGrp(), resultVO.getFileMsk()));
		
		attachFileService.updateDwnldCntByFileIdAndFileSeq(attachFileVO);
		
        return new ModelAndView(AttachFileDownloadView.NAME, AttachFileDownloadView.MODELNAME, resultVO);
	}
	
	@RequestMapping({"/csl/attachfile/downloadAll.do","/attachfile/downloadAll.do","/eng/attachfile/downloadAll.do"})
	public ModelAndView downloadAll(HttpServletRequest request, 
			@ModelAttribute AttachFileVO attachFileVO) {
		
    	if(!this.isAllowReferrer(request)){
    		return new ModelAndView(NOT_ALLOW_VIEW);
    	}
    	
		attachFileVO.setDeleteFlg("N");
		
		List<AttachFileVO> resultList = attachFileService.selectFullList(attachFileVO);
		AttachFileVO[] resultVOs = new AttachFileVO[resultList.size()];
		resultVOs = resultList.toArray(resultVOs);
		
		for(AttachFileVO vo : resultVOs){
			vo.setFilePath(attachFileService.getFileDownloadFilePath(propertiesService.getString("attachfile.path.dir"), vo.getFileGrp(), vo.getFileMsk()));
		}
		
		attachFileService.updateDwnldCntByFileId(attachFileVO);
		
        return new ModelAndView(AttachFileDownloadView.NAME, AttachFileDownloadView.MODELNAME, resultVOs);
	}
	
	@RequestMapping({"/csl/attachfile/viewImage.do","/attachfile/viewImage.do","/eng/attachfile/viewImage.do"})
	public ModelAndView viewImage(HttpServletRequest request, 
			@ModelAttribute AttachFileVO attachFileVO) {
		
    	if(!this.isAllowReferrer(request)){
    		return new ModelAndView(NOT_ALLOW_VIEW);
    	}
    	
		AttachFileVO resultVO = attachFileService.select(attachFileVO);
		if(resultVO.isImage()){
			resultVO.setFilePath(attachFileService.getFileDownloadFilePath(propertiesService.getString("attachfile.path.dir"), resultVO.getFileGrp(), resultVO.getFileMsk()));	
		}else{
			resultVO.setFilePath(this.getNoImagePath());
		}
		
		attachFileService.updateDwnldCntByFileIdAndFileSeq(attachFileVO);
		
        return new ModelAndView(AttachFileDownloadView.NAME, AttachFileDownloadView.MODELNAME, resultVO);
	}
	
	@RequestMapping({"/csl/attachfile/previewImage.do","/attachfile/previewImage.do","/eng/attachfile/previewImage.do"})
	public ModelAndView previwImage(HttpServletRequest request, 
			@ModelAttribute AttachFileVO attachFileVO) {
		
    	if(!this.isAllowReferrer(request)){
    		return new ModelAndView(NOT_ALLOW_VIEW);
    	}
    	
		AttachFileVO resultVO = attachFileService.select(attachFileVO);
		
		if(resultVO.isImage()){
			resultVO.setFilePath(attachFileService.getFileDownloadFilePath(propertiesService.getString("attachfile.path.dir"), resultVO.getFileGrp(), resultVO.getFileMsk() + "_thumb"));	
		}else{
			resultVO.setFilePath(this.getNoImagePath());
		}
		
		attachFileService.updateDwnldCntByFileIdAndFileSeq(attachFileVO);
		
        return new ModelAndView(AttachFileDownloadView.NAME, AttachFileDownloadView.MODELNAME, resultVO);
	}
	
	private String getNoImagePath() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		if(StringUtils.startsWith(request.getRequestURI(), "/csl")){
			return request.getSession().getServletContext().getRealPath("/") + "csl" + File.separator + propertiesService.getString("attachfile.noimg.path");
		}else if(StringUtils.startsWith(request.getRequestURI(), "/eng")){
			return request.getSession().getServletContext().getRealPath("/") + "eng" + File.separator + propertiesService.getString("attachfile.noimg.path");
		}else{
			return request.getSession().getServletContext().getRealPath("/") + propertiesService.getString("attachfile.noimg.path");
		}
	}
	
	private boolean isAllowReferrer(HttpServletRequest request) {
		boolean rtnVal = false;

		String refererUri = request.getHeader("referer") == null ? "" : request.getHeader("referer");
		String hostName = request.getServerName();
		
		if(!StringUtils.isEmpty(refererUri)) {
			Pattern urlPattern = Pattern.compile("^(https?):\\/\\/([^:\\/\\s]+)(:([^\\/]*))?((\\/[^\\s/\\/]+)*)?\\/([^#\\s\\?]*)(\\?([^#\\s]*))?(#(\\w*))?$");
			Matcher mc = urlPattern.matcher(refererUri);
			if(mc.matches()) {
				if(StringUtils.equals(hostName, mc.group(2))) {
					rtnVal = true;
				}
			}
		}

		return rtnVal;
	}
}


