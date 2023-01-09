package com.ipms.main.projectbookmark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class ProjBookMarkController {

	@GetMapping("/bookmark")
	public String ProjBookMark() {
		return "main/mypage/bookmark";
	}
}
