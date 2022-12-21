package com.ipms.proj.issue.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaAVO;
import com.ipms.proj.issue.service.IssueService;
import com.ipms.proj.issue.vo.IssueVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/proj")
public class IssueController {
	
	@Autowired
	IssueService issueservice;

	@GetMapping("/issueboard")
	public ModelAndView issueboard(ModelAndView mav , String pageNum , String amount) {
		
//		List<IssueVO> vo = this.issueservice.IssueListSelect();
//		log.info("vo : " + vo.toString());
		
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
		
		// 한 회원의 QaA만 필요한 경우
		List<IssueVO> vo = this.issueservice.issuePage(criteria);
		
		
		// total은 전체 페이지의 수를 결정하기위해 필요
		int total = issueservice.totalNum();
		
		PageVO pageVO = new PageVO(criteria, total);
		
		mav.addObject("vo", vo);
		mav.addObject("pageVO", pageVO);
//		mav.addObject("vo", vo);
		mav.setViewName("proj/issueboard/issueBoard");
		
		
		
		return mav;
	}
	
	@GetMapping("/issueBoardPL")
	public String issueBoardPL() {
		return "proj/issueboard/issueBoardPL";
	}
	
	@GetMapping("/issueDetail")
	public ModelAndView issueDetail(ModelAndView mav , IssueVO vo ) {
		IssueVO list = this.issueservice.IssueDetail(vo);
		
		mav.addObject("list",list);
		mav.setViewName("proj/issueboard/issueDetail");
		
		return mav;
	}
	
	@GetMapping("/issueInsert")
	public String issueInsert() {
		return "proj/issueboard/issueInsert";
	}
	
	@GetMapping("/issueUpdate")
	public String issueUpdate() {
		return "proj/issueboard/issueUpdate";
	}
	
	
	@ResponseBody
	@PostMapping("/issueDataInsert")
	public int issueDataInsert(@RequestBody IssueVO vo) {
		log.info("* view -> CONTROLLER * IssueController => issueDataInsert Value : "  + vo.toString());
		
		int result = this.issueservice.IssueDataInsert(vo);
		log.info("* DB -> CONTROLLER * IssueController => issueDataInsert result : " + result);
		
		int filenum = this.issueservice.MaxFileNumSelect(vo);
		
		log.info("filenum : " + filenum);
		
		
		
		return filenum ; 
	}
	
	@ResponseBody
	@PostMapping("/taskListSelect")
	public JSONObject taskListSelect() {
		List<IssueVO> returnvo = this.issueservice.taskListSelect();
		
		log.info("* DB -> CONTROLLER * IssueController => taskListSelct Value : "  + returnvo.toString());
		
		JSONObject obj = new JSONObject();
		obj.put("vo", returnvo);
		
		return obj ;
	}
	
	
//	public List<IssueVO> IssueListSelect(){
//		
//		
//		
//		log.info("* DB -> CONTROLLER * IssueController => IssueListSelect Value : "  + vo.toString());
//		
//		return  vo;
//	}
	
}
