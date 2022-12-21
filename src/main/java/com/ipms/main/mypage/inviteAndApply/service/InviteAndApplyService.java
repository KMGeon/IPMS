package com.ipms.main.mypage.inviteAndApply.service;

import com.ipms.main.newProject.vo.ProjMemVO;

import java.util.List;

public interface InviteAndApplyService {
    List<ProjMemVO> memberWhoApplied(String memCode);

    public String getMemCode(String memEmail);

    public int approvalJoiningProject(ProjMemVO projMemVO);

    public int companionProject(ProjMemVO projMemVO);
}
