package com.ipms.main.admin.projManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class ProjManagementController {

	@GetMapping("/projManagement")
	public String projMana() {

		return "main/admin/projManagement";

	}
}