package com.ipms.proj.noticeboard.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeBoardVO {
	
	private Date projNtWriteDate;
	private int projNtNum;
	private String projId;
	private String memCode;
	private String projNtTitle;
	private String projNtCts;
	private String itgrnAttachFileNum;
	private String deleteYn;
}
