package com.ipms.main.mypage.portfolio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.mypage.portfolio.service.PortfolioService;
import com.ipms.main.mypage.portfolio.vo.PortfolioVO;
import com.ipms.main.register.vo.TechStackVO;
import com.ipms.security.domain.CustomUser;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class PortfolioController {
	
	@Autowired
	PortfolioService portfolioService; 
	
	@GetMapping("/portfolio")
	public String portfolio(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		CustomUser principal = (CustomUser) authentication.getPrincipal();
		
		MemVO member = null;
		
		if(authentication != null || principal != null) {
			log.info("PortfolioController - portfolio -> principal : {}", principal.getMember().toString());
			member = principal.getMember();
			log.info("PortfolioController - portfolio -> member : {}",member.toString());
		}
		
		TechStackVO portfolioTechStackSelect = portfolioService.portfolioTechStackSelect(member.getMemCode());
		List<PortfolioVO> completeProjSelect = portfolioService.completeProjSelect(member.getMemCode());
		List<PortfolioVO> proceedingProjSelect = portfolioService.proceedingProjSelect(member.getMemCode());
		
		model.addAttribute("member", member);
		model.addAttribute("portfolioTechStackSelect", portfolioTechStackSelect);
		model.addAttribute("completeProjSelect", completeProjSelect);
		model.addAttribute("proceedingProjSelect", proceedingProjSelect);
		
		return "main/mypage/portfolio";
	}
}
