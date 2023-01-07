package com.ipms.commons.pageHandler;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
public class PageHandler {
    private int totalCnt;//총 게시물 수
    private int pageSize;// 한 페이지의 크기
    private int navSize = 10;//페이지 네비의 크기
    private int totalPage;//전체 페이지 수
    private int page;//현재 페이지
    private int beginPage;//네비 시작
    private int endPage;//네이 마지막
    private boolean showPrev=true;//이전
    private boolean showNext;//다음

    public PageHandler(int totalCnt, int page) {
        this(totalCnt, page, 10);
    }

    public PageHandler(int totalCnt, int page, int pageSize) {
        this.totalCnt = totalCnt;
        this.page = page;
        this.pageSize = pageSize;

        totalPage = (int) Math.ceil(totalCnt / (double) pageSize);//전체 페이지의 수
        beginPage = (page-1) / navSize * navSize + 1;
        endPage = Math.min(beginPage + navSize - 1, totalPage);
        showPrev = beginPage != 1;
        showNext = endPage != totalPage;
    }

    void print() {
        System.out.println("Page" + page);
        System.out.print(showPrev ? "[PREV]" : "");
        for (int i = beginPage; i <= endPage; i++) {
            System.out.print(i + " ");
        }
        System.out.println(showNext ? "[NEXT]" : " ");
    }
}
