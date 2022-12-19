package com.ipms.proj.gantt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.task.service.TaskService;
import com.ipms.proj.task.vo.TaskVO;

@Controller
@RequestMapping("/proj")
public class GanttController {
	
	@Autowired
	TaskService taskService;
	
	@GetMapping("/{projId}/gantt")
	public String ganttSelect(@PathVariable String projId,Model model) {
		
		model.addAttribute("projId",projId);
		return "proj/gantt/gantt";
	}
	
	@ResponseBody
	@PostMapping("/ganttSelectData")
	public List<TaskVO> ganttSelectData(){
		
		List<TaskVO> taskData = taskService.HighWorkList();
		
		return taskData;
	}
	
}
