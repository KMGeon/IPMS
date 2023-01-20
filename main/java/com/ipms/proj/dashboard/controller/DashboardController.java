package com.ipms.proj.dashboard.controller;

import lombok.extern.slf4j.Slf4j;

import java.lang.annotation.Repeatable;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.dashboard.service.DashboardService;
import com.ipms.proj.erd.vo.ErdVO;
import com.ipms.proj.freeboard.vo.FreeboardVO;
import com.ipms.proj.issue.vo.IssueVO;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;
import com.ipms.proj.task.vo.TaskVO;
import com.ipms.proj.wiki.vo.WikiVO;
import com.ipms.security.CustomUserDetailsService;
import com.ipms.security.domain.CustomUser;

@Slf4j
@RequestMapping("/proj")
@Controller
public class DashboardController {
	
	@Autowired
	DashboardService dashBoardService;
	
	@PreAuthorize("isAuthenticated()")
	@ResponseStatus(HttpStatus.OK)
	@GetMapping("/{projId}/dashboard")
	public String projMain(@PathVariable(name = "projId")String projId,Model model) {
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		ProjVO projInfo = dashBoardService.selectProj(map);
		log.info("projInfo: "+projInfo);
		model.addAttribute("projInfo",projInfo);
		model.addAttribute("projId", projId);
		return "proj/dashboard/dashboard";
	}
	
