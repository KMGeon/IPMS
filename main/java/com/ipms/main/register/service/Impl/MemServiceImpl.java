package com.ipms.main.register.service.Impl;

import com.ipms.main.register.service.MemService;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.mapper.MemMapper;
import com.ipms.main.register.vo.CommonCodeVO;
import com.ipms.main.register.vo.TechStackVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemServiceImpl implements MemService {

    private final MemMapper memMapper;

    @Transactional(rollbackFor = {RuntimeException.class, Exception.class})
    public String signUp(MemVO memVO, Authentication authentication, TechStackVO techStackVO) {
        if (this.memMapper.registerMember(memVO) == 1) {
            List<MemberAuth> list = memVO.getMemAuthList();
            getMembership(memVO, list);//회원권한을 얻다 ROLE_MEMBER
            List<TechStackVO> techStackVOList = memVO.getTechStackVOList();
            getMemberTechStack(memVO, techStackVOList); // 공통코드로 관리하는 기술스텍
            return "success";
        }
        return "fail";
    }

    private void getMemberTechStack(MemVO memVO, List<TechStackVO> techStackVOList) {
        for (TechStackVO vo : techStackVOList) {
            if (vo.getTechStackCode() != null) {
                TechStackVO tech = new TechStackVO();
                tech.setMemCode(memVO.getMemCode());
                tech.setTechStackCode(vo.getTechStackCode());
                this.memMapper.insertTechStack(tech);
            }
        }
    }

    private void getMembership(MemVO memVO, List<MemberAuth> list) {
        for (MemberAuth authVO : list) {
            if (authVO.getMemAuth() != null) {
                MemberAuth memberAuth = new MemberAuth();
                memberAuth.setMemCode(memVO.getMemCode());
                memberAuth.setMemAuth(authVO.getMemAuth());
                this.memMapper.authInsert(memberAuth);
            }
        }
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
