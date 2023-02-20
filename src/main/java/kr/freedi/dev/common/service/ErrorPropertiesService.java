package kr.freedi.dev.common.service;

import java.io.FileNotFoundException;
import java.util.Properties;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.ServletContextResource;

@Service("errorPropertiesService")
public class ErrorPropertiesService {
	
	private ServletContext servletContext;
	private Properties properties;
	
	@Autowired
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	public void setPropertiesPath(String propertiesPath) throws FileNotFoundException {
		try {
			Resource resource = new ServletContextResource(servletContext, propertiesPath);
			properties = PropertiesLoaderUtils.loadProperties(resource);
		} catch (Exception e) {
			throw new FileNotFoundException("Properties File Not Found!! : " + propertiesPath);
		}
	}
	
	public String getValue(String error){
		return String.valueOf(properties.get(error));
	}
}
