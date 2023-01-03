package com.ipms.proj.issue.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
public class IssueVO {
	
	private String issueId; // 이슈 아이디
	private String taskId; // 일감 아이디
	private String issueTitle; //이슈 제목
	private String issueCts; // 이슈 내용
	private Date issueRgstDate; // 이슈 등록 일자
	private String issueStusCode; // 이슈 상태
	private String itgrnAttachFileNum; // 파일 넘버
	private String deleteYn; // 삭제 여부
	private String writer; // 작성자
	private String taskTitle; // 일감 타이틀
	private String filePath; // 파일 경로
	private String projId; // 프로젝트 아이디
	private String fileName; // 파일이름
	private String fileType; // 파일 타입
	private String saveFileName; // 저장된 파일이름
}
