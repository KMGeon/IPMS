package com.ipms.main.wholeProject.service.Impl;

import com.ipms.main.wholeProject.service.WholeProjectService;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class WholeProjectImpl implements WholeProjectService {
@Autowired
    ProjMapper projMapper;

    @Override
    public List<ProjVO> listProj() {
        return this.projMapper.listProj();
    }

    @Override
    public List<ProjVO> selectPage(Map map) {
        return this.projMapper.selectPage(map);
    }

    @Override
    public List<ProjVO> getProjId(String memEmail) {
        return this.projMapper.getProjId(memEmail);
    }

    @Override
    public int count() {
        return this.projMapper.count();
    }

    @Override
    public List<ProjVO> detailPage(String projId) {
        return this.projMapper.detailPage(projId);
    }
}
