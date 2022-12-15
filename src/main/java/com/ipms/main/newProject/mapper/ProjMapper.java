package com.ipms.main.newProject.mapper;

import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjTeamVO;
import com.ipms.main.newProject.vo.ProjVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProjMapper {

    public List<ProjVO> listProj();

    public int projInsert(ProjVO projVO);

    public int insertProjMem(ProjMemVO projMemVO);

    public int projAuthInsert(MemberAuth memberAuth);

    public int authDelete(String memCoed);

    public int insertProTeam(ProjTeamVO projTeamVO);
}
