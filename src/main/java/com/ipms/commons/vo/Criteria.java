package com.ipms.commons.vo;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;
    private int amount;

    private String memCode;

    public Criteria() {
        this( 1, 10 );
    }

    public Criteria( int pageNum, int amount ) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
    
}
