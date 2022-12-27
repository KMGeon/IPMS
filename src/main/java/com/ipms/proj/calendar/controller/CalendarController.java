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
import com.ipms.proj.calendar.vo.CalendarVO;
import com.ipms.proj.task.vo.TaskVO;

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
		
		List<CalendarVO> list = calendarservice.selectSchd();	// 일정 리스트
		
		log.info("*******schedule list: " + list.toString());
		
		return list;
	}
	
	@ResponseBody
	@PostMapping("/calList2")
	public List<TaskVO> fullPost2(){
		log.info("일감 리스트!");
		
		List<TaskVO> listT = calendarservice.selectT();			// 일감 리스트
		
		log.info("*******task list: " + listT.toString());
		
		return listT;
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
	
	//data : {"indvSchdNum":11,"title":"ㅋㅋㄴ","indvSchdCts":"ㅎㅎㄴ","indvSchdStrtDate":"2022-12-28T06:00","indvSchdEndDate":"2022-12-28T06:30"}
	@ResponseBody
	@PostMapping("/updateSchd")
	public Map<String, String> updateSchd(@RequestBody CalendarVO calendarVO){

		log.info("수정!!!!!!");
//		
//		//CalendarVO(indvSchdNum=11, writer=null, projId=null, indvSchdTitle=null, 
//		//indvSchdCts=ㅎㅎㅎㅎㅎ, deleteYn=null, indvSchdStrtDate=2022-12-28T06:00, indvSchdEndDate=2022-12-28T06:30, indvSchdWriteDate=null)
//		calendarVO.setIndvSchdTitle(calendarVO.getTitle());
		
		//calendarVO : CalendarVO(indvSchdNum=11, writer=null, projId=null, indvSchdTitle=ㅋㅋㄴ, indvSchdCts=ㅎㅎㄴ, deleteYn=null, 
		//title=ㅋㅋㄴ, indvSchdStrtDate=2022-12-28T06:00, indvSchdEndDate=2022-12-28T06:30, indvSchdWriteDate=null)
		log.info("calendarVO : " + calendarVO.toString());
		
		log.info("map : " + calendarVO);
		
		calendarservice.updateSchd(calendarVO);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");

		return map;
	}

	
}
