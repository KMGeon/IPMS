package com.ipms.proj.issue.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
		log.info(" Controller -> IssueCommentVO:{}" , vo.toString());
		int result = this.issueCommentService.HighCmtInsert(vo , authentication);
		log.info("result : {} " , result);
		
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{projId}/IssueCmtList" , method = RequestMethod.POST )
	public String IssueCmtList(IssueCommentVO vo) {
		log.info("Contoller -> IssueId : {} " , vo.getIssueId());
		
		
		
		
		return "";
	}
	
	
	
	
	
	
	
	
	
}
