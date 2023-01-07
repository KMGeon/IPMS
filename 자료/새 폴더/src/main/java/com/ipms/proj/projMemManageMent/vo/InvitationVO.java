package com.ipms.proj.projMemManageMent.vo;

import lombok.Data;

@Data
public class InvitationVO {
    private String inviteNum;//초대번호
    private String memCode;//회원코드
    private String projId;//프로젝트 아이디
    private String invttnot;//초대여부

    private  String projName;
}
