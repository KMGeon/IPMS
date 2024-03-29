package com.ipms.proj.projQuit.service.serviceImpl;

import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.projQuit.mapper.ProjQuitMapper;
import com.ipms.proj.projQuit.service.ProjQuitService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProjQuitServiceImpl implements ProjQuitService {

    private final ProjQuitMapper projMemManageMapper;

    @Override
    public int dropApplication(ProjVO projVO) {
        return this.projMemManageMapper.dropApplication(projVO);
    }
}
