package kr.freedi.dev.popup.service;

import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.common.service.FileService;
import kr.freedi.dev.popup.domain.PopupSearchVO;
import kr.freedi.dev.popup.domain.PopupVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.googlecode.ehcache.annotations.Cacheable;
import com.googlecode.ehcache.annotations.TriggersRemove;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: PopupService.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service("popupService")
public class PopupService implements IPopupService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;

	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;

	@Resource(name = "fileService")
	private FileService fileService;

	@Override
	@Cacheable(cacheName = "cache")
	public List<EgovMap> selectList(PopupSearchVO searchVO) {
		return dao.selectList("Popup.selectList", searchVO);
	}

	@Override
	@Cacheable(cacheName = "cache")
	public int selectListCount(PopupSearchVO searchVO) {
		return (Integer) dao.selectOne("Popup.selectListCount", searchVO);
	}

	@Override
	@TriggersRemove(cacheName="cache", removeAll=true)
	public void insert(PopupVO popupVO) throws Exception {

		dao.insert("Popup.insert", popupVO);
	}

	@Override
	@Cacheable(cacheName = "cache")
	public PopupVO select(PopupVO popupVO) {
		return (PopupVO) dao.selectOne("Popup.select", popupVO);
	}

	@Override
	@TriggersRemove(cacheName="cache", removeAll=true)
	public void update(PopupVO popupVO) throws Exception {
		
		dao.update("Popup.update", popupVO);
	}

	@Override
	@TriggersRemove(cacheName="cache", removeAll=true)
	public void delete(PopupVO popupVO) {
		
		dao.delete("Popup.delete", popupVO);
	}

	@Override
	@Cacheable(cacheName = "cache")
	public List<EgovMap> selectFullList(PopupVO popupVO) {
		return dao.selectList("Popup.selectFullList", popupVO);
	}

	@Override
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public void refreshEcache() {
		log.debug("clear cache = ok");
	}
}
