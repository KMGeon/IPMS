package com.ipms.main.mypage.ongoingProject.controller;

import com.ipms.main.mypage.inviteAndApply.service.InviteAndApplyService;
import com.ipms.main.mypage.ongoingProject.service.OnGoingProjectService;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.security.domain.CustomUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.List;

@Controller
@RequestMapping("/main")
@Slf4j
public class OngoingProjectController {

	@Autowired
	OnGoingProjectService onGoingProjectService;
	@Autowired
	InviteAndApplyService inviteAndApplyService;

	@GetMapping("/ongoing")
	@ResponseStatus(HttpStatus.CREATED)
	public String ongoing(Model model) {
		Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
		CustomUser user = (CustomUser) authentication.getPrincipal();
		List<ProjMemVO> list = this.onGoingProjectService.goingProjects(user.getMember().getMemCode());
		model.addAttribute("list", list);
		return "main/mypage/ongoingProject";
	}

}
