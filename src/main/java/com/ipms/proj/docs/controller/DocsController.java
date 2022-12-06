package com.ipms.proj.docs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class DocsController {
	
	@GetMapping("/docs")
	public String docs() {
		return "proj/docs/docs";
	}
}
