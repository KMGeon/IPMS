package com.ipms.proj.noticeboard.vo;

import com.ipms.commons.vo.Criteria;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
public class NoticePageVO {
	
	private int startPage; // 첫 페이지 번호
    private int endPage; // 마지막페이지 번호
    private boolean next; // 다음 버튼 활성화
    private boolean prev; // 이전 버튼 활성화
    private int total; // 총 게시글 수
    private int pageNum; // 조회하는 페이지 번호 ( cri에도 존재함 )
    private int amount; // 보여질 데이터 개수 ( 한 페이지에 보여질 게시물 수 )
    private int realEnd;	//마지막페이지
    
    private Criteria cri;
    
 // 만약 Criteria를 안쓸거면 pageNum이랑 amount를 파라미터로 보내줘도 됨
    public NoticePageVO( Criteria cri, int total ) {
        // 번호, 개수, 총 게시글 수 초기화
        this.pageNum = cri.getPageNum();
        log.debug( "pageNum : {}", pageNum );
        this.amount = cri.getAmount(); 
        this.total = total;
        this.cri = cri;

    	if(this.pageNum <= 0) {
    		this.pageNum = 1;
    	}
    	
        // endPage( 끝번호 ) 계산
        /*
         * pageNum 5번 -> 끝페이지 번호는 10
         * pageNum 11번 -> 끝페이지 번호는 20
         * (int) Math.ceil( pageNum / 보여질 페이지 수 ) * 보여질 페이지 수
         *
         */
         this.endPage = (int) (Math.ceil( this.pageNum / 5.0 ) * 5.0);
         log.debug( "endPage : {}", endPage );

         this.startPage = this.endPage - 5 + 1;
         log.debug( "startPage : {}", startPage );

         // 게시글 53개 -> 마지막 끝 페이지 번호는 6
         // 게시글 112 -> 마지막 끝 페이지 번호는 12
         // (int)Math.ceil( 전체게시글 수 / 화면에 뿌려질 데이터 amount값 )
         int realEnd = (int) Math.ceil( this.total / (double)this.amount );
         if( this.endPage > realEnd ) {
             this.endPage = realEnd; // 마지막에 도달했을 때 보여질 번호를 변경
         }
         log.debug("realEnd : " + realEnd);
         this.realEnd = realEnd;

         // 이전버튼 활성화 여부
         // startPage는 1, 11, 21, 31 ...
         this.prev = this.pageNum > 5;
         log.debug( "prev : {}", prev );

         // 다음버튼 활성화 여부
         //endPage < realEnd => true
         // endPage는 10, 20, 30 ... realEnd
         this.next = this.endPage < realEnd;
         log.debug( "next : {}", next );
		 
    }
   
}
