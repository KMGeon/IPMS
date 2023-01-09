package com.ipms.main.mypage.pwAuth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class PwAuthController {

	@GetMapping("/pwAuth")
	public String pwAuth() {
		return "main/mypage/pwAuth";
	}
}
