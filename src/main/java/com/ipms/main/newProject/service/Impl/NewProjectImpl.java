package com.ipms.main.newProject.service.Impl;

import com.ipms.main.newProject.service.NewProjectService;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewProjectImpl implements NewProjectService {
@Autowired
    ProjMapper projMapper;
    @Override
    public int projInsert(ProjVO projVO) {
        return this.projMapper.projInsert(projVO);
    }

    @Override
    public int insertProjMem(ProjMemVO projMemVO) {
        return this.projMapper.insertProjMem(projMemVO);
    }
}
