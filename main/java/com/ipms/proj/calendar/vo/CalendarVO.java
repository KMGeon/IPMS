package com.ipms.proj.calendar.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CalendarVO {

	private int indvSchdNum;
	private String writer;
	private String memCode;
	private String projId;
	private String indvSchdTitle;
	private String indvSchdCts;
	private String deleteYn;
//	private String title;
	
//	JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
//	DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private String indvSchdStrtDate;
	
//	JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
//	DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private String indvSchdEndDate;
	
//	JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date indvSchdWriteDate;
}
