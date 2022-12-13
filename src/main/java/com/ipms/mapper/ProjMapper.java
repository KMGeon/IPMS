package com.ipms.mapper;

import com.ipms.vo.ProjVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProjMapper {
    public int projInsert(ProjVO projVO);
    public int insertProjMem(ProjVO projVO);
}
