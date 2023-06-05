package kr.freedi.dev.common.controller;

import java.util.Collections;
import java.util.Properties;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;

import com.opensymphony.module.sitemesh.Config;
import com.opensymphony.module.sitemesh.Decorator;
import com.opensymphony.module.sitemesh.DecoratorMapper;
import com.opensymphony.module.sitemesh.Page;
import com.opensymphony.module.sitemesh.mapper.ConfigDecoratorMapper;
import com.opensymphony.module.sitemesh.mapper.ConfigLoader;

import kr.freedi.dev.banner.domain.BannerVO;
import kr.freedi.dev.banner.service.IBannerService;
import kr.freedi.dev.board.domain.BoardVO;
import kr.freedi.dev.board.service.BoardService;
import kr.freedi.dev.menu.domain.MenuVO;
import kr.freedi.dev.menu.service.IMenuService;

/**
 * @project : dev_default
 * @file 	: CustomConfigDecoratorMapper.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Component
public class CustomConfigDecoratorMapper extends ConfigDecoratorMapper {

	protected Log log = LogFactory.getLog(this.getClass());

	//private List pageProps;
	private ConfigLoader configLoader;
	final String MENU_TYP_CSL = "CSL";
	final String MENU_TYP_DEF = "DEF";
	final String MENU_TYP_ENG = "ENG";

	private static IMenuService menuService;
	private static IBannerService bannerService;
	private static BoardService boardService;
	

	@SuppressWarnings("static-access")
	@Autowired
	public void setMenuService(IMenuService _menuService) {
		this.menuService = _menuService;
	}
	@SuppressWarnings("static-access")
	@Autowired
	public void setBannerService(IBannerService _bannerService) {
		this.bannerService = _bannerService;
	}
	@SuppressWarnings("static-access")
	@Autowired
	public void setBoardService(BoardService _boardService){
		this.boardService = _boardService;
	}
	
	public CustomConfigDecoratorMapper(){
		this.configLoader = null;
	}

	@Override
	public void init(Config config, Properties properties, DecoratorMapper parent) throws InstantiationException {
		super.init(config, properties, parent);
		try {
			String fileName = properties.getProperty("config");
			this.configLoader = new ConfigLoader(fileName, config);
		} catch (Exception e) {
			throw new InstantiationException(e.toString());
		}
	}
	
	@Override
	public Decorator getNamedDecorator(HttpServletRequest request, String name) {
		Decorator result = null;
		try {
			result = this.configLoader.getDecoratorByName(name);
		} catch (ServletException e) {
			e.printStackTrace();
		}

		if ((result == null) || ((result.getRole() != null) && (!(request.isUserInRole(result.getRole()))))) {
			return super.getNamedDecorator(request, name);
		}
		return result;
	}

	@Override
	public Decorator getDecorator(HttpServletRequest request, Page page){
		Decorator decorator = null;
		
		String thisPath = request.getServletPath();

		if (thisPath == null) {
			String requestURI = request.getRequestURI();
			if (request.getPathInfo() != null) {
				thisPath = requestURI.substring(0, requestURI.indexOf(request.getPathInfo()));
			} else {
				thisPath = requestURI;
			}
		} else if ("".equals(thisPath)) {
			thisPath = request.getPathInfo();
		}
		
		if(StringUtils.endsWith(thisPath, ".jsp")){
			thisPath = (String)request.getAttribute("org.springframework.web.servlet.HandlerMapping.pathWithinHandlerMapping");
		}
		
		String name = null;
		
		try {
			name = this.configLoader.getMappedName(thisPath);
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
		decorator = getNamedDecorator(request, name) == null ? super.getDecorator(request, page) : getNamedDecorator(request, name);

		if(decorator != null){
			//def
			if(decorator.getName().equals("def") || decorator.getName().equals("defIndex")){
				request.setAttribute("treeMenuList", menuService.getActTreeList(MENU_TYP_DEF));
				if(request.getParameter("menuKey") != null && !request.getParameter("menuKey").equals("")){
					MenuVO menuVO = menuService.select(Integer.parseInt(request.getParameter("menuKey")));
					request.setAttribute("currentMenu", menuVO);
					request.setAttribute("historyMenuList", menuService.getHistoryMenuList(menuVO.getMenuKey()));
					
					menuService.setHeaderInormation(request);
					
					/*if(decorator.getName().equals("def")){
			        	ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
			        	IBannerService bannerService = (IBannerService)ac.getBean("bannerService");
			        	//sub visual banner
			    		BannerVO visualBannerVO = new BannerVO();
			    		visualBannerVO.setLocateTyp("SUB_VISUAL");
			    		visualBannerVO.setActFlg("Y");
			    		request.setAttribute("subBanner", bannerService.selectFullList(visualBannerVO).get(0));
			        }*/
				}
				
				
			//eng
			}else if(decorator.getName().equals("eng") || decorator.getName().equals("engIndex")){
				request.setAttribute("treeMenuList", menuService.getActTreeList(MENU_TYP_ENG));
				if(request.getParameter("menuKey") != null && !request.getParameter("menuKey").equals("")){
					MenuVO menuVO = menuService.select(Integer.parseInt(request.getParameter("menuKey")));
					request.setAttribute("currentMenu", menuVO);
					request.setAttribute("historyMenuList", menuService.getHistoryMenuList(menuVO.getMenuKey()));
				}
				
				
			//csl
			}else if(decorator.getName().equals("csl") || decorator.getName().equals("cslIndex")){

				request.setAttribute("treeMenuList", menuService.getActTreeList(MENU_TYP_CSL));

				if(request.getParameter("menuKey") != null && !request.getParameter("menuKey").equals("")){
					MenuVO menuVO = menuService.select(Integer.parseInt(request.getParameter("menuKey")));
					request.setAttribute("currentMenu", menuVO);
					request.setAttribute("historyMenuList", menuService.getHistoryMenuList(menuVO.getMenuKey()));
				}
				
				String sBoardKey = request.getParameter("boardKey") == null ? "" : request.getParameter("boardKey");
				if(StringUtils.isNotEmpty(request.getParameter("boardKey"))){
					BoardVO boardVO = new BoardVO();
					boardVO.setBoardKey(Integer.parseInt(sBoardKey));
					request.setAttribute("currentBoard", boardService.select(boardVO));
				}
			}

		}

		String currentUrl = request.getRequestURI();
		log.debug("requestUri=" + currentUrl);

		//pdh
		SortedMap<String, String[]> sMap = Collections.synchronizedSortedMap(new TreeMap<String, String[]>(request.getParameterMap()));
		int firstParameter = 0;
		for(String key : sMap.keySet()){
			String[] value = sMap.get(key);
			for(int n = 0; n < value.length; n++){
				if(firstParameter == 0){
					currentUrl += "?" + key + "=" + value[n];
				} else {
					currentUrl += "&" + key + "=" + value[n];
				}
			}
			firstParameter++;
		}
		request.getSession().setAttribute("currentUrl", currentUrl);

		return decorator;
	}
}
