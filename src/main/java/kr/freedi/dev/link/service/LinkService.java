package kr.freedi.dev.link.service;

import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.link.domain.LinkSearchVO;
import kr.freedi.dev.link.domain.LinkVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.googlecode.ehcache.annotations.Cacheable;
import com.googlecode.ehcache.annotations.TriggersRemove;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * @project : dev_default
 * @file 	: LinkService.java
 * @date	: 2017. 2. 8.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */

@Service("linkService")
public class LinkService implements ILinkService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;

	@Override
	@Cacheable(cacheName = "cache")
	public List<EgovMap> selectList(LinkSearchVO searchVO) {		
		return dao.selectList("Link.selectList", searchVO);
	}
	
	@Override
	@Cacheable(cacheName = "cache")
	public int selectListCount(LinkSearchVO searchVO) {
		return (Integer) dao.selectOne("Link.selectListCount", searchVO);
	}
	
	@Override
	@Cacheable(cacheName = "cache")
	public List<EgovMap> selectFullList(LinkVO linkVO) {
		return dao.selectList("Link.selectFullList", linkVO);
	}
	
	@Override
	@TriggersRemove(cacheName="cache", removeAll=true)
	public void insert(LinkVO linkVO) throws Exception {
		dao.insert("Link.insert", linkVO);
	}
	
	@Override
	@Cacheable(cacheName = "cache")
	public LinkVO select(LinkVO linkVO) {
		return (LinkVO) dao.selectOne("Link.select", linkVO);
	}
	
	@Override
	@TriggersRemove(cacheName="cache", removeAll=true)
	public void update(LinkVO linkVO) throws Exception {
		
		dao.update("Link.update", linkVO);
	}
	
	@Override
	@TriggersRemove(cacheName="cache", removeAll=true)
	public void delete(LinkVO linkVO) {
		dao.delete("Link.delete", linkVO);
	}
	
	@Override
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public void refreshEcache() {
		log.debug("clear cache = ok");
	}
}
