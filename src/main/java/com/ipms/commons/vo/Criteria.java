package com.ipms.commons.vo;

import lombok.Data;

import java.util.Date;

@Data
public class Criteria {

    private int pageNum;
    private int amount;

    private String memEmail;
    private String memName;

    private String memCode;
    private String keyword;
    private String type;
    private String category;
    private Date searchDate;
    private String[] typeArr;
    private  String StrtDateKeyword;
    private  String EndDateKeyword;
    private String comple;
    private String noncomple;

    private String aprov;
    private String projId; // issueboard - 박종환 추가
    private String projName;

    private Date startDate;
    private Date endDate;

    public Criteria() {
        this(1, 8);
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = 8;
    }

    public String[] getTypeArr() {
        return type == null ? new String[]{} : type.split("");
    }

}





