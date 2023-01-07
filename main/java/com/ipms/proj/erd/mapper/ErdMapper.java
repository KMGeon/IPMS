package com.ipms.proj.erd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;

import com.ipms.proj.erd.vo.ErdVO;



@MapperScan("com.ipms.mapper.ErdMapper")
public interface ErdMapper {
	
	public int insertErd(ErdVO erdVO);
	
	public List<ErdVO> selectVer(ErdVO erdVO);
	
	public ErdVO selectErd(ErdVO erdVO);
	
	public int erdUpdate(ErdVO erdVO);
	
	public int erdDelete(ErdVO erdVO);
}
