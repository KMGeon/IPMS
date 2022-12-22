package com.ipms.proj.dashboard.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

@Slf4j
@RequestMapping("/proj")
@Controller
public class DashboardController {


	@ResponseStatus(HttpStatus.OK)
	@GetMapping("/{projId}/dashboard")
	public String projMain(@PathVariable(name = "projId")String projId) {

		return "proj/dashboard/dashboard";
	}
}
