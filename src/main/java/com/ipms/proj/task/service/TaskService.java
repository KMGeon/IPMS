package com.ipms.proj.task.service;

import java.util.List;

import com.ipms.proj.task.vo.TaskVO;

public interface TaskService {
	
	public List<TaskVO> HighWorkList();
	
	public TaskVO HighNum(TaskVO vo);
	
	public int lowWorkInsert(TaskVO vo);

}
