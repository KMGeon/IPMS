package com.ipms.main.newProject.mapper;

import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProjMapper {
    public List<ProjVO>listProj();
    public int projInsert(ProjVO projVO);
    public int insertProjMem(ProjMemVO projMemVO);
}
