package com.ipms.main.projectlistdetail.mapper;

import com.ipms.main.projectlistdetail.vo.ProjSmryCmtVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProjSmryCmtMapper {
	
    List<ProjSmryCmtVO> projCmtList(String projId); // 댓글 리스트
    public int projCmtInsert(ProjSmryCmtVO projSmryCmtVO);	// 상위 댓글 작성
    public int projCmtInsert2(ProjSmryCmtVO projSmryCmtVO);	// 하위 댓글 작성
    public int projCmtUpdate(ProjSmryCmtVO projSmryCmtVO); // 댓글 수정
    public int projCmtDel(ProjSmryCmtVO projSmryCmtVO); // 댓글 삭제
    
    ProjSmryCmtVO read(String projSmryCmtNum);
    public int insertReply(ProjSmryCmtVO projSmryCmtVO);
    public int replyInsert(ProjSmryCmtVO projSmryCmtVO);
    public int replySeqUpdate(ProjSmryCmtVO parent);

}
