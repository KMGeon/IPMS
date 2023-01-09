package com.ipms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/proj")
@Controller
public class CalendarController {

	@GetMapping("/schedule")
	public String calList() {
		
		return "proj/schedule";
	}
}
