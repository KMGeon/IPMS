package com.ipms.main.register.service;

import com.ipms.main.vo.MemVO;

public interface MemService {
    public int registerCheck(String memEmail);
    public int registerMember(MemVO memVO);
}
