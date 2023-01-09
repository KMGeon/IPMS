package com.ipms.proj.MemManageMent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/proj")
public class MemManagementController {
	
	@GetMapping("/memManagement")
		public String memManagement() {
			return "proj/memmanagement/adminMemberManagement";
		}
}

