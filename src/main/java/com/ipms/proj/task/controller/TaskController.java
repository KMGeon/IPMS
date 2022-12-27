package com.ipms.proj.task.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.task.service.TaskService;
import com.ipms.proj.task.vo.TaskVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class TaskController {
	
	@Autowired
	TaskService taskservice;
	
	@GetMapping("/{projId}/work")
	public String work(@PathVariable String projId) {
		log.info("TaskCotroller --> projId : " + projId);
		
		return "proj/work/work";
	}
	
	@ResponseBody
	@GetMapping("/{projId}/workmove")
	public JSONObject workjax(TaskVO vo , Authentication authentication , @PathVariable String projId) {
		
		vo.setProjId(projId);
		log.info("TaskController => vo : "+ vo.toString());
		
		List<TaskVO> returnvo = this.taskservice.HighWorkList(vo ,authentication);
		
		JSONObject obj = new JSONObject(); 
		obj.put("fjson", returnvo);
		
		
		log.info("obj다 : " +obj.toString());
		
		return obj;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/taskInsert")
	public String taskInsert(@RequestBody TaskVO vo , Authentication authentication , @PathVariable String projId) {
		String sendresult =null;
		log.info("taskInsert IN :" + vo.toString());
		log.info("taskInsert IN projId value :" + projId);
		
		
		if(vo.getHighTaskId() != null){ // 하위일감 등록
			log.info("authentication.getAuthorities() : " + authentication.getAuthorities());
			log.info("TaskController -> ajax val : " + vo.toString());
			
			TaskVO returnvo = this.taskservice.HighNum(vo);
			log.info("TaskContoller -> taskInsert -> 하위일감 등록 -> VO : " + returnvo.toString());
			
			vo.setTaskId(returnvo.getTaskId());
			vo.setLowRgstSeq(returnvo.getLowRgstSeq()+1);
			
			vo.setProjId(projId);
			log.info("TaskContoller -> taskInsert -> 하위일감 등록 ->저장된 VO : " + vo.toString());
			int result = this.taskservice.lowWorkInsert(vo , authentication);
			sendresult = result+"";
			log.info("result : " + result);
		
		}
		
		if(vo.getHighTaskId() == null) { // 상위일감 등록
			
			log.info("authentication.getAuthorities() : " + authentication.getAuthorities());
			log.info("TaskContoller -> taskInsert -> 상위일감 등록");
			
			TaskVO returnvo = this.taskservice.HighWorkNum(vo); // 최초에 상위일감이 생성 안되어 있을 때 NVL --> 1 RETURN
			log.info("TaskContoller -> taskInsert -> 상위일감 등록  -> hightaskId : " + returnvo.toString());
			
			
			vo.setTaskId(returnvo.getTaskId());
			vo.setProjId(projId);

			
			// 멤코드랑 프로젝트id를 들고 들어가서 해당프로젝트에 해당멤코드가 리더권한이 있는지 확인
			
			int result = this.taskservice.HighWorkInsert(vo , authentication);
			sendresult = result+"";
			log.info("*Insert Result*  : " + result );
			
		}
		return sendresult;
		
	}
	
	@ResponseBody
	@PostMapping("/workDetail")
	public TaskVO work(@RequestBody TaskVO vo) { // 워크 디테일 페이지
		log.error("★ receive ==> TaskController ==> WorkDetaildata ==> vo.tostring()" + vo.toString());
		TaskVO reciveVO = this.taskservice.WorkDetail(vo);
		log.error("★ receive ==> TaskController ==> WorkDetaildata" + reciveVO.toString());
		
		return reciveVO;
	}
	
	@ResponseBody
	@PostMapping("/taskApproval")
	public int taskApproval(@RequestBody TaskVO vo) { // 일감 승인
		log.error("★ receive ==> TaskController ==> taskapproval ==> vo.tostring()" + vo.toString());
		int result = this.taskservice.taskApproval(vo);
		log.error("★ receive ==> TaskController ==> taskapproval result : " + result);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/referCts")
	public int referCts(@RequestBody TaskVO vo) { // 일감 반려
		log.error("★ receive ==> TaskController ==> referCts ==> vo.tostring()" + vo.toString());
		int result = this.taskservice.referCts(vo);
		log.error("★ receive ==> TaskController ==> referCts result : " + result);
		
		return result;
	}
	
	
	@ResponseBody
	@PostMapping("/taskCtsUpdate")
	public int taskCtsUpdate(@RequestBody TaskVO vo) { // 일감 반려
		
		
		log.error("★ receive ==> TaskController ==> taskCtsUpdate ==> vo.tostring()" + vo.toString());
		int result = this.taskservice.taskCtsUpdate(vo);
		log.error("★ receive ==> TaskController ==> taskCtsUpdate result : " + result);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/taskPgresUpdate")
	public int taskPgresUpdate(@RequestBody TaskVO vo) { // 일감 반려
		
		
		log.error("★ receive ==> TaskController ==> taskPgresUpdate ==> vo.tostring()" + vo.toString());
		int result = this.taskservice.taskPgresUpdate(vo);
		log.error("★ receive ==> TaskController ==> taskPgresUpdate result : " + result);
		
		return result;
	}
	
	
	@ResponseBody
	@PostMapping("/highTaskCtsUpdate")
	public int highTaskCtsUpdate(@RequestBody TaskVO vo) { // 일감 반려
		
		log.error("★ receive ==> TaskController ==> highTaskCtsUpdate ==> vo.tostring()" + vo.toString());
		int result = this.taskservice.highTaskCtsUpdate(vo);
		log.error("★ receive ==> TaskController ==> highTaskCtsUpdate result : " + result);
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
