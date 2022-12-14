package com.ipms.proj.task.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.task.service.serviceImpl.TaskServiceImpl;
import com.ipms.proj.task.vo.TaskVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class TaskController {

//	@GetMapping("/work")
//	public String work() {
//		return ;
//	}
	
	@Autowired
	TaskServiceImpl taskserviceImpl;
	
	@GetMapping("/work")
	public String work() {
		
		return "proj/work/work";
	}
	
	@ResponseBody
	@GetMapping("/workmove")
	public JSONObject workjax(Model model) {
		
		List<TaskVO> vo = this.taskserviceImpl.HighWorkList();
		
		JSONObject obj = new JSONObject(); 
		obj.put("fjson", vo);
		
		
		log.info("obj다 : " +obj.toString());
		
		return obj;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
