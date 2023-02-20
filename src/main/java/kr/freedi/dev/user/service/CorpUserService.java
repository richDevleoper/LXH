package kr.freedi.dev.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.common.util.EncriptUtil;
import kr.freedi.dev.user.domain.CorpUserSearchVO;
import kr.freedi.dev.user.domain.CorpUserVO;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: CorpUserService.java
 * @date	: 2017. 2. 17.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service
public class CorpUserService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	
	public List<EgovMap> selectList(CorpUserSearchVO searchVO) {		
		return dao.selectList("CorpUser.selectList", searchVO);
	}
	
	public int selectListCount(CorpUserSearchVO searchVO) {
		return (Integer) dao.selectOne("CorpUser.selectListCount", searchVO);
	}
	
	public Integer insert(CorpUserVO corpUserVO) {
		corpUserVO.setUserId(corpUserVO.getUserId().toLowerCase());
		corpUserVO.setUserPw(EncriptUtil.encript(corpUserVO.getUserPw()));
		return (Integer)dao.insert("CorpUser.insert", corpUserVO);
	}
	
	public CorpUserVO select(CorpUserVO corpUserVO) {
		return (CorpUserVO) dao.selectOne("CorpUser.select", corpUserVO);
	}
	
	public CorpUserVO selectByUserIdAndUserPw(CorpUserVO corpUserVO) {
		corpUserVO.setUserPw(EncriptUtil.encript(corpUserVO.getUserPw()));
		return (CorpUserVO) dao.selectOne("CorpUser.selectByUserIdAndUserPw", corpUserVO);
	}
	
	public CorpUserVO selectByUserNmAndChrMob(CorpUserVO corpUserVO) {
		return (CorpUserVO) dao.selectOne("CorpUser.selectByUserNmAndChrMob", corpUserVO);
	}
	
	public CorpUserVO selectByUserIdAndUserNmAndEmail(CorpUserVO corpUserVO) {
		return (CorpUserVO) dao.selectOne("CorpUser.selectByUserIdAndUserNmAndEmail", corpUserVO);
	}
	
	public Integer updateByMngr(CorpUserVO corpUserVO) {
		if(StringUtils.isNotEmpty(corpUserVO.getUserPw())){
			corpUserVO.setUserPw(EncriptUtil.encript(corpUserVO.getUserPw()));
		}
		return (Integer)dao.update("CorpUser.updateByMngr", corpUserVO);
	}
	
	public Integer updateByCorp(CorpUserVO corpUserVO) {
		return (Integer)dao.update("CorpUser.updateByCorp", corpUserVO);
	}
	
	public Integer updatePw(CorpUserVO corpUserVO) {
		if(StringUtils.isNotEmpty(corpUserVO.getUserPw())){
			corpUserVO.setUserPw(EncriptUtil.encript(corpUserVO.getUserPw()));
		}
		return (Integer)dao.update("CorpUser.updatePw", corpUserVO);
	}
	
	public Integer updateLastLoginDt(CorpUserVO corpUserVO) {
		return (Integer)dao.update("CorpUser.updateLastLoginDt", corpUserVO);
	}
	
	public Integer updateRegSt(CorpUserVO corpUserVO) {
		return (Integer)dao.update("CorpUser.updateRegSt", corpUserVO);
	}
	
	public void updateSetNullAuthId(String authId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authId", authId);
		dao.update("CorpUser.updateSetNullAuthId", map);
	}
	
	public void delete(CorpUserVO corpUserVO) {
		dao.delete("CorpUser.delete", corpUserVO);
	}
	
}


