package com.ipms.main.admin.adminServiceCenter.adminNoticeInsert.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ipms.main.admin.adminServiceCenter.adminNoticeInsert.service.AdminNoticeInsertService;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main")
public class AdminNoticeInsertController {
	
	@Autowired
	AdminNoticeInsertService adminNoticeInsertService;
	
	@GetMapping("/adminNoticeInsert")
	public String adminNoticeInsert() {
		return "main/admin/adminNoticeInsert";
	}
	
	@PostMapping("/adminNoticeInsert")
	public String adminNoticeInsertPost(SvcNoticeVO svcNoticeVO) {
		log.info("svcNoticeVO: "+svcNoticeVO);
		int result = adminNoticeInsertService.insertSiteNotice(svcNoticeVO);
		if(svcNoticeVO.getNtCtgCode().equals("notice")) {
			return "redirect:/main/adminSvcNotice";			
		}else {
			return "redirect:/main/adminSvcFaq";
		}
	}
}
