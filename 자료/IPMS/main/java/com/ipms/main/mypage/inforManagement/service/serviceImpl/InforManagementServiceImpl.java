package com.ipms.main.mypage.inforManagement.service.serviceImpl;

import com.ipms.main.mypage.inforManagement.mapper.InforManageMapper;
import com.ipms.main.mypage.inforManagement.service.InforManagementService;
import com.ipms.main.register.vo.TechStackVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InforManagementServiceImpl implements InforManagementService {
    @Autowired
    InforManageMapper inforManageMapper;

    @Override
    public List<TechStackVO> personalSkillsStackList(TechStackVO techStackVO) {
        return this.inforManageMapper.personalSkillsStackList(techStackVO);
    }
}
