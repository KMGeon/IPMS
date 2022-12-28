package com.ipms.proj.issue.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.commons.vo.Criteria;
import com.ipms.proj.issue.mapper.IsuueMapper;
import com.ipms.proj.issue.service.IssueService;
import com.ipms.proj.issue.vo.IssueVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class IssueServiceImpl implements IssueService {

	@Autowired
	IsuueMapper issuemapper;

	@Override
	public List<IssueVO> taskListSelect() {

		return this.issuemapper.taskListSelect();
	}

	@Override
	public int IssueDataInsert(IssueVO vo) {
		return this.issuemapper.IssueDataInsert(vo);
		
	}

	@Override
	public List<IssueVO> IssueListSelect() {
		return this.issuemapper.IssueListSelect();
	}

	@Override
	public List<IssueVO> issuePage(Criteria criteria) {
		return this.issuemapper.issuePage(criteria);
	}

	@Override
	public int totalNum() {
		return this.issuemapper.totalNum();
	}

	@Override
	public IssueVO IssueDetail(IssueVO vo) {
		
		return this.issuemapper.IssueDetail(vo);
	}

	@Override
	public int MaxFileNumSelect() {
		
		return this.issuemapper.MaxFileNumSelect();
	}

	@Override
	public int uploadFileInsert(IntgAttachFileVO vo) {
		return this.issuemapper.uploadFileInsert(vo);
	}

	@Override
	public String getMemCode(String userName) {
		return this.issuemapper.getMemCode(userName);
	}

	@Override
	public String getUserName(String userEmail) {
		return this.issuemapper.getUserName(userEmail);
	}
	
	

}
