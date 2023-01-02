package com.ipms.main.projectlistdetail.service.serviceImpl;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.projectlistdetail.mapper.ProjSmryCmtMapper;
import com.ipms.main.projectlistdetail.service.ProjectListDetailService;
import com.ipms.main.projectlistdetail.vo.ProjSmryCmtVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectListDetailImpl implements ProjectListDetailService {
    @Autowired
    ProjSmryCmtMapper projSmryCmtMapper;
    @Autowired
    ProjMapper projMapper;

    @Override
    public List<MemVO> getDetailLeaderInfo(String memCode) {
        return this.projMapper.getDetailLeaderInfo(memCode);
    }

    @Override
    public int projectsAlreadyApplied(ProjVO projVO) {
        return this.projMapper.projectsAlreadyApplied(projVO);
    }

    @Override
    public List<ProjSmryCmtVO> getList() {
        return this.projSmryCmtMapper.getList();
    }

    @Override
    public int joinProject(ProjVO projVO) {
        return this.projMapper.joinProject(projVO);
    }

    @Override
    public ProjSmryCmtVO read(String projSmryCmtNum) {
        return this.projSmryCmtMapper.read(projSmryCmtNum);
    }
}
