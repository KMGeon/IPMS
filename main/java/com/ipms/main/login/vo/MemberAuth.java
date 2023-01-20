package com.ipms.main.login.vo;

import lombok.*;

import javax.validation.constraints.NotNull;


@Data
public class MemberAuth {
    private String memCode;
    private String projId;
    private String memAuth;

}
