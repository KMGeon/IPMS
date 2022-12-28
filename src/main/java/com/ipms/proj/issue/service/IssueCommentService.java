package com.ipms.proj.issue.service;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import com.ipms.proj.issue.vo.IssueCommentVO;

@Service
public interface IssueCommentService {
	
	public int HighCmtInsert(IssueCommentVO vo , Authentication authentication);

	
	
	

}
