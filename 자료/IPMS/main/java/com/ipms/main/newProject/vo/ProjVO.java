package com.ipms.main.newProject.vo;

import com.ipms.main.login.vo.MemberAuth;
import lombok.Data;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @author KMG
 */
@Data
public class ProjVO {
    private  String projId;//프로젝트 아이디
    private String memCode;//회원번호
    private  String projName;//프로젝트 이름
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date projStrtDate;//프로젝트 시작일자
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date projEndDate;//프로젝트 종료일자
    private String projSmry;//개요
    private  String projOpnWhth;//공개여부
    private  Date projCreatnDate;//프로젝트 생성일자
    private String projImgRoute;//파일 위치
    private String deleteWhth;//삭제여부
    private String techStackCode;
    private String memEmail;
    private  String memName;
    private String keyword;
    List<ProjMemVO> projMemVOList;
    List<MemberAuth>memberAuthList;
}
