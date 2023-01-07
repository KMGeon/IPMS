package com.ipms.proj.issue.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class IssueCommentVO {
	
	private String issueCmtId; // 댓글 아이디 seq
	private String issueId;    // 이슈 아이디 ㅇ
	private String highCmtId;  // 상위 댓글 아이디 null
	private String issueCmtCts;// 댓글 내용  ㅇ
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss" , timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date issueCmtWriteDate; // 작성일자 sysdate
	
	private int lowRgstWhth; //하위등록 순서 seq
	private String deleteYn; // 삭제 여부 'n'
	private String writer;   // 작성자 mem_name 

}
