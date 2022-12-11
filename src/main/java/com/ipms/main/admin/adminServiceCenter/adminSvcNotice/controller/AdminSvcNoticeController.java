package com.ipms.main.admin.adminServiceCenter.adminSvcNotice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class AdminSvcNoticeController {

	@GetMapping("/adminSvcNotice")
	public String adminSvcNotice() {
		return "main/admin/adminSvcNotice";
	}
	
	@GetMapping("/adminSvcNoticeDetail")
	public String adminSvcNoticeDetail() {
		return "main/admin/adminSvcNoticeDetail";
	}
}
