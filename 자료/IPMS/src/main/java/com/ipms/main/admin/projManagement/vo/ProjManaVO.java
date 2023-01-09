package com.ipms.main.admin.projManagement.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProjManaVO {

	private String projId;			// 프로젝트 아이디
	private String memCode;			// 회원 코드
	private String projName;		// 프로젝트 이름
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date projStrtDate;		// 프로젝트 시작 일자
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date projEndDate;		// 프로젝트 종료 일자
	
	private String projSmry;		// 프로젝트 개요
	private String projOpnWhth;		// 프로젝트 공개 여부
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date projCreatnDate;	// 프로젝트 생성 일자
	
	private String projImgRoute;	// 프로젝트 대표 이미지 경로
	private String deleteWhth;		// 프로젝트 삭제 여부
	
	private String writer;
    private String prtptAprovCode;//참여 승인 코드 null
    private String referCts;//반려 내용 null
    private String dropStatus;//하차여부
    private String invttnot;//초대여부
	
}
