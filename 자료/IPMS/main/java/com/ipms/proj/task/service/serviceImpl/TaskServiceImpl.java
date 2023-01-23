package com.ipms.proj.task.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.ipms.main.login.vo.MemVO;
import com.ipms.proj.task.mapper.TaskMapper;
import com.ipms.proj.task.service.TaskService;
import com.ipms.proj.task.vo.TaskCmtVO;
import com.ipms.proj.task.vo.TaskVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TaskServiceImpl implements TaskService {
	
	@Autowired
	TaskMapper taskMapper;
	
	@Override
	public int lowWorkInsert(TaskVO vo , Authentication authentication) {
		UserDetails userdetail =  (UserDetails) authentication.getPrincipal();
		log.info("userdetailName : " + userdetail.getUsername());
		
		MemVO memvo = new MemVO();
		memvo.setMemEmail(userdetail.getUsername());
		
		String userCode = this.taskMapper.userNameSelect(memvo);
		log.info("userCode : " + userCode);
		vo.setMemCode(userCode);
		
		log.info("TaskService --> CheckVO : " + vo.toString());
		return this.taskMapper.lowWorkInsert(vo);
	}
	
	@Override
	public int HighWorkInsert(TaskVO vo , Authentication authentication) {
		UserDetails userdetail =  (UserDetails) authentication.getPrincipal();
		MemVO memvo = new MemVO();
		memvo.setMemEmail(userdetail.getUsername());
		
		String userCode = this.taskMapper.userNameSelect(memvo);
		vo.setMemCode(userCode);
		log.info("TaskService --> 상위일감VO CHECK : " + vo.toString());
		
		String[] autharr = this.taskMapper.authCheck(vo);
		
		for(int i=0; i<autharr.length; i++) {
			if(autharr[i].equals("ROLE_PROJECT_LEADER")) {
				log.info("ROLE_PROJECT_READER IN ");
				return this.taskMapper.HighWorkInsert(vo);
				
			}
		}
		log.info("TaskController --> authCheckVO --> :"+vo.toString());
		log.info("TaskController --> authCheck --> :"+autharr[0]);
		
		return -1;
	}
	
	@Override
	public List<TaskVO> HighWorkList(TaskVO vo , Authentication authentication) {
		
		UserDetails userdetail =  (UserDetails) authentication.getPrincipal();
		MemVO memvo = new MemVO();
		memvo.setMemEmail(userdetail.getUsername());
		
		String userCode = this.taskMapper.userNameSelect(memvo);
		log.info("receive TaskServiceImpl => userCode : "  + userCode );
		
		vo.setMemCode(userCode);
		
		String[] autharr = this.taskMapper.authCheck(vo);
		
		log.info("receive TaskServiceImpl => vo : "  + vo.toString());
		
		//리더일 경우 모든 일감 셀렉트
		for(int i=0; i<autharr.length; i++) {
			if(autharr[i].equals("ROLE_PROJECT_LEADER")) {
				log.info("ROLE_PROJECT_READER IN ");
				List<TaskVO> returnvo = this.taskMapper.HighWorkList(vo);
				return returnvo;
			}
		}	
		
		log.info(" 셀렉트 전 vo : " + vo.toString());
		//일반 멤버일 경우 셀렉
		List<TaskVO> memberTask = this.taskMapper.memberTaskList(vo);
		List<TaskVO> nullTask = this.taskMapper.nullHighTaskId(vo); // projId 넘겨야됨
		
		for(TaskVO nt: memberTask) {
			log.info("nt : --> : " + nt.toString());
			nullTask.add(nt);
		}
		
		log.info("memberTask --> : " + memberTask.toString());
		log.info("nullTask --> : " + nullTask.toString());
		
		
		
		return nullTask;
	}

	@Override
	public TaskVO HighNum(TaskVO vo) {
		
		return this.taskMapper.HighNum(vo);
		
	}

	
	@Override
	public TaskVO HighWorkNum(TaskVO vo) {
		vo = this.taskMapper.HighWorkNum(vo);
		
		log.info("TaskServiceImpl -> HighWrokNum -> highTaskId" + vo.toString());
		
		return vo ;
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

	@Override
	public int highTaskCtsUpdate(TaskVO vo) {
		return this.taskMapper.highTaskCtsUpdate(vo);
	}

	@Override
	public String[] authCheck(TaskVO vo) {
		return this.taskMapper.authCheck(vo);
	}

	@Override
	public int hiworkDelBefor(TaskVO vo) {
		return this.taskMapper.hiworkDelBefor(vo);
	}

	@Override
	public int lowWorkDel(TaskVO vo) {
		return this.taskMapper.lowWorkDel(vo); 
	}

	@Override
	public List<TaskCmtVO> dashTaskCmt(TaskVO vo) {	
		return this.taskMapper.dashTaskCmt(vo);
	}

	@Override
	public int dashHighCmtInsert(TaskCmtVO vo) {
		return this.taskMapper.dashHighCmtInsert(vo);
		
	}

	@Override
	public int dashlowCmtInsert(TaskCmtVO vo) {
		return this.taskMapper.dashlowCmtInsert(vo);
		
	}

}
