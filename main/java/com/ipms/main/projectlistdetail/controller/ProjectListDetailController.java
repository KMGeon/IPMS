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
	public String projectDetail(@PathVariable("projId") String projId, Model model) {
		
		ProjVO vo = new ProjVO();
		
		vo.setProjId(projId);
		vo.setMemCode(getCustomUser());
		
		log.info("==========================="+this.projectListDetailService.projectsAlreadyApplied(vo));
		model.addAttribute("detailList", this.wholeProjectService.detailPage(projId));//상세정보
		model.addAttribute("getDetailLeaderInfo", this.projectListDetailService.getDetailLeaderInfo(projId));//프로젝트 리더 정보
		model.addAttribute("checkMyProject",this.wholeProjectService.checkMyProject(projId));//내가 만든 프로젝트 체크
		model.addAttribute("projectsAlreadyApplied",this.projectListDetailService.projectsAlreadyApplied(vo));//내가 만든 프로젝트 체크
		
		// 댓글 리스트
		List<ProjSmryCmtVO> dataCmt = this.projectListDetailService.projCmtList(projId);
		log.info("cmt list: " + dataCmt.toString());
				
		model.addAttribute("dataCmt", dataCmt);

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
	
	// 상위댓글 작성
	@ResponseBody
	@PostMapping("/{projId}/projCmtInsert")
	public int projCmtInsert(@RequestBody ProjSmryCmtVO projSmryCmtVO) {

		int result = this.projectListDetailService.projCmtInsert(projSmryCmtVO);
		log.info("result: " + result);
		
		return result;
	}
	
	// 하위댓글 작성
	@ResponseBody
	@PostMapping("/{projId}/projCmtInsert2")
	public int projCmtInsert2(@RequestBody ProjSmryCmtVO projSmryCmtVO) {
		
		int result = this.projectListDetailService.projCmtInsert2(projSmryCmtVO);
		log.info("result: " + result);
		
		return result;
	}
	
	// 댓글 수정
	@ResponseBody
	@PostMapping("/{projId}/projCmtUpdate")
	public int projCmtUpdate(@RequestBody ProjSmryCmtVO projSmryCmtVO) {
		
		log.info("projSmryCmtVO : " + projSmryCmtVO.toString());
		
		int result = this.projectListDetailService.projCmtUpdate(projSmryCmtVO);
		log.info("result: " + result);
		
		return result;
	}
	
	// 댓글 삭제
	@ResponseBody
	@PostMapping("/{projId}/projCmtDel")
	public int projCmtDel(@RequestBody ProjSmryCmtVO projSmryCmtVO) {
		
		int result = this.projectListDetailService.projCmtDel(projSmryCmtVO);
		log.info("result: " + result);
		
		return result;
	}
	
	
	
}