package com.ipms.main.serviceCenter.svcFaq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class SvcFaqController {

	@GetMapping("/svcFaq")
	public String svcFaq() {
		return "main/serviceCenter/svcFaq";
	}
}
