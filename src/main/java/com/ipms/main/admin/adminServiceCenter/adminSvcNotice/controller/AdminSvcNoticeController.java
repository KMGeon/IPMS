package com.ipms.main.admin.adminServiceCenter.adminSvcNotice.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.main.admin.adminServiceCenter.adminSvcNotice.service.AdminSvcNoticeService;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@RequestMapping("/main")
@Controller
public class AdminSvcNoticeController {

	@Autowired
	AdminSvcNoticeService adminSvcNoticeService;
	
	
	@GetMapping("/adminSvcNotice")
	public String adminSvcNotice(Model model,String pageNum,String amount,String keyword,String category,String searchDate) {
		Criteria criteria;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		log.info("pageNum : {} , amount : {}", pageNum, amount);
		
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
		if(category == null || category.equals("")) {
			criteria.setCategory("");
		}else {
			criteria.setCategory(category);
		}
		criteria.setKeyword("%"+keyword+"%");
		Date date = null;
		if(searchDate != null && !searchDate.isEmpty()) {			
			try {
				date = format.parse(searchDate);
				criteria.setSearchDate(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			date = null;
		}
		
		List<SvcNoticeVO> list = adminSvcNoticeService.selectNotice(criteria);
		
		int total = adminSvcNoticeService.total(criteria);
		PageVO pageVO = new PageVO(criteria, total);
		
		model.addAttribute("date",searchDate);
		model.addAttribute("keyword",keyword);
		model.addAttribute("list",list);
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("page","notice");
		return "main/admin/adminSvcNotice";
	}
	
	@GetMapping("/adminSvcNoticeDetail")
	public String adminSvcNoticeDetail(Model model, int siteNtNum) {
		
		SvcNoticeVO svcNotice = adminSvcNoticeService.SiteNoticeDetail(siteNtNum);
		
		model.addAttribute("svcNotice",svcNotice);
		return "main/admin/adminSvcNoticeDetail";
	}
	
	@ResponseBody
	@PostMapping("/adminSvcNoticeUpdate")
	public int adminSvcNoticeUpdate(@RequestBody SvcNoticeVO svcNoticeVO) {
		log.info("vo: "+svcNoticeVO);
		int result = adminSvcNoticeService.siteNoticeUpdate(svcNoticeVO);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/adminSvcNoticeDelete")
	public int adminSvcNoticeDelete(@RequestBody SvcNoticeVO svcNoticeVO) {
		int result = adminSvcNoticeService.siteNoticeDelete(svcNoticeVO);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/adminSvcNoticeChkDelete")
	public int adminSvcNoticeChkDelete(@RequestBody List<SvcNoticeVO> svcNoticeVOList) {
		log.info("-------------vo: "+svcNoticeVOList);
		int result = adminSvcNoticeService.siteNoticeDeleteList(svcNoticeVOList);
		return result;
	}
}
