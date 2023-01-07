package com.ipms.proj.chat.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ChatVO {
	private int chatNum;
	private String chatRoomId;
	private String chatCts;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date chatDate;
	private int itgrnAttachFileNum;
	private String writer;
	private String deleteYn;
	
	//조인해온 값들
	private String saveFileName;
	private String fileName;
	
	//writerName
	private String writerName;
}
