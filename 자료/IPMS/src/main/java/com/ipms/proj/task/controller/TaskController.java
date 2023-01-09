package com.ipms.proj.task.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.issue.service.IssueService;
import com.ipms.proj.issue.vo.IssueCommentVO;
import com.ipms.proj.task.service.TaskService;
import com.ipms.proj.task.vo.TaskCmtVO;
import com.ipms.proj.task.vo.TaskVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class TaskController {
	
	@Autowired
	TaskService taskservice;
	
	@Autowired
	IssueService issueService;
	
	@GetMapping("/{projId}/work")
	public String work(@PathVariable String projId,TaskVO vo , Authentication authentication,Model model) {
		log.info("TaskCotroller --> projId : " + projId);
		vo.setProjId(projId);
		UserDetails userdetail = (UserDetails)authentication.getPrincipal();
		String userEmail = userdetail.getUsername(); // 유저이메일 가져오자
		String userCode = this.issueService.getMemCode(userEmail);
		vo.setMemCode(userCode);
		String[] auth = taskservice.authCheck(vo);
		String authCheck = "";
		
		for (String string : auth) {
			if(string.equals("ROLE_PROJECT_LEADER")) {
				authCheck = "true";
			}else {
				authCheck ="false";
			}
		}
		log.info(" authCheck : {}",authCheck);
		
		model.addAttribute("authCheck",authCheck);
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
	@PostMapping("/{projId}/highWorkdel")
	public String highWorkdel(@RequestBody TaskVO vo , Authentication authentication , @PathVariable String projId) {
		
		
		
		vo.setProjId(projId);
		String votaskId = vo.getTaskId();
		vo.setHighTaskId(votaskId);
		
		log.info("Controller --> TaskVO : "+ vo.toString());
		
		
		UserDetails userdetail = (UserDetails)authentication.getPrincipal();
		String userEmail = userdetail.getUsername(); // 유저이메일 가져오자
		String userCode = this.issueService.getMemCode(userEmail); // 유저이메일로 멤버 코드를 가져오자 
		vo.setMemCode(userCode); // 가져온 멤버code 저장
		
		String autharr[] = this.taskservice.authCheck(vo);
		log.info("autharr[] : " + autharr.toString());
		
		
		
		//권한체크 프로젝트 리더만 삭제가능
		for(String arr : autharr) {
			if(arr.equals("ROLE_PROJECT_LEADER")) {
				int result = this.taskservice.hiworkDelBefor(vo);
				log.info("result : " + result);
				
				return result+"";
			}
		}
		
		
		
		log.info("Controller --> TaskVO : "+ vo.toString());
		 
		return "-1";
	}
		
		//상위 삭제 로직
	@ResponseBody
	@PostMapping("/{projId}/workDetail")
	public TaskVO work(@RequestBody TaskVO vo) { // 워크 디테일 페이지
		log.error("★ receive ==> TaskController ==> WorkDetaildata ==> vo.tostring()" + vo.toString());
		TaskVO reciveVO = this.taskservice.WorkDetail(vo);
		log.error("★ receive ==> TaskController ==> WorkDetaildata" + reciveVO.toString());
		
		return reciveVO;
	}
	
	
	@ResponseBody
	@PostMapping("/{projId}/taskApproval")
	public int taskApproval(@RequestBody TaskVO vo) { // 일감 승인
		log.error("★ receive ==> TaskController ==> taskapproval ==> vo.tostring()" + vo.toString());
		int result = this.taskservice.taskApproval(vo);
		log.error("★ receive ==> TaskController ==> taskapproval result : " + result);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/referCts")
	public int referCts(@RequestBody TaskVO vo) { // 일감 반려
		log.error("★ receive ==> TaskController ==> referCts ==> vo.tostring()" + vo.toString());
		int result = this.taskservice.referCts(vo);
		log.error("★ receive ==> TaskController ==> referCts result : " + result);
		
		return result;
	}
	
	
	@ResponseBody
	@PostMapping("/{projId}/taskCtsUpdate")
	public int taskCtsUpdate(@RequestBody TaskVO vo) { // 일감 반려
		
		
		log.error("★ receive ==> TaskController ==> taskCtsUpdate ==> vo.tostring()" + vo.toString());
		int result = this.taskservice.taskCtsUpdate(vo);
		log.error("★ receive ==> TaskController ==> taskCtsUpdate result : " + result);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/taskPgresUpdate")
	public int taskPgresUpdate(@RequestBody TaskVO vo) { // 일감 반려
		
		
		log.error("★ receive ==> TaskController ==> taskPgresUpdate ==> vo.tostring()" + vo.toString());
		int result = this.taskservice.taskPgresUpdate(vo);
		log.error("★ receive ==> TaskController ==> taskPgresUpdate result : " + result);
		
		return result;
	}
	
	
	@ResponseBody
	@PostMapping("/{projId}/highTaskCtsUpdate")
	public int highTaskCtsUpdate(@RequestBody TaskVO vo) { // 일감 반려
		
		log.error("★ receive ==> TaskController ==> highTaskCtsUpdate ==> vo.tostring()" + vo.toString());
		int result = this.taskservice.highTaskCtsUpdate(vo);
		log.error("★ receive ==> TaskController ==> highTaskCtsUpdate result : " + result);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/lowWorkDel")
	public int lowWorkDel(@RequestBody TaskVO vo) {
		log.info("TaskController --> lowWorkDelVO --> {}" , vo.toString());
		int result = this.taskservice.lowWorkDel(vo);
		
		return result;
	}
	
	//대시보드 리스트 -> 일감상세 페이지
	@GetMapping("/{projId}/dashWorkDetail")
	public String dashBoardTask( TaskVO vo , Model model) { // 워크 디테일 페이지
		
		log.error("★  TaskController ==> WorkDetaildata ==> vo.tostring()" + vo.toString());
		log.error("★  TaskController ==> WorkDetaildata ==> model" + model.toString());
		TaskVO reciveVO = this.taskservice.WorkDetail(vo);
		log.error("★  receive ==> TaskController ==> WorkDetaildata" + reciveVO.toString());
		
		List<TaskCmtVO> cmtList = this.taskservice.dashTaskCmt(vo);
		log.info("CmtList : {} " , cmtList.toString());
		
		model.addAttribute("list",reciveVO);
		model.addAttribute("cmtList",cmtList);
		
		return "proj/dashboard/dashWorkDetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{projId}/dashHighCmtInsert" , method = RequestMethod.POST )
	public String dashHighCmtInsert(@RequestBody TaskCmtVO vo) {
		log.info(" Controller(dashHighCmtInsert) -> TaskVO:{}" , vo.toString());
		int result = this.taskservice.dashHighCmtInsert(vo);
		log.info("result : {} " , result);
		
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{projId}/dashlowCmtInsert" , method = RequestMethod.POST )
	public String dashlowCmtInsert(@RequestBody TaskCmtVO vo) {
		log.info(" Controller(dashlowCmtInsert) -> TaskVO:{}" , vo.toString());
		int result = this.taskservice.dashlowCmtInsert(vo);
		log.info("result : {} " , result);
		
		return result+"";
	}
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
