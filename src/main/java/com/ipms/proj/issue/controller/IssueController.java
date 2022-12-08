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
	
	@GetMapping("/issueBoardPL")
	public String issueBoardPL() {
		return "proj/issueboard/issueBoardPL";
	}
	
	@GetMapping("/issueDetail")
	public String issueDetail() {
		return "proj/issueboard/issueDetail";
	}
	
	@GetMapping("/issueInsert")
	public String issueInsert() {
		return "proj/issueboard/issueInsert";
	}
	
}
