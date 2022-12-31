package com.ipms.main.newProject.vo;

import lombok.*;


@Data
public class ProjMemVO {
    private String memCode;//회원코드
    private String projId;//프로젝트 아이디
    private String prtptAprovCode;//참여 승인 코드 null
    private String referCts;//반려 내용 null
    private  String dropStatus;//하차여부
    private  String invttnot;//초대여부

    private String projSmry;
    private String memEmail;
    private String projName;//프로젝트 이름
    private  String memName;
    private  String projImgRoute;

}
