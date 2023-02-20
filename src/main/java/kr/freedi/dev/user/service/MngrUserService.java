package kr.freedi.dev.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.common.util.EncriptUtil;
import kr.freedi.dev.user.domain.MngrUserSearchVO;
import kr.freedi.dev.user.domain.MngrUserVO;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: MngrUserService.java
 * @date	: 2017. 2. 17.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service
public class MngrUserService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	
	public List<EgovMap> selectList(MngrUserSearchVO searchVO) {		
		return dao.selectList("MngrUser.selectList", searchVO);
	}
	
	public int selectListCount(MngrUserSearchVO searchVO) {
		return (Integer) dao.selectOne("MngrUser.selectListCount", searchVO);
	}
	
	public void insert(MngrUserVO mngrUserVO) {
		mngrUserVO.setUserId(mngrUserVO.getUserId().toLowerCase());
		mngrUserVO.setUserPw(EncriptUtil.encript(mngrUserVO.getUserPw()));
		dao.insert("MngrUser.insert", mngrUserVO);
	}
	
	public MngrUserVO select(MngrUserVO mngrUserVO) {
		return (MngrUserVO) dao.selectOne("MngrUser.select", mngrUserVO);
	}
	
	public MngrUserVO selectByUserIdAndUserPw(MngrUserVO mngrUserVO) {
		mngrUserVO.setUserPw(EncriptUtil.encript(mngrUserVO.getUserPw()));
		
		return (MngrUserVO) dao.selectOne("MngrUser.selectByUserIdAndUserPw", mngrUserVO);
	}
	
	public void update(MngrUserVO mngrUserVO) {
		if(StringUtils.isNotEmpty(mngrUserVO.getUserPw())){
			mngrUserVO.setUserPw(EncriptUtil.encript(mngrUserVO.getUserPw()));
		}
		dao.update("MngrUser.update", mngrUserVO);
	}
	
	public Integer updateLastLoginDt(MngrUserVO mngrUserVO) {
		return (Integer)dao.update("MngrUser.updateLastLoginDt", mngrUserVO);
	}
	
	public void updateSetNullAuthId(String authId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authId", authId);
		dao.update("MngrUser.updateSetNullAuthId", map);
	}
	
	public void delete(MngrUserVO mngrUserVO) {
		dao.delete("MngrUser.delete", mngrUserVO);
	}
	
}


