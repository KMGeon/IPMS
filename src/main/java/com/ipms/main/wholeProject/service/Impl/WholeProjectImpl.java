package com.ipms.main.wholeProject.service.Impl;

import com.ipms.main.wholeProject.service.WholeProjectService;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WholeProjectImpl implements WholeProjectService {
@Autowired
    ProjMapper projMapper;

    @Override
    public List<ProjVO> listProj() {
        return this.projMapper.listProj();
    }
}
