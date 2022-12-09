package com.ipms.main.register.service;

import com.ipms.main.vo.MemAthrtyVO;
import com.ipms.main.vo.MemVO;

public interface MemService {
    public int registerCheck(String email);
    public int registerMember(MemVO memVO);
    public int UpdatePwd(MemVO memVO);
    public int authInsert(MemAthrtyVO memAthrtyVO);
}
