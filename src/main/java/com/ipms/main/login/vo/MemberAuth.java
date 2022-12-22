package com.ipms.main.login.vo;

import lombok.*;

import javax.validation.constraints.NotNull;


@Data
public class MemberAuth {
    @NotNull(message = "회원고유코드")
    private String memCode;
    @NotNull(message = "프로젝트 고유 아이디")
    private String projId;
    @NotNull(message = "회원의 권한")
    private String memAuth;

}
