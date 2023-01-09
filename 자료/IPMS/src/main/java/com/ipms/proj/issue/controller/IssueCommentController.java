package com.ipms.proj.issue.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.issue.service.IssueCommentService;
import com.ipms.proj.issue.service.IssueService;
import com.ipms.proj.issue.vo.IssueCommentVO;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
@RequestMapping("/proj")
public class IssueCommentController { // 서비스에서 처리하자

	@Autowired
	IssueCommentService issueCommentService;
	
	@ResponseBody
	@RequestMapping(value = "/{projId}/IssueHighCmtInsert" , method = RequestMethod.POST )
	public String IssueHighCmtInsert(@RequestBody IssueCommentVO vo , @PathVariable String projId , Authentication authentication) {
		log.info(" Controller(IssueHighCmtInsert) -> IssueCommentVO:{}" , vo.toString());
		int result = this.issueCommentService.HighCmtInsert(vo , authentication);
		log.info("result : {} " , result);
		
		return result+"";
	}
	
	@ResponseBody
	@PostMapping("/{projId}/getAllCmtList")
	public List<IssueCommentVO> IssueCmtList(@RequestBody IssueCommentVO vo) {
		log.info("Contoller(getAllCmtList) -> IssueId : {} " , vo.getIssueId());
		
		List<IssueCommentVO> list = this.issueCommentService.getAllCmtList(vo);
		
		log.info("Controller -> cmtList : {}", list.toString() );
		
		return list;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/lowCmtInsert")
	public int lowCmtInsert(@RequestBody IssueCommentVO vo , Authentication athAuthentication) {
		log.info("Contoller(lowCmtInsert) -> IssueId : {} " , vo.getIssueId());
		log.info("Contoller -> CommentVO : {} " , vo.toString());
		
		int result = this.issueCommentService.lowCmtInsert(vo , athAuthentication);
		
		log.info("Controller -> result : {}", result );
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/replymodify")
	public int replymodify(@RequestBody IssueCommentVO vo){
		log.info("Contoller(replymodify) -> CommentVO : {} " , vo.toString());
		int result = this.issueCommentService.replymodify(vo);
		
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/lowCmtDel")
	public int lowCmtDel(@RequestBody IssueCommentVO vo){
		log.info("Contoller(lowCmtDel) -> CommentVO : {} " , vo.toString());
		
		int result = this.issueCommentService.lowCmtDel(vo);
		
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/highCmtDel")
	public int highCmtDel(@RequestBody IssueCommentVO vo){
		log.info("Contoller(lowCmtDel) -> CommentVO : {} " , vo.toString());
		String highcmt = vo.getIssueCmtId();
		vo.setHighCmtId(highcmt);
		
		
		int result = this.issueCommentService.highCmtDel(vo);
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
}
