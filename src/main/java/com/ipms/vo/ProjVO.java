package com.ipms.vo;

import lombok.Data;
import oracle.sql.CLOB;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
@Data
public class ProjVO {
    private  String projId;//프로젝트 아이디
    private String memCode;//회원번호
    private  String projName;//프로젝트 이름
    private Date projStrtDate;//프로젝트 시작일자
    private Date projEndDate;//프로젝트 종료일자
    private CLOB projSmry;//개요
    private  String projOpnWhth;//공개여부
    private  Date projCreatnDate;//프로젝트 생성일자
    private String itgrnAttachFileNum;//통합첨부파일번호
    private String deleteWhth;//삭제여부
}
