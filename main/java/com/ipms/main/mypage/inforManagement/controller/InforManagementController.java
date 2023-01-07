package com.ipms.main.mypage.inforManagement.controller;

import com.ipms.main.mypage.inforManagement.service.InforManagementService;
import com.ipms.main.register.service.MemService;
import com.ipms.main.register.vo.TechStackVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static com.ipms.main.login.controller.LoginController.getCustomUser;

@Slf4j
@Controller
@RequestMapping("/main")
public class InforManagementController {

	@Autowired
	InforManagementService inforManagementService;
	@Autowired
	MemService memService;
	
	@GetMapping("/inforManagement")
	public String inforManagement(Model model , TechStackVO techStackVO) {
		techStackVO.setMemCode(getCustomUser().getMember().getMemCode());
		List<TechStackVO> techList = this.inforManagementService.personalSkillsStackList(techStackVO);
		log.info("tech-----------------------:"+techList);
		model.addAttribute("list" ,this.memService.techStack());
		model.addAttribute("techList" , techList.get(0).getTechStackCode().split(","));
		return "main/mypage/inforManagement";
	}
}