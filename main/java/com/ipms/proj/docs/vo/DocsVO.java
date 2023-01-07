package com.ipms.proj.docs.vo;

import lombok.Data;

@Data
public class DocsVO {
	
	private String foldId; // 폴더 아이디
	private String projId; // 프로젝트 아이디
	private String memCode; // 회원 코드
	private String highFoldId; // 폴더 명
	private String foldName; // 상위 폴더 아이디
	private String itgrnAttachFileNum; // 통합첨부파일번호
	private String deleteYn; // 삭제 여부
	
}
