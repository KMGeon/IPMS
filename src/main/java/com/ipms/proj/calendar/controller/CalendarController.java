package com.ipms.proj.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.calendar.service.CalendarService;
import com.ipms.proj.calendar.vo.CalendarVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarservice;
	
	@GetMapping("/schedule")
	public String calList() {
		
		return "proj/calendar/schedule";
	}


	@ResponseBody
	@PostMapping("/calList")
	public List<CalendarVO> fullPost(){
		log.info("풀캘린더 리스트!");
		
		List<CalendarVO> list = calendarservice.selectSchd();
		log.info("schedule list: " + list.toString());
		
		return list;
	}
	
	@ResponseBody
	@PostMapping("/insertSchd")
	public Map<String, String> insertSchd(@RequestBody CalendarVO calendarVO) {
		
	//	calendarVO.setWriter(writer);
		
		log.info("CalendarVO: " + calendarVO);
		
		calendarservice.insertSchd(calendarVO);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		
		return map;
	}

	@ResponseBody
	@PostMapping("/deleteSchd")
	public Map<String, String> deleteSchd(@RequestBody CalendarVO calendarVO){
		
		log.info("calendarVO: " + calendarVO);
		
		Map<String, String> map = new HashMap<String, String>();
		
		log.info("delete" + map.toString());
		calendarservice.deleteSchd(calendarVO);
		
		map.put("result", "success");
		map.put("writer", calendarVO.getWriter()+"");
//		map.put("title", calendarVO.getIndvSchdTitle());
		return map;
	}
	
}
