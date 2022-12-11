package com.ipms.main.admin.adminServiceCenter.adminSvcFaq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class AdminSvcFaqController {

	@GetMapping("/adminSvcFaq")
	public String adminSvcFaq() {
		return "main/admin/adminSvcFaq";
	}
	
}
