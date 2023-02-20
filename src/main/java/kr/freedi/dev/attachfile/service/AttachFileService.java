package kr.freedi.dev.attachfile.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import kr.freedi.dev.attachfile.domain.AttachFileVO;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.common.util.RandomUtil;
import kr.freedi.dev.common.util.ThumbNailUtil;
import kr.freedi.dev.common.util.DateUtil;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @project : offset
 * @file 	: AttachFileService.java
 * @date	: 2017. 4. 3.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service
public class AttachFileService {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;
	
	@Autowired
	private ServletContext servletContext;
	
	
	/*
	final String UPLOAD_FULL_DIR = servletContext.getRealPath("/") + propertiesService.getString("attachfile.path.dir");
	final String UPLOAD_DIR = propertiesService.getString("attachfile.path.dir");
	final String FTP_SERVER_IP = propertiesService.getString("attachfile.ftp.server.ip");
	final String FTP_USER_ID = propertiesService.getString("attachfile.user.id");
	final String FTP_USER_PWD = propertiesService.getString("attachfile.user.pwd");
	final String FILE_EXT_IMG = propertiesService.getString("file.ext.images");
	*/
	
	public List<AttachFileVO> selectFullList(AttachFileVO attachFileVO) {
		return dao.selectList("AttachFile.selectFullList", attachFileVO);
	}
	

	public AttachFileVO select(AttachFileVO attachFileVO) {
		return (AttachFileVO) dao.selectOne("AttachFile.select", attachFileVO);
	}

	public AttachFileVO selectByFileMsk(AttachFileVO attachFileVO) {
		return (AttachFileVO) dao.selectOne("AttachFile.selectByFileMsk", attachFileVO);
	}
	
	public Integer insert(AttachFileVO attachFileVO) throws Exception {
		return (Integer)dao.insert("AttachFile.insert", attachFileVO);
	}

	
	public void updateByFileIdAndFileSeq(AttachFileVO attachFileVO) throws Exception {
		dao.update("AttachFile.updateByFileIdAndFileSeq", attachFileVO);
	}

	
	public void updateDeleteFlgByFileId(AttachFileVO attachFileVO){
		dao.update("AttachFile.updateDeleteFlgByFileId", attachFileVO);
	}
	
	
	public void updateDeleteFlgByFileIdAndFileSeq(AttachFileVO attachFileVO){
		dao.update("AttachFile.updateDeleteFlgByFileIdAndFileSeq", attachFileVO);
	}
	
	
	public void updateDwnldCntByFileId(AttachFileVO attachFileVO){
		dao.update("AttachFile.updateDwnldCntByFileId", attachFileVO);
	}
	
	
	public void updateDwnldCntByFileIdAndFileSeq(AttachFileVO attachFileVO){
		dao.update("AttachFile.updateDwnldCntByFileIdAndFileSeq", attachFileVO);
	}
	
	
	public void deleteByFileId(AttachFileVO attachFileVO) {
		dao.delete("AttachFile.deleteByFileId", attachFileVO);
	}

	
	public void deleteByFileIdAndFileSeq(AttachFileVO attachFileVO) {
		dao.delete("AttachFile.deleteByFileIdAndFileSeq", attachFileVO);
	}
	
	
	
	
	public List<AttachFileVO> uploadAttachFile(Collection<MultipartFile> multipartFiles, AttachFileVO attachFileVO) {
		List<AttachFileVO> resultList = new ArrayList<AttachFileVO>();
		if(multipartFiles != null){
			for (MultipartFile mf : multipartFiles) {
				resultList.add(uploadAttachFile(mf, attachFileVO));
	        }
		}
		return resultList;
	}
	
	@SuppressWarnings("unused")
	public AttachFileVO uploadAttachFile(MultipartFile multipartFile, AttachFileVO attachFileVO) {
		
		AttachFileVO rtnVO = new AttachFileVO();
		AttachFileVO uploadVO = new AttachFileVO();
		uploadVO.setFileId(attachFileVO.getFileId());
		uploadVO.setFileGrp(attachFileVO.getFileGrp());
		uploadVO.setDwnldCnt(0);
		uploadVO.setDeleteFlg("N");
		
		uploadVO.setFileMsk(this.getGenerateFileMask());
		uploadVO.setFileNm(multipartFile.getOriginalFilename());
		uploadVO.setFileSiz(multipartFile.getSize());
		String uploadDirectoryPath = this.getUploadDirectoryPath(propertiesService.getString("attachfile.path.dir"), uploadVO.getFileGrp());
		String uploadFilePath = getUploadFilePath(propertiesService.getString("attachfile.path.dir"), uploadVO.getFileGrp(), uploadVO.getFileMsk());
		
		log.debug("uploadDirectoryPath=" + uploadDirectoryPath);
		log.debug("uploadFilePath=" + uploadFilePath);
		
		try {
			File dir = new File(uploadDirectoryPath);
			if(!dir.exists()){
				dir.mkdirs();
			}
			
			FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(uploadFilePath));
			
			if(ThumbNailUtil.isImageFile(uploadVO.getFileNm(), propertiesService.getString("file.ext.images"))){
				ThumbNailUtil.createImage(uploadDirectoryPath, uploadVO.getFileMsk(), StringUtils.substringAfterLast(uploadVO.getFileNm(), "."));
			}
			
			log.debug(uploadVO.toString());
			Integer result = this.insert(uploadVO);
			rtnVO = this.selectByFileMsk(uploadVO);
			
		}catch(IOException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return rtnVO;
	}
	
