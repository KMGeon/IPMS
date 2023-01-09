package com.ipms.main.login.controller;

import com.ipms.security.domain.CustomUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

@Slf4j
@RequestMapping("/main")
@Controller
public class LoginController {

    @GetMapping("/loginForm")
    public String loginForm() {
        return "main/login/loginForm";
    }


    // 비밀번호 찾기
    @RequestMapping(value = "/fgtPwd", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String ForgotPwd() {
        return "main/ForgotPassword/fgtPwd";
    }


    //로그인 메인페이지
    @GetMapping("/loginMain")
    public String asd() {
        return "main/login/loginMain";
    }
    public static CustomUser getCustomUser() {
        Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
        CustomUser user = (CustomUser) authentication.getPrincipal();
        return user;
    }

}
