package com.ipms.main.admin.adminServiceCenter.adminSvcFaq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.main.admin.adminServiceCenter.adminSvcFaq.service.AdminSvcFaqService;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class AdminSvcFaqController {
	
	@Autowired
	AdminSvcFaqService adminSvcFaqService;
	
	@GetMapping("/adminSvcFaq")
	public String adminSvcFaq(Model model,String pageNum,String amount) {
		Criteria criteria;
		
		log.info("pageNum : {} , amount : {}", pageNum, amount);
		
		if(pageNum == null && amount == null) { // 처음 들어왔을 때
			criteria = new Criteria();
			log.info("처음 페이지 pageNum : {}",criteria.getPageNum());
		}else { // 페이징 숫자를 눌렀을 경우
			if(pageNum.equals("0")) {
				pageNum = "1";
			}
			criteria = new Criteria(Integer.parseInt( pageNum ), Integer.parseInt( amount ));
			log.info("두번쨰 페이지 pageNum : {}",criteria.getPageNum());
		}
		List<SvcNoticeVO> list = adminSvcFaqService.selectFaq(criteria);
		
		int total = adminSvcFaqService.total();
		PageVO pageVO = new PageVO(criteria, total);
		
		model.addAttribute("list",list);
		model.addAttribute("pageVO",pageVO);
		
		return "main/admin/adminSvcFaq";
	}
	
}
