package com.ipms.proj.freeboard.vo;

import java.util.Date;

import lombok.Data;

@Data
public class FreeboardCmtVO {

	private int projBdCmtId;			// 댓글 아이디
	private int projBdId;				// 게시판 아이디
	private String projBdCmtCts;		// 내용
	private String writer;				// 작성자
	private String writerCmt;				// 작성자
	private Date projBdCmtWriteDate;	// 작성일
	private String highCmtId;			// 상위 댓글 아이디
	private int lowRgstSeq;				// 하위 등록 순서
	private String deleteYn;			// 삭제 여부
	
	private String memCode;
}
