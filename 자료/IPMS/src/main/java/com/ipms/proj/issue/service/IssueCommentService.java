package com.ipms.proj.issue.service;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import com.ipms.proj.issue.vo.IssueCommentVO;

@Service
public interface IssueCommentService {
	
	public int HighCmtInsert(IssueCommentVO vo , Authentication authentication);
	
	public List<IssueCommentVO> getAllCmtList(IssueCommentVO vo);
	
	public int lowCmtInsert(IssueCommentVO vo ,Authentication authentication);
	
	public int replymodify( IssueCommentVO vo);
	
	public int lowCmtDel( IssueCommentVO vo);
	
	public int highCmtDel(IssueCommentVO vo);
	

	

}
