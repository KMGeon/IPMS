package com.ipms.proj.issue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/proj")
public class IssueController {

	@GetMapping("/issueboard")
	public String issueboard() {
		return "proj/issueboard/issueBoard";
	}
		
	
}
