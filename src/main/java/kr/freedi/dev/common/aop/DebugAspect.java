package kr.freedi.dev.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
//import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.core.annotation.Order;

@Aspect
@Order(10)
public class DebugAspect {

	/*
	@Around("execution(* egovframework.*.service.*Service.*(..))")
	public void logAround(ProceedingJoinPoint joinPoint) throws Throwable {
		String className = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();

		//System.out.println("[Aspect - checkService - START] ClassName = " + className + ", MethodName = " + methodName);
		System.out.println("START========================= ClassName = " + className + ", MethodName = " + methodName);
		
		joinPoint.proceed();
		
		//System.out.println("[Aspect - checkService - END    ] ClassName = " + className + ", MethodName = " + methodName);
		System.out.println("EEEND========================= ClassName = " + className + ", MethodName = " + methodName);
	}
	*/
	
	@Before("execution(* egovframework.*.service.*Service.*(..))")
	public void beforeDebug(JoinPoint joinPoint) throws Throwable {
		String className = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();

		//System.out.println("[Aspect - checkService - START] ClassName = " + className + ", MethodName = " + methodName);
		System.out.println("START========================= ClassName = " + className + ", MethodName = " + methodName);
	}
	
	@AfterReturning("execution(* egovframework.*.service.*Service.*(..))")
	public void afterDebug(JoinPoint joinPoint) throws Throwable {
		String className = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();

		//System.out.println("[Aspect - checkService - END    ] ClassName = " + className + ", MethodName = " + methodName);
		System.out.println("END========================= ClassName = " + className + ", MethodName = " + methodName);
	}
	
}
