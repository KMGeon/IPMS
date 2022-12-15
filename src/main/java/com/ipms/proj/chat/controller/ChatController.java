package com.ipms.proj.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ipms.proj.chat.service.ChatService;
import com.ipms.proj.chat.vo.ChatVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@GetMapping("/{projId}/chat")
	public String chat2(@PathVariable(name = "projId") String projId,Model model,String memId) {
		log.info("projId: "+projId);
		ChatVO chatVO = new ChatVO();
		chatVO.setChatRoomId(projId);
		chatVO.setWriter(memId);
		List<ChatVO> chatList = chatService.selectChat(chatVO);
		log.info("list: "+chatList.toString());
		
		model.addAttribute("chatList",chatList);
		model.addAttribute("memId",memId);
		model.addAttribute("projId",projId);
		return "proj/chat/chat";
	}
}
