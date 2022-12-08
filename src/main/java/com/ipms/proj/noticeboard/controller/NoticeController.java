package com.ipms.proj.noticeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/proj")
@Controller
public class NoticeController {

	@GetMapping("/noticeBoard")
	public String noticeBoard() {
		return "proj/noticeboard/noticeBoard";
	}
	
	@GetMapping("/noticeInsert")
	public String noticeInsert() {
		return "proj/noticeboard/noticeInsert";
	}
	
	@GetMapping("/noticeBoardPL")
	public String noticeBoardPL() {
		return "proj/noticeboard/noticeBoardPL";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail() {
		return "proj/noticeboard/noticeBoardDetail";
	}
	
}
