package com.ipms.vo;

import lombok.Data;
import org.omg.CORBA.PRIVATE_MEMBER;

@Data
public class MemAthrtyVO {
    private  String memNum;
    private String athrty;//권한
    private  String projId; //프로젝트 아이디

    private  String email;//memvo의 이메일
}
