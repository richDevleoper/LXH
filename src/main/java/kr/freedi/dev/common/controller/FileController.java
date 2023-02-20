package kr.freedi.dev.common.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;
import kr.freedi.dev.banner.domain.BannerVO;
import kr.freedi.dev.banner.service.BannerService;
import kr.freedi.dev.common.domain.FileVO;
import kr.freedi.dev.common.service.FileService;
import kr.freedi.dev.common.view.FileDownloadView;

@Controller
public class FileController {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "fileService")
	private FileService fileService;
	
	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;
	
	@Resource(name = "bannerService")
	private BannerService bannerService;

	
	@RequestMapping("/file/uploadForm.do")
	public String commonFileUploadForm(
			Model model, 
			String fileId, 
			Integer limitSize, 
			Integer maxFileCount,
			String usePreview,
			String fileType)throws Exception{
		
		if(limitSize==null || limitSize.intValue() <= 0) limitSize = propertiesService.getInt("file.size.default");
		if(maxFileCount==null || maxFileCount.intValue() <= 0) maxFileCount = propertiesService.getInt("file.count.default");
		if(StringUtils.isEmpty(fileType)) fileType = "all";
		if(StringUtils.isEmpty(usePreview)) usePreview = "false";
		
		model.addAttribute("fileType", fileType);
		model.addAttribute("usePreview", usePreview);
		model.addAttribute("fileId", fileId);
		model.addAttribute("limitSize", limitSize);
		model.addAttribute("maxFileCount", maxFileCount);
		
		return "common/file/UploadForm";
	}
	
	
	@RequestMapping("/file/download.do")
	public ModelAndView download(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam(required = true, value="key1")String key1,
			@RequestParam(required = true, value="module")String module) throws Exception{
		
		String pathProp = "file" + "." + module + "." + "path";
		FileVO fileVO = new FileVO();
		
		if(StringUtils.isNotEmpty(pathProp)) {
			
			//banner
			if(StringUtils.equalsIgnoreCase(module, "banner")){
				BannerVO paramVO = new BannerVO();
				paramVO.setBannerKey(Integer.parseInt(key1));
				BannerVO vo = bannerService.select(paramVO);
				
				fileVO.setFileName(vo.getFileMsk());
				fileVO.setServerFileName(vo.getFileMsk());
				fileVO.setAbsolutePath(fileService.getFileDownloadPath(propertiesService.getString(pathProp), "", fileVO.getServerFileName()));
			}
		}
		
		return new ModelAndView(FileDownloadView.NAME, FileDownloadView.MODELNAME, fileVO);
	}
}
