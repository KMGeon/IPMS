package com.ipms.main.mypage.mapper;

import com.ipms.main.newProject.vo.ProjMemVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InviteAndApplyMapper {
    List<ProjMemVO> memberWhoApplied(String memCode);
    String getMemCode(String memEmail);
    public     int approvalJoiningProject(ProjMemVO projMemVO);
}
