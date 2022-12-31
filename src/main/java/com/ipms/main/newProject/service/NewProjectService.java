package com.ipms.main.newProject.service;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.chat.mapper.ChatMapper;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@Service
@Slf4j
public class NewProjectService {
    @Autowired
    ProjMapper projMapper;
    @Autowired
    MyPageMapper myPageMapper;
    @Autowired
    ChatMapper chatMapper;



    @Transactional
    public String projectCreate(@ModelAttribute ProjVO projVO, @ModelAttribute MemVO memVO, Authentication authentication, MultipartFile[] uploadFile, Model model) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        String uploadFolder = "E:\\IdeaProjects\\ipms\\src\\main\\webapp\\resources\\upload\\img";

        for (MultipartFile multipartFile : uploadFile) {
            log.info("Upload File Name: " + multipartFile.getOriginalFilename());
            log.info("Upload File Size: " + multipartFile.getSize());

            File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
            projVO.setProjImgRoute(multipartFile.getOriginalFilename());

            try {
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                log.error(e.getMessage());
            } // end catch
        } // end for
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
//            FtpUtil.createDirectory("/", projVO.getProjId());
            //프로젝트 생성시 채팅방 생성
            chatMapper.createChatRoom(projVO);
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
