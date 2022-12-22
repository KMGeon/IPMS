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

	@Override
	public TaskVO HighWorkNum(TaskVO vo) {
		vo = this.taskMapper.HighWorkNum(vo);
		
		log.info("TaskServiceImpl -> HighWrokNum -> highTaskId" + vo.toString());
		
		return vo ;
	}

	@Override
	public int HighWorkInsert(TaskVO vo) {
		return this.taskMapper.HighWorkInsert(vo);
	}

	
	@Override
	public TaskVO WorkDetail(TaskVO vo) {
		TaskVO rcvo = this.taskMapper.WorkDetail(vo);
		log.info("★ receive ==> TaskServiceImpl ==> WorkDetaildata"+rcvo.toString());
		return rcvo;
	}

	@Override
	public int taskApproval(TaskVO vo) {
		return this.taskMapper.taskApproval(vo);
	}

	@Override
	public int referCts(TaskVO vo) {
		return this.taskMapper.referCts(vo);
	}

	@Override
	public int taskCtsUpdate(TaskVO vo) {
		return this.taskMapper.taskCtsUpdate(vo);
		
	}

	@Override
	public int taskPgresUpdate(TaskVO vo) {
		return this.taskMapper.taskPgresUpdate(vo);
	}

}
