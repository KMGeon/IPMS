package com.ipms.proj.task.vo;

import java.util.Date;

public class TaskVO {
	private String classification; // 일감 구분
	private String taskId; // 일감 아이디
	private String projId; // 프로젝트 아이디
	private String memCode; // 회원 코드
	private String taskTitle; // 일감 제목
	private String taskCts; //  일감 내용
	private Date taskStrtDate; // 일감 시작일자
	private Date taskEndDate; // 일감 종료일자
	private String taskStusCode; // 일감 상태 코드
	private int taskPgres; // 진척도
	private String highTaskId; //  상위 일감 아이디
	private int lowRgstSeq; // 하위 등록 순서
	private String aprovWhth; // 승인 여부
	private String taskRepre; // 담당자
	private String deleteYn; // 삭제 여부
	private String referCts; // 반려 내용
	
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getProjId() {
		return projId;
	}
	public void setProjId(String projId) {
		this.projId = projId;
	}
	public String getMemCode() {
		return memCode;
	}
	public void setMemCode(String memCode) {
		this.memCode = memCode;
	}
	public String getTaskTitle() {
		return taskTitle;
	}
	public void setTaskTitle(String taskTitle) {
		this.taskTitle = taskTitle;
	}
	public String getTaskCts() {
		return taskCts;
	}
	public void setTaskCts(String taskCts) {
		this.taskCts = taskCts;
	}
	public Date getTaskStrtDate() {
		return taskStrtDate;
	}
	public void setTaskStrtDate(Date taskStrtDate) {
		this.taskStrtDate = taskStrtDate;
	}
	public Date getTaskEndDate() {
		return taskEndDate;
	}
	public void setTaskEndDate(Date taskEndDate) {
		this.taskEndDate = taskEndDate;
	}
	public String getTaskStusCode() {
		return taskStusCode;
	}
	public void setTaskStusCode(String taskStusCode) {
		this.taskStusCode = taskStusCode;
	}
	public int getTaskPgres() {
		return taskPgres;
	}
	public void setTaskPgres(int taskPgres) {
		this.taskPgres = taskPgres;
	}
	public String getHighTaskId() {
		return highTaskId;
	}
	public void setHighTaskId(String highTaskId) {
		this.highTaskId = highTaskId;
	}
	public int getLowRgstSeq() {
		return lowRgstSeq;
	}
	public void setLowRgstSeq(int lowRgstSeq) {
		this.lowRgstSeq = lowRgstSeq;
	}
	public String getAprovWhth() {
		return aprovWhth;
	}
	public void setAprovWhth(String aprovWhth) {
		this.aprovWhth = aprovWhth;
	}
	public String getTaskRepre() {
		return taskRepre;
	}
	public void setTaskRepre(String taskRepre) {
		this.taskRepre = taskRepre;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getReferCts() {
		return referCts;
	}
	public void setReferCts(String referCts) {
		this.referCts = referCts;
	}
	
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	@Override
	public String toString() {
		return "WorkVO [classification=" + classification + ", taskId=" + taskId + ", projId=" + projId + ", memCode="
				+ memCode + ", taskTitle=" + taskTitle + ", taskCts=" + taskCts + ", taskStrtDate=" + taskStrtDate
				+ ", taskEndDate=" + taskEndDate + ", taskStusCode=" + taskStusCode + ", taskPgres=" + taskPgres
				+ ", highTaskId=" + highTaskId + ", lowRgstSeq=" + lowRgstSeq + ", aprovWhth=" + aprovWhth
				+ ", taskRepre=" + taskRepre + ", deleteYn=" + deleteYn + ", referCts=" + referCts + "]";
	}
	
	

}
