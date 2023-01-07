package com.ipms.proj.taskcomment.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TaskCommentVO {
	private String taskCmtId; // 댓글 아이디
	private String taskId; 	  // 일감 아이디
	private String highCmtId; // 상위 댓글 아이디
	private String taskCmtCts; // 내용
	private Date taskCmtWriteDate; // 작성일자
	private int lowRgstSeq; // 하위 등록 순서
	private String deleteYn; // 삭제 여부
	private String writer; // 작성자

}
