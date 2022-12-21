package com.ipms.proj.dashboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class DashboardController {
	
	@GetMapping("/{projId}/dashboard")
	public String projMain(@PathVariable(name = "projId")String projId) {
		return "proj/dashboard/dashboard";
	}
}
