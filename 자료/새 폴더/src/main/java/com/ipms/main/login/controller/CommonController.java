package com.ipms.main.login.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

import javax.servlet.http.HttpServletRequest;

@Controller
@Slf4j
public class CommonController {

    @GetMapping("/accessError")
    public void accessDenied(Authentication auth, Model model) {

        log.info("access Denied : " + auth);

        model.addAttribute("msg", "Access Denied");
    }

    @GetMapping("/customLogin")
    public String loginInput(HttpServletRequest request) {
        return "main/page";
    }

    @GetMapping("/customLogout")
    public String logoutGET() {
        return "main/page";
    }

    @PostMapping("/customLogout")
    public String logoutPost() {

        log.info("post custom logout");
        return "main/login/loginForm";
    }

}
