package com.ipms.main.admin.techStackManagement.service;

import com.ipms.main.admin.techStackManagement.vo.TechStackVO;

public interface TechStackService {
    public int addSkillStack(TechStackVO techStackVO);
    public int clearSkillStack(String commonCodeValue);
}
