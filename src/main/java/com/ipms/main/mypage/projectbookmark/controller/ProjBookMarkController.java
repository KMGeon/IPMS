package com.ipms.main.mypage.projectbookmark.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.main.mypage.projectbookmark.service.ProjectBookMarkService;
import com.ipms.main.mypage.projectbookmark.vo.BookMarkVO;
import com.ipms.security.domain.CustomUser;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class ProjBookMarkController {
	
	@Autowired
	ProjectBookMarkService bookmarkservice;
	
	@GetMapping("/bookmark")
	public String bookmark(Model model , String pageNum , String amount ) {
		
		//멤코드 조회
		Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
		CustomUser user = (CustomUser) authentication.getPrincipal();
		String memCode = user.getMember().getMemCode();
		log.info("memCode: " + memCode); 

		Criteria criteria;
		
		
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
		
		// db 조회 값
		criteria.setMemCode(memCode);
		criteria.setAmount(6);
		
		List<BookMarkVO> list =  this.bookmarkservice.bookMarkSelectAll(criteria);
		log.info("list : {} " , list);
		
		int total = bookmarkservice.totalNum(criteria);
		PageVO pageVO = new PageVO(criteria, total);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("list",list);
		
		return "main/mypage/bookmark";
	}
	
	@ResponseBody
	@PostMapping("/{projId}/markInsert")
	public int ProjBookMark(@RequestBody BookMarkVO vo , @PathVariable String projId) {
		
		log.info("markInsert : {} " , vo.toString());
		vo.setProjId(projId);
		int result = this.bookmarkservice.bookMarkInsert(vo);
		log.info("markresult : {} " , result);
		
		return result;
	}
	
	//북마크 해제
	@ResponseBody
	@PostMapping("/bookMarkDel")
	public int bookMarkDel(@RequestBody BookMarkVO vo) {
		
		log.info("bookMarkDel VO : {} " , vo.toString());
		
		int result = this.bookmarkservice.bookMarkDel(vo);
		
		
		return result;
	}
	
}
