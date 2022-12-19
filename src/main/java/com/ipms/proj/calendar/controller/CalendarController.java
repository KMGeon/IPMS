package com.ipms.proj.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.calendar.service.CalendarService;
import com.ipms.proj.calendar.vo.CalendarOriginVO;
import com.ipms.proj.calendar.vo.CalendarVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarservice;
	
	@GetMapping("/schedule")
	public String schdList() {
		
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
		
		log.info("힝~~~~~~~~~~~~~~~~삭제하고파~~~" + map.toString());
		calendarservice.deleteSchd(calendarVO);
		
		map.put("result", "success");
		map.put("writer", calendarVO.getWriter()+"");
//		map.put("title", calendarVO.getIndvSchdTitle());
		return map;
	}
	
	@ResponseBody
	@PostMapping("/updateSchd")
	public Map<String, String> updateSchd(@RequestBody CalendarOriginVO calendarOriginVO){
		/*
		{
	    "indvSchdNum": 11,
	    "title": "ㅋㅇㅇ",
	    "indvSchdCts": "ㅋㅇㅇ",
	    "startdt": "2022-12-12",
	    "enddt": "1899-11-30"	<- 이 자식 맘에 안들어
		}
		*/	
		log.info("수정!!!!!!");
		log.info("calendarOriginVO : " + calendarOriginVO.toString());
		
		CalendarVO calendarVO = new CalendarVO();
		calendarVO.setIndvSchdNum(calendarOriginVO.getIndvSchdNum());
		calendarVO.setIndvSchdTitle(calendarOriginVO.getTitle());
		calendarVO.setIndvSchdCts(calendarOriginVO.getIndvSchdCts());
		calendarVO.setIndvSchdStrtDate(calendarOriginVO.getStartdt());
		calendarVO.setIndvSchdEndDate(calendarOriginVO.getEnddt());
		
		//calendarVO : CalendarVO(indvSchdNum=2, writer=null, projId=null
		//, indvSchdTitle=123ㅎㅎ, indvSchdCts=123ㅎㅎ, indvSchdStrtDate=Tue Dec 13 09:00:00 KST 2022
		//, indvSchdEndDate=Thu Nov 30 09:00:00 KST 1899, indvSchdWriteDate=null, deleteYn=null)
		log.info("calendarVO : " + calendarVO);
		
		calendarservice.updateSchd(calendarVO);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");

		return map;
	}
	
}
