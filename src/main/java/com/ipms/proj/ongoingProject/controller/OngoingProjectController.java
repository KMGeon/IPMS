package com.ipms.proj.ongoingProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/proj")
public class OngoingProjectController {

	@GetMapping("/ongoing")
	public String ongoing() {
		return "proj/ongoingproject/ongoingProject";
	}
	
}


	
	
