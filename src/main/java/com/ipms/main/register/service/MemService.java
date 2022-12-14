package com.ipms.main.register.service;

import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.login.vo.MemVO;

public interface MemService {
    public int registerCheck(String memEmail);
    public int registerMember(MemVO memVO);
    public int UpdatePwd(MemVO memVO);
    public int authInsert(MemberAuth memberAuth);
}
