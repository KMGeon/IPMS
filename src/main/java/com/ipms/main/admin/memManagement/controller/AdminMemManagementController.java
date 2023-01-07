package com.ipms.main.admin.memManagement.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.memManagement.service.AdminMemManagementService;
import com.ipms.main.admin.memManagement.vo.AdminMemPageVO;
import com.ipms.main.admin.memManagement.vo.AdminMemVO;
import com.ipms.main.admin.projManagement.vo.ProjManaVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class AdminMemManagementController {

	@Autowired
	AdminMemManagementService adminMemManagementService;
	
	@GetMapping("/adminMemberManagement")
	public String adminMemList(AdminMemVO adminMemVO, String pageNum, String amount, Model model, String keyword, String category) {
//		log.info(keyword+" : "+category);
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
		log.info("-------------criteria="+criteria);
		List<AdminMemVO> adminMemListVO = this.adminMemManagementService.adminMemList(criteria);
		
		log.info("adminMemListVO: " + adminMemListVO);
		
		int total = adminMemManagementService.getTotal(criteria);
		
		AdminMemPageVO adminMemPageVO = new AdminMemPageVO(criteria, total);
		
		model.addAttribute("adminMemListVO", adminMemListVO);
		model.addAttribute("pageVO", adminMemPageVO);
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		
		return "main/admin/adminMemManagement";
	}
	
	// 회원 상세 팝업창
	@GetMapping("/adminMemDetail")
	public String adminMemManaInfo(@ModelAttribute AdminMemVO adminMemVO, Model model) {
		
//		log.info("adminMemManaInformation---------------");
		//AdminMemVO(memCode=M028, memEmail=null, memPasswd=null, memName=null, 
		//memPhoneNumber=null, memSgnupDate=null, memImgRoute=null, memWhdrlYn=null, memProjQuit=null, projVOList=null)
		log.info("adminMemVO : " + adminMemVO);
		
		AdminMemVO data = this.adminMemManagementService.adminMemDetail(adminMemVO);
		log.info("adminMemDetail->adminMemVO: " + data);
		Date date = new Date();
		model.addAttribute("now",date);
		model.addAttribute("data", data);
		
		return "main/admin/adminPopUp/adminMemManaInfo";
		
	}
	
	@ResponseBody
	@PostMapping("/ckDelMem")
	public int ckDelMem(@RequestParam(value = "ckbox[]") List<String> ckArr, AdminMemVO adminMemVO) {
		
		log.info("선택 삭제 ---------------------");
		
		int result = 0;
		
		for(String memCode : ckArr) {
			adminMemVO.setMemCode(memCode);
			adminMemManagementService.ckDelMem(adminMemVO);
		}
		result = 1;
		
		return result;
	}
	
}