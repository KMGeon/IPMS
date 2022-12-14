package com.ipms.proj.wiki.vo;

import java.util.Date;

import lombok.Data;


public class WikiVO {
	private String projId;
	private String wikiId;
	private String memNum;
	private String wikiTitle;
	private String wikiCts;
	private String highWikiId;
	private int lowRgstSeq;
	private Date wikiWriteDate;
	private String deleteWhth;
	private String levell;
	
	public String getLevell() {
		return levell;
	}

	public void setLevell(String level) {
		this.levell = level;
	}

	public WikiVO() {}

	public String getProjId() {
		return projId;
	}

	public void setProjId(String projId) {
		this.projId = projId;
	}

	public String getWikiId() {
		return wikiId;
	}

	public void setWikiId(String wikiId) {
		this.wikiId = wikiId;
	}

	public String getMemNum() {
		return memNum;
	}

	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}

	public String getWikiTitle() {
		return wikiTitle;
	}

	public void setWikiTitle(String wikiTitle) {
		this.wikiTitle = wikiTitle;
	}

	public String getWikiCts() {
		return wikiCts;
	}

	public void setWikiCts(String wikiCts) {
		this.wikiCts = wikiCts;
	}

	public String getHighWikiId() {
		return highWikiId;
	}

	public void setHighWikiId(String highWikiId) {
		this.highWikiId = highWikiId;
	}

	public int getLowRgstSeq() {
		return lowRgstSeq;
	}

	public void setLowRgstSeq(int lowRgstSeq) {
		this.lowRgstSeq = lowRgstSeq;
	}

	public Date getWikiWriteDate() {
		return wikiWriteDate;
	}

	public void setWikiWriteDate(Date wikiWriteDate) {
		this.wikiWriteDate = wikiWriteDate;
	}

	public String getDeleteWhth() {
		return deleteWhth;
	}

	public void setDeleteWhth(String deleteWhth) {
		this.deleteWhth = deleteWhth;
	}

	@Override
	public String toString() {
		return "WikiVO [projId=" + projId + ", wikiId=" + wikiId + ", memNum=" + memNum + ", wikiTitle=" + wikiTitle
				+ ", wikiCts=" + wikiCts + ", highWikiId=" + highWikiId + ", lowRgstSeq=" + lowRgstSeq
				+ ", wikiWriteDate=" + wikiWriteDate + ", deleteWhth=" + deleteWhth + ", level=" + levell + "]";
	}

}
