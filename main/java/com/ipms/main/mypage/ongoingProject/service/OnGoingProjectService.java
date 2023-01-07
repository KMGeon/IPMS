package com.ipms.main.mypage.ongoingProject.service;
import com.ipms.main.newProject.vo.ProjMemVO;

import java.util.List;

public interface OnGoingProjectService {
    public List<ProjMemVO> goingProjects(String memCode);
}
