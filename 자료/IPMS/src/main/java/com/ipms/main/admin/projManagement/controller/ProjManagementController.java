package com.ipms.main.admin.projManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.projManagement.service.ProjManagementService;
import com.ipms.main.admin.projManagement.vo.ProjManaPageVO;
import com.ipms.main.admin.projManagement.vo.ProjManaVO;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class ProjManagementController {

	@Autowired
	ProjManagementService projManagementService;
	
	@GetMapping("/projManagement")
	public String adminProjList(ProjManaVO projManaVO, String pageNum, String amount, Model model, String keyword, String category) {

		Criteria criteria;
		
		log.info("pageNum: {}, amount: {}", pageNum, amount);
		
		if(pageNum == null && amount == null) {
			criteria = new Criteria();
			log.info("첫 페이지 pageNum: {}", criteria.getPageNum());
		} else {
			if(pageNum.equals("0")) {
				pageNum = "1";
			}
			criteria = new Criteria(Integer.parseInt(pageNum), Integer.parseInt(amount));
			log.info("두 번째 페이지 pageNum: {}", criteria.getPageNum());
			
		}
		if(category == null || category.equals("")) {
			criteria.setCategory("");
		} else {
			criteria.setCategory(category);
		}
		
		criteria.setKeyword("%"+keyword+"%");
		
		criteria.setAmount(8);
		
		List<ProjManaVO> ProjManaVO = this.projManagementService.adminProjList(criteria);
		
		log.info("ProjManaVO: " + ProjManaVO);

		int total = projManagementService.getTotal(criteria);
		
		ProjManaPageVO projManaPageVO = new ProjManaPageVO(criteria, total);
		
		model.addAttribute("ProjManaVO", ProjManaVO);
		model.addAttribute("pageVO", projManaPageVO);
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		
		return "main/admin/projManagement";

	}
	
	@GetMapping("/adminProjDetail")
	public String adminProjDetail(@ModelAttribute ProjManaVO projManaVO, Model model) {
		
		ProjManaVO data = this.projManagementService.adminProjDetail(projManaVO);
		ProjManaVO data2 = this.projManagementService.adminProjDetail2(projManaVO);
		List<ProjManaVO> memData = this.projManagementService.adminProjMem(projManaVO);
		
		log.info("proj detail-------> " + data.toString());
		log.info("proj memData-------> " + memData.toString());
		
		model.addAttribute("data", data);
		model.addAttribute("data2", data2);
		model.addAttribute("memData", memData);
		
		return "main/admin/adminPopUp/adminProjDetail";
	}
	
	@ResponseBody
	@PostMapping("/ckDelProj")
	public int ckDelProj(@RequestParam(value = "ckbox[]") List<String> ckArr, ProjManaVO projManaVO) {
		
		log.info("선택 삭제 ---------------------");
		
		int result = 0;
		
		for(String projId : ckArr) {
			projManaVO.setProjId(projId);
			projManagementService.ckDelProj(projManaVO);
		}
		result = 1;
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/ckRestoreProj")
	public int ckRestoreProj(@RequestParam(value = "ckbox[]") List<String> ckArr, ProjManaVO projManaVO) {
		
		log.info("선택 복구---------------------");
		
		int result = 0;
		
		for(String projId : ckArr) {
			projManaVO.setProjId(projId);
			projManagementService.ckRestoreProj(projManaVO);
		}
		result = 1;
		
		return result;
	}
	
}