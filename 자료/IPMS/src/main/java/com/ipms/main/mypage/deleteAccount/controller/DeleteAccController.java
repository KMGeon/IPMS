package com.ipms.main.mypage.deleteAccount.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class DeleteAccController {
	
	@GetMapping("/memDeleteAcc")
	public String withdrawal() {
		
		return "main/mypage/memDeleteAcc";
	}
}
