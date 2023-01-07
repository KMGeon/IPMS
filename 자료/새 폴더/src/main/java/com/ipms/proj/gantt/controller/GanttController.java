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

import com.ipms.proj.gantt.service.GanttService;
import com.ipms.proj.gantt.vo.GanttVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/proj")
public class GanttController {
	
	@Autowired
	GanttService ganttService;
	
	@GetMapping("/{projId}/gantt")
	public String ganttSelect(@PathVariable String projId,Model model) {
		
		model.addAttribute("projId",projId);
		return "proj/gantt/gantt";
	}
	
	@ResponseBody
	@PostMapping("/{projId}/ganttSelectData")
	public List<GanttVO> ganttSelectData(@PathVariable String projId){
		
		List<GanttVO> taskData = ganttService.ganttSelect(projId);
		
		return taskData;
	}
	
}
