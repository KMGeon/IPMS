package com.ipms.main.newProject.service;

import com.ipms.commons.ftp.FtpUtil;
import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Service
public class NewProjectService {
    @Autowired
    ProjMapper projMapper;
    @Autowired
    MyPageMapper myPageMapper;


    @Transactional
    public String projectCreate(@ModelAttribute ProjVO projVO, @ModelAttribute MemVO memVO, Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        //프로젝트 생성
        if (this.projInsert(projVO) == 1) {

            //프로젝트 생성  -> 프로젝트 멤버 생성
            ProjMemVO vo = new ProjMemVO();
            vo.setProjId(projVO.getProjId());
            vo.setMemCode(myPageMapper.getMemCode(userDetails.getUsername()));
            this.insertProjMem(vo);

            //권한부여 ROLE_MEMBER , ROLE_PROJECT_LEADER
            List<MemberAuth> memberAuthList = memVO.getMemAuthList();
            for (MemberAuth authVO : memberAuthList) {
                if (authVO.getMemAuth() != null) {
                    MemberAuth memberAuth = new MemberAuth();
                    memberAuth.setMemCode(myPageMapper.getMemCode(userDetails.getUsername()));
                    memberAuth.setProjId(projVO.getProjId());
                    memberAuth.setMemAuth(authVO.getMemAuth());
                    this.projAuthInsert(memberAuth);
                }
            }
            
            // 프로젝트 생성 시 프로젝트 폴더(문서함)생성 
            FtpUtil.createDirectory("/", projVO.getProjId());
            return "main/page";
        }
        return "redirect:/main/page";
    }

    private int projInsert(ProjVO projVO) {
        return this.projMapper.projInsert(projVO);
    }

    private int insertProjMem(ProjMemVO projMemVO) {
        return this.projMapper.insertProjMem(projMemVO);
    }

    private int projAuthInsert(MemberAuth memberAuth) {
        return this.projMapper.projAuthInsert(memberAuth);
    }

}
