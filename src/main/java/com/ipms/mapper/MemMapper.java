package com.ipms.mapper;

import com.ipms.vo.MemAthrtyVO;
import com.ipms.vo.MemVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemMapper {
    public int registerCheck(String email);
    public int registerMember(MemVO memVO);
    public  int loginMem(MemVO memvo);
    public MemVO read(String email);
    public int UpdatePwd(MemVO memVO);
    public int authInsert(MemAthrtyVO memAthrtyVO);
}
