package com.ipms.main.admin.memManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.memManagement.service.AdminMemManagementService;
import com.ipms.main.admin.memManagement.vo.AdminMemPageVO;
import com.ipms.main.admin.memManagement.vo.AdminMemVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class AdminMemManagementController {

	@Autowired
	AdminMemManagementService adminMemManagementService;
	
	@GetMapping("/adminMemberManagement")
	public String adminMemList(AdminMemVO adminMemVO, String pageNum, String amount, Model model) {
		
		Criteria criteria;
		
		log.info("pageNum: {}, amount: {}", pageNum, amount);
		
		if(pageNum == null && amount == null) {
			criteria = new Criteria();
			log.info("첫 페이지 pageNum: {}", criteria.getPageNum());
		} else {
			if(pageNum.equals("0")) {
				pageNum = "1";
			}
			criteria = new Criteria(Integer.parseInt(pageNum), Integer.parseInt(amount));
			log.info("두 번째 페이지 pageNum: {}", criteria.getPageNum());
			
		}
		
		criteria.setAmount(10);
		
		List<AdminMemVO> adminMemListVO = this.adminMemManagementService.adminMemList(criteria);
		
		log.info("adminMemListVO: " + adminMemListVO);
		
		int total = adminMemManagementService.getTotal();
		
		AdminMemPageVO adminMemPageVO = new AdminMemPageVO(criteria, total);
		
		model.addAttribute("adminMemListVO", adminMemListVO);
		model.addAttribute("pageVO", adminMemPageVO);
		
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