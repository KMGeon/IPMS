package com.ipms.main.mypage.inviteAndApply.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class InviteAndApplyController {
	
	@GetMapping("/inviteAndApply")
	public String inviteOrApply() {
		
		return "main/mypage/inviteAndApply";
	}
}
