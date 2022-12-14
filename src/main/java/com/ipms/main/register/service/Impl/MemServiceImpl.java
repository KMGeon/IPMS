package com.ipms.main.register.service.Impl;

import com.ipms.main.register.service.MemService;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.mapper.MemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemServiceImpl  implements MemService {
    @Autowired
    MemMapper memMapper;
    @Override
    public int registerCheck(String memEmail) {
        return this.memMapper.registerCheck(memEmail);
    }
    @Override
    public int registerMember(MemVO memVO) {
        return this.memMapper.registerMember(memVO);
    }

    @Override
    public int UpdatePwd(MemVO memVO) {
        return this.memMapper.UpdatePwd(memVO);
    }
    @Override
    public int authInsert(MemberAuth memberAuth){
        return this.memMapper.authInsert(memberAuth);
    }
}
