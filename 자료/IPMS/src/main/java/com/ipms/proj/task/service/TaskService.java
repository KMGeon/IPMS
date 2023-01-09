package com.ipms.proj.task.service;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import com.ipms.proj.task.vo.TaskCmtVO;
import com.ipms.proj.task.vo.TaskVO;

public interface TaskService {
	
	public List<TaskVO> HighWorkList(TaskVO vo, Authentication authentication);
	
	public TaskVO HighNum(TaskVO vo);
	
	public int lowWorkInsert(TaskVO vo , Authentication authentication);
	
	public TaskVO HighWorkNum(TaskVO vo);
	
	public int HighWorkInsert(TaskVO vo , Authentication authentication);
	
	public TaskVO WorkDetail(TaskVO vo);
	
	public int taskApproval(TaskVO vo);
	
	public int referCts(TaskVO vo);
	
	public int taskCtsUpdate(TaskVO vo);
	
	public int taskPgresUpdate(TaskVO vo);
	
	public int highTaskCtsUpdate(TaskVO vo);
	
	public String[] authCheck(TaskVO vo);
	
	public int hiworkDelBefor(TaskVO vo);
	
	public int lowWorkDel(TaskVO vo);
	
	public List<TaskCmtVO> dashTaskCmt(TaskVO vo);
	
	public int dashHighCmtInsert(@RequestBody TaskCmtVO vo);

	public int dashlowCmtInsert(@RequestBody TaskCmtVO vo);
}
