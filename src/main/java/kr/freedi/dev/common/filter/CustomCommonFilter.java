package kr.freedi.dev.common.filter;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import kr.freedi.dev.banner.domain.BannerVO;
import kr.freedi.dev.banner.service.IBannerService;

/**
 * @project : dev_default
 * @file : CustomCommonFilter.java
 * @date : 2017. 2. 22.
 * @author : pdh
 * @comment :
 * @history :
 */
public class CustomCommonFilter implements Filter {

	protected FilterConfig filterConfig = null;

	public void init(FilterConfig fc) throws ServletException {
		this.filterConfig = fc;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		//write reqHistory
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		String[] reqHistory = httpRequest.getSession().getAttribute("reqHistory") == null ? new String[10] : (String[])httpRequest.getSession().getAttribute("reqHistory");
        for( int i = reqHistory.length-2; i >= 0 ; i-- ){
        	reqHistory[i+1] = reqHistory [i];
        }
        reqHistory[0] = httpRequest.getRequestURI();
        httpRequest.getSession().setAttribute("reqHistory", reqHistory);
		
        //for(int i =0; i<reqHistory.length; i++){
        //	System.out.println(this.getClass() + ">reqHistory" + i + "=" + reqHistory[i]);	
        //}
        //check menuKey
		String sMenuKey = request.getParameter("menuKey");
		if(sMenuKey != null && StringUtils.isNotEmpty(sMenuKey)){
			try{
				@SuppressWarnings("unused")
				Integer iMenuKey = Integer.parseInt(sMenuKey);
			}catch(NumberFormatException e){
				HttpServletResponse httpResponse = (HttpServletResponse)response;
				httpResponse.sendRedirect("/common/error.do");
				return;
			}
		}
		chain.doFilter(request, response);
	}
	
	public void destroy(){
		this.filterConfig = null;
	}

	public FilterConfig getFilterConfig() {
		return filterConfig;
	}
	public void setFilterConfig(FilterConfig filterConfig) {
		this.filterConfig = filterConfig;
	}
}
