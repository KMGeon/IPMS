package com.ipms.proj.noticeboard.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;

import lombok.Data;

@Data
public class NoticeBoardVO {
	
	private int projNtNum;
	private String projId;
	private String memCode;
	private String projNtTitle;
	private String projNtCts;
	private String deleteYn;
	private Date projNtWriteDate;
	
	private String itgrnAttachFileNum;
	private String fileName;
	private MultipartFile[] uploadFile;

	//1:N관계
	private List<IntgAttachFileVO> intgAttachFileVOList;
}
