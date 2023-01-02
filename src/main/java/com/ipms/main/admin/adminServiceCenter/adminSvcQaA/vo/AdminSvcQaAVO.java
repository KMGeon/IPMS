package com.ipms.main.admin.adminServiceCenter.adminSvcQaA.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminSvcQaAVO {
	
	private int qnaNum; // Q&A 번호
	private String writer; // 작성자
	private String qnaTitle; // Q&A 제목
	private String qnaCts; // Q&A 내용
	private Date qnaWriteDate; // 작성일자
	private String qnaStatus; // 답변 상태
	private String memCode; // 회원 코드 
	private String deleteYn; // 삭제 여부
	
}
