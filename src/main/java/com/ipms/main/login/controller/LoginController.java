package com.ipms.main.login.controller;

import com.ipms.main.login.service.LoginService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.inject.Inject;

@Slf4j
@RequestMapping("/main")
@Controller
public class LoginController {
    @Autowired
    LoginService loginService;
    @Inject
    BCryptPasswordEncoder passEncoder;


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


    //로그인  POST
//    @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
//    @ResponseStatus(HttpStatus.CREATED)
//    public String loginPost(@ModelAttribute MemVO memvo) {
//        int success = this.loginService.loginMem(memvo);
//        if (success == 1) {
//            return "redirect:/main/loginMain";
//        } else {
//            return "redirect:/main/loginForm";
//        }
//    }

    //로그인 메인페이지
    @GetMapping("/loginMain")
    public String asd() {
        return "main/login/loginMain";
    }


}
