package kr.freedi.dev.content.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.content.domain.ContentHstryVO;

/**
 * @project : dev_default
 * @file 	: ContentHstryService.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service
public class ContentHstryService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	
	public List<ContentHstryVO> selectFullList(ContentHstryVO contentHstryVO) {
		return dao.selectList("ContentHstry.selectFullList", contentHstryVO);
	}
	
	public Integer insert(ContentHstryVO contentHstryVO) throws Exception {
		return (Integer)dao.insert("ContentHstry.insert", contentHstryVO);
	}

	public ContentHstryVO select(ContentHstryVO contentHstryVO) {
		return (ContentHstryVO) dao.selectOne("ContentHstry.select", contentHstryVO);
	}

	public Integer update(ContentHstryVO contentHstryVO) throws Exception {
		
		return (Integer)dao.update("ContentHstry.update", contentHstryVO);
	}

	public Integer delete(ContentHstryVO contentHstryVO) {
		return (Integer)dao.delete("ContentHstry.delete", contentHstryVO);
	}
	
	
}
