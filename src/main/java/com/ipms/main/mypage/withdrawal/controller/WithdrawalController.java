package com.ipms.main.mypage.withdrawal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class WithdrawalController {
	
	@GetMapping("/memWithdrawal")
	public String withdrawal() {
		
		return "main/mypage/memWithdrawal";
	}
}
