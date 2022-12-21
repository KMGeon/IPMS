package com.ipms.main.mypage.inviteAndApply.service.serviceImpl;

import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.mypage.inviteAndApply.service.InviteAndApplyService;
import com.ipms.main.newProject.vo.ProjMemVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
public class InviteAndApplyServiceImpl implements InviteAndApplyService {
    @Autowired
    MyPageMapper myPageMapper;


    @Override
    public List<ProjMemVO> memberWhoApplied(String memCode) {
        return this.myPageMapper.memberWhoApplied(memCode);
    }

    @Override
    public String getMemCode(String memEmail) {
        return this.myPageMapper.getMemCode(memEmail);
    }

    @Transactional
    @Override
    public int approvalJoiningProject(ProjMemVO projMemVO) {
        int division = this.myPageMapper.approvalJoiningProject(projMemVO);
        if (division == 1) {
            MemberAuth memberAuth = new MemberAuth();
            memberAuth.setMemCode(projMemVO.getMemCode());
            memberAuth.setProjId(projMemVO.getProjId());
            memberAuth.setMemAuth("ROLE_PROJECT");
            return 1;
        }
        return 0;
    }

    @Override
    public int companionProject(ProjMemVO projMemVO) {
        return this.myPageMapper.companionProject(projMemVO);
    }
}