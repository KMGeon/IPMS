package com.ipms.main.register.service.Impl;

import com.ipms.main.register.service.MemService;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.mapper.MemMapper;
import com.ipms.main.register.vo.CommonCodeVO;
import com.ipms.main.register.vo.TechStackVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
public class MemServiceImpl implements MemService {
    @Autowired
    MemMapper memMapper;


    @Transactional(rollbackFor = {RuntimeException.class, Exception.class})
    public String signUp(MemVO memVO, Authentication authentication, TechStackVO techStackVO) {
        int result = this.memMapper.registerMember(memVO);
        if (result == 1) {
            List<MemberAuth> list = memVO.getMemAuthList();
            for (MemberAuth authVO : list) {
                if (authVO.getMemAuth() != null) {
                    MemberAuth memberAuth = new MemberAuth();
                    memberAuth.setMemCode(memVO.getMemCode());
                    memberAuth.setMemAuth(authVO.getMemAuth());
                    this.memMapper.authInsert(memberAuth);
                }
            }
            List<TechStackVO> techStackVOList = memVO.getTechStackVOList();
            for (TechStackVO vo : techStackVOList) {
                if (vo.getTechStackCode() != null) {
                    TechStackVO tech = new TechStackVO();
                    tech.setMemCode(memVO.getMemCode());
                    tech.setTechStackCode(vo.getTechStackCode());
                    this.memMapper.insertTechStack(tech);
                }
            }
            return "main/page";
        }
        return "redirect:/main/page";
    }


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
    public int authInsert(MemberAuth memberAuth) {
        return this.memMapper.authInsert(memberAuth);
    }

    @Override
    public int insertTechStack(TechStackVO techStackVO) {
        return this.memMapper.insertTechStack(techStackVO);
    }


    @Override
    public List<CommonCodeVO> techStack() {
        return this.memMapper.techStack();
    }


}
