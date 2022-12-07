package com.ipms.proj.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/proj")
@Controller
public class WorkController {

	@GetMapping("/work")
	public String work() {
		return "proj/work/work";
	}
}
