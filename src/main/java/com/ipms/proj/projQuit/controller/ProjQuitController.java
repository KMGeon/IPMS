package com.ipms.proj.projQuit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class ProjQuitController {
	
	@GetMapping("/projQuit")
	public String projQuit() {
		return "proj/projQuit/projQuit";
	}
}
