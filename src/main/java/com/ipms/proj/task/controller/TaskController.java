package com.ipms.proj.task.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/work")
	public String work() {
		
		return "proj/work/work";
	}
	
	@ResponseBody
	@GetMapping("/workmove")
	public JSONObject workjax() {
		
		List<TaskVO> vo = this.taskservice.HighWorkList();
		log.info("TaskController => vo : "+ vo.toString());
		
		JSONObject obj = new JSONObject(); 
		obj.put("fjson", vo);
		
		
		log.info("obj다 : " +obj.toString());
		
		return obj;
	}
	
	@ResponseBody
	@PostMapping("/taskInsert")
	public String taskInsert(@RequestBody TaskVO vo) {
		String sendresult =null;
		log.info("taskInsert IN :");
		
		
		if(vo.getHighTaskId() != null){
			log.info("TaskController -> ajax val : " + vo.toString());
			
			TaskVO returnvo = this.taskservice.HighNum(vo);
			log.info("TaskContoller -> taskInsert -> 하위일감 등록 -> VO : " + returnvo.toString());
			
			int num= Integer.parseInt( returnvo.getTaskId())+1;
			
			vo.setTaskId(num+"");
			vo.setLowRgstSeq(returnvo.getLowRgstSeq()+1);
			
			
			
			log.info("num : " + num);
	
			
			
			log.info("TaskContoller -> taskInsert -> 하위일감 등록 ->저장된 VO : " + vo.toString());
			int result = this.taskservice.lowWorkInsert(vo);
			sendresult = result+"";
			log.info("result : " + result);
		
		}
		
		if(vo.getHighTaskId() == null) {
			log.info("TaskContoller -> taskInsert -> 상위일감 등록");
			TaskVO returnvo = this.taskservice.HighWorkNum(vo); // 최초에 상위일감이 생성 안되어 있을 때 NVL --> 1 RETURN
			log.info("TaskContoller -> taskInsert -> 상위일감 등록  -> hightaskId : " + returnvo.toString());
			vo.setTaskId(returnvo.getTaskId());
			int result = this.taskservice.HighWorkInsert(vo);
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
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
