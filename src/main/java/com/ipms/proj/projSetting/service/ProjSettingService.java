package com.ipms.proj.projSetting.service;

import com.ipms.main.newProject.vo.ProjVO;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ProjSettingService {
    List<ProjVO> listProjectSettings(String projId);
    int modifyProjectSettings(ProjVO projVO);
    public String projectCreate(@ModelAttribute ProjVO projVO, MultipartFile[] uploadFile );
    int withdrawalProject(String projId);
}
