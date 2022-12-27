package com.ipms.proj.dashboard.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.dashboard.service.DashboardService;
import com.ipms.proj.erd.vo.ErdVO;
import com.ipms.proj.freeboard.vo.FreeboardVO;
import com.ipms.proj.issue.vo.IssueVO;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;
import com.ipms.proj.task.vo.TaskVO;
import com.ipms.proj.wiki.vo.WikiVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class DashboardController {

	@Autowired
	MyPageMapper myPageMapper;

	@Autowired
	DashboardService dashBoardService;

	@PreAuthorize("isAuthenticated()")
	@ResponseStatus(HttpStatus.OK)
	@GetMapping("/{projId}/dashboard")
	public String projMain(@PathVariable(name = "projId") String projId, Model model, Authentication authentication) {
		model.addAttribute("projId", projId);
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		List<ProjVO> list = this.myPageMapper.getCheckProjId(userDetails.getUsername());
		for (ProjVO proj : list) {
			if (proj.getProjId().equals(projId)) {
				model.addAttribute("projId", projId);
				return "proj/dashboard/dashboard";
			}
		}
		return "redirect:/main/page";
	}

	@ResponseBody
	@PostMapping("{projId}/selectTask")
	public List<TaskVO> selectTask(@PathVariable String projId) {
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<TaskVO> taskList = dashBoardService.selectTask(map);

		return taskList;
	}

	@ResponseBody
	@PostMapping("{projId}/selectIssue")
	public List<IssueVO> selectIssue(@PathVariable String projId) {
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<IssueVO> issueList = dashBoardService.selectIssue(map);

		return issueList;
	}

	@ResponseBody
	@PostMapping("{projId}/selectNotice")
	public List<NoticeBoardVO> selectNotice(@PathVariable String projId) {
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<NoticeBoardVO> noticeList = dashBoardService.selectProjNotice(map);

		return noticeList;
	}

	@ResponseBody
	@PostMapping("{projId}/selectBoard")
	public List<FreeboardVO> selectBoard(@PathVariable String projId) {
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<FreeboardVO> boardList = dashBoardService.selectProjBoard(map);

		return boardList;
	}

	@ResponseBody
	@PostMapping("{projId}/selectErd")
	public List<ErdVO> selectErd(@PathVariable String projId) {
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<ErdVO> erdList = dashBoardService.selectErd(map);

		return erdList;
	}

	@ResponseBody
	@PostMapping("{projId}/selectWiki")
	public List<WikiVO> selectWiki(@PathVariable String projId) {
		Map<String, Object> map = new HashedMap();
		map.put("projId", projId);
		List<WikiVO> wikiList = dashBoardService.selectWiki(map);

		return wikiList;
	}
}
