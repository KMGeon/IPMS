package com.ipms.proj.task.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.task.service.serviceImpl.TaskServiceImpl;
import com.ipms.proj.task.vo.TaskVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class TaskController {
	
	@Autowired
	TaskServiceImpl taskserviceImpl;
	
	@GetMapping("/work")
	public String work() {
		
		return "proj/work/work";
	}
	
	@ResponseBody
	@GetMapping("/workmove")
	public JSONObject workjax() {
		
		List<TaskVO> vo = this.taskserviceImpl.HighWorkList();
		log.info("TaskController => vo : "+ vo.toString());
		
		JSONObject obj = new JSONObject(); 
		obj.put("fjson", vo);
		
		
		log.info("obj다 : " +obj.toString());
		
		return obj;
	}
	
	@ResponseBody
	@PostMapping("/taskInsert")
	public String taskInsert(@RequestBody TaskVO vo) {
		String sendresult = null;
		
		log.info("vo : " + vo.toString());
		
//		if(vo.getClassification().equals("상위 일감")){
//			
//		}
		
		
		if(vo.getClassification().equals("하위 일감")){
			TaskVO returnvo = this.taskserviceImpl.HighNum(vo);
			log.info("넘어온 vo : " + returnvo.toString());
			
			vo.setLowRgstSeq(returnvo.getLowRgstSeq()+1);
			 int num= Integer.parseInt(returnvo.getTaskId())+1;
			vo.setTaskId(num+"");
			
			log.info("저장된 vo 값 : " + vo.toString());
			
			int result = this.taskserviceImpl.lowWorkInsert(vo);
			sendresult = result+"";
			log.info("result : " + result);
		
		}
		
		return sendresult;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
