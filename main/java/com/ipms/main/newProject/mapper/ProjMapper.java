package com.ipms.main.newProject.mapper;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProjMapper {

    public  List<ProjMemVO>listProj();
    public List<ProjVO>getListPage( );
    public List<ProjVO>getListPage(Criteria criteria);
    public int getWholeProjectTotal();
    public int getWholeProjectTotal(Criteria criteria);
    public List<ProjVO>getProjId(String memEmail);
    public List<ProjVO> detailPage(String projId);
    public int projInsert(ProjVO projVO);
    public int insertProjMem(ProjMemVO projMemVO);
    public int projAuthInsert(MemberAuth memberAuth);
    public int joinProject(ProjVO projVO);
    public List<MemVO>getDetailLeaderInfo(String memCode);
    public List<ProjVO>checkMyProject(String projId);
    public int projectsAlreadyApplied(ProjVO projVO);
}
