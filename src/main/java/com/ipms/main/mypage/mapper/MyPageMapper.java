package com.ipms.main.mypage.mapper;

import com.ipms.main.newProject.vo.ProjMemVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyPageMapper {
    List<ProjMemVO> memberWhoApplied(String memCode);
    List<ProjMemVO>projectsApplied(String memCode);
    String getMemCode(String memEmail);
    public     int approvalJoiningProject(ProjMemVO projMemVO);
    public     int companionProject(ProjMemVO projMemVO);
    public List<ProjMemVO>goingProjects(String memCode);
}
