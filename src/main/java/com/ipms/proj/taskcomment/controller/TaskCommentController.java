package com.ipms.proj.taskcomment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ipms.proj.taskcomment.service.TaskCommentService;
import com.ipms.proj.taskcomment.vo.TaskCommentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/task")
public class TaskCommentController {

	@Autowired
	TaskCommentService taskcommentservice;
	
	
	@PostMapping("/cmtInsert")
	public int TaskCommentInsert(@RequestBody TaskCommentVO vo) {
		
		log.info("TskCommentController -> HighCmtInsert -> receiveVO : " + vo.toString());
		
		int result = this.taskcommentservice.taskHighCmtInsert(vo);
		
		return result; 
	}
	
}
