package com.ipms.vo;

import lombok.Data;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Data
@Repository
public class MemVO {
    private String memCode;//회원번호
    private String memEmail;//이메일
    private String memPasswd;//비밀번호
    private String memName;//이름
    private String memPhoneNumber;//전화번호
    private Date memSgnupDate; //가입일자
    private String memWhdrlWhth;//탈퇴여부
    private String projImgRoute;//프로필

    private List<MemberAuth> memAuthList;//N+1
}
