package kr.freedi.dev.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.common.util.EncriptUtil;
import kr.freedi.dev.user.domain.CorpUserSearchVO;
import kr.freedi.dev.user.domain.CorpUserVO;
import kr.freedi.dev.user.domain.IntfUserVO;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: LxhUserService.java
 * @date	: 2023. 4. 26.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service
public class IntfUserService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	
	public IntfUserVO selectByComNo(IntfUserVO vo) {
		return (IntfUserVO) dao.selectOne("IntfUser.selectByComNo", vo);
	}

	public Integer updateLastLoginDt(IntfUserVO vo) {
		return (Integer)dao.update("IntfUser.updateLastLoginDt", vo);
	}
}


