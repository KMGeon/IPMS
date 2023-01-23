package com.ipms.main.newProject.service;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import org.springframework.security.core.Authentication;
import org.springframework.web.multipart.MultipartFile;

public interface NewProjectService {
    int projInsert(ProjVO projVO);

    int insertProjMem(ProjMemVO projMemVO);

    int projAuthInsert(MemberAuth memberAuth);

    String projectCreate(ProjVO projVO, MemVO memVO, Authentication authentication, MultipartFile[] uploadFile);
}

