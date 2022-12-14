package com.ipms.proj.erd.service;

import java.util.List;

import com.ipms.proj.erd.vo.ErdVO;

public interface ErdService {
	
	public int insertErd(ErdVO erdVO);

	public List<ErdVO> selectVer(ErdVO erdVO);

	public ErdVO selectErd(ErdVO erdVO);

	public int erdUpdate(ErdVO erdVO);

	public int erdDelete(ErdVO erdVO);

}
