package com.ipms.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

  @Override
  public void handle(HttpServletRequest request, 
      HttpServletResponse response, AccessDeniedException accessException)
      throws IOException, ServletException {

    log.info("=============================================================");
    log.info("=============================================================");
    log.info("=============================================================");
    log.error("===========해당  권한에 문제가 있습니다. 다시 확인하세요.============");
    log.info("=============================================================");
    log.info("=============================================================");
    log.info("=============================================================");
    log.info("=============================================================");

    response.sendRedirect("/main/page");
  }
}
