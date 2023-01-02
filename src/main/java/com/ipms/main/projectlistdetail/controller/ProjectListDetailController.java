package com.ipms.main.projectlistdetail.controller;

import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.projectlistdetail.service.ProjectListDetailService;
import com.ipms.main.wholeProject.service.WholeProjectService;
import com.ipms.security.domain.CustomUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
	public String projectDetail(@PathVariable("projId") String projId, Model model) {
		ProjVO vo = new ProjVO();
		vo.setProjId(projId);
		vo.setMemCode(getCustomUser());
		log.info("==========================="+this.projectListDetailService.projectsAlreadyApplied(vo));
		model.addAttribute("detailList", this.wholeProjectService.detailPage(projId));//상세정보
		model.addAttribute("getDetailLeaderInfo", this.projectListDetailService.getDetailLeaderInfo(getCustomUser()));//프로젝트 리더 정보
		model.addAttribute("checkMyProject",this.wholeProjectService.checkMyProject(projId));//내가 만든 프로젝트 체크
		model.addAttribute("projectsAlreadyApplied",this.projectListDetailService.projectsAlreadyApplied(vo));//내가 만든 프로젝트 체크

		return "main/wholeProject/projectDetail";
	}


	@PostMapping(value = "/joinProject")
	@ResponseStatus(value = HttpStatus.OK)
	@ResponseBody
	public int joinProject(ProjVO projVO , String projId) {
		projVO.setMemCode(getCustomUser());
		projVO.setProjId(projId);
		return this.projectListDetailService.joinProject(projVO);
	}

	private static String getCustomUser() {
		Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
		CustomUser user = (CustomUser) authentication.getPrincipal();
		return user.getMember().getMemCode();
	}

}