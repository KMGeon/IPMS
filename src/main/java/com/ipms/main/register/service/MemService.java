package com.ipms.main.register.service;

import com.ipms.vo.MemAthrtyVO;
import com.ipms.vo.MemVO;

public interface MemService {
    public int registerCheck(String email);
    public int registerMember(MemVO memVO);
    public int UpdatePwd(MemVO memVO);
    public int authInsert(MemAthrtyVO memAthrtyVO);
}
