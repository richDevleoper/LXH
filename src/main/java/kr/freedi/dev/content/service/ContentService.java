package kr.freedi.dev.content.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.googlecode.ehcache.annotations.Cacheable;
import com.googlecode.ehcache.annotations.TriggersRemove;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.content.domain.ContentHstryVO;
import kr.freedi.dev.content.domain.ContentSearchVO;
import kr.freedi.dev.content.domain.ContentVO;


/**
 * @project : dev_default
 * @file 	: ContentService.java
 * @date	: 2017. 2. 22.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service("contentService")
public class ContentService implements IContentService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource(name = "contentHstryService")
	private ContentHstryService contentHstryService;

	@Override
	@Cacheable(cacheName = "cache")
	public List<EgovMap> selectList(ContentSearchVO searchVO) {		
		return dao.selectList("Content.selectList", searchVO);
	}
	
	@Override
	@Cacheable(cacheName = "cache")
	public int selectListCount(ContentSearchVO searchVO) {
		return (Integer) dao.selectOne("Content.selectListCount", searchVO);
	}

	public List<EgovMap> selectFullList(ContentVO contentVO){
		return dao.selectList("Content.selectFullList", contentVO);
	};
	
	public Integer selectNextKey(){
		return (Integer)dao.selectOne("Content.selectNextKey");
	}
	
	@Override
	@TriggersRemove(cacheName="cache", removeAll=true)
	public Integer insert(ContentVO contentVO) throws Exception {
		Integer rtnVal = 0;
		Integer nextKey = this.selectNextKey();
		contentVO.setContentKey(nextKey);
		rtnVal = (Integer)dao.insert("Content.insert", contentVO);
		
		//hstry
		if(rtnVal > 0){
			ContentHstryVO contentHstryVO = new ContentHstryVO();
			contentHstryVO.setContentKey(contentVO.getContentKey());
			contentHstryVO.setContent(contentVO.getContent());
			contentHstryVO.setOperId(contentVO.getFrstOperId());
			contentHstryService.insert(contentHstryVO);
		}
		
		return rtnVal;
	}

	@Override
	@Cacheable(cacheName = "cache")
	public ContentVO select(ContentVO contentVO) {
		return (ContentVO) dao.selectOne("Content.select", contentVO);
	}

	@Override
	@TriggersRemove(cacheName="cache", removeAll=true)
	public Integer update(ContentVO contentVO) throws Exception {
		Integer rtnVal = 0;
		rtnVal = (Integer)dao.update("Content.update", contentVO);
		
		//hstry
		if(rtnVal > 0){
			ContentHstryVO contentHstryVO = new ContentHstryVO();
			contentHstryVO.setContentKey(contentVO.getContentKey());
			contentHstryVO.setContent(contentVO.getContent());
			contentHstryVO.setOperId(contentVO.getLastOperId());
			contentHstryService.insert(contentHstryVO);
		}
		
		return rtnVal;
	}

	@Override
	@TriggersRemove(cacheName="cache", removeAll=true)
	public void delete(ContentVO contentVO) {
		dao.delete("Content.delete", contentVO);
	}

	@Override
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public void refreshEcache() {
		log.debug("clear cache = ok");
	}
}
