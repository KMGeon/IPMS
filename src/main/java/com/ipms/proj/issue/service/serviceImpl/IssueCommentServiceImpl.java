package com.ipms.proj.issue.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.ipms.proj.issue.mapper.IssueCommentMapper;
import com.ipms.proj.issue.service.IssueCommentService;
import com.ipms.proj.issue.vo.IssueCommentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IssueCommentServiceImpl implements IssueCommentService {
	
	@Autowired
	IssueCommentMapper commentMapper;

	@Override
	public int HighCmtInsert(IssueCommentVO vo, Authentication authentication) {
		UserDetails userdetails = (UserDetails)authentication.getPrincipal();
		String memEmail = userdetails.getUsername();
		log.info("Service -> userdetails.getUsername() : {}" , memEmail );
		String memName = this.commentMapper.getMemname(memEmail);
		vo.setWriter(memName);
		
		
		return this.commentMapper.HighCmtInsert(vo);
			
	}


	
	
	
}
