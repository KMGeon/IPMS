package com.ipms.main.alert.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class AlrmVO {
    private String alrmId;//알람아이디
    private String memCode;//회원코드
    private String alrmCts;//알림내용
    private Date alrmTime;//알림시간
    private String alrmDivisionCode;//알림 구분 코드

    List<AlrmReceiverVO>alrmReceiverVOList;
}
