package com.ipms.proj.task.mapper;

import java.util.List;

import com.ipms.proj.task.vo.TaskVO;

public interface TaskMapper {
	
	public List<TaskVO> HighWorkList();

	public TaskVO HighNum(TaskVO vo);
	
	public int lowWorkInsert(TaskVO vo);
}
