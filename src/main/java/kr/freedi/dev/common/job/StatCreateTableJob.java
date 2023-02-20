package kr.freedi.dev.common.job;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.web.context.ContextLoader;

import kr.freedi.dev.stat.service.StatService;


/**
 * @project : dev_default
 * @file 	: StatCreatJob.java
 * @date	: 2017. 3. 29.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */

public class StatCreateTableJob extends QuartzJobBean {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Override
	protected void executeInternal (JobExecutionContext ctx) throws JobExecutionException{
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		
		StatService statService = (StatService)ac.getBean("statService");

		log.info("START StatCreateTableJob");
		
		try{
			statService.createNextYearTable();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		log.info("END StatCreateTableJob");
	}
}