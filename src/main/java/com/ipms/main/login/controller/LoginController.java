package com.ipms.main.login.controller;

import com.ipms.main.login.service.LoginService;
import com.ipms.main.login.vo.MemVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.inject.Inject;
import java.util.List;

@Slf4j
@RequestMapping("/main")
@Controller
public class LoginController {
    @Autowired
    LoginService loginService;
    @Inject
    BCryptPasswordEncoder passEncoder;


    @GetMapping("/loginForm")
    public String loginForm(Model model) {
        List<MemVO> test = this.loginService.allGetMemCode();
        for(int i=0; i<test.size(); i++) {
            test.get(i).getMemCode();
            log.info(test.get(i).getMemCode());

        }
        log.info("test"+test.size());
        log.info("test"+test.toString());
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


}
