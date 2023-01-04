package com.ipms.aop;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@Slf4j
public class CommonInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
            log.info(" Request URI \t:  " + request.getRequestURI());
        return super.preHandle(request, response, handler);
    }



}
