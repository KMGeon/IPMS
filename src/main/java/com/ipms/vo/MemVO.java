package com.ipms.vo;

import lombok.Data;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Data
@Repository
public class MemVO {
    private String memNum;//회원번호
    private String email;//이메일
    private String paswd;//비밀번호
    private String name;//이름
    private String memDvmntArea;//개발분야
    private String memWhdrlWhth;//탈퇴여부
    private String memPhoneNumber;//전화번호
    private Date memSgnupDate; //가입일자
    private String itgrnAttachFileNum;//프로필

    private List<MemAthrtyVO> memAuthList;//N+1
}
