package com.ipms.vo;

import lombok.Data;

/**
 * @author KMG
 */
@Data
public class ProjMemVO {
    private String memCode;//회원코드
    private String projId;//프로젝트 아이디
    private String teamId;//팀 이름 null
    private String prtptAprovCode;//참여 승인 코드 null
    private String referCts;//반려 내용 null
}
