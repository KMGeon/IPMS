package com.ipms.proj.noticeboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.commons.vo.Criteria;
import com.ipms.proj.noticeboard.service.NoticeService;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;
import com.ipms.proj.noticeboard.vo.NoticePageVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	// 프로젝트 공지사항 리스트 출력(select) & 페이징 처리
	@GetMapping("/noticeBoard")
	public String ntList(String pageNum, String amount, Model model) {
		
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
		
		List<NoticeBoardVO> ntSelect = noticeService.getNtPage(criteria);
		
		int total = noticeService.getTotal(); // 게시글 총 개수! 
		
		NoticePageVO noticePageVO = new NoticePageVO(criteria, total);
		
		model.addAttribute("ntSelect", ntSelect);
		model.addAttribute("pageVO", noticePageVO);
		
		return "proj/noticeboard/noticeBoard";
	}
	
	
	@GetMapping("/noticeBoardDetail")
	public String detailNt(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model) {
		
		NoticeBoardVO data = this.noticeService.detailNt(noticeBoardVO);
		log.info("notice detail -> noticeboardVO: " + data.toString());
		
		model.addAttribute("data", data);
		
		return "proj/noticeboard/noticeBoardDetail";
	}
	
	@GetMapping("/noticeInsert")
	public String nInsert(Model model) {
		
		return "proj/noticeboard/noticeInsert";
	}
	
	@PostMapping("/noticeBoardInsertPost")
	public String insertNt(@ModelAttribute NoticeBoardVO noticeBoardVO) {
		
		log.info("notice insert -> noticeBoardVO: " + noticeBoardVO.toString());
		
		int result = this.noticeService.insertNt(noticeBoardVO);
		log.info("result: " + result);
		
		return "redirect:/proj/noticeBoardDetail?projNtNum="+noticeBoardVO.getProjNtNum();
		
	}

	@GetMapping("/noticeUpdate")
	public String nUpdate(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model) {
		
		NoticeBoardVO data = this.noticeService.detailNt(noticeBoardVO);
		
		model.addAttribute("data", data);
		
		return "proj/noticeboard/noticeUpdate";
	}
	
	@PostMapping("/noticeBoardUpdatePost")
	public String updateNt(@ModelAttribute NoticeBoardVO noticeBoardVO) {
		
		log.info("update notice: ", noticeBoardVO.toString());
		
		int result = this.noticeService.updateNt(noticeBoardVO);
		log.info("result", result);
		
		return "redirect:/proj/noticeBoardDetail?projNtNum="+noticeBoardVO.getProjNtNum();
	}
	
	@ResponseBody
	@PostMapping("/noticeBoardDelete")
	public int deleteNt(@RequestBody NoticeBoardVO noticeBoardVO) {
		
		int result = this.noticeService.deleteNt(noticeBoardVO);
		log.info("result", result);
		
		return result;
		
	}
	
	@ResponseBody
	@PostMapping("/deleteSelNt")
	public int ckDelNt(@RequestParam(value = "ckbox[]") List<String> ckArr, NoticeBoardVO noticeBoardVO) {
		
		log.info("선택 삭제 ---------------------");
		
		int result = 0;
		int projNtNum = 0;
		
		for(String i : ckArr) {
			projNtNum = Integer.parseInt(i);
			noticeBoardVO.setProjNtNum(projNtNum);
			noticeService.ckDelNt(noticeBoardVO);
		}
		
		result = 1;
		
		return result;
	}
	
	
}
