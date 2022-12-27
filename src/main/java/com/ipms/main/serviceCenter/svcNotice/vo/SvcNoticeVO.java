package com.ipms.main.serviceCenter.svcNotice.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SvcNoticeVO {
	private int siteNtNum;
	private String siteNtTitle;
	private String siteNtCts;
	private Date siteNtWriteDate;
	private String ntCtgCode;
	private String deleteYn;
	
}
