package com.ipms.main.mypage.projectbookmark.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BookMarkVO {
	
	private String projId;       //프로젝트 아이디
	private String memCode;      // 멤버코드
	private String deleteYn;     // 삭제여부
	private String projName;     // 프로젝트 이름
	
	@JsonFormat(pattern = "yyyy-MM-dd" , timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date projStrtDate;   // 프로젝트 시작일
	
	@JsonFormat(pattern = "yyyy-MM-dd" , timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date projEndDate;    // 프로젝트 종료일
	
	private String projSmry;     // 개요
	private String projOpnWhth;  // 프로젝트 공개여부 
	private Date projCreatnDate; // 프로젝트 생성일자
	private String projImgRoute; // 프로젝트 이미지경로
	private String deleteWhtn;   // 삭제 여부
	private String memName; // 멤버 이름

}


