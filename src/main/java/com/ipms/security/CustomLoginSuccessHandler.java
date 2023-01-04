package com.ipms.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
            throws IOException {
        log.warn("Login Success");
        List<String> roleNames = new ArrayList<>();
        auth.getAuthorities().forEach(authority -> {
            roleNames.add(authority.getAuthority());
        });
        log.warn("ROLE NAMES: " + roleNames);
        if (roleNames.contains("ROLE_ADMIN")) {
            response.sendRedirect("/main/adminMemberManagement");
            return;
        }

        if (roleNames.contains("ROLE_MEMBER")) {

            response.sendRedirect("/main/page");
            return;
        }

        if (roleNames.contains("ROLE_PROJECT")) {

            response.sendRedirect("/main/page");
            return;
        }
        if (roleNames.contains("ROLE_PROJECT_LEADER")) {

            response.sendRedirect("/main/page");
            return;
        }
    }
}


