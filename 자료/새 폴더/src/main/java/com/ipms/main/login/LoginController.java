package com.ipms.main.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class LoginController {

	@GetMapping("/loginForm")
	public String loginForm() {
		return "main/login/loginForm";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "fgtPwd", method = RequestMethod.GET)
	public String ForgotPwd() {
		return "main/ForgotPassword/fgtPwd";
	}

	//로그인 메인페이지
	@RequestMapping(value = "/main" ,method = RequestMethod.GET)
	public String loginPage(){
		return "main";
	}
}
