package com.ipms.proj.task.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TaskCmtVO {
	
	private String taskCmtId;
	private String taskId;
	private String highCmtId;
	private String taskCmtCts;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date taskCmtWriteDate;
	private int lowRgstSeq;
	private String deleteYn;
	private String writer;

}
