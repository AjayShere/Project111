package com.cognizant.Aspects;

import java.util.Arrays;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.cognizant.controller.ApplyHomeLoanController;

@Aspect
@Component
public class Aspects {

	private static final Logger LOG = Logger.getLogger(ApplyHomeLoanController.class);

	@Before("execution(* com.cognizant.service..*(..))")
	public void LoggingAspect(JoinPoint joinPoint) {

		System.out.println("LoggingAspect() is running!");
		System.out.println("******");

		System.out.println("hijacked : " + joinPoint.getSignature());
		System.out.println("Before running loggingAdvice on method=" + joinPoint.toString());
		System.out.println("Agruments Passed=" + Arrays.toString(joinPoint.getArgs()));

	}

	@AfterReturning(pointcut = "execution(* com.cognizant.service..*(..))", returning = "result")
	public void logBefore1(JoinPoint joinPoint, Object result) {
		LOG.info("logBefore() is running!");
		System.out.println("hijacked : " + joinPoint.getSignature());
		System.out.println("Before running loggingAdvice on method=" + joinPoint.toString());

		System.out.println("Agruments Passed=" + Arrays.toString(joinPoint.getArgs()));
		System.out.println("******");
		System.out.println("Metod returns  " + result);
	}

}
