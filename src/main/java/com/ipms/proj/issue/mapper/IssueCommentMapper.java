package com.ipms.proj.issue.mapper;

import org.springframework.security.core.Authentication;

import com.ipms.proj.issue.vo.IssueCommentVO;

public interface IssueCommentMapper {
	
	public int HighCmtInsert(IssueCommentVO vo);
	
	public String getMemname(String memEmail);

}
