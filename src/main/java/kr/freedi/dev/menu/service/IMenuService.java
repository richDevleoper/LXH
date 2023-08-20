package kr.freedi.dev.menu.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.common.exception.NotAllowFileExtException;
import kr.freedi.dev.common.exception.OverflowFileSizeException;
import kr.freedi.dev.menu.domain.MenuVO;

import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.googlecode.ehcache.annotations.Cacheable;
import com.googlecode.ehcache.annotations.TriggersRemove;

import egovframework.rte.fdl.cmmn.exception.FdlException;


/**
 * @project : dev_default
 * @file 	: IMenuService.java
 * @date	: 2017. 2. 14.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public interface IMenuService {

	@Cacheable(cacheName = "cache")
	public abstract List<MenuVO> selectTopMenuList(String menuType);
	
	@Cacheable(cacheName = "cache")
	public abstract List<MenuVO> selectActTopMenuList(String menuType);
	
	@Cacheable(cacheName = "cache")
	public abstract List<MenuVO> selectMenuList(String menuType);
	
	@Cacheable(cacheName = "cache")
	public abstract List<MenuVO> selectActMenuList(String menuType);

	@Cacheable(cacheName = "cache")
	public abstract MenuVO select(int menuKey);
	
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public abstract MenuVO insert(int targetKey, String menuName, String menuType, String userid);
	
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public abstract int update(MenuVO menuVO);
	
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public abstract int updateMenuNm(int menuKey, String menuName, String userid);	
	
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public abstract void delete(int menuKey);
	
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public abstract void updateFile(MultipartHttpServletRequest request, Integer menuKey,
			Map<String, Object> oldValue, String... fieldId) throws OverflowFileSizeException,
			NotAllowFileExtException, FdlException;
	
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public abstract Integer deleteFile(Integer menuKey, String columnName);
	
	public abstract Integer moveMenu(String menuTyp, String moveTyp, String moveWay, Integer selectedMenuKey);

	public abstract List<MenuVO> getTreeList(String menuTyp);
	
	public abstract List<MenuVO> getActTreeList(String menuTyp);
	
	public abstract List<MenuVO> getActTreeList(String menuTyp, String isAdmin);
	
	public abstract List<MenuVO> getHistoryMenuList(Integer MenuKey);
	
	public abstract MenuVO getAvailChildMenu(MenuVO menuVO);
	
	public abstract void refreshEcache();

	public abstract void setHeaderInormation(HttpServletRequest request);

}


