package com.ipms.mapper;

import com.ipms.vo.MemberAuth;
import com.ipms.vo.MemVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemMapper {
    public int registerCheck(String memEmail);
    public int registerMember(MemVO memVO);
    public  int loginMem(MemVO memvo);
    public MemVO read(String userName);
    public int UpdatePwd(MemVO memVO);
    public int authInsert(MemberAuth memberAuth);
}
