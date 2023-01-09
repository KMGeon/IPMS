package com.ipms.main.projectlistdetail.vo;

import lombok.Data;

import java.util.Date;

@Data
public class ProjSmryCmtVO {
    private int projSmryCmtNum;//프로젝트 개요 댓글 번호
    private String projId;
    private String memCode;
    private String projSmryCmtCts;//댓글 내용
    private Date projSmryCmtWriteDate;//작성일
    private String replyGroup;
    private String replyLevel;
    private String replySeq;
    private String deleteYn;
    private String highCmtId;
    
    private String memEmail;
}
