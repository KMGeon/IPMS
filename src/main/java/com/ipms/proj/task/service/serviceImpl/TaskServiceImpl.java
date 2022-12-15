package com.ipms.proj.task.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.proj.task.mapper.TaskMapper;
import com.ipms.proj.task.service.TaskService;
import com.ipms.proj.task.vo.TaskVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TaskServiceImpl implements TaskService {
	
	@Autowired
	TaskMapper taskMapper;
	
	@Override
	public List<TaskVO> HighWorkList() {
		
		List<TaskVO> vo = this.taskMapper.HighWorkList();
		
		log.info("receive TaskServiceImpl => vo : "  + vo.toString());
		
		return vo;
	}

	@Override
	public TaskVO HighNum(TaskVO vo) {
		
		return this.taskMapper.HighNum(vo);
		
	}

	@Override
	public int lowWorkInsert(TaskVO vo) {
		return this.taskMapper.lowWorkInsert(vo);
	}

}
