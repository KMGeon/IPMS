package com.ipms.main.admin.memManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ipms.main.admin.memManagement.service.AdminMemManagementService;
import com.ipms.main.admin.memManagement.vo.AdminMemVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class AdminMemManagementController {

	@Autowired
	AdminMemManagementService adminMemManagementService;
	
	@GetMapping("/adminMemberManagement")
	public String adminMemList(Model model) {
		
		List<AdminMemVO> adminMemListVO = this.adminMemManagementService.adminMemList();
		
		log.info("adminMemListVO: " + adminMemListVO);
		
		model.addAttribute("adminMemListVO", adminMemListVO);
		
		return "main/admin/adminMemManagement";
	}
	
	// 회원 상세 팝업창
	@GetMapping("/adminMemDetail")
	public String adminMemManaInfo(@ModelAttribute AdminMemVO adminMemVO, Model model) {
		
//		log.info("adminMemManaInformation---------------");
		
		AdminMemVO data = this.adminMemManagementService.adminMemDetail(adminMemVO);
		log.info("adminMemDetail->adminMemVO: " + data.toString());
		
		model.addAttribute("data", data);
		
		return "main/admin/adminPopUp/adminMemManaInfo";
		
	}
	

	
}