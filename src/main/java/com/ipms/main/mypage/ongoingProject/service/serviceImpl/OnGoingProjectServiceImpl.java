package com.ipms.main.mypage.ongoingProject.service.serviceImpl;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.mypage.ongoingProject.service.OnGoingProjectService;
import com.ipms.main.newProject.vo.ProjMemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.PublicKey;
import java.util.List;

@Service
public class OnGoingProjectServiceImpl  implements OnGoingProjectService {
@Autowired
    MyPageMapper myPageMapper;

    @Override
    public List<ProjMemVO> goingProjects(String memCode) {
        return this.myPageMapper.goingProjects(memCode);
    }
}
