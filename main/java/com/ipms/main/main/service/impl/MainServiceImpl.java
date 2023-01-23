package com.ipms.main.main.service.impl;

import com.ipms.main.alert.vo.AlrmVO;
import com.ipms.main.main.service.MainService;
import com.ipms.proj.projMemManageMent.mapper.MemManageMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {

    private final MemManageMapper memManageMapper;

    @Override
    public int deleteAlrm(AlrmVO alrmVO) {
        return this.memManageMapper.deleteAlrm(alrmVO);
    }

    @Override
    public List<AlrmVO> getAlrmList(String memCode) {
        return this.memManageMapper.getAlrmList(memCode);
    }

    @Override
    public int countAlrm(String memCode) {
        return this.memManageMapper.countAlrm(memCode);
    }
}
