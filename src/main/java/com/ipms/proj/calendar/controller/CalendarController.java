package com.ipms.proj.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class CalendarController {
	
	@GetMapping("/schedule")
	public String calList() {
		
		return "proj/calendar/schedule";
	}
	
}
