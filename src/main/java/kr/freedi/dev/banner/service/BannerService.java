package kr.freedi.dev.banner.service;

import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.banner.domain.BannerSearchVO;
import kr.freedi.dev.banner.domain.BannerVO;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.common.domain.FileVO;
import kr.freedi.dev.common.service.FileService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.googlecode.ehcache.annotations.Cacheable;
import com.googlecode.ehcache.annotations.TriggersRemove;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * @project : dev_default
 * @file 	: BannerService.java
 * @date	: 2017. 2. 9.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */

@Service("bannerService")
public class BannerService implements IBannerService{

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;
	
	@Resource(name = "fileService")
	private FileService fileService;
	
	
	@Override
	@Cacheable(cacheName = "cache")
	public List<EgovMap> selectList(BannerSearchVO searchVO) {
		return dao.selectList("Banner.selectList", searchVO);
	}
	
	@Override
	@Cacheable(cacheName = "cache")
	public int selectListCount(BannerSearchVO searchVO) {
		return (Integer) dao.selectOne("Banner.selectListCount", searchVO);
	}
	
	@Override
	@Cacheable(cacheName = "cache")
	public List<EgovMap> selectFullList(BannerVO bannerVO) {
		return dao.selectList("Banner.selectFullList", bannerVO);
	}
	

	@Override
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public void insert(BannerVO bannerVO, MultipartHttpServletRequest mrequest, String inputFileTagName) throws Exception {
		
		String savePath = propertiesService.getString("file.banner.path");
		Integer limitSize = propertiesService.getInt("file.banner.size");
		
		FileVO fileVO = fileService.commonUpload(mrequest, savePath, inputFileTagName, limitSize, "");
		if(fileVO != null) {
			bannerVO.setFileMsk(fileVO.getServerFileName());
		}
		
		dao.insert("Banner.insert", bannerVO);
	}

	
	@Override
	@Cacheable(cacheName = "cache")
	public BannerVO select(BannerVO bannerVO) {
		return (BannerVO) dao.selectOne("Banner.select", bannerVO);
	}

	
	@Override
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public void update(BannerVO bannerVO, MultipartHttpServletRequest mrequest, String inputFileTagName) throws Exception {
		
		String savePath = propertiesService.getString("file.banner.path");
		Integer limitSize = propertiesService.getInt("file.banner.size");
		
		BannerVO old = this.select(bannerVO);
		
		FileVO fileVO = fileService.commonUpload(mrequest, savePath, inputFileTagName, limitSize, "");
		if(fileVO != null) {
			if(old.getFileMsk() != null && old.getFileMsk().length() > 0) {
				fileService.deleteFile(savePath, old.getFileMsk());
			}
			bannerVO.setFileMsk(fileVO.getServerFileName());
		}else{
			bannerVO.setFileMsk(old.getFileMsk());
		}
		
		//입력폼 없는 항목
		bannerVO.setViewOrd(old.getViewOrd());
		
		dao.update("Banner.update", bannerVO);
		
	}

	
	@Override
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public void delete(BannerVO bannerVO) {

		String savePath = propertiesService.getString("file.banner.path");
		
		BannerVO old = this.select(bannerVO);
		
		if(old.getFileMsk() != null && old.getFileMsk().length() > 0) {
			fileService.deleteFile(savePath, old.getFileMsk());
		}
		
		dao.delete("Banner.delete", bannerVO);
	}

	@Override
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public Integer deleteFile(BannerVO bannerVO){
		
		String savePath = propertiesService.getString("file.banner.path");
		
		BannerVO old = this.select(bannerVO);
		
		fileService.deleteFile(savePath, old.getFileMsk());
		
		return dao.update("Banner.deleteFile", old);
	}
	
	@Override
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public void refreshEcache() {
		log.debug("clear cache = ok");
	}
}
