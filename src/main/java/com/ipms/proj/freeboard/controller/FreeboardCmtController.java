package com.ipms.proj.freeboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ipms.proj.freeboard.service.FreeboardCmtService;
import com.ipms.proj.freeboard.vo.FreeboardCmtVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FreeboardCmtController {

	@Autowired
	FreeboardCmtService freeboardCmtService;
//	
//	// 댓글 리스트를 띄워보자
//	@GetMapping("/freeCmtList")
//	public String freeCmtList(Model model) {
//		
//		List<FreeboardCmtVO> freeboardCmtVOList = this.freeboardCmtService.freeCmtList();
//		
//		log.info("freeboardCmtVOList: " + freeboardCmtVOList);
//		
//		model.addAttribute("freeboardCmtVOList", freeboardCmtVOList);
//		
//		return "proj/freeboard/freeBoardDetail";
//	}
}
