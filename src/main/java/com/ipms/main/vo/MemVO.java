package com.ipms.main.vo;

import lombok.Data;

import java.util.Date;

@Data
public class MemVO {
    private String memNum;//회원번호
    private String email;//이메일
    private String paswd;//비밀번호
    private String name;//이름
    private String memDvmntArea;//개발분야
    private String memWhdrlWhth;//탈퇴여부
    private String memPhoneNumber;//전화번호
    private Date memSgnupDate; //가입일자
}