	@GetMapping("/{projId}/taskList")
	public String taskList(Model model,
			@PathVariable String projId,
			String pageNum,String amount,
			String keyword,String strDate,
			String endDate,String memCode,
			@RequestParam(defaultValue = "") String aprov) {
		Criteria criteria;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		log.info("startDate: "+strDate);
		log.info("endDate: "+endDate);
		Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
		CustomUser user = (CustomUser) authentication.getPrincipal();
		
		log.info("userPrincipal: " +user.getMember().getMemCode()); 
		
		if(pageNum == null && amount == null) { // 처음 들어왔을 때
			criteria = new Criteria();
			log.info("처음 페이지 pageNum : {}",criteria.getPageNum());
		}else { // 페이징 숫자를 눌렀을 경우
			if(pageNum.equals("0")) {
				pageNum = "1";
			}
			criteria = new Criteria(Integer.parseInt( pageNum ), Integer.parseInt( amount ));
			log.info("두번쨰 페이지 pageNum : {}",criteria.getPageNum());
		}
		if(keyword == null || keyword.isEmpty()) {
			criteria.setKeyword(null);
		} else {
			criteria.setKeyword("%"+keyword+"%");
		}
		Date startDate = null;
		if(strDate != null && !strDate.equals("")) {			
			try {
				startDate = format.parse(strDate);
				criteria.setStartDate(startDate);;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			strDate = null;
		}
		
		Date edDate = null;
		if(endDate !=null && !endDate.equals("")) {			
			try {
				edDate = format.parse(endDate);
				criteria.setStartDate(edDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			edDate = null;
		}
		
		if(memCode != null && memCode.equals("my")) {
			criteria.setMemCode(user.getMember().getMemCode());	
		}else {
			criteria.setMemCode(null);		
		}
		
		if(aprov.equals("y")) {
			criteria.setAprov("y");			
		}else if(aprov.equals("n")) {
			criteria.setAprov("n");
		}else {
			criteria.setAprov("");
		}
		criteria.setProjId(projId);
		criteria.setAmount(15);
		log.info("aprov-------------------"+criteria.getAprov());
		List<TaskVO> taskList = dashBoardService.selectTaskList(criteria);
		if(taskList.size() != 0) {
			for (TaskVO taskVO : taskList) {
				int index = 0;
				if(taskVO.getHighTaskId() == null) {
					String taskId = taskVO.getTaskId(); 
					int prges = 0;
					int taskSeq = 0;
					
					for (TaskVO taskVO2 : taskList) {
						log.info("taskId: {}, highTaskId: {}",taskId,taskVO2.getHighTaskId());
						if(taskId.equals(taskVO2.getHighTaskId())) {
							prges += taskVO2.getTaskPgres();
							taskSeq++;
							log.info("preges : {}", prges);
							log.info("listSize : {}",taskSeq);
						}
					}
					int resultPgres = 0;
					if(taskSeq != 0) {
						resultPgres = (prges / taskSeq);		
						taskVO.setTaskPgres(resultPgres);
						taskList.set(index, taskVO);
					}else {
						taskVO.setTaskPgres(0);
						taskList.set(index, taskVO);
					}
					log.info("resultPgres : {}", resultPgres);
					index++;
				}
			}
		}
		int finish = dashBoardService.selectTaskFinish(projId);
		int middel = dashBoardService.selectTaskMiddle(projId);
		int aprovResult = dashBoardService.selectTaskAprove(projId);
		int notAprov = dashBoardService.selectTaskNot(projId);
		
		int total = dashBoardService.total(criteria);
		PageVO pageVO = new PageVO(criteria, total);
		log.info("pageVO---------------------------"+pageVO);
		/*
		  	String keyword,String strDate,
			String endDate,String memCode,
			String aprov
		 */
		model.addAttribute("finish",finish);
		model.addAttribute("middle",middel);
		model.addAttribute("aprovResult",aprovResult);
		model.addAttribute("notAprov",notAprov);
		model.addAttribute("keyword",keyword);
		model.addAttribute("strDate",strDate);
		model.addAttribute("endDate",endDate);
		model.addAttribute("memCode",memCode);
		model.addAttribute("aprov",aprov);
		model.addAttribute("taskList",taskList);
		model.addAttribute("pageVO",pageVO);
		return "proj/dashboard/taskList";
	}
	
	@ResponseBody
	@PostMapping("{projId}/selectTask")
	public List<TaskVO> selectTask(@PathVariable String projId){
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<TaskVO> taskList = dashBoardService.selectTask(map);
		
		for (TaskVO taskVO : taskList) {
			int index = 0;
			if(taskVO.getHighTaskId() == null) {
				String taskId = taskVO.getTaskId(); 
				int prges = 0;
				int taskSeq = 0;
				
				for (TaskVO taskVO2 : taskList) {
					log.info("taskId: {}, highTaskId: {}",taskId,taskVO2.getHighTaskId());
					if(taskId.equals(taskVO2.getHighTaskId())) {
						prges += taskVO2.getTaskPgres();
						taskSeq++;
						log.info("preges : {}", prges);
						log.info("listSize : {}",taskSeq);
					}
				}
				int resultPgres = 0;
				if(taskSeq != 0) {
					resultPgres = (prges / taskSeq);		
					taskVO.setTaskPgres(resultPgres);
					taskList.set(index, taskVO);
				}else {
					taskVO.setTaskPgres(0);
					taskList.set(index, taskVO);
				}
				log.info("resultPgres : {}", resultPgres);
				index++;
			}
		}
		return taskList;
	}
	
	@ResponseBody
	@PostMapping("{projId}/selectIssue")
	public List<IssueVO> selectIssue(@PathVariable String projId){
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<IssueVO> issueList = dashBoardService.selectIssue(map);
		
		return issueList;
	}
	
	@ResponseBody
	@PostMapping("{projId}/selectNotice")
	public List<NoticeBoardVO> selectNotice(@PathVariable String projId){
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<NoticeBoardVO> noticeList = dashBoardService.selectProjNotice(map);
		
		return noticeList;
	}
	
	@ResponseBody
	@PostMapping("{projId}/selectBoard")
	public List<FreeboardVO> selectBoard(@PathVariable String projId){
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<FreeboardVO> boardList = dashBoardService.selectProjBoard(map);
		
		return boardList;
	}
	
	@ResponseBody
	@PostMapping("{projId}/selectErd")
	public List<ErdVO> selectErd(@PathVariable String projId){
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<ErdVO> erdList = dashBoardService.selectErd(map);
		
		return erdList;
	}
	
	@ResponseBody
	@PostMapping("{projId}/selectWiki")
	public List<WikiVO> selectWiki(@PathVariable String projId){
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<WikiVO> wikiList = dashBoardService.selectWiki(map);
		
		return wikiList;
	}
	
	@ResponseBody
	@PostMapping("{projId}/selectPgres")
	public Map<String, Object> selectPgres(@PathVariable String projId){
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		Map<String, Object> pgres = dashBoardService.selectPgres(map);
		
		return pgres;
	}
}
