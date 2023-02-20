package kr.freedi.dev.common.aop;

import java.lang.reflect.Method;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;

import com.googlecode.ehcache.annotations.TriggersRemove;

import kr.freedi.dev.ecache.domain.EcacheApplyVO;
import kr.freedi.dev.ecache.service.EcacheApplyService;

/**
 * @project : dev_default
 * @file 	: EcacheAspect.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Aspect
@Order(5)
public class EcacheAspect {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource
	private EcacheApplyService ecacheApplyService;
	
	private String[] includeClasses = {
			"MenuService",
			"ContentService",
			"BannerService", 
			"PopupService", 
			"LinkService"};
	
	@AfterReturning("execution(* kr.freedi.dev.*.service.*Service.*(..))")
	public void afterCache(JoinPoint joinPoint) throws Throwable {
		String className = joinPoint.getTarget().getClass().getSimpleName();
		//String packageName = joinPoint.getTarget().getClass().getPackage().getName();
		//String methodName = joinPoint.getSignature().getName();
		
		if(isIncludeClasses(className)){
			Class<?> cls = joinPoint.getTarget().getClass();
			String methodName = joinPoint.getSignature().getName();
			Method method = null;
			TriggersRemove triggersRemove = null;
			
			Method[] methodList = cls.getDeclaredMethods();
			for(Method m : methodList){
				if(StringUtils.equals(methodName, m.getName())){
					method = m;
					triggersRemove = method.getAnnotation(TriggersRemove.class);
					break;
				}
			}
			
			
			if(triggersRemove != null && triggersRemove.removeAll()){
				log.debug(className);
				
				EcacheApplyVO ecacheApplyVO = new EcacheApplyVO();
				
				if(StringUtils.equals(className, "MenuService")){
					ecacheApplyVO.setMenuFlg("N");
					ecacheApplyService.updateMenuFlgAll(ecacheApplyVO);

				}else if(StringUtils.equals(className, "ContentService")){
					ecacheApplyVO.setContentFlg("N");
					ecacheApplyService.updateContentFlgAll(ecacheApplyVO);
					
				}else if(StringUtils.equals(className, "BannerService")){
					ecacheApplyVO.setBannerFlg("N");
					ecacheApplyService.updateBannerFlgAll(ecacheApplyVO);
					
				}else if(StringUtils.equals(className, "PopupService")){
					ecacheApplyVO.setPopupFlg("N");
					ecacheApplyService.updatePopupFlgAll(ecacheApplyVO);
					
				}else if(StringUtils.equals(className, "LinkService")){
					ecacheApplyVO.setLinkFlg("N");
					ecacheApplyService.updateLinkFlgAll(ecacheApplyVO);
					
				}
			}
		}
	}
	
	
	private boolean isIncludeClasses(String className){
		boolean result = false;
		if(includeClasses != null && includeClasses.length > 0){
			for(String includeClasse : includeClasses){
				if(StringUtils.equals(className, includeClasse)){
					result = true;
					break;
				}
			}
		}
		return result;
	}
}
