package com.ipms.proj.dashboard.controller;

import com.ipms.proj.dashboard.service.DashboardService;
import com.ipms.proj.erd.vo.ErdVO;
import com.ipms.proj.freeboard.vo.FreeboardVO;
import com.ipms.proj.issue.vo.IssueVO;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;
import com.ipms.proj.task.vo.TaskVO;
import com.ipms.proj.wiki.vo.WikiVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping("/proj")
@Controller
public class DashboardController {
	
	@Autowired
	DashboardService dashBoardService;
	
	@PreAuthorize("isAuthenticated()")
	@ResponseStatus(HttpStatus.OK)
	@GetMapping("/{projId}/dashboard")
	public String projMain(@PathVariable(name = "projId")String projId, Model model) {
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
//		ProjVO projInfo = dashBoardService.selectProj(map);
//		log.info("projInfo: "+projInfo);
//		model.addAttribute("projInfo",projInfo);
		model.addAttribute("projId", projId);
		return "proj/dashboard/dashboard";
	}
//
//	@GetMapping("/{projId}/taskList")
//	public String taskList(Model model,
//			@PathVariable String projId,
//			String pageNum,String amount,
//			String keyword,String strDate,
//			String endDate,String memCode,
//			String aprov) {
//		Criteria criteria;
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		log.info("startDate: "+strDate);
//		log.info("endDate: "+endDate);
//		Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
//		CustomUser user = (CustomUser) authentication.getPrincipal();
//<<<<<<< .mine
//||||||| .r297442
//=======
//
//		log.info("userPrincipal: " +user.getMember().getMemCode());
//
//>>>>>>> .r297588
//		if(pageNum == null && amount == null) { // 처음 들어왔을 때
//			criteria = new Criteria();
//			log.info("처음 페이지 pageNum : {}",criteria.getPageNum());
//		}else { // 페이징 숫자를 눌렀을 경우
//			if(pageNum.equals("0")) {
//				pageNum = "1";
//			}
//			criteria = new Criteria(Integer.parseInt( pageNum ), Integer.parseInt( amount ));
//			log.info("두번쨰 페이지 pageNum : {}",criteria.getPageNum());
//		}
//		if(keyword == null || keyword.isEmpty()) {
//			criteria.setKeyword(null);
//		} else {
//			criteria.setKeyword("%"+keyword+"%");
//		}
//		Date startDate = null;
//		if(strDate != null && !strDate.equals("undefined")) {
//			try {
//				startDate = format.parse(strDate);
//				criteria.setStartDate(startDate);;
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}else {
//			strDate = null;
//		}
//
//		Date edDate = null;
//		if(endDate !=null &&!endDate.equals("undefined")) {
//			try {
//				edDate = format.parse(endDate);
//				criteria.setStartDate(edDate);
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}else {
//			edDate = null;
//		}
//
//		if(memCode != null && !memCode.equals("") && memCode.equals("my")) {
//			criteria.setMemCode(user.getMember().getMemCode());
//		}else {
//			criteria.setMemCode(null);
//		}
//		criteria.setProjId(projId);
//		criteria.setAmount(15);
//		List<TaskVO> taskList = dashBoardService.selectTaskList(criteria);
//
//		int total = dashBoardService.total(criteria);
//		PageVO pageVO = new PageVO(criteria, total);
//
//		model.addAttribute("taskList",taskList);
//		model.addAttribute("pageVO",pageVO);
//		return "proj/dashboard/taskList";
//	}
//
	@ResponseBody
	@PostMapping("{projId}/selectTask")
	public List<TaskVO> selectTask(@PathVariable String projId){
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<TaskVO> taskList = dashBoardService.selectTask(map);
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
//		Map<String, Object> pgres = dashBoardService.selectPgres(map);
		
//		return pgres;
		return null;
	}
}
