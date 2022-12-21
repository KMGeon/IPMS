package com.ipms.main.mypage.inforManagement.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/main")
@Controller
public class InforManagementController {
	
	@GetMapping("/inforManagement")
	public String infor(Authentication authentication) {


		return "main/mypage/inforManagement";
	}
}