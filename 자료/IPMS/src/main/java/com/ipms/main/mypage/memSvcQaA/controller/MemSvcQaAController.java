package com.ipms.main.mypage.memSvcQaA.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.main.mypage.memSvcQaA.service.MemSvcQaAService;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaAVO;
import com.ipms.security.domain.CustomUser;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class MemSvcQaAController {
	
	@Autowired
	MemSvcQaAService memSvcQaAService;

	@GetMapping("/memSvcQaA")
	public String memSvcQaA(Model model, String pageNum, String amount) {
		
		Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
	    CustomUser user = (CustomUser) authentication.getPrincipal();
	      
	    log.info("userPrincipal: " +user.getMember().getMemCode()); 
		
		Criteria criteria;
        log.info("pageNum : {} , amount : {}", pageNum, amount);
        
        if (pageNum == null && amount == null) { // 처음 들어왔을 때
            criteria = new Criteria();
            log.info("처음 페이지 pageNum : {}", criteria.getPageNum());
        } else { // 페이징 숫자를 눌렀을 경우
            if (pageNum.equals("0")) {
                pageNum = "1";
            }
            criteria = new Criteria(Integer.parseInt(pageNum), Integer.parseInt(amount));
            log.info("두번쨰 페이지 pageNum : {}", criteria.getPageNum());
        }
        
        // 한 회원의 QaA만 필요한 경우
        criteria.setMemCode(user.getMember().getMemCode());

        List<SvcQaAVO> memSvcQaASelect = memSvcQaAService.memSvcQaASelect(criteria);
        // 오류 핸들링
		// if(svcQaASelect)
        // total은 전체 페이지의 수를 결정하기위해 필요
        int total = memSvcQaAService.memTotal(user.getMember().getMemCode());
        PageVO pageVO = new PageVO(criteria, total);
        model.addAttribute("memSvcQaASelect", memSvcQaASelect);
        model.addAttribute("pageVO", pageVO);
	
		return "main/mypage/memSvcQaA";
	}
	
}
