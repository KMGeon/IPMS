package com.ipms.proj.task.mapper;

import java.util.List;

import org.springframework.security.core.Authentication;

import com.ipms.main.login.vo.MemVO;
import com.ipms.proj.task.vo.TaskCmtVO;
import com.ipms.proj.task.vo.TaskVO;

public interface TaskMapper {
	
	public List<TaskVO> HighWorkList(TaskVO vo);

	public TaskVO HighNum(TaskVO vo);
	
	public int lowWorkInsert(TaskVO vo);
	
	public TaskVO HighWorkNum(TaskVO vo);
	
	public int HighWorkInsert(TaskVO vo);
	
	public TaskVO WorkDetail(TaskVO vo);
	
	public int taskApproval(TaskVO vo);
	
	public int referCts(TaskVO vo);
	
	public int taskCtsUpdate(TaskVO vo);
	
	public int taskPgresUpdate(TaskVO vo);
	
	public int highTaskCtsUpdate(TaskVO vo);
	
	public String userNameSelect(MemVO vo);
	
	public String[] authCheck(TaskVO vo);
	
	public List<TaskVO> memberTaskList(TaskVO vo);
	
	public List<TaskVO> nullHighTaskId(TaskVO vo);
	
	public int hiworkDelBefor(TaskVO vo);
	
	public int lowWorkDel(TaskVO vo);
	
	public List<TaskCmtVO> dashTaskCmt(TaskVO vo);
	
	public int dashHighCmtInsert(TaskCmtVO vo);
	
	public int dashlowCmtInsert(TaskCmtVO vo);
	
}
