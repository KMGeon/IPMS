package com.ipms.main.mypage.inforManagement.mapper;

import com.ipms.main.register.vo.TechStackVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InforManageMapper {
    List<TechStackVO>personalSkillsStackList(TechStackVO techStackVO);
}
