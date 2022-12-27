package com.ipms.main.serviceCenter.svcFaq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ipms.main.admin.adminServiceCenter.adminSvcFaq.service.AdminSvcFaqService;
import com.ipms.main.serviceCenter.svcFaq.service.SvcFaqService;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class SvcFaqController {
	
	@Autowired
	SvcFaqService SvcFaqService;
	
	@GetMapping("/svcFaq")
	public String svcFaq(Model model) {
		
		List<SvcNoticeVO> list = SvcFaqService.selectFaq();
		
		model.addAttribute("list",list);
		return "main/serviceCenter/svcFaq";
	}
}
