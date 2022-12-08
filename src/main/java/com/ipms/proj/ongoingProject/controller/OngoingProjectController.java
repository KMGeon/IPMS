package com.ipms.proj.ongoingProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class OngoingProjectController {

	@GetMapping("/ongoing")
	public String ongoing() {
		return "main/mypage/ongoingProject";
	}
	
}


	
	
