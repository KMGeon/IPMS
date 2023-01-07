package com.ipms.proj.taskcomment.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.proj.taskcomment.mapper.TaskCommentMapper;
import com.ipms.proj.taskcomment.service.TaskCommentService;
import com.ipms.proj.taskcomment.vo.TaskCommentVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TaskCommentServiceImpl implements TaskCommentService {

	@Autowired
	TaskCommentMapper taskcommentmapper;

	@Override
	public int taskHighCmtInsert(TaskCommentVO vo) {
		
		log.info("TskCommentServiceImpl -> taskHighCmtInsert -> receiveVO : " + vo.toString());
		
		return this.taskcommentmapper.taskHighCmtInsert(vo);
	}
	
}
