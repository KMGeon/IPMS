package com.ipms.main.newProject.service.Impl;

import com.ipms.main.login.service.LoginService;
import com.ipms.main.newProject.service.NewProjectService;
import com.ipms.mapper.MemMapper;
import com.ipms.mapper.ProjMapper;
import com.ipms.vo.MemVO;
import com.ipms.vo.ProjVO;
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
    public int insertProjMem(ProjVO projVO) {
        return this.projMapper.insertProjMem(projVO);
    }


}
