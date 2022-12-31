package com.ipms.main.admin.projManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.projManagement.service.ProjManagementService;
import com.ipms.main.admin.projManagement.vo.ProjManaPageVO;
import com.ipms.main.admin.projManagement.vo.ProjManaVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class ProjManagementController {

	@Autowired
	ProjManagementService projManagementService;
	
	@GetMapping("/projManagement")
	public String adminProjList(ProjManaVO projManaVO, String pageNum, String amount, Model model) {

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
		
		List<ProjManaVO> ProjManaVO = this.projManagementService.adminProjList(criteria);
		
		log.info("ProjManaVO: " + ProjManaVO);

		int total = projManagementService.getTotal();
		
		ProjManaPageVO projManaPageVO = new ProjManaPageVO(criteria, total);
		
		model.addAttribute("ProjManaVO", ProjManaVO);
		model.addAttribute("pageVO", projManaPageVO);
		
		return "main/admin/projManagement";

	}
	
	@GetMapping("/adminProjDetail")
	public String adminProjDetail(@ModelAttribute ProjManaVO projManaVO, Model model) {
		
		ProjManaVO data = this.projManagementService.adminProjDetail(projManaVO);
		
		log.info("proj detail-------> " + data.toString());
		
		model.addAttribute("data", data);
		
		return "main/admin/adminPopUp/adminProjDetail";
	}
	
	
	
}