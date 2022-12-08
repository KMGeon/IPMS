package com.ipms.main.projectlistdetail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class ProjectListDetailController {

	@GetMapping("/projlistdetail")
	public String ProjListDetail() {
		return "main/wholeProject/projectDetail";
	}
	
}