package com.ipms.proj.task.service;

import java.util.List;

import com.ipms.proj.task.vo.TaskVO;

public interface TaskService {
	
	public List<TaskVO> HighWorkList();
	
	public TaskVO HighNum(TaskVO vo);
	
	public int lowWorkInsert(TaskVO vo);
	
	public TaskVO HighWorkNum(TaskVO vo);
	
	public int HighWorkInsert(TaskVO vo);
	
	public TaskVO WorkDetail(TaskVO vo);
	
	public int taskApproval(TaskVO vo);
	
	public int referCts(TaskVO vo);

}
