package com.ipms.main.newProject.service.Impl;

import com.ipms.commons.ftp.FtpUtil;
import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.service.NewProjectService;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.chat.mapper.ChatMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class NewProjectImpl implements NewProjectService {

    private final ProjMapper projMapper;

    private final ChatMapper chatMapper;

    private final MyPageMapper myPageMapper;

    @Autowired
    ServletContext servletContext;

    @Transactional
    public String projectCreate(@ModelAttribute ProjVO projVO, @ModelAttribute MemVO memVO, Authentication authentication, MultipartFile[] uploadFile) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String uploadFolder = servletContext.getRealPath("/") + "\\resources\\upload\\img";
        uploadProjectMainImage(projVO, uploadFile, uploadFolder);
        if (this.projInsert(projVO) == 1) {
            createProject(projVO, userDetails);//프로젝트 생성  -> 프로젝트 멤버 생성
            getMemberShip(projVO, memVO, userDetails);//권한부여 ROLE_MEMBER , ROLE_PROJECT_LEADER
            FtpUtil.createDirectory("/", projVO.getProjId());// 프로젝트 생성 시 프로젝트 폴더(문서함)생성
            chatMapper.createChatRoom(projVO);//프로젝트 생성시 채팅방 생성
            return "success";
        }
        return "fail";
    }

    private void createProject(ProjVO projVO, UserDetails userDetails) {
        ProjMemVO vo = new ProjMemVO();
        vo.setProjId(projVO.getProjId());
        vo.setMemCode(myPageMapper.getMemCode(userDetails.getUsername()));
        this.insertProjMem(vo);
    }

    private void getMemberShip(ProjVO projVO, MemVO memVO, UserDetails userDetails) {
        List<MemberAuth> memberAuthList = memVO.getMemAuthList();
        for (MemberAuth authVO : memberAuthList) {
            if (authVO.getMemAuth() != null) {
                setProjectPermissions(projVO, userDetails, authVO);
            }
        }
    }

    private void setProjectPermissions(ProjVO projVO, UserDetails userDetails, MemberAuth authVO) {
        MemberAuth memberAuth = new MemberAuth();
        memberAuth.setMemCode(myPageMapper.getMemCode(userDetails.getUsername()));
        memberAuth.setProjId(projVO.getProjId());
        memberAuth.setMemAuth(authVO.getMemAuth());
        this.projAuthInsert(memberAuth);
    }

    private static void uploadProjectMainImage(ProjVO projVO, MultipartFile[] uploadFile, String uploadFolder) {
        for (MultipartFile multipartFile : uploadFile) {
            if (multipartFile.isEmpty()) {//파일이 없을 때
                projVO.setProjImgRoute("IPMSlogo2.png");

            } else {//파일이 있을 때 실행
                File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
                projVO.setProjImgRoute(multipartFile.getOriginalFilename());

                try {
                    multipartFile.transferTo(saveFile);
                } catch (Exception e) {
                    log.error(e.getMessage());
                } // end catch
            }
        }
    }

    public int projInsert(ProjVO projVO) {
        return this.projMapper.projInsert(projVO);
    }

    public int insertProjMem(ProjMemVO projMemVO) {
        return this.projMapper.insertProjMem(projMemVO);
    }

    public int projAuthInsert(MemberAuth memberAuth) {
        return this.projMapper.projAuthInsert(memberAuth);
    }

}
