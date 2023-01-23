package com.ipms.proj.chat.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.proj.chat.mapper.ChatMapper;
import com.ipms.proj.chat.service.ChatService;
import com.ipms.proj.chat.vo.ChatVO;

@Service
@Transactional
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	ChatMapper chatMapper;
	
	@Override
	public int insertChat(ChatVO chatVO) {
		return chatMapper.insertChat(chatVO);
	}
	
	@Override
	public List<ChatVO> selectChat(ChatVO chatVO){
		return chatMapper.selectChat(chatVO);
	}
	
	@Override
	public int insertAttach(IntgAttachFileVO intgAttachFileVO) {
		return chatMapper.insertAttach(intgAttachFileVO);
	}
	
	@Override
	public int selectChatNum() {
		return chatMapper.selectChatNum();
	}
}
