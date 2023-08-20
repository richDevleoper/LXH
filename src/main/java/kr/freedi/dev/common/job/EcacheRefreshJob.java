package kr.freedi.dev.common.job;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.web.context.ContextLoader;

import kr.freedi.dev.ecache.service.EcacheApplyService;


/**
 * @project : dev_default
 * @file 	: EcacheApplyJob.java
 * @date	: 2017. 3. 29.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */

public class EcacheRefreshJob extends QuartzJobBean {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Override
	protected void executeInternal (JobExecutionContext ctx) throws JobExecutionException{
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		
		EcacheApplyService ecacheApplyService = (EcacheApplyService)ac.getBean("ecacheApplyService");

		log.info("START EcacheRefreshJob");
		
		InetAddress ia = null;
		String hostIp = null;
		String hostNm = null;
		try{
			 ia = InetAddress.getLocalHost();
			 hostIp = ia.getHostAddress();
			 hostNm = ia.getHostName();
		}catch(UnknownHostException uhe){
			log.error(uhe.getMessage());
		}
		
		String nodeNm = "";
		String targetSvcNm = "ALL";
		
		if(StringUtils.isEmpty(hostIp) || StringUtils.equals(hostIp, "127.0.0.1")){
			if(StringUtils.isEmpty(hostNm)){
				nodeNm = "UNKNOWN";
			}else{
				nodeNm = hostNm;
			}
		}else{
			nodeNm = hostIp;
		}
		
		System.out.println("hostIp=" + hostIp);
		System.out.println("hostNm=" + hostNm);
		System.out.println("nodeNm=" + nodeNm);
		
		try{
			ecacheApplyService.refreshEcache(nodeNm, targetSvcNm);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		log.info("END EcacheRefreshJob");
	}
}