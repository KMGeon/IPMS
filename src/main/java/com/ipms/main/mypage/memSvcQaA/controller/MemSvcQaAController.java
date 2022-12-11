package com.ipms.main.mypage.memSvcQaA.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class MemSvcQaAController {

	@GetMapping("/memSvcQaA")
	public String memSvcQaA() {
		return "main/mypage/memSvcQaA";
	}
	
	@GetMapping("/memSvcQaADetail")
	public String memSvcQaADetail() {
		return "main/mypage/memSvcQaADetail";
	}
	
}
