package com.ipms.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler, AuthenticationFailureHandler {

    @Override
    public void handle(HttpServletRequest request,
                       HttpServletResponse response, AccessDeniedException accessException)
            throws IOException, ServletException {


        log.info("=============================================================");
        log.info("=============================================================");
        log.error("===========해당  권한에 문제가 있습니다. 다시 확인하세요.============");
        log.info("=============================================================");
        log.info("=============================================================");


        response.sendRedirect("/main/page");
    }

    @Override
    public void onAuthenticationFailure(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
        log.info("=========================================================================================");
        log.info("==============실패해서 accessDeniedHandler왔음====================");
        log.info("=========================================================================================");
        httpServletResponse.sendRedirect("/main/loginForm");
    }
}
