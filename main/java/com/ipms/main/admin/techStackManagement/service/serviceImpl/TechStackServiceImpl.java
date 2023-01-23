package com.ipms.main.admin.techStackManagement.service.serviceImpl;

import com.ipms.main.admin.techStackManagement.mapper.TeckStackManageMapper;
import com.ipms.main.admin.techStackManagement.service.TechStackService;
import com.ipms.main.admin.techStackManagement.vo.TechStackVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TechStackServiceImpl implements TechStackService {

    private final TeckStackManageMapper teckStackManageMapper;

    @Override
    public int addSkillStack(TechStackVO techStackVO) {
        return this.teckStackManageMapper.addSkillStack(techStackVO);
    }

    @Override
    public int clearSkillStack(String commonCodeValue) {
        return this.teckStackManageMapper.clearSkillStack(commonCodeValue);
    }
}
