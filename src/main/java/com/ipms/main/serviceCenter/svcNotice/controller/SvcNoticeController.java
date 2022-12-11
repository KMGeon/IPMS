package com.ipms.main.serviceCenter.svcNotice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class SvcNoticeController {

	@GetMapping("/svcNotice")
	public String svcNotice() {
		return "main/serviceCenter/svcNotice";
	}
	
	@GetMapping("/svcNoticeDetail")
	public String svcNoticeDetail() {
		return "main/serviceCenter/svcNoticeDetail";
	}
}
