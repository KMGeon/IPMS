package com.ipms.proj.issue.mapper;

import java.util.List;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.commons.vo.Criteria;
import com.ipms.proj.issue.vo.IssueVO;

public interface IsuueMapper {
	
	public List<IssueVO> taskListSelect(String projId);
	
	public int IssueDataInsert(IssueVO vo);
	
	public List<IssueVO> IssueListSelect();
	
	public List<IssueVO> issuePage(Criteria criteria);
	
	public int totalNum(Criteria criteria);
	
	public IssueVO IssueDetail(IssueVO vo);
	
	public int MaxFileNumSelect();
	
	public int uploadFileInsert(IntgAttachFileVO vo);
	
	public String getMemCode(String userName);
	
	public String getUserName(String userEmail);
	
	public int issueStatusCompl(IssueVO vo);
	
	public int issueStatusNonCompl(IssueVO vo);
}
