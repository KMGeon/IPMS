package com.ipms.proj.issue.mapper;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;

import com.ipms.proj.issue.vo.IssueCommentVO;

public interface IssueCommentMapper {
	
	public int HighCmtInsert(IssueCommentVO vo);
	
	public String getMemname(String memEmail);
	
	public List<IssueCommentVO> getAllCmtList(IssueCommentVO vo);

	public int lowCmtInsert(IssueCommentVO vo);
	
	public int replymodify(IssueCommentVO vo);
	
	public int lowCmtDel(IssueCommentVO vo);
	
	public int highCmtDel(IssueCommentVO vo);
}
