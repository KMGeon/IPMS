package com.ipms.main.admin.memManagement.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.ipms.main.newProject.vo.ProjVO;

import lombok.Data;

@Data
public class AdminMemVO {
	
	private String memCode;			// 회원 코드
	private String memEmail; 		// 회원 아이디
	private String memPasswd; 		// 회원 비밀번호
	private String memName; 		// 회원 이름
	private String memPhoneNumber; // 회원 전화번호
	
	private Date memSgnupDate;	 // 회원 가입일자
	
	private String memImgRoute;	 // 회원 프로필 이미지경로
	private String memWhdrlYn;	 // 회원 탈퇴 여부
	private String memProjQuit;	 // 회원 프로젝트 중도 하차 횟수
	
	private List<ProjVO> projVOList;
}
