package com.ipms.main.newProject.service.Impl;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.service.NewProjectService;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjTeamVO;
import com.ipms.main.newProject.vo.ProjVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NewProjectImpl implements NewProjectService {
    @Autowired
    ProjMapper projMapper;
    @Autowired
    NewProjectService newProjectService;

    @Transactional
    public String projectCreate(ProjVO projVO, MemVO memVO, ProjTeamVO projTeamVO, String teamId, String memCode) {
        //프로젝트 생성
        int sortation = this.newProjectService.projInsert(projVO);
        if (sortation == 1) {
            // 프로젝트 생성 -> 프로젝트 팀 생성
            projTeamVO.setProjId(projVO.getProjId());
//            insertProTeam(projTeamVO);

            //프로젝트 생성 -> 프로젝트 팀 생성 -> 프로젝트 멤버 생성
            ProjMemVO vo = new ProjMemVO();
            vo.setProjId(projTeamVO.getProjId());
            vo.setMemCode(memCode);
            vo.setTeamId(teamId);
            insertProjMem(vo);

            //권한부여 ROLE_MEMBER , ROLE_PROJECT_LEADER
            List<MemberAuth> list = memVO.getMemAuthList();
            for (MemberAuth authVO : list) {
                if (authVO.getMemAuth() != null) {
                    MemberAuth memberAuth = new MemberAuth();
                    memberAuth.setMemCode(memCode);
                    memberAuth.setProjId(projTeamVO.getProjId());
                    memberAuth.setMemAuth(authVO.getMemAuth());
                    projAuthInsert(memberAuth);
                }
            }
            return "main/page";
        }
        return "main/loginFrom";
    }

    @Override
    public int projInsert(ProjVO projVO) {
        return this.projMapper.projInsert(projVO);
    }

    @Override
    public int insertProjMem(ProjMemVO projMemVO) {

        return this.projMapper.insertProjMem(projMemVO);
    }

    @Override
    public int projAuthInsert(MemberAuth memberAuth) {
        return this.projMapper.projAuthInsert(memberAuth);

    }
}
