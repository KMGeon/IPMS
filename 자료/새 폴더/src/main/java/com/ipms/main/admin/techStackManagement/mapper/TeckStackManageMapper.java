package com.ipms.main.admin.techStackManagement.mapper;

import com.ipms.main.admin.techStackManagement.vo.TechStackVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeckStackManageMapper {
    public int addSkillStack(TechStackVO techStackVO);
    public int clearSkillStack(String commonCodeValue);
}