	public void deleteAttachFile(String fileId){
		AttachFileVO paramVO = new AttachFileVO();
		paramVO.setFileId(fileId);
		List<AttachFileVO> attachFileList = this.selectFullList(paramVO);
		if(attachFileList != null && attachFileList.size() > 0){
			for(AttachFileVO vo : attachFileList){
				this.deleteAttachFile(fileId, vo.getFileSeq());
			}
		}
	}
	
	public void deleteAttachFile(String fileId, Integer fileSeq){
		AttachFileVO attachFileVO = new AttachFileVO();
		attachFileVO.setFileId(fileId);
		attachFileVO.setFileSeq(fileSeq);
		
		AttachFileVO removeVO = this.select(attachFileVO);
		if(removeVO != null && StringUtils.isNotEmpty(removeVO.getFileId())){
			File file = new File(this.getFileDownloadFilePath(propertiesService.getString("attachfile.path.dir"), removeVO.getFileGrp(), removeVO.getFileMsk()));
			File thumbFile = new File(this.getFileDownloadFilePath(propertiesService.getString("attachfile.path.dir"), removeVO.getFileGrp(), "thumb_" + removeVO.getFileMsk()));
			
			this.removeAttachFile(file, thumbFile);
			this.deleteByFileIdAndFileSeq(removeVO);
		}
	}
	
	public void deleteAttachFileByFileMsk(String fileMsk){
		AttachFileVO attachFileVO = new AttachFileVO();
		attachFileVO.setFileMsk(fileMsk);
		
		AttachFileVO removeVO = this.selectByFileMsk(attachFileVO);
		if(removeVO != null && StringUtils.isNotEmpty(removeVO.getFileId())){
			File file = new File(this.getFileDownloadFilePath(propertiesService.getString("attachfile.path.dir"), removeVO.getFileGrp(), removeVO.getFileMsk()));
			File thumbFile = new File(this.getFileDownloadFilePath(propertiesService.getString("attachfile.path.dir"), removeVO.getFileGrp(), "thumb_" + removeVO.getFileMsk()));
			
			this.removeAttachFile(file, thumbFile);
			this.deleteByFileIdAndFileSeq(removeVO);
		}
	}
	
	public void removeAttachFile(File... deleteFiles){
		for(File file : deleteFiles){
			if(file.exists() && file.isFile()){
				file.delete();
			}
		}
	}
	
	public String getGenerateFileMask() {
		return DateUtil.getSysDate() + RandomUtil.getSmallLetter(14);
	}
	
	private String getAbsolutePath(){
		
		String absolutePath = servletContext.getRealPath("/");
		String rootAbsPath = propertiesService.getString("file.root.absolute.path");
		String rootRelPath = propertiesService.getString("file.root.relative.path");
		
		if (StringUtils.isNotEmpty(rootAbsPath)) {
			absolutePath = rootAbsPath;
		}else{
			absolutePath += rootRelPath;
		}
		
		if (StringUtils.lastIndexOf(absolutePath, "/") == -1 || StringUtils.lastIndexOf(absolutePath, "\\") == -1) {
			absolutePath += File.separator;
		}
		
		return absolutePath;
	}
	
    public String getUploadDirectoryPath(String defaultPath, String fileGrp) {
    	return new StringBuilder().append(this.getAbsolutePath())
    		.append(defaultPath)
			.append(java.io.File.separator)
			.append(fileGrp)
			.append(java.io.File.separator)
			.append(DateUtil.getSysDate("yyyy"))
			.append(java.io.File.separator)
			.toString();
	}

    public String getUploadFilePath(String defaultPath, String fileGrp, String fileMsk) {
    	return this.getUploadDirectoryPath(defaultPath, fileGrp).concat(fileMsk);
    }

	public String getFileDownloadDirectoryPath(String defaultPath, String fileGrp, String fileMsk) {
		return new StringBuilder().append(this.getAbsolutePath())
			.append(defaultPath)
			.append(java.io.File.separator)
			.append(fileGrp)
			.append(java.io.File.separator)
			.append(fileMsk.substring(0, 4))
			.append(java.io.File.separator)
			.toString();
	}
	
    public String getFileDownloadFilePath(String defaultPath, String fileGrp, String fileMsk) {
		return getFileDownloadDirectoryPath(defaultPath, fileGrp, fileMsk).concat(fileMsk);
	}
	

}


