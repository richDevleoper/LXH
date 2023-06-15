package kr.freedi.dev.menu.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.googlecode.ehcache.annotations.Cacheable;
import com.googlecode.ehcache.annotations.TriggersRemove;

import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.common.domain.FileVO;
import kr.freedi.dev.common.exception.NotAllowFileExtException;
import kr.freedi.dev.common.exception.OverflowFileSizeException;
import kr.freedi.dev.common.service.FileService;
import kr.freedi.dev.menu.domain.MenuVO;
import kr.freedi.dev.qapprove.domain.ApproveSearchVO;
import kr.freedi.dev.qreport.domain.ReportSearchVO;
import kr.freedi.dev.user.domain.UserVO;


/**
 * @project : dev_default
 * @file 	: MenuService.java
 * @date	: 2017. 2. 14.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service("menuService")
public class MenuService implements IMenuService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;

	@Resource(name = "fileService")
	private FileService fileService;
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;

	@Resource(name = "menuUseService")
	private MenuUseService menuUseService;
	
	
	
	@Cacheable(cacheName = "cache")
	public List<MenuVO> selectTopMenuList(String menuTyp) {
		return dao.selectList("Menu.selectTopMenuList", menuTyp);
	}
	
	@Cacheable(cacheName = "cache")
	public List<MenuVO> selectActTopMenuList(String menuTyp) {
		return dao.selectList("Menu.selectActTopMenuList", menuTyp);
	}
	
	@Cacheable(cacheName = "cache")
	public List<MenuVO> selectMenuList(String menuTyp) {
		
		EgovMap param = new EgovMap();
		param.put("menuTyp", menuTyp);
		param.put("isAdmin", "");
		
		return dao.selectList("Menu.selectMenuList", param);
	}
	
	@Cacheable(cacheName = "cache")
	public List<MenuVO> selectActMenuList(String menuTyp) {
		EgovMap param = new EgovMap();
		param.put("menuTyp", menuTyp);
		param.put("isAdmin", ""); //admin
		//param.put("isAdmin", "0"); //user
		return this.selectActMenuList(param);
	}
	
	@Cacheable(cacheName = "cache")
	public List<MenuVO> selectActMenuList(EgovMap param) {
		
		return dao.selectList("Menu.selectActMenuList", param);
	}
	
	@Cacheable(cacheName = "cache")
	public MenuVO select(int menuKey) {
		MenuVO vo = (MenuVO) dao.selectOne("Menu.selectMenu", menuKey);
		return vo;
	}
	
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public MenuVO insert(int targetKey, String menuNm, String menuTyp, String userid) {

		//최상위 new
		if(targetKey == 0){
			MenuVO menuVO = new MenuVO();
			menuVO.setMenuTyp(menuTyp);
			
			Integer nextMenuKey = this.selectNextMenuKey();
			Integer nextFkey = this.selectNextFkey(menuTyp);
			menuVO.setMenuKey(nextMenuKey);
			menuVO.setFkey(nextFkey);
			menuVO.setPkey(0);
			menuVO.setOkey(0);
			menuVO.setGkey(0);
			menuVO.setMenuNm(menuNm);
			menuVO.setNaviFlg("N"); //부메뉴
			menuVO.setActFlg("Y"); //메뉴 활성
			menuVO.setLinkTyp("EMPTY"); //빈메뉴
			menuVO.setSubViewTyp("LIST"); //기본
			menuVO.setFrstOperId(userid);
			
			dao.insert("Menu.insertMenu", menuVO);
			return select(nextMenuKey);
			
		//하위
		}else{
			MenuVO parentMenuVO = this.select(targetKey);
			log.debug(parentMenuVO.toString());
			MenuVO menuVO = new MenuVO();
			menuVO.setMenuTyp(menuTyp);
			
			Integer nextMenuKey = this.selectNextMenuKey();
			menuVO.setMenuKey(nextMenuKey);
			menuVO.setFkey(parentMenuVO.getFkey());
			menuVO.setPkey(parentMenuVO.getMenuKey());
			menuVO.setGkey(parentMenuVO.getGkey() + 1);
			
			//동일한 pkey 값을 가진 형제메뉴중 가장 큰값+1을 세팅, 형제가 없다면 1로 셋팅
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("pkey", parentMenuVO.getMenuKey());
			Integer nextOkey = (Integer) dao.selectOne("Menu.selectNextOkey", paramMap);
			menuVO.setOkey(nextOkey);
			
			menuVO.setMenuNm(menuNm);
			menuVO.setActFlg("Y"); //메뉴 활성
			menuVO.setLinkTyp("EMPTY"); //빈메뉴
			menuVO.setSubViewTyp("LIST"); //기본
			menuVO.setFrstOperId(userid);
			

			//현재 메뉴 정렬키 값 이상인 레코드의 정렬키 값을 +1 증가시킴
			//dao.update("Menu.updateOkey", menuVO);
			
			//현재 메뉴 insert
			dao.insert("Menu.insertMenu", menuVO);
			return select(nextMenuKey);
		}
	}
	
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public int update(MenuVO menuVO) {
		
		log.debug(menuVO.toString());
		Integer result = 0;
		
		//활성,비활성 여부에 따라 하위 메뉴도 update
		List<MenuVO> childList = this.getChildList(menuVO.getMenuKey());
		log.debug(childList.toString());
		if(childList != null && childList.size() > 0){
			Map<String, Object> paramMap = null;
			for(MenuVO vo : childList){
				paramMap = new HashMap<String, Object>();
				paramMap.put("menuKey", vo.getMenuKey());
				paramMap.put("actFlg", menuVO.getActFlg());
				result += dao.delete("Menu.updateActFlg", paramMap);
			}
		}
		
		result += dao.update("Menu.updateMenu", menuVO);; 
		return result;
	}
	
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public int updateMenuNm(int menuKey, String menuNm, String userid) {

		MenuVO menuVO = new MenuVO();
		menuVO.setMenuKey(menuKey);
		menuVO.setMenuNm(menuNm);
		menuVO.setLastOperId(userid);

		return dao.update("Menu.updateMenuNm", menuVO);
	}

	@TriggersRemove(cacheName = "cache", removeAll = true)
	public void delete(int menuKey) {
		
		List<MenuVO> childList = this.getChildList(menuKey);
		
		log.debug(childList.toString());
		
		if(childList != null && childList.size() > 0){
			Map<String, Object> paramMap = null;
			for(MenuVO vo : childList){
				paramMap = new HashMap<String, Object>();
				paramMap.put("menuKey", vo.getMenuKey());
				dao.delete("Menu.deleteMenu", paramMap);
				
				//delete menuUse
				menuUseService.deleteByMenuKey(vo.getMenuKey());
			}
		}
		
		dao.delete("Menu.deleteMenu", menuKey);
		
		//delete menuUse
		menuUseService.deleteByMenuKey(menuKey);
	}
	
	@TriggersRemove(cacheName="cache", removeAll=true)
	public void updateFile(MultipartHttpServletRequest request, Integer menuKey,
			Map<String, Object> oldValue, String... fieldId) throws OverflowFileSizeException,
			NotAllowFileExtException, FdlException {

		Integer limitSize = propertiesService.getInt("file.menu.size");
		String savePath = propertiesService.getString("file.menu.path");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		MenuVO menuVO = this.select(menuKey);
		
		paramMap.put("mainTopImgOnFile", menuVO.getMainTopImgOn());
		paramMap.put("mainTopImgOffFile", menuVO.getMainTopImgOff());
		paramMap.put("topImgOnFile", menuVO.getTopImgOn());
		paramMap.put("topImgOffFile", menuVO.getTopImgOff());
		paramMap.put("leftTopImgFile", menuVO.getLeftTopImg());
		paramMap.put("leftImgOnFile", menuVO.getLeftImgOn());
		paramMap.put("leftImgOffFile", menuVO.getLeftImgOff());
		paramMap.put("titleImgFile", menuVO.getTitleImg());
		
		for (String f : fieldId) {
			FileVO fileVO = fileService.commonUpload(request, savePath, f, limitSize, "");
			if(fileVO != null) {
				paramMap.put(f, fileVO.getServerFileName());
			} else {
				paramMap.put(f, (String) oldValue.get(f));
			}
		}
		paramMap.put("menuKey", menuKey);
		dao.update("Menu.updateFile", paramMap);
	}
	
	@TriggersRemove(cacheName="cache", removeAll=true)
	public Integer deleteFile(Integer menuKey, String fileColumn){
		
		Integer result = 0;
		String savePath = propertiesService.getString("file.menu.path");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		MenuVO old = this.select(menuKey);
		String deleteFileMask = "";
		
		paramMap.put("menuKey", menuKey);
		
		if(fileColumn.equals("mainTopImgOn")){
			deleteFileMask = old.getMainTopImgOn();
			paramMap.put("columnName", "mainTopImgOn");
		}else if(fileColumn.equals("mainTopImgOff")){
			deleteFileMask = old.getMainTopImgOff();
			paramMap.put("columnName", "mainTopImgOff");
		}else if(fileColumn.equals("topImgOn")){
			deleteFileMask = old.getTopImgOn();
			paramMap.put("columnName", "topImgOn");
		}else if(fileColumn.equals("topImgOff")){
			deleteFileMask = old.getTopImgOff();
			paramMap.put("columnName", "topImgOff");
		}else if(fileColumn.equals("leftTopImg")){
			deleteFileMask = old.getLeftTopImg();
			paramMap.put("columnName", "leftTopImg");
		}else if(fileColumn.equals("leftImgOn")){
			deleteFileMask = old.getLeftImgOn();
			paramMap.put("columnName", "leftImgOn");
		}else if(fileColumn.equals("leftImgOff")){
			deleteFileMask = old.getLeftImgOff();
			paramMap.put("columnName", "leftImgOff");
		}else if(fileColumn.equals("titleImg")){
			deleteFileMask = old.getTitleImg();
			paramMap.put("columnName", "titleImg");
		}
		
		if(StringUtils.isNotEmpty(deleteFileMask)){
			fileService.deleteFile(savePath, deleteFileMask);
			result = dao.update("Menu.deleteFile", paramMap);
		}
		
		return result;
	}
	
	private Integer selectNextMenuKey(){
		return (Integer)dao.selectOne("Menu.selectNextMenuKey");
	}
	
	private Integer selectNextFkey(String menuTyp){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("menuTyp", menuTyp);
		return (Integer)dao.selectOne("Menu.selectNextFkey", paramMap);
	}
	
	//메뉴이동
	@TriggersRemove(cacheName="cache", removeAll=true)
	public Integer moveMenu(String menuTyp, String moveTyp, String moveWay, Integer selectedMenuKey){
		
		MenuVO selectedMenuVO = this.select(selectedMenuKey);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menuTyp", menuTyp);
		map.put("fkey", selectedMenuVO.getFkey());
		map.put("pkey", selectedMenuVO.getPkey());
		map.put("okey", selectedMenuVO.getOkey());
		
		Integer result = 0;
		
		if(StringUtils.equals(moveTyp, "topMenu")){

			Integer prevFkey = 0;
			Integer nextFkey = 0;
			List<MenuVO> currentMenuList = dao.selectList("Menu.selectListByMenuTypAndFkey", map);
			
			if(StringUtils.equals(moveWay, "up")){
				prevFkey = (Integer)dao.selectOne("Menu.selectFkeyForMovePrev", map);
				map.put("fkey", prevFkey);
				List<MenuVO> prevMenuList = dao.selectList("Menu.selectListByMenuTypAndFkey", map);

				if(prevMenuList != null && prevMenuList.size() > 0){
					Map<String, Object> paramMap = new HashMap<String, Object>();
					paramMap.put("menuTyp", menuTyp);
					
					//update current
					paramMap.put("fkey", prevFkey);
					for(MenuVO vo : currentMenuList){
						paramMap.put("menuKey", vo.getMenuKey());	
						result += dao.update("Menu.updateFkeyForMove", paramMap);
					}
					
					//update target
					paramMap.put("fkey", selectedMenuVO.getFkey());
					for(MenuVO vo : prevMenuList){
						paramMap.put("menuKey", vo.getMenuKey());	
						result += dao.update("Menu.updateFkeyForMove", paramMap);
					}
				}
				
			}else if(StringUtils.equals(moveWay, "down")){
				nextFkey = (Integer)dao.selectOne("Menu.selectFkeyForMoveNext", map);
				map.put("fkey", nextFkey);
				List<MenuVO> nextMenuList = dao.selectList("Menu.selectListByMenuTypAndFkey", map);

				if(nextMenuList != null && nextMenuList.size() > 0){
					Map<String, Object> paramMap = new HashMap<String, Object>();
					paramMap.put("menuTyp", menuTyp);
					
					//update current
					paramMap.put("fkey", nextFkey);
					for(MenuVO vo : currentMenuList){
						paramMap.put("menuKey", vo.getMenuKey());	
						result += dao.update("Menu.updateFkeyForMove", paramMap);
					}
					
					//update target
					paramMap.put("fkey", selectedMenuVO.getFkey());
					for(MenuVO vo : nextMenuList){
						paramMap.put("menuKey", vo.getMenuKey());	
						result += dao.update("Menu.updateFkeyForMove", paramMap);
					}
				}
			}
			
		}else if(StringUtils.equals(moveTyp, "childMenu")){
			
			//Integer prevOkey = 0;
			//Integer nextOkey = 0;
			
			if(StringUtils.equals(moveWay, "up")){
				
				MenuVO prevMenuVO = (MenuVO) dao.selectOne("Menu.selectForMovePrev", map);
				if(prevMenuVO != null){
					
					Map<String, Object> paramMap = new HashMap<String, Object>();
					paramMap.put("menuTyp", menuTyp);
					
					//update current
					paramMap.put("menuKey", selectedMenuVO.getMenuKey());
					paramMap.put("okey", prevMenuVO.getOkey());
					result += dao.update("Menu.updateOkeyForMove", paramMap);
					
					//update target
					paramMap.put("menuKey", prevMenuVO.getMenuKey());
					paramMap.put("okey", selectedMenuVO.getOkey());
					result += dao.update("Menu.updateOkeyForMove", paramMap);
				}
				
			}else if(StringUtils.equals(moveWay, "down")){
				
				MenuVO nextMenuVO = (MenuVO) dao.selectOne("Menu.selectForMoveNext", map);
				if(nextMenuVO != null){
					
					Map<String, Object> paramMap = new HashMap<String, Object>();
					paramMap.put("menuTyp", menuTyp);
					
					//update current
					paramMap.put("menuKey", selectedMenuVO.getMenuKey());
					paramMap.put("okey", nextMenuVO.getOkey());
					result += dao.update("Menu.updateOkeyForMove", paramMap);
					
					//update target
					paramMap.put("menuKey", nextMenuVO.getMenuKey());
					paramMap.put("okey", selectedMenuVO.getOkey());
					result += dao.update("Menu.updateOkeyForMove", paramMap);
				}
				
			}
		}
		
		
		
		//List<MenuVO> selectedMenuList = this.selectListByMenuTypAndFkey(menuTyp, selectedFkey);
		//if(StringUtils.equals(moveTyp, "before")){
		
		//}else if(StringUtils.equals(moveTyp, "after")){
		
		//}
		return result;
	}
	
	
	@SuppressWarnings("unused")
	private List<MenuVO> selectListByMenuTypAndFkey(String menuTyp, Integer fkey){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("menuType", menuTyp);
		paramMap.put("fkey", fkey);
		return dao.selectList("Menu.selectListByMenuTypAndFkey", paramMap);
		
	}
	
	
	private List<MenuVO> getChildList(Integer menuKey){
		List<MenuVO> resultList = new ArrayList<MenuVO>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("menuKey", menuKey);
		List<MenuVO>  childList = dao.selectList("Menu.selectChildList", paramMap);
		return this.makeChildList(childList, resultList);
	}
	
	private List<MenuVO> makeChildList(List<MenuVO> childList, List<MenuVO> resultList){
		if(childList != null && childList.size() > 0){
			Map<String, Object> paramMap = null;
			for(MenuVO vo : childList){
				paramMap = new HashMap<String, Object>();
				paramMap.put("menuKey", vo.getMenuKey());
				List<MenuVO>  cList = dao.selectList("Menu.selectChildList", paramMap);
				if(cList != null && cList.size() > 0){
					this.makeChildList(cList, resultList);
				}
				resultList.add(vo);
			}
		}
		return resultList;
	}
	
	/**
	 * @method	: getTreeList
	 * @date	: 2017. 2. 14.
	 * @author	: pdh
	 * @comment	: 트리 형태의 전체메뉴 리스트 반환(전체메뉴)
	 * @history	: 
	 * @param	: 
	 * @return	: List<MenuVO>
	 */
	public List<MenuVO> getTreeList(String menuTyp){
		List<MenuVO> treeList = new ArrayList<MenuVO>();
		
		List<MenuVO> parentMenuList = this.selectTopMenuList(menuTyp);
		List<MenuVO> menuList = this.selectMenuList(menuTyp);
		
		treeList = this.getMakeTreeList(parentMenuList, menuList);
		
		return treeList;
	}
	
	/**
	 * @method	: getActTreeList
	 * @date	: 2017. 2. 14.
	 * @author	: pdh
	 * @comment	: 트리 형태의 전체메뉴 리스트 반환(활성메뉴만)
	 * @history	: 
	 * @param	: 
	 * @return	: List<MenuVO>
	 */
	public List<MenuVO> getActTreeList(String menuTyp){
		List<MenuVO> treeList = new ArrayList<MenuVO>();
		
		List<MenuVO> parentMenuList = this.selectActTopMenuList(menuTyp);
		List<MenuVO> menuList = this.selectActMenuList(menuTyp);
		
		treeList = this.getMakeTreeList(parentMenuList, menuList);
		
		return treeList;
	}
	
	public List<MenuVO> getActTreeList(String menuTyp, String isAdmin){
		List<MenuVO> treeList = new ArrayList<MenuVO>();
		
		List<MenuVO> parentMenuList = this.selectActTopMenuList(menuTyp);
		EgovMap param = new EgovMap();
		param.put("menuTyp", menuTyp);
		if(isAdmin.equals("1")) {
			param.put("isAdmin", ""); // admin
		} else {
			param.put("isAdmin", "0"); // 일반유저
		} 	
		
		List<MenuVO> menuList = this.selectActMenuList(param);
		
		treeList = this.getMakeTreeList(parentMenuList, menuList);
		
		return treeList;
	}
	
	private List<MenuVO> getChildTreeList(MenuVO parentVO, List<MenuVO> menuList){
		List<MenuVO> childList = new ArrayList<MenuVO>();
		for(MenuVO vo : menuList){
			if(parentVO.getMenuKey().equals(vo.getPkey())){
				childList.add(vo);
			}
		}
		
		return childList;
	}
	
	private List<MenuVO> getMakeTreeList(List<MenuVO> topMenuList, List<MenuVO> menuList){
		for(MenuVO menuVO : topMenuList){
			List<MenuVO> cList = getChildTreeList(menuVO, menuList);
			
			if (cList != null && cList.size() > 0) {
				menuVO.setChildList(cList);
				getMakeTreeList(cList, menuList);
			}
		}
		return topMenuList;
	}
	
	/**
	 * @method	: getHistoryMenuList
	 * @date	: 2017. 2. 14.
	 * @author	: pdh
	 * @comment	: 현재메뉴의 직계 트리 반환
	 * @history	: 
	 * @param	: 
	 * @return	: List<MenuVO>
	 */
	public List<MenuVO> getHistoryMenuList(Integer menuKey) {

		List<MenuVO> history = new ArrayList<MenuVO>();
		
		MenuVO menuVO = select(menuKey);
		List<MenuVO> menuList = selectMenuList(menuVO.getMenuTyp());

		history = makeHistoryMenuList(menuKey, menuList);
		return history;

	}
	
	private List<MenuVO> makeHistoryMenuList(int menuKey, List<MenuVO> menuList){
		List<MenuVO> history = new ArrayList<MenuVO>();
		
		int tMenuKey = menuKey;
		
		Collections.reverse(menuList);
		for(MenuVO vo : menuList){
			if(tMenuKey == vo.getMenuKey()){
				history.add(vo);
				tMenuKey = vo.getPkey();
			}
		}
		
		Collections.reverse(history);
		return history;
	}
	
	/**
	 * @method	: getAvailChildMenu
	 * @date	: 2017. 2. 14.
	 * @author	: pdh
	 * @comment	: 하위 메뉴중에 빈메뉴(menuTyp=EMPTY)가 아닌 유효한 메뉴 반환
	 * @history	: 
	 * @param	: 
	 * @return	: MenuVO
	 */
	public MenuVO getAvailChildMenu(MenuVO menuVO){
		
		List<MenuVO> treeSortList = new ArrayList<MenuVO>();
		
		List<MenuVO> parentMenuList = new ArrayList<MenuVO>();
		parentMenuList.add(menuVO);
		
		List<MenuVO> menuList = this.selectActMenuList(menuVO.getMenuTyp());
		
		treeSortList = this.getMakeTreeSortList(treeSortList, parentMenuList, menuList);
		
		if(treeSortList != null && treeSortList.size() > 0){
			for(MenuVO vo : treeSortList){
				if(menuVO.getMenuKey() != vo.getMenuKey() && !StringUtils.equals(vo.getLinkTyp(), "EMPTY")){
					return vo;
				}
			}
			return null;
		}else{
			return null;
		}
	}
	
	private List<MenuVO> getChildTreeSortList(MenuVO parentVO, List<MenuVO> menuList){
		List<MenuVO> childList = new ArrayList<MenuVO>();
		for(MenuVO vo : menuList){
			if(parentVO.getMenuKey().equals(vo.getPkey())){
				childList.add(vo);
			}
		}
		
		return childList;
	}
	
	private List<MenuVO> getMakeTreeSortList(List<MenuVO> resultList, List<MenuVO> parentMenuList, List<MenuVO> menuList){
		List<MenuVO> list = resultList;
		for(MenuVO menuVO : parentMenuList){
			List<MenuVO> cList = getChildTreeSortList(menuVO, menuList);
			
			list.add(menuVO);			
			if (cList != null && cList.size() > 0) {
				
				getMakeTreeSortList(list, cList, menuList);
			}
		}
		return list;
	}
	
	@Override
	@TriggersRemove(cacheName = "cache", removeAll = true)
	public void refreshEcache() {
		log.debug("clear cache = ok");
	}

	@Override
	public void setHeaderInormation(HttpServletRequest request) {
		
		
		UserVO userSession = (UserVO)request.getSession().getAttribute("userSession");
		
		String userId = null;
		if(userSession!=null) {
			userId = userSession.getUserId();
		}
		
		int countReport = 0;
		int countApprove = 0;
		if(userId!=null) {
			ReportSearchVO reportSearchVO = new ReportSearchVO();
			reportSearchVO.setSearchUserid(userSession.getUserId());
			reportSearchVO.setMenuCode("REPORT");
			countReport = (Integer) dao.selectOne("Report.selectFullListTotalCount", reportSearchVO);
			
			ApproveSearchVO approveSearchVO = new ApproveSearchVO();
			approveSearchVO.setSearchUserid(userSession.getUserId());
			countApprove = (Integer) dao.selectOne("Approval.selectListTotalCount", approveSearchVO);	
		}
		
		request.setAttribute("countReport", countReport);
		request.setAttribute("countApprove", countApprove);
		request.setAttribute("countEducation", 0);
	}
}


