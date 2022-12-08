package com.ipms.proj.projMemManageMent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/proj")
public class ProjMemManagementController {
	
	@GetMapping("/memManagement")
		public String projmemManagement() {
			return "proj/memmanagement/projMemberManagement";
		}
}

