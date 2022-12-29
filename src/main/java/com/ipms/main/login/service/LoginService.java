package com.ipms.main.login.service;

import com.ipms.main.login.vo.MemVO;

import java.util.List;

public interface LoginService {
    public  int loginMem(MemVO memvo );
    public List<MemVO> allGetMemCode();
}
