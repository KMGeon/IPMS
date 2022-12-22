package com.ipms.main;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@RequestMapping("/main")
@Controller
public class MainController {
	@GetMapping("/page")
	public String hello(Authentication auth, Model model) {

		return "main/page";
	}
}
