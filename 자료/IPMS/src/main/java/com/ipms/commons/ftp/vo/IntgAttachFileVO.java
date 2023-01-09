package com.ipms.commons.ftp.vo;

import java.util.Date;

import lombok.Data;

@Data
public class IntgAttachFileVO {
	
	private String intgAttachFileNum; // 통합첨부파일번호
	private long attachFileSeq; // 첨부파일순서
	private String filePath; // 파일경로
	private String fileName; // 파일명
	private String saveFileName; // 저장파일명
	private long fileSize; // 파일크기
	private String fileSizeName; // 파일크기 명
	private Date rgstDate; // 등록일자
	private String rgstId; // 등록자 ID
	private String fileDeleteWhth; // 파일 삭제 여부
	
	private String fileType;	//파일타입
}
