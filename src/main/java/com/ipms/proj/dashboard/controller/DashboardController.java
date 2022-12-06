package com.ipms.proj.dashboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class DashboardController {
	
	@GetMapping("/dashboard")
	public String projMain() {
		return "proj/dashboard/dashboard";
	}
}
