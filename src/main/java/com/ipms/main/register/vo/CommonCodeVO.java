package com.ipms.main.register.vo;

import lombok.Data;

@Data
public class CommonCodeVO {
    private String commonCode; //공통코드
    private String commonCodeGroup;//공통 코드 그룹
    private String commonCodeValue;//코드값
    private String commonCodeSeq;//표시 순서
    private String commonCodeEplntn;//코드 설명
    private String userWhth;//사용여부
}
