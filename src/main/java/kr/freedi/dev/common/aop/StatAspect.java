package kr.freedi.dev.common.aop;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.freedi.dev.stat.service.MenuStatService;
import kr.freedi.dev.stat.service.StatService;

import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.core.annotation.Order;


/**
 * @project : dev_default
 * @file 	: StatAspect.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Aspect
@Order(1)
public class StatAspect {

	@Resource(name = "statService")
	private StatService statService;
	
	@Resource(name = "menuStatService")
	private MenuStatService menuStatService;

	
	@SuppressWarnings("unchecked")
	@Before("within(@org.springframework.stereotype.Controller *)")
	public void statisticCheck(JoinPoint joinPoint) throws Throwable {
		
		Object[] args = joinPoint.getArgs();
		for (Object obj : args) {
			
			if (obj instanceof HttpServletRequest) {
				HttpServletRequest request = (HttpServletRequest) obj;

				String defSessionId = request.getSession().getAttribute("defSessionId") == null ? "" : (String)request.getSession().getAttribute("defSessionId");
				String engSessionId = request.getSession().getAttribute("engSessionId") == null ? "" : (String)request.getSession().getAttribute("engSessionId");
				String mblSessionId = request.getSession().getAttribute("mblSessionId") == null ? "" : (String)request.getSession().getAttribute("mblSessionId");
				
				String uri = request.getRequestURI();
				
				/*접속통계***************************/
				if(!StringUtils.startsWith(uri, "/csl")){
					String refererUri = request.getHeader("referer") == null ? "" : request.getHeader("referer").replaceFirst("^(https?):\\/\\/([^:\\/\\s]+)(:([^\\/]*))?", "");
					if(!StringUtils.startsWith(refererUri, "/csl")){
						//eng
						if(StringUtils.startsWith(uri, "/eng")){
							if(StringUtils.isEmpty(engSessionId)){
								request.getSession().setAttribute("engSessionId", request.getSession().getId());
								statService.insert(request, "ENG");				
							}
						//mobile
						}else if(StringUtils.startsWith(uri, "/mobile")){
							if(StringUtils.isEmpty(mblSessionId)){
								request.getSession().setAttribute("mblSessionId", request.getSession().getId());
								statService.insert(request, "MBL");							
							}
						//def
						}else{
							if(!StringUtils.startsWith(request.getHeader("referer"), "/csl") && StringUtils.isEmpty(defSessionId)){
								request.getSession().setAttribute("defSessionId", request.getSession().getId());
								statService.insert(request, "DEF");				
							}
						}
					}
				}
				
				/* 메뉴통계 ************************/
				if(!StringUtils.startsWith(uri, "/csl")){
					String menuKey = request.getParameter("menuKey");
					if(menuKey != null && !StringUtils.equals(StringUtils.trim(menuKey), "")){
						String statMenuKey = StringUtils.trim(menuKey);
						List<String> defStatMenuKeys = request.getSession().getAttribute("defStatMenuKeys") == null ? new ArrayList<String>() : (ArrayList<String>)request.getSession().getAttribute("defStatMenuKeys");
						List<String> engStatMenuKeys = request.getSession().getAttribute("engStatMenuKeys") == null ? new ArrayList<String>() : (ArrayList<String>)request.getSession().getAttribute("engStatMenuKeys");
						List<String> mblStatMenuKeys = request.getSession().getAttribute("mblStatMenuKeys") == null ? new ArrayList<String>() : (ArrayList<String>)request.getSession().getAttribute("mblStatMenuKeys");
						
						//eng
						if(StringUtils.startsWith(uri, "/eng")){
							if(!StringUtils.startsWith(request.getHeader("referer"), "/csl") && !StringUtils.startsWith(uri, "/eng/sub.do")){
								if(engStatMenuKeys.indexOf(statMenuKey) < 0){
									engStatMenuKeys.add(statMenuKey);
									request.getSession().setAttribute("engStatMenuKeys", engStatMenuKeys);
									menuStatService.insert(request,"ENG");
								}
							}
						//mbl
						}else if(StringUtils.startsWith(uri, "/mobile")){
							if(!StringUtils.startsWith(request.getHeader("referer"), "/csl") && !StringUtils.startsWith(uri, "/mobile/sub.do")){
								if(mblStatMenuKeys.indexOf(statMenuKey) < 0){
									mblStatMenuKeys.add(statMenuKey);
									request.getSession().setAttribute("mblStatMenuKeys", mblStatMenuKeys);
									menuStatService.insert(request,"MBL");
								}
							}
							
						//def
						}else{
							if(!StringUtils.startsWith(request.getHeader("referer"), "/csl") && !StringUtils.startsWith(uri, "/sub.do")){
								if(defStatMenuKeys.indexOf(statMenuKey) < 0){
									defStatMenuKeys.add(statMenuKey);
									request.getSession().setAttribute("defStatMenuKeys", defStatMenuKeys);
									menuStatService.insert(request,"DEF");
								}
							}
						}
					}
				}
			}
		}
	}
}