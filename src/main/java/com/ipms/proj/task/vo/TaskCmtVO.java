package com.ipms.proj.task.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TaskCmtVO {
	
	private String taskCmtId;
	private String taskId;
	private String highCmtId;
	private String taskCmtCts;
	private Date taskCmtWriteDate;
	private int lowRgstSeq;
	private String deleteYn;
	private String writer;

}
