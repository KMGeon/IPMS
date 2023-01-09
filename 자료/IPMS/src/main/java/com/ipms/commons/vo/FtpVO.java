package com.ipms.commons.vo;

import java.util.List;

import lombok.Data;

@Data
public class FtpVO implements Comparable<FtpVO>{
	
	private String text;
	private String regDate;
	private long size;
	private int seq;
	private int parentId;
	
	private boolean isDir;

	private List<FtpVO> ftpList;
	
	@Override
	public int compareTo(FtpVO o) {
		int a = this.isDir == true ? 1:0;
		int b = o.isDir == true ? 1:0;
		return b - a;
	}
	
}
