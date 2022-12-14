package com.ipms.proj.chat.service;

import java.util.List;

import com.ipms.proj.chat.vo.ChatVO;

public interface ChatService {

	public int insertChat(ChatVO chatVO);

	public List<ChatVO> selectChat(ChatVO chatVO);

}
