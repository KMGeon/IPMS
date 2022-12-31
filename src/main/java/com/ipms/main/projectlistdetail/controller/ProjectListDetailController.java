package com.ipms.main.projectlistdetail.controller;

import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.projectlistdetail.service.ProjectListDetailService;
import com.ipms.main.projectlistdetail.vo.ProjSmryCmtVO;
import com.ipms.main.wholeProject.service.WholeProjectService;
import com.ipms.security.domain.CustomUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/main")
public class ProjectListDetailController {
@Autowired
	MyPageMapper myPageMapper;
@Autowired
	WholeProjectService wholeProjectService;
@Autowired
	ProjectListDetailService projectListDetailService;

	@PreAuthorize("isAuthenticated() and ( hasAnyRole('ROLE_MEMBER'))")
	@RequestMapping(value = "/projectDetail/{projId}", method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public String projectDetail(@PathVariable("projId") String projId, Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String memCode = myPageMapper.getMemCode(userDetails.getUsername());
		ProjVO vo = new ProjVO();
		vo.setProjId(projId);
		vo.setMemCode(memCode);
		List<ProjVO> detailList = this.wholeProjectService.detailPage(projId);
		List<ProjVO> checkMyProject = this.wholeProjectService.checkMyProject(projId);
		List<ProjVO> test = this.wholeProjectService.checkMyProject2(vo);

		model.addAttribute("detailList", detailList);
		model.addAttribute("check", checkMyProject);
		model.addAttribute("check2", test);
		model.addAttribute("test",this.projectListDetailService.getList());
		return "main/wholeProject/projectDetail";
	}
	@ResponseBody
	@PostMapping("/insertReply")
	public void insertReply(ProjSmryCmtVO projSmryCmtVO , @RequestParam String projId){
		Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
		CustomUser user = (CustomUser) authentication.getPrincipal();
		projSmryCmtVO.setMemCode(user.getMember().getMemCode());
		log.info("==============",user.getMember().getMemCode());
		  this.projectListDetailService.replyreply(projSmryCmtVO);
	}

	@ResponseBody
	@PostMapping("/viewReply")
	public List<ProjSmryCmtVO> viewReply(ProjSmryCmtVO projSmryCmtVO ){
		return this.projectListDetailService.getList();
	}
}