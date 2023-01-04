package com.ipms.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@Aspect
public class ServiceLoggerAdvice {

//    @Pointcut("@annotation(org.springframework.web.bind.annotation.GetMapping)")
    @Before("execution(* com.ipms.main.*..*(..))")
    public void startLog(JoinPoint jp) {
        log.info("============================");
        log.info("jPSingle : " + jp.getSignature());
    }
}
