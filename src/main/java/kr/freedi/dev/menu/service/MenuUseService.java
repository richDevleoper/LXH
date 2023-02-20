package kr.freedi.dev.menu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import kr.freedi.dev.common.dao.DefaultDAO;

/**
 * @project : dev_default
 * @file 	: MenuUseService.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service("menuUseService")
public class MenuUseService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	public Integer insert(String authId, List<Integer> keyList, String useTyp, String menuTyp) {
		
		Integer result = 0;
		
		this.deleteByAuthIdAndUseTypAndMenuTyp(authId, useTyp, menuTyp);
		
		if(keyList != null && keyList.size() > 0){
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("authId", authId);
			paramMap.put("useTyp", useTyp);
			paramMap.put("menuTyp", menuTyp);
			
			for (Integer menuKey : keyList) {
				paramMap.put("menuKey", menuKey);
				result += dao.insert("MenuUse.insert", paramMap);
			}
		}
		
		return result;
	}

	public void deleteByAuthIdAndUseTypAndMenuTyp(String authId, String useTyp, String menuTyp) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("authId", authId);
		paramMap.put("useTyp", useTyp);
		paramMap.put("menuTyp", menuTyp);
		
		dao.delete("MenuUse.deleteByAuthIdAndUseTypAndMenuTyp", paramMap);
	}
	
	public void deleteByAuthId(String authId) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("authId", authId);
		
		dao.delete("MenuUse.deleteByAuthId", paramMap);
	}
	
	public void deleteByMenuKey(Integer menuKey) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("menuKey", menuKey);
		
		dao.delete("MenuUse.deleteByMenuKey", paramMap);
	}

	public List<Integer> selectMenuUseKeys(String authId, String useTyp, String menuTyp) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("authId", authId);
		paramMap.put("useTyp", useTyp);
		paramMap.put("menuTyp", menuTyp);
		
		return dao.selectList("MenuUse.selectFullList", paramMap);
	}
}
