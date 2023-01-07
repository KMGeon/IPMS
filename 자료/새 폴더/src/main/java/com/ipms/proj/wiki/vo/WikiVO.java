package com.ipms.proj.wiki.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WikiVO {
	private String projId;
	private String wikiId;
	private String memCode;
	private String wikiTitle;
	private String wikiCts;
	private String highWikiId;
	private int lowRgstSeq;
	private Date wikiWriteDate;
	private String deleteWhth;
	private String levell;
	

}
