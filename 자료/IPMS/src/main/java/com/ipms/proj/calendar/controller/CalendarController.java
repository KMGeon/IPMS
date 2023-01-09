package com.ipms.proj.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.calendar.service.CalendarService;
import com.ipms.proj.calendar.vo.CalendarVO;
import com.ipms.proj.issue.service.IssueService;
import com.ipms.proj.task.vo.TaskVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class CalendarController {
	
	@Autowired
	IssueService issueService;
	
	@Autowired
	CalendarService calendarservice;
	
	@GetMapping("/{projId}/schedule")
	public String schdList(Authentication authentication,Model model,@PathVariable String projId) {
		
//		UserDetails userdetail = (UserDetails)authentication.getPrincipal();
//		String userEmail = userdetail.getUsername(); // 유저이메일 가져오자
//		String userCode = this.issueService.getMemCode(userEmail);
//		
//		log.info("memCode: " + userCode);
		model.addAttribute("projId",projId);
		return "proj/calendar/schedule";
	}
	
	@ResponseBody
	@PostMapping("/{projId}/calList")
	public List<CalendarVO> fullPost(Authentication authentication, @PathVariable String projId){
		log.info("풀캘린더 리스트!");
		
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		
		String memName = userDetails.getUsername();
		log.info("userName: " + memName);
		
		String writer = this.issueService.getMemCode(memName);
		log.info("writer: " + writer);
		
		CalendarVO calendarVO = new CalendarVO();
		
		calendarVO.setWriter(writer);
		calendarVO.setProjId(projId);
		
		List<CalendarVO> list = calendarservice.selectSchd(calendarVO);	// 일정 리스트
		
		log.info("*******schedule list: " + list.toString());
		
		return list;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/calList2")
	public List<TaskVO> fullPost2(Authentication authentication, @PathVariable String projId){
		log.info("나의 일감 리스트!");
		
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String userName = userDetails.getUsername();
		log.info("userName: " + userName);
		
		String memCode = this.issueService.getMemCode(userName);
		log.info("memCode: " + memCode);
		CalendarVO calendarVO = new CalendarVO();
		
		calendarVO.setWriter(memCode);
		calendarVO.setProjId(projId);
		List<TaskVO> listT = calendarservice.selectT(calendarVO);			// 일감 리스트
		
		log.info("*******task list: " + listT.toString());
		
		return listT;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/calList3")
	public List<TaskVO> fullPost3(Authentication authentication, @PathVariable String projId){
		log.info("모든 상위 일감 리스트!");

		CalendarVO calendarVO = new CalendarVO();

		calendarVO.setProjId(projId);
		
		List<TaskVO> listT2 = calendarservice.selectT2(calendarVO);			// 일감 리스트
		
		log.info("*******task list: " + listT2.toString());
		
		return listT2;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/insertSchd")
	public Map<String, String> insertSchd(@RequestBody CalendarVO calendarVO, Authentication authentication, @PathVariable String projId) {
		
		log.info("insert CalendarVO: " + calendarVO);
	//	calendarVO.setWriter(writer);

		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		
		String memName = userDetails.getUsername();
		log.info("userName: " + memName);
		
		String writer = this.issueService.getMemCode(memName);
		log.info("writer: " + writer);
		
		calendarVO.setWriter(writer);
		calendarVO.setProjId(projId);
		
		calendarservice.insertSchd(calendarVO);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		
		return map;
	}

	@ResponseBody
	@PostMapping("/{projId}/deleteSchd")
	public Map<String, String> deleteSchd(@RequestBody CalendarVO calendarVO, Authentication authentication, @PathVariable String projId){
		
		log.info("calendarVO: " + calendarVO);
		
		Map<String, String> map = new HashMap<String, String>();
		
		log.info("힝~~~~~~~~~~~~~~~~삭제하고파~~~" + map.toString());
		
		//
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		
		String memName = userDetails.getUsername();
		log.info("userName: " + memName);
		
		String writer = this.issueService.getMemCode(memName);
		log.info("writer: " + writer);
		
		calendarVO.setWriter(writer);
		calendarVO.setProjId(projId);
		//
		
		calendarservice.deleteSchd(calendarVO);
		
		map.put("result", "success");
		map.put("writer", calendarVO.getWriter()+"");
//		map.put("title", calendarVO.getIndvSchdTitle());
		return map;
	}
	
	//data : {"indvSchdNum":11,"title":"ㅋㅋㄴ","indvSchdCts":"ㅎㅎㄴ","indvSchdStrtDate":"2022-12-28T06:00","indvSchdEndDate":"2022-12-28T06:30"}
	@ResponseBody
	@PostMapping("/{projId}/updateSchd")
	public Map<String, String> updateSchd(@RequestBody CalendarVO calendarVO, Authentication authentication, @PathVariable String projId){

		log.info("수정!!!!!!");
//		
//		//CalendarVO(indvSchdNum=11, writer=null, projId=null, indvSchdTitle=null, 
//		//indvSchdCts=ㅎㅎㅎㅎㅎ, deleteYn=null, indvSchdStrtDate=2022-12-28T06:00, indvSchdEndDate=2022-12-28T06:30, indvSchdWriteDate=null)
//		calendarVO.setIndvSchdTitle(calendarVO.getTitle());
		
		//calendarVO : CalendarVO(indvSchdNum=11, writer=null, projId=null, indvSchdTitle=ㅋㅋㄴ, indvSchdCts=ㅎㅎㄴ, deleteYn=null, 
		//title=ㅋㅋㄴ, indvSchdStrtDate=2022-12-28T06:00, indvSchdEndDate=2022-12-28T06:30, indvSchdWriteDate=null)
		log.info("calendarVO : " + calendarVO.toString());
		
		log.info("map : " + calendarVO);
		
		//
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		
		String memName = userDetails.getUsername();
		log.info("userName: " + memName);
		
		String writer = this.issueService.getMemCode(memName);
		log.info("writer: " + writer);
		
		calendarVO.setWriter(writer);
		calendarVO.setProjId(projId);
		//
		
		calendarservice.updateSchd(calendarVO);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");

		return map;
	}

	
}
