package kr.freedi.dev.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.common.util.EncriptUtil;
import kr.freedi.dev.user.domain.GenrUserSearchVO;
import kr.freedi.dev.user.domain.GenrUserVO;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: GenrUserService.java
 * @date	: 2017. 2. 17.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service
public class GenrUserService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	
	public List<EgovMap> selectList(GenrUserSearchVO searchVO) {		
		return dao.selectList("GenrUser.selectList", searchVO);
	}
	
	public int selectListCount(GenrUserSearchVO searchVO) {
		return (Integer) dao.selectOne("GenrUser.selectListCount", searchVO);
	}
	
	public Integer insert(GenrUserVO genrUserVO) {
		genrUserVO.setUserId(genrUserVO.getUserId().toLowerCase());
		genrUserVO.setUserPw(EncriptUtil.encript(genrUserVO.getUserPw()));
		return (Integer)dao.insert("GenrUser.insert", genrUserVO);
	}
	
	public GenrUserVO select(GenrUserVO genrUserVO) {
		return (GenrUserVO) dao.selectOne("GenrUser.select", genrUserVO);
	}
	
	public GenrUserVO selectByUserIdAndUserPw(GenrUserVO genrUserVO) {
		genrUserVO.setUserPw(EncriptUtil.encript(genrUserVO.getUserPw()));
		return (GenrUserVO) dao.selectOne("GenrUser.selectByUserIdAndUserPw", genrUserVO);
	}
	
	public GenrUserVO selectByUserNmAndMob(GenrUserVO genrUserVO) {
		return (GenrUserVO) dao.selectOne("GenrUser.selectByUserNmAndMob", genrUserVO);
	}
	
	public GenrUserVO selectByUserIdAndUserNmAndEmail(GenrUserVO genrUserVO) {
		return (GenrUserVO) dao.selectOne("GenrUser.selectByUserIdAndUserNmAndEmail", genrUserVO);
	}
	
	public Integer updateByMngr(GenrUserVO genrUserVO) {
		if(StringUtils.isNotEmpty(genrUserVO.getUserPw())){
			genrUserVO.setUserPw(EncriptUtil.encript(genrUserVO.getUserPw()));
		}
		return (Integer)dao.update("GenrUser.updateByMngr", genrUserVO);
	}
	
	public Integer updateByGenr(GenrUserVO genrUserVO) {
		return (Integer)dao.update("GenrUser.updateByGenr", genrUserVO);
	}
	
	public Integer updatePw(GenrUserVO genrUserVO) {
		if(StringUtils.isNotEmpty(genrUserVO.getUserPw())){
			genrUserVO.setUserPw(EncriptUtil.encript(genrUserVO.getUserPw()));
		}
		return (Integer)dao.update("GenrUser.updatePw", genrUserVO);
	}
	
	public Integer updateLastLoginDt(GenrUserVO genrUserVO) {
		return (Integer)dao.update("GenrUser.updateLastLoginDt", genrUserVO);
	}
	
	public Integer updateRegSt(GenrUserVO genrUserVO) {
		return (Integer)dao.update("GenrUser.updateRegSt", genrUserVO);
	}
	
	public Integer updateSetNullAuthId(String authId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authId", authId);
		return (Integer)dao.update("GenrUser.updateSetNullAuthId", map);
	}
	
	public Integer delete(GenrUserVO genrUserVO) {
		return (Integer)dao.delete("GenrUser.delete", genrUserVO);
	}
	
}


