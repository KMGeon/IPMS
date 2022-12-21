package com.ipms.main.serviceCenter.svcQaA.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.main.serviceCenter.svcQaA.service.SvcQaAService;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaAVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class SvcQaAController {
	
	@Autowired
	SvcQaAService svcQaAService;
	
	// 구역을 나눠서 가독성을 높이자
	@GetMapping("/svcQaA")
	public String svcQaASelect(
			Model model,
			String pageNum,
			String amount
			) {
		
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
		
		// 한 회원의 QaA만 필요한 경우
		String id = "M001";
		criteria.setMemCode(id);
		
		List<SvcQaAVO> svcQaASelect = svcQaAService.svcQaASelect(criteria);
		
		// 오류 핸들링
//		if(svcQaASelect)
		
		// total은 전체 페이지의 수를 결정하기위해 필요
		int total = svcQaAService.total(id);
		
		PageVO pageVO = new PageVO(criteria, total);
		
		model.addAttribute("svcQaASelect", svcQaASelect);
		model.addAttribute("pageVO", pageVO);
		
		return "main/serviceCenter/svcQaA";
	}
	
	@GetMapping("/svcQaADetail")
	public String svcQaADetail(String qnaNum, Model model) {
		
		if(qnaNum != null) {
			log.info("SvcQaAController - svcQaADetail -> qnaNum : {}", qnaNum);
		}
		
		SvcQaAVO svcQaAVO = svcQaAService.svcQaADetail(qnaNum);
		
		model.addAttribute("svcQaAVO", svcQaAVO);
		
		return "main/serviceCenter/svcQaADetail";
	}
	
	@GetMapping("svcQaAInsertForm")
	public String svcQaAInsertForm() {
		
		log.info("SvcQaAController - svcQaAInsertForm");
		
		return "main/serviceCenter/svcQaAInsertForm";
	}
	
	@PostMapping("/svcInsert")
	public String svcInsert(SvcQaAVO svcQaAVO) {
		
		if(svcQaAVO != null) {
			log.info("SvcQaAController - svcInsert -> svcQaAVO : {}", svcQaAVO.toString());
			// 작성자 하드 코딩 바꾸기
			svcQaAVO.setWriter("M001");
		}
		
		int result = svcQaAService.svcQaAInsert(svcQaAVO);
		
		if(result > 0) {
			log.info("Q&A 등록 성공");
		}else {
			log.info("Q&A 등록 실패!!!");
		}
		
		return "redirect:/main/svcQaA";
	}
	
}
