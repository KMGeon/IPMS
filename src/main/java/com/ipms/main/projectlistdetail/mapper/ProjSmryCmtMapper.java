package com.ipms.main.projectlistdetail.mapper;

import com.ipms.main.projectlistdetail.vo.ProjSmryCmtVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProjSmryCmtMapper {
    List<ProjSmryCmtVO>getList();
    ProjSmryCmtVO read(String projSmryCmtNum);
    public int insertReply(ProjSmryCmtVO projSmryCmtVO);
    public int replyInsert(ProjSmryCmtVO projSmryCmtVO);
    public int replySeqUpdate(ProjSmryCmtVO parent);


}
