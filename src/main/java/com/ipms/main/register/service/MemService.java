package com.ipms.main.register.service;

import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.login.vo.MemVO;
import com.ipms.main.register.vo.CommonCodeVO;
import com.ipms.main.register.vo.TechStackVO;
import org.springframework.security.core.Authentication;

import java.util.List;

public interface MemService {
    public String signUp(MemVO memVO , Authentication authentication , TechStackVO techStackVO);

    public int registerCheck(String memEmail);

    public int registerMember(MemVO memVO);

    public int UpdatePwd(MemVO memVO);

    public int authInsert(MemberAuth memberAuth);

    public int insertTechStack(TechStackVO techStackVO);

    public List<CommonCodeVO> techStack();
}
