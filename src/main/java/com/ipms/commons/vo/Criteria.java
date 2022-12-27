package com.ipms.commons.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;
    private int amount;
    
    private String memCode;
    private String keyword;
    
    private String category;
    private Date searchDate;

    public Criteria() {
        this( 1, 10 );
    }

    public Criteria( int pageNum, int amount ) {
        this.pageNum = pageNum;
        this.amount = 10;
    }
    
}
