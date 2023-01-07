package com.ipms.proj.freeboard.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FreeboardVO {

	private int projBdId;			// 글 번호
	private String writer;				// 작성자
	private String projId;				// 프로젝트 번호
	private String projBdTitle;			// 제목
	private String projBdCts;			// 내용
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date projBdWriteDate;		// 작성일
	
	private int itgrnAttachFileNum;	// 통첨파 번호
	private String deleteYn;			// 삭제 여부
	
}
