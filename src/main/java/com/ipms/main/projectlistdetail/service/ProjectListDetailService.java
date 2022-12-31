package com.ipms.main.projectlistdetail.service;

import com.ipms.main.projectlistdetail.vo.ProjSmryCmtVO;

import java.util.List;

public interface ProjectListDetailService {
    List<ProjSmryCmtVO> getList();
    ProjSmryCmtVO read(String projSmryCmtNum);
    public int insertReply(ProjSmryCmtVO projSmryCmtVO);
    public int replyInsert(ProjSmryCmtVO projSmryCmtVO);
    public int replySeqUpdate(ProjSmryCmtVO parent);
    public void replyreply(ProjSmryCmtVO vo);
}
