package com.ipms.main.admin.techStackManagement.service.serviceImpl;

import com.ipms.main.admin.techStackManagement.mapper.TeckStackManageMapper;
import com.ipms.main.admin.techStackManagement.service.TechStackService;
import com.ipms.main.admin.techStackManagement.vo.TechStackVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TechStackServiceImpl implements TechStackService {
    @Autowired
    TeckStackManageMapper teckStackManageMapper;

    @Override
    public int addSkillStack(TechStackVO techStackVO) {
        return this.teckStackManageMapper.addSkillStack(techStackVO);
    }

    @Override
    public int clearSkillStack(String commonCodeValue) {
        return this.teckStackManageMapper.clearSkillStack(commonCodeValue);
    }
}
