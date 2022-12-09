package com.ipms.main.register.service.Impl;

import com.ipms.main.register.service.MemService;
import com.ipms.main.vo.MemVO;
import com.ipms.mapper.MemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemServiceImpl  implements MemService {
    @Autowired
    MemMapper memMapper;
    @Override
    public int registerCheck(String email) {
        return this.memMapper.registerCheck(email);
    }
    @Override
    public int registerMember(MemVO memVO) {
        return this.memMapper.registerMember(memVO);
    }

    @Override
    public int UpdatePwd(MemVO memVO) {
        return this.memMapper.UpdatePwd(memVO);
    }
}
