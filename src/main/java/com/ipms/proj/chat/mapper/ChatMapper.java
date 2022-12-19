package com.ipms.proj.chat.mapper;

import java.util.List;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.proj.chat.vo.ChatVO;

public interface ChatMapper {

	public int insertChat(ChatVO chatVO);
	
	public List<ChatVO> selectChat(ChatVO chatVO);
	
	public int insertAttach(IntgAttachFileVO intgAttachFileVO);
	
	public int selectChatNum();
}
