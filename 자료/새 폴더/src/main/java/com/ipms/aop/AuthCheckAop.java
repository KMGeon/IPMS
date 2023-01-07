package com.ipms.aop;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
@Component
public class AuthCheckAop {
	
	@Before("execution(* com.ipms.proj.*.controller.*..*(..))")
	public void authCheckBefore(JoinPoint joinpoint) {
		log.info("=============================================");
		log.info("aop 지나감: "+joinpoint.getSignature().getName());
	}
}
