package com.ipms.proj.issue.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.ipms.proj.issue.mapper.IssueCommentMapper;
import com.ipms.proj.issue.service.IssueCommentService;
import com.ipms.proj.issue.vo.IssueCommentVO;
import com.ipms.security.domain.CustomUser;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IssueCommentServiceImpl implements IssueCommentService {
	
	@Autowired
	IssueCommentMapper commentMapper;

	@Override
	public int HighCmtInsert(IssueCommentVO vo, Authentication authentication) {
//		UserDetails userdetails = (UserDetails)authentication.getPrincipal();
//		String memEmail = userdetails.getUsername();
//		log.info("Service -> userdetails.getUsername() : {}" , memEmail );
//		String memName = this.commentMapper.getMemname(memEmail);
		
		Authentication authentication2 =  SecurityContextHolder.getContext().getAuthentication();
	      CustomUser usercode = (CustomUser) authentication2.getPrincipal();
	      String memCode = usercode.getMember().getMemCode(); 
	      log.info("userPrincipal: " +usercode.getMember().getMemCode()); 
		
		vo.setWriter(memCode);
		
		
		return this.commentMapper.HighCmtInsert(vo);
			
	}

	@Override
	public List<IssueCommentVO> getAllCmtList(IssueCommentVO vo) {
		return this.commentMapper.getAllCmtList(vo);
	}

	@Override
	public int lowCmtInsert(IssueCommentVO vo, Authentication authentication) {
		Authentication authentication2 =  SecurityContextHolder.getContext().getAuthentication();
	      CustomUser usercode = (CustomUser) authentication2.getPrincipal();
	      String memCode = usercode.getMember().getMemCode(); 
	      log.info("userPrincipal: " +usercode.getMember().getMemCode()); 
		
		vo.setWriter(memCode);
		
		
		return this.commentMapper.lowCmtInsert(vo);
	}

	@Override
	public int replymodify(IssueCommentVO vo) {
		return this.commentMapper.replymodify(vo); 
	}

	@Override
	public int lowCmtDel(IssueCommentVO vo) {
		
		return this.commentMapper.lowCmtDel(vo);
	}

	
	@Override
	public int highCmtDel(IssueCommentVO vo) {
		return this.commentMapper.highCmtDel(vo);
	}


	
	
	
}
