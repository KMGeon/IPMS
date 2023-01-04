package com.ipms.main.mypage.portfolio.vo;

import java.util.Date;
import java.util.List;

import com.ipms.main.register.vo.TechStackVO;

import lombok.Data;

@Data
public class PortfolioVO {
	
	private String projId; // 프로젝트 아이디 
	private String memCode; // 회원 코드
	private String projName; // 프로젝트 이름 
	private Date projStrtDate; // 프로젝트 시작일
	private Date projEndDate; // 프로젝트 종료일
	private String projSmry; // 프로젝트 개요(설명글)
	private String projOpnWhth; // 프로젝트 공개 여부
	private Date projCreatnDate; // 프로젝트 생성일
	private String projImgRoute; // 프로젝트 이미지 경로
	private String deleteWhth; // 프로젝트 삭제 여부
	
	private String memAuth; // 프로젝트 권한
	
}
